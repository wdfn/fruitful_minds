include(`include/common.m4')dnl
FM_START(`Fruitful Minds Symposium on Nutrition Education',
`#event-body {
	padding: 1em 2.5em 1em 2.5em;
}
#event-date {
	text-align: center;
	color: #555;
	font-size: 120%;
	font-weight: bold;
	font-variant: small-caps;
}
#event-place {
	text-align: center;
	color: #333;
	font-size: 115%;
}
#event-paypal {
	float: left;
	width: 34%;
	padding-top: 2em;
}
#event-info {
	float: right;
	width: 64%;
}
#event-speakers {
	padding-left: 1em;
}
.person {
	font-size: 110%;
}
')
FM_MASTHEAD()

<div id="content">
FM_TITLE(`Fruitful Minds Symposium on Nutrition Education')
<div id="event-body">

<div id="event-date">1 &ndash; 4 PM Sunday, April 21, 2013</div>
<div id="event-place">102 Wurster Hall <span style="font-size: 90%;">[<a href="http://www.berkeley.edu/map/3dmap/3dmap.shtml?wurster">map</a>]</span></div>

<p>
Fruitful Minds is a non-profit student group on campus that provides
access to nutrition education for children throughout the Bay Area.
Our main focus is to inspire young students to be the best they can
be through healthy choices while also providing college students with
professional development.
</p>

<div id="event-paypal">
<form style="" action="https://www.paypal.com/cgi-bin/webscr" method="post">
<fieldset>
	<legend><img src="FM_ROOT()/commons/paypal_solution.png" alt="PayPal / Credit" height="50px" /></legend>
	<input type="hidden" name="cmd" value="_xclick" />
	<input type="hidden" name="charset" value="utf-8" />
	<input type="hidden" name="business" value="TR3MG3H9S2C9A" />
	<input type="hidden" name="return" value="http://www.fruitfulminds.org/" />

	<input type="hidden" name="item_name" value="Fruitful Minds Symposium admission" />

	<input name="amount" type="radio" value="5.00" checked="checked" />
		<label>Student ($5, <small>student ID required at the door</small>)</label><br />
	<input name="amount" type="radio" value="12.00" />
		<label>Community Member ($12)</label>

	<input type="hidden" name="currency_code" value="USD" />
	<div style="margin-top: 0.5em; text-align: center">
		<label>Quantity:</label>
		<input type="text" name="quantity" value="1" size="2" style="text-align: right;" />
		<input type="submit" value="Purchase admission" />
	</div>

</fieldset>
</form>
</div>

define(`SPEAKER', `<li>ifelse(`$2',, `$1', `<span class="person">$1</span> &mdash; $2')</li>'`')dnl
<div id="event-info">
<h3 style="text-align: center;">Speakers</h3>
<ul id="event-speakers">
	SPEAKER(`Kyle Cornforth', `Director of <a href="http://edibleschoolyard.org/">The Edible Schoolyard</a> (who will also be presenting results from a Center for Weight and Health study on the Fruitful Minds program)')
	SPEAKER(`Luis Rodriguez', `Dietitian at the <a href="http://www.ucsfbenioffchildrens.org/">UCSF Benioff Children&apos;s Hospital</a> and Nutritionist at the <a href="http://www.ucsfbenioffchildrens.org/clinics/watch/">WATCH</a> (Weight Assessment for Teen and Child Health) Clinic')
	SPEAKER(`Joanne Ikeda', `Vice President of the <a href="http://www.sneb.org/">Society on Nutrition Education and Behavior</a> (SNEB), former UC Berkeley professor, and nutrition consultant to the Cartoon Network')
	SPEAKER(`Linda Shak', `Representative from the <a href="http://www.preventioninstitute.org/">Prevention Institute</a>')
	SPEAKER(`Sophie Johnson', `Executive Director of <a href="http://www.choicelunch.com/">Choice Lunch</a>, a healthy lunch program used in over 250 schools in Northern and Southern California')
</ul>
</div>

<p class="clear">
At the end of the event, there will be a student and community group
fair to let participants explore opportunities in nutrition education
and health advocacy and promotion at UC Berkeley.
</p>

<div style="text-align: center; padding-top: 0.5em;">
<em>Sponsors</em>:
<a href="http://www.asuc.org/">ASUC</a> &middot;
<a href="http://www.kp.org/">Kaiser Permanente</a> &middot;
<a href="http://www.floraoakland.com/">Flora</a> &middot;
<a href="http://www.bocanova.com/">Bocanova</a> &middot;
<a href="http://www.chezpanisse.com/">Chez Panisse</a><br />
<a href="http://www.woodtavern.net/">Wood Tavern</a> &middot;
<a href="http://www.onepacificcoastbank.com/">One Pacific Coast Bank</a> &middot;
<a href="http://www.wholefoodsmarket.com/">Whole Foods</a> &middot;
<a href="http://www.andronicos.com/">Andronico's</a>
</div>

</div>
</div>
FM_FOOTER()
FM_END()
