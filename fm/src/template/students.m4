include(`include/common.m4')dnl
FM_START(`Students &amp; Parents',
`
#students-col1 {
	width: 50%;
	float: left;
	margin: 0;
	padding: 0;
}
#students-col1-body {
	padding: 0.5em 1em 0 30px;
}
#students-col2 {
	width: 50%;
	float: left;
	margin: 0;
	padding: 0;
}
#students-col2-body {
	padding: 0.5em 30px 0 1em;
}
#slideshow-bretharte {
	width: 380px;
	height: 252px;
	border: 1px solid #aaa;
	margin: 0 auto 1em auto;
}
')
FM_MASTHEAD()

define(`FM_IMAGE_BH', `<li><img src="FM_ROOT()/gallery/bh/$1" alt="" width="100%" /></li>')dnl
<div id="content">
<h1 id="title">Students &amp; Parents</h1>

<div id="students-col1">
<div id="students-col1-body">

<h3>Cal Students on Nutrition</h3>
<p>Read <a href="FM_ROOT()/articles/decal.html">articles on nutrition</a> written by students at UC Berkeley.</p>

<h3>Links</h3>
<h4>Analyze Your Plate</h4>
<p><a href="FM_ROOT()/extern/analyze-my-plate.html">Analyze Your Plate</a> is one way you and your family can understand what your food is doing for you. Follow the link to understand the nutritional value of your meals at home.</p>
<p>Next time you&apos;re at the grocery store, use your label reading skills to purchase nutritious food.</p>

<h4>Harvest of the Month</h4>
<p><a href="FM_ROOT()/extern/harvest-of-the-month.html">Harvest of the Month</a> is a great way to learn about seasonal fruits and veggies and how you can prepare them at home.</p>

<h4>Farmers Markets</h4>
<p>Check out a list of <a href="FM_ROOT()/extern/farmers-markets-eastbay.html">farmers markets</a> in East Bay.</p>

</div> <!-- id:students-col1-body -->
</div> <!-- id:students-col1 -->

<div id="students-col2">
<div id="students-col2-body">

<h3 id="activities">Activities for Parents and Kids</h3>
<p>During the spring and summer, make sure you get your exercise. Take a trip to the zoo, go swimming at a local pool, or go on a hike at a regional park!</p>

<ul class="slideshow" id="slideshow-bretharte">
	FM_IMAGE_BH(`DSC_4273.jpg')
	FM_IMAGE_BH(`DSC_4274.jpg')
	FM_IMAGE_BH(`DSC_4276.jpg')
	FM_IMAGE_BH(`DSC_4286.jpg')
	FM_IMAGE_BH(`DSC_4290.jpg')
	FM_IMAGE_BH(`DSC_4312.jpg')
	FM_IMAGE_BH(`DSC_4326.jpg')
</ul>

<p>Fruitful Minds is teaching at a school near you.  If you want nutrition education for your family, bring Fruitful Minds to your school.</p>
<p>Learn more about <a href="FM_ROOT()/services.html">our programs</a>.</p>

</div> <!-- id:students-col2-body -->
</div> <!-- id:students-col2 -->

<div class="clear"></div>
</div> <!-- id:content -->

FM_FOOTER()
FM_END()
