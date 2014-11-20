include(`include/common.m4')dnl
FM_START(`Educators',
`
#edu-main {
	width: 60%;
	float: left;
	margin: 0;
	padding: 0;
}
#edu-main-body {
	padding: 0.5em 30px 0 30px;
}
#edu-side {
	width: 40%;
	float: right;
	margin: 0;
	padding: 0;
}
#edu-side-body {
	padding-right: 30px;
}
')
FM_MASTHEAD()

<div id="content">
<h1 id="title">Educators</h1>

<div id="edu-main">
<div id="edu-main-body">
	<h3 id="franchise">Franchise Opportunities</h3>
	<p>Fruitful Minds began with a student movement at UC Berkeley and can be expanded to provide <a href="FM_ROOT()/services.html">services</a> in any community with college resources.  Fruitful Minds supports franchise locations with organizational training and access to materials via the website.</p>

	<h3 id="workshops">Workshops</h3>
	<p>Fruitful Minds offers workshops for parent clubs, community centers and any group looking for an update on nutrition basics. Our seven lesson series is condensed to provide basic review of the food pyramid, nutrients, label reading, advertising influences, physical activity and personal choices.</p>

	<h3>Website</h3>
	<p>The Fruitful Minds website provides an online tool for students and parents to review what the students are learning in class. It provides links to other helpful websites to learn about seasonal recipes or locate the nearest farmers market.</p>
</div> <!-- id:edu-main-body -->
</div> <!-- id:edu-main -->

<div id="edu-side">
<div id="sidebar">
	<ul class="sidebar-links">
		<li><a href="FM_ROOT()/download/curriculum.html">Download curriculum</a> (requires login)</li>
	</ul>
</div> <!-- id:sidebar -->

<div id="edu-side-body">
	<h3>Colleges offering<br />Fruitful Minds programs:</h3>
		<ul>
			<li><a href="FM_ROOT()/extern/berkeley.html">University of California, Berkeley</a></li>
		</ul>

	<h3>Have We Inspired You?</h3>
	<p>Learn more about <a href="FM_ROOT()/services.html">our services</a> and <a href="FM_ROOT()/contact.html">contact us</a> to bring Fruitful Minds Ambassadors to your school.</p>
</div> <!-- id:edu-col2-body -->
</div> <!-- id:edu-col2 -->

<div class="clear"></div>
</div> <!-- id:content -->

FM_FOOTER()
FM_END()
