define(`FM_ROOT', `..')dnl
include(`include/common.m4')dnl
FM_START(`Cal Students on Nutrition',
`
#decal-main-body {
	padding: 1em 30px 30px;
}
table#articles {
	min-width: 70%;
	border: 1px solid #a7d7f9;
}
table#articles thead th {
	background: #eee;
	text-align: left;
}
table#articles th, td {
	padding: 0 0.5em 0 0.5em;
}
table#articles td a {
	color: #6db23f;
}
table#articles td a:hover {
	color: #aaa;
}
')
FM_MASTHEAD()

<div id="content">

<h1 id="title">Cal Students on Nutrition</h1>
<div id="decal-main-body">
<p>The following articles were written by students at UC Berkeley.<br />
Read and discuss with your family&#x2026; you might learn something new!</p>

define(`FM_ARTICLE_ITEM', `<tr><td>$1</td><td><a href="FM_ROOT()/articles/$3">$2</a></td></tr>')dnl
<table id="articles">
	<thead>
		<tr><th>Author</th><th>Title</th></tr>
	</thead>
	<tbody>
	FM_ARTICLE_ITEM(`Alex Dombrowski', `The Health of a College Student', `the-health-of-a-college-student.html')
	FM_ARTICLE_ITEM(`Ayumi Tsurushita', `With Menu Labeling Laws, Consumers Will Know Calorie Counts', `with-menu-labeling-laws.html')
	FM_ARTICLE_ITEM(`Carla Banks', `Eat Healthy, Eat Smart!', `eat-healthy-eat-smart.html')
	FM_ARTICLE_ITEM(`Connie Tien', `Heart Attack Grill', `heart-attack-grill.html')
	FM_ARTICLE_ITEM(`Flora Ting', `Free Radicals and Antioxidants', `free-radicals-and-antioxidants.html')
	FM_ARTICLE_ITEM(`Janet Ruiz', `Dietary Fiber and its Health Benefits', `dietary-fiber-and-its-health-benefits.html')
	FM_ARTICLE_ITEM(`Zona Keo', `Is Organic Produce Really Better?', `is-organic-produce-really-better.html')
	</tbody>
</table>
</div> <!-- id:decal-main-body -->

</div> <!-- id:content -->

FM_FOOTER()
FM_END()
