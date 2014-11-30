function js_init() {
//	multitab_init();
	slideshow_init();
}

/*
 * Developed by Robert Nyman, http://www.robertnyman.com
 * Code/licensing: http://code.google.com/p/getelementsbyclassname/
 */
var getElementsByClassName = function (className, tag, elm) {
	if (document.getElementsByClassName) {
		getElementsByClassName = function (className, tag, elm) {
			elm = elm || document;
			var elements = elm.getElementsByClassName(className),
			nodeName = (tag)? new RegExp("\\b" + tag + "\\b", "i") : null,
			returnElements = [],
			current;
			for(var i=0, il=elements.length; i<il; i+=1){
				current = elements[i];
				if(!nodeName || nodeName.test(current.nodeName)) {
					returnElements.push(current);
				}
			}
			return returnElements;
		};
	}
	else if (document.evaluate) {
		getElementsByClassName = function (className, tag, elm) {
			tag = tag || "*";
			elm = elm || document;
			var classes = className.split(" "),
			classesToCheck = "",
			xhtmlNamespace = "http://www.w3.org/1999/xhtml",
			namespaceResolver = (document.documentElement.namespaceURI === xhtmlNamespace)? xhtmlNamespace : null,
			returnElements = [],
			elements,
			node;
			for(var j=0, jl=classes.length; j<jl; j+=1){
				classesToCheck += "[contains(concat(' ', @class, ' '), ' " + classes[j] + " ')]";
			}
			try     {
				elements = document.evaluate(".//" + tag + classesToCheck, elm, namespaceResolver, 0, null);
			}
			catch (e) {
				elements = document.evaluate(".//" + tag + classesToCheck, elm, null, 0, null);
			}
			while ((node = elements.iterateNext())) {
				returnElements.push(node);
			}
			return returnElements;
		};
	}
	else {
		getElementsByClassName = function (className, tag, elm) {
			tag = tag || "*";
			elm = elm || document;
			var classes = className.split(" "),
			classesToCheck = [],
			elements = (tag === "*" && elm.all)? elm.all : elm.getElementsByTagName(tag),
			current,
			returnElements = [],
			match;
			for(var k=0, kl=classes.length; k<kl; k+=1){
				classesToCheck.push(new RegExp("(^|\\s)" + classes[k] + "(\\s|$)"));
			}
			for(var l=0, ll=elements.length; l<ll; l+=1){
				current = elements[l];
				match = false;
				for(var m=0, ml=classesToCheck.length; m<ml; m+=1){
					match = classesToCheck[m].test(current.className);
					if (!match) {
						break;
					}
				}
				if (match) {
					returnElements.push(current);
				}
			}
			return returnElements;
		};
	}
	return getElementsByClassName(className, tag, elm);
};



/*************** MULTITAB ***************/

// function multitab_init() {
// 	var groups = document.getElementsByClassName('multitab');
// 	for (var i = 0; i < groups.length; i++) {
// 		var panes = new Array;
// 		var tabs = new Array;
// 		for (var node = groups[i].firstChild; node; node = node.nextSibling) {
// 			if (node.nodeType != 1)
// 				continue;
// 			var selected;
// 			if (node.className == 'toc') {
// 				var links = node.getElementsByTagName('a');
// 				for (var k = 0; k < links.length; k++) {
// 					tabs.push(links[k]);
// 					links[k].onclick = function() { multitab_select(this, tabs, panes); };
// 					/* Save for selection if link reference matches fragment in URL */
// 					if (links[k].getAttribute('href') == location.hash) {
// 						selected = links[k];
// 					}
// 				}
// 			} else {
// 				node.style.display = 'none';
// 				panes.push(node);
// 			}
// 			
// 			if (selected) { /* Show initial tab */
// 				multitab_select(selected, tabs, panes);
// 			}
// 		}
// 	}
// }
// 
// function multitab_select(selected, tabs, panes) {
// 	for (var i = 0; i < tabs.length; i++) {
// 		if (tabs[i] != selected) {
// 			tabs[i].style.fontWeight = 'normal';
// 		}
// 	}
// 	selected.style.fontWeight = 'bold';
// 	
// 	var target = selected.getAttribute('href');
// 	var id = target.substring(target.lastIndexOf('#') + 1);
// 	for (var i = 0; i < panes.length; i++) {
// 		panes[i].style.display = (panes[i].getAttribute('id') == id) ? 'inline' : 'none';
// 	}
// }


/*************** GALLERY ***************/

var gbl_pause_sec = 3.5;
var gbl_fade_sec = 1.5;
var gbl_fade_fms = 30; /* Milliseconds per fade frame */

function slideshow_init() {
	var groups = (document.getElementsByClassName ? document.getElementsByClassName('slideshow') : getElementsByClassName('slideshow'));
	for (var i = 0; i < groups.length; i++) {
		var gallery = new Object;
		gallery.dom = groups[i];
		var imgs = new Array;
		gallery.imgs = imgs;
		for (var node = gallery.dom.firstChild; node; node = node.nextSibling) {
			if (node.nodeType == 1 /* Node.ELEMENT_NODE */) {
				//node.style.position = 'absolute';
				//node.style.top = 0;
				node.style.zIndex = 0;
				set_opacity(node, 0);
				node.style.visibility = 'visible';
				imgs.push(node);
			}
		}
		if (gallery.imgs.length <= 0)
			return;

		/* Navigation button */
		var nav = document.createElement('div');
		nav.appendChild(document.createTextNode('next'));
		nav.style.position = 'absolute';
		nav.style.top = 0;
		nav.style.right = 0;
		nav.style.zIndex = 3;
		nav.style.padding = '0.2em 1em 0.2em 1em';
		nav.style.backgroundColor = '#fff';
		nav.style.fontVariant = 'small-caps';
		nav.onclick = function() {
			if (gallery.op >= 100) {
				window.clearTimeout(gallery.timerID);
				slideshow_fade(gallery);
			}
		}
		gallery.dom.appendChild(nav);
		
		var start = Math.floor(Math.random() * imgs.length);
		imgs[start].style.zIndex = 1;
		set_opacity(imgs[start], 100);
		set_opacity(imgs[(start + 1) % imgs.length], 100);
		gallery.target = start;
		gallery.op = 100;
		gallery.timerID = window.setTimeout(function() {
				slideshow_fade(gallery);
			}, gbl_pause_sec * 1000);
	}
}

function slideshow_fade(gallery) {
	var i = gallery.target;
	var imgs = gallery.imgs;
	if (gallery.op > 0) {
		gallery.op -= 100 / (gbl_fade_fms * gbl_fade_sec);
		set_opacity(imgs[i], gallery.op);
		gallery.timerID = window.setTimeout(function() { slideshow_fade(gallery); }, gbl_fade_fms);
	} else {
		imgs[i].style.zIndex = 0;
		i = (i + 1) % imgs.length;
		imgs[i].style.zIndex = 1;
		set_opacity(imgs[(i + 1) % imgs.length], 100);
		gallery.target = i;
		gallery.op = 100;
		gallery.timerID = window.setTimeout(function() {
				slideshow_fade(gallery);
			}, gbl_pause_sec * 1000);
	}
}

function set_opacity(obj, opacity) {
	opacity = (opacity == 100) ? 99.999 : opacity;
	obj.style.filter = 'alpha(opacity:' + opacity + ')'; /* IE */
	opacity /= 100;
	obj.style.KHTMLOpacity = opacity; /* Safari (< v1.2), Konqueror */
	obj.style.MozOpacity = opacity; /* Older Mozilla and Firefox */
	obj.style.opacity = opacity; /* Safari (v1.2+), newer Firefox and Mozilla, CSS3 */
}
