include(`include/common.m4')dnl
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN"
	"http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
	<link rel="stylesheet" type="text/css" href="FM_ROOT()/commons/portal.css" />
	<link rel="stylesheet" type="text/css" href="FM_ROOT()/commons/media.css" />
	<script src="./commons/script.js" type="text/javascript" charset="utf-8"></script>
	<title>Fruitful Minds</title>
FM_ANALYTICS
</head>

<body onload="js_init()">
<div id="container">
<div id="content">
	<!--
	<ul id="navbar">
		<li><a href="FM_ROOT()/mission.html">About Us</a></li>
		<li><a href="FM_ROOT()/donate.html">Donate</a></li>
	</ul>
	-->
	<div id="portal">
		<a class="portal-button" href="FM_ROOT()/students.html">
			<img src="FM_ROOT()/commons/grape_solid.png" alt="" /><br />
			Students &amp;<br/>Parents
		</a>
		<a class="portal-button" href="FM_ROOT()/educators.html">
			<img src="FM_ROOT()/commons/apple_solid.png" alt="" /><br />
			Educators
		</a>
		<a class="portal-button last" href="FM_ROOT()/involved.html">
			<img src="FM_ROOT()/commons/pear_solid.png" alt="" /><br />
			Get Involved
		</a>
	</div>

	<hr />

	<div id="portal-announce">
	<strong>Fruitful Minds Annual Symposium on Nutrition Education</strong> &ndash; April 19, 2014<br />
	Sugar: Perspectives and Practical Approaches for Healthy Living<br />
	<a href="FM_ROOT()/symposium-2014.html">more information &#x95; purchase admission</a>
	</div>

define(`FM_SLIDE', `<li><img src="FM_ROOT()/gallery/portal/$1" alt="" width="340px" height="226px" /><div class="portal-quote">$2<div class="portal-quote-attrib">&mdash; $3</div></div></li>')dnl
define(`FM_QUOTE1', `&quot;I was impressed by the valuable nutritional information presented by Fruitful Minds &ndash; essential for meeting the needs of today&apos;s kids.  The hands-on, interactive nature of the presentations keeps the kids engaged.&quot;')dnl
define(`FM_QUOTE1_ATTRIB', `Cindy Soulier, Piedmont Middle School, 7th Grade Science Teacher')dnl
define(`FM_QUOTE2', `&quot;The Unity Council recognizes Fruitful Minds for their dedication in serving multi-cultural communities through an inventive and creative curriculum.  Participants in our Girls Sports Program have become more conscientious of their everyday eating habits, nutritional facts and the importance of exercise.&quot;')dnl
define(`FM_QUOTE2_ATTRIB', `Meron Misgun, Youth Services Manager, The Unity Council')dnl
	<div id="slideshow-container">
	<ul id="portal-slideshow" class="slideshow">
		FM_SLIDE(`DSC_4276.jpg', `FM_QUOTE1', `FM_QUOTE1_ATTRIB')
		FM_SLIDE(`DSC_4280.jpg', `FM_QUOTE1', `FM_QUOTE1_ATTRIB')
		FM_SLIDE(`DSC_4307.jpg', `FM_QUOTE2', `FM_QUOTE2_ATTRIB')
		FM_SLIDE(`DSC_4327.jpg', `FM_QUOTE2', `FM_QUOTE2_ATTRIB')
	</ul>
	</div>
	
	<div id="portal-summary">
	<p>Fruitful Minds places college students in local elementary and middle schools to deliver nutrition education.</p>
	<p>We inspire young students to be the best they can be through healthy choices while providing college students with professional development.</p>
	</div>
	<a class="portal-link" href="./mission.html">About</a>
	<a class="portal-link" href="./students.html#news">News</a>
	<a class="portal-link" href="./contact.html">Contact Us</a>
	<a class="portal-link" href="./donate.html">Donate</a>

	<div class="clear"></div>

</div><!-- div:content -->

<div id="footer">
<div id="footer-content">
&#x00A9; 2011&ndash;2013 Fruitful Minds, Inc.
</div>
</div>

</div><!-- div:container -->
</body>
</html>
