define(`FM_ROOT', `..')dnl
include(`include/common.m4')dnl
dnl
dnl
dnl
define(`FM_ARTICLE',
`FM_START(`$1',
`
#author {
	color: #888;
}
ul#headlines {
	list-style: none;
	padding: 0 2em 0 2em;
}
ul#headlines li {
	line-height: 120%;
	margin-bottom: 0.5em;
}
ul#headlines li a {
	color: #6db23f;
}
ul#headlines li a:hover {
	color: #333;
}
')
FM_MASTHEAD()

FM_COLUMNS(`',
`<h2>$1</h2>
<span id="author">By $2</span>

$3',

`<ul id="headlines">
	<li><a href="FM_ROOT()/articles/the-health-of-a-college-student.html">The Health of a College Student</a></li>
	<li><a href="FM_ROOT()/articles/with-menu-labeling-laws.html">With Menu Labeling Laws, Consumers Will Know Calorie Counts</a></li>
	<li><a href="FM_ROOT()/articles/eat-healthy-eat-smart.html">Eat Healthy, Eat Smart!</a></li>
	<li><a href="FM_ROOT()/articles/heart-attack-grill.html">Heart Attack Grill</a></li>
	<li><a href="FM_ROOT()/articles/free-radicals-and-antioxidants.html">Free Radicals and Antioxidants</a></li>
	<li><a href="FM_ROOT()/articles/dietary-fiber-and-its-health-benefits.html">Dietary Fiber and its Health Benefits</a></li>
	<li><a href="FM_ROOT()/articles/is-organic-produce-really-better.html">Is Organic Produce Really Better?</a></li>
</ul>')

FM_FOOTER()
FM_END()')dnl
