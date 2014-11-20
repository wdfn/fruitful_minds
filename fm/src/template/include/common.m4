ifdef(`FM_ROOT',, `define(`FM_ROOT', `.')')dnl
dnl
dnl
dnl
dnl
define(`FM_ANALYTICS',
`<script type="text/javascript">
	var _gaq = _gaq || [];
	_gaq.push(["_setAccount", "UA-22860878-1"]);
	_gaq.push(["_trackPageview"]);
	(function() {
		var ga = document.createElement("script"); ga.type = "text/javascript"; ga.async = true;
		ga.src = ("https:" == document.location.protocol ? "https://ssl" :"http://www") + ".google-analytics.com/ga.js";
		var s = document.getElementsByTagName("script")[0]; s.parentNode.insertBefore(ga, s);
	})();
</script>')dnl
dnl
dnl
dnl
dnl
define(`FM_START',
`<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN"
	"http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
	<link rel="stylesheet" type="text/css" href="FM_ROOT()/commons/skin.css" />
	<link rel="stylesheet" type="text/css" href="FM_ROOT()/commons/media.css" />
	<style type="text/css" media="screen,projection">/*<![CDATA[*/
$2
	/*]]>*/</style>
	<script src="FM_ROOT()/commons/script.js" type="text/javascript" charset="utf-8"></script>
	<title>$1 | Fruitful Minds</title>

	<meta http-equiv="cache-control" content="max-age=0" />
	<meta http-equiv="cache-control" content="no-cache" />
	<meta http-equiv="expires" content="0" />
	<meta http-equiv="expires" content="Tue, 01 Jan 1980 1:00:00 GMT" />
	<meta http-equiv="pragma" content="no-cache" />

FM_ANALYTICS
</head>
<body onload="js_init()">
<div id="container">')dnl
dnl
dnl
dnl
dnl
define(`FM_MASTHEAD',
`<span id="top"></span>
<div id="masthead">
<a id="logo" href="FM_ROOT()/index.html"><img src="FM_ROOT()/commons/logo_full.png" alt="Fruitful Minds" /></a>
<ul id="topnav">
	<li id="nav1" class="topnav-box">
		<a class="topnav-link" href="FM_ROOT()/students.html">Students &amp; Parents</a>
		<ul class="topnav-menu">
			<li><a href="FM_ROOT()/students.html#activities">Activities</a></li>
			<li><a href="FM_ROOT()/recipes.html">Recipes</a></li>
			<li><a href="FM_ROOT()/news.html">News</a></li>
			<!--<li><a href="#">Blog</a></li>-->
		</ul>
	</li>
	<li id="nav2" class="topnav-box">
		<a class="topnav-link" href="FM_ROOT()/educators.html">Educators</a>
		<ul class="topnav-menu">
			<li><a href="FM_ROOT()/educators.html#franchise">Bring FM to your school</a></li>
			<li><a href="FM_ROOT()/educators.html#workshops">Schedule a workshop</a></li>
			<li><a href="FM_ROOT()/download/curriculum.html">Download curriculum</a></li>
		</ul>
	</li>
	<li id="nav3" class="topnav-box">
		<a class="topnav-link" href="FM_ROOT()/involved.html">Get Involved</a>
		<ul class="topnav-menu">
			<li><a href="FM_ROOT()/donate.html">Giving</a></li>
			<li><a href="FM_ROOT()/involved.html#franchise">Franchise</a></li>
			<li><a href="FM_ROOT()/involved.html#ambassador">Volunteer</a></li>
		</ul>
	</li>
</ul>
<div class="clear"></div>
</div>
<!-- Image prefetch -->
<script type="text/javascript">
//<![CDATA[
var nav1 = new Image();
nav1.src = "FM_ROOT()/commons/nav1b.png";
var nav2 = new Image();
nav2.src = "FM_ROOT()/commons/nav2b.png";
var nav3 = new Image();
nav3.src = "FM_ROOT()/commons/nav3b.png";
//]]>
</script>
<hr class="gap" />')dnl
dnl
dnl
dnl
dnl
define(`FM_TITLE', `<h1 id="title">$1</h1>')dnl
dnl
dnl
dnl
dnl
define(`FM_COLUMNS',
`<div id="content">
<div id="col2-wrap">
<div id="col1-wrap">
	<div id="col1">
$1
		<div id="mainbar">
$2
		</div>
	</div>
	<div id="col2">
		<div id="sidebar">
$3
		</div>
	</div>
</div> <!-- id:col2-wrap -->
</div> <!-- id:col1-wrap -->
</div> <!-- id:content -->')dnl
dnl
dnl
dnl
dnl
define(`FM_FOOTER',
`<div id="footer">
<hr class="gap" />
<div id="footer-content">
	<a href="#top">Back to top</a>&#8593; | <a href="http://validator.w3.org/check/referer">XHTML</a> | <a href="http://jigsaw.w3.org/css-validator/check/referer">CSS</a>
	<span id="footer-social"><script src="http://connect.facebook.net/en_US/all.js#xfbml=1"></script><fb:like href="http://www.facebook.com/pages/Fruitful-Minds/279566942066129" layout="button_count" show_faces="false" font=""></fb:like></span>
	<span id="footer-nav"><a href="FM_ROOT()/index.html">Home</a><a href="FM_ROOT()/mission.html">About</a><a href="FM_ROOT()/contact.html">Contact Us</a><a href="FM_ROOT()/donate.html">Donate</a></span>
	<span class="clear"></span>
	<div id="footer-legal">&#169; 2011&ndash;2014 Fruitful Minds, Inc.&nbsp; Fruitful Minds &#174; is a registered trademark of Fruitful Minds, Inc.</div>
</div></div>')dnl
dnl
dnl
dnl
dnl
define(`FM_END',
`</div> <!-- id:container -->
</body>
</html>')dnl
dnl
dnl
dnl
dnl
define(`FM_SIDEBAR_ABOUT',
`<ul class="sidebar-links">
	<li><a href="FM_ROOT()/mission.html">ifelse(`$1', `mission', `<strong>Mission</strong>', `Mission')</a></li>
	<li><a href="FM_ROOT()/services.html">ifelse(`$1', `services', `<strong>Services</strong>', `Services')</a></li>
	<li><a href="FM_ROOT()/team.html">ifelse(`$1', `team', `<strong>Team</strong>', `Team')</a></li>
	<li><a href="FM_ROOT()/supporters.html">ifelse(`$1', `supporters', `<strong>Supporters</strong>', `Supporters')</a></li>
</ul>
<ul class="sidebar-links">
	<li><a href="FM_ROOT()/donate.html">ifelse($1, `donate', `<strong>Donate</strong>', `Donate')</a></li>
	<li><a href="FM_ROOT()/contact.html">ifelse($1, `contact', `<strong>Contact Us</strong>', `Contact Us')</a></li>
</ul>')dnl
dnl
dnl
dnl
dnl
define(`FM_DONATE',
`<form action="https://www.paypal.com/cgi-bin/webscr" method="post">
<fieldset>
	<legend><img src="FM_ROOT()/commons/paypal_solution.gif" alt="PayPal / Credit" height="52px" /></legend>
	<input type="hidden" name="cmd" value="_donations" />
	<input type="hidden" name="charset" value="utf-8" />
	<input type="hidden" name="business" value="TR3MG3H9S2C9A" />
	<input type="hidden" name="return" value="http://www.fruitfulminds.org/" />

	<label>Select your donation amount:</label><br />
	<input name="amount" type="radio" value="25.00" /><label>25</label>&nbsp;
	<input name="amount" type="radio" value="50.00" checked="checked" /><label>50</label>&nbsp;
	<input name="amount" type="radio" value="100.00" /><label>100</label>&nbsp;
	<input name="amount" type="radio" value="500.00" /><label>500</label><br />
	<input name="amount" type="radio" value="" /><label>Other</label>&nbsp;
	<input name="amount" size="5" type="text" />

	<select name="currency_code" size="1">
		<option value="USD" selected="selected">USD &ndash; $</option>
		<option value="EUR">EUR &ndash; &#x20AC;</option>
		<option value="AUD">AUD &ndash; $</option>
		<option value="CAD">CAD &ndash; $</option>
		<option value="CHF">CHF &ndash; Fr.</option>
		<option value="CZK">CZK &ndash; K&#x010D;</option>
		<option value="DKK">DKK &ndash; kr</option>
		<option value="GBP">GBP &ndash; &#x00A3;</option>
		<option value="HKD">HKD &ndash; HK$</option>
		<option value="HUF">HUF &ndash; Ft</option>
		<option value="ILS">ILS &ndash; &#x20AA;</option>
		<option value="JPY">JPY &ndash; &#x00A5;</option>
		<option value="NOK">NOK &ndash; kr</option>
		<option value="MXN">MXN &ndash; $</option>
		<option value="NZD">NZD &ndash; NZ$</option>
		<option value="PHP">PHP &ndash; &#x20B1;</option>
		<option value="PLN">PLN &ndash; z&#x0142;</option>
		<option value="SEK">SEK &ndash; kr</option>
		<option value="TWD">TWD &ndash; S$</option>
		<option value="THB">THB &ndash; &#x0E3F;</option>
		<option value="TRY">TRY &ndash; TL</option>
	</select>
	<div style="margin-top: 1em; text-align: center">
		<input name="submit" type="image" src="FM_ROOT()/commons/paypal_donate.gif" alt="Make payments with PayPal" />
	</div>
</fieldset>
</form>')dnl
