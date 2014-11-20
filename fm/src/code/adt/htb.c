#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#include <stdint.h>
#include <stdarg.h>

#include "adt.h"

typedef uint32_t hash_t;

struct _ht_node {
	struct _ht_node *next;
	void *val;
	size_t klen;
	hash_t hash;
	char key[];
};

static inline hash_t _hash_fnv32a(const void *buf, size_t len) {
	const unsigned char *bp;
	const unsigned char *be;
	hash_t hash;
	bp = (const unsigned char *)buf;
	be = bp + len;
	hash = 0x8492;
	while (bp < be) {
		hash ^= (hash_t)(*bp++);
#ifdef FNV_GCC_OPTIMIZE
		hash += (hash << 1) + (hash << 4) + (hash << 7) +
		        (hash << 8) + (hash << 24);
#else
#define FNV_32_PRIME ((hash_t)0x01000193)
		hash *= FNV_32_PRIME;
#endif
	}
	return hash;
}

int ht_alloc(htb_t *map, unsigned int size) {
	unsigned int i;
	map->tbl = malloc(sizeof(struct _hmap_node *) * size);
	if (map->tbl == NULL)
		return -1;
	for (i = size; i > 0;) {
		map->tbl[--i] = NULL;
	}
	map->size = size;
	map->load = 0;
	map->dtor = NULL;
	return 0;
}

void ht_dtor(htb_t *map, void (*dtor)(void *)) {
	map->dtor = dtor;
}

void ht_clear(htb_t *map) {
	unsigned int i;
	for (i = map->size; i > 0;) {
		struct _ht_node *node;
		/* Iterate down chain */
		for (node = map->tbl[--i]; node != NULL;) {
			struct _ht_node *tmp;
			if (map->dtor != NULL)
				map->dtor(node->val);
			tmp = node->next;
			free(node);
			node = tmp;
		}
	}
	map->load = 0;
}

void ht_free(htb_t *map) {
	ht_clear(map);
	free(map->tbl);
	map->tbl = NULL;
	map->size = 0;
	map->load = 0;
}

static int _ht_realloc(htb_t *map) {
	unsigned int nsiz, i;
	struct _ht_node **ntbl;
	nsiz = map->size << 1;
	ntbl = malloc(sizeof(struct _ht_node *) * nsiz);
	if (ntbl == NULL)
		return -1;
	for (i = nsiz; i > 0;) {
		ntbl[--i] = NULL;
	}
	/* Transfer nodes to new table */
	for (i = map->size; i > 0;) {
		struct _ht_node *node;
		/* Iterate down chain */
		for (node = map->tbl[--i]; node != NULL;) {
			unsigned int k;
			struct _ht_node *tmp;
			k = node->hash % nsiz;
			/* Insert into new table */
			if ((tmp = ntbl[k]) == NULL) {
				ntbl[k] = node;
			} else {
				for (; tmp->next != NULL; tmp = tmp->next) {
				}
				tmp->next = node;
			}
			tmp = node->next;
			node->next = NULL;
			node = tmp;
		}
	}
	free(map->tbl);
	map->tbl = ntbl;
	map->size = nsiz;
	return 0;
}

int ht_add(htb_t *map, const void *key, size_t len, void *val) {
	struct _ht_node *node;
	struct _ht_node *chain;
	hash_t hash;
	unsigned int i;

	/* Resize table if load factor exceeds ~0.7 */
	if ((map->load * 3) >> 1 >= map->size && _ht_realloc(map) != 0)
		return -1; /* Reallocation failure */

	hash = _hash_fnv32a(key, len);
	i = hash % map->size;
	if ((chain = map->tbl[i]) == NULL) {
		/* New mapping */
		node = malloc(sizeof(struct _ht_node) + len);
		map->tbl[i] = node;
	} else {
		node = NULL;
		for (;;) {
			if (chain->hash == hash && chain->klen == len
			    && memcmp(chain->key, key, len) == 0) {
				/* Found existing mapping */
				node = chain;
				if (map->dtor != NULL)
					map->dtor(node->val); /* Deallocate previous value */
				goto done;
			} else if (chain->next == NULL) {
				/* New mapping */
				node = malloc(sizeof(struct _ht_node) + len);
				chain->next = node;
				break;
			}
			chain = chain->next;
		}
	}
	if (node == NULL)
		return -1; /* Memory allocation failure */
	memcpy(node->key, key, len);
	node->klen = len;
	node->hash = hash;
	node->next = NULL;
done:
	node->val = val;
	map->load++;
	return 0;
}

inline void *ht_get(htb_t *map, const void *key, size_t len) {
	struct _ht_node *node;
	hash_t hash;
	hash = _hash_fnv32a(key, len);
	node = map->tbl[hash % map->size];
	for (; node != NULL; node = node->next) {
		if (node->hash == hash && node->klen == len
		    && memcmp(node->key, key, len) == 0) {
			return node->val;
		}
	}
	return NULL;
}

