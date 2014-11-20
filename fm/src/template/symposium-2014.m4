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
	width: 48%;
	padding-top: 2em;
}
#event-info {
	float: right;
	width: 48%;
}

#event-title {
	text-align: center;
	font-size: 300%;
	font-weight: bolder;
	font-variant: small-caps;
	color: #8fBc8f;
	padding-top: 0.5em;
	padding-bottom: 0.4em;
}
#event-subtitle {
	text-align: center;
	font-size: 150%;
	font-style: italic;
	color: gray;
	padding-bottom: 1em;
}
#event-subtitle span {
	padding-bottom: 0.3em;
	border-bottom: 1px dotted gray;
}

#event-speakers {
	margin-left: auto;
	margin-right: auto;
	padding-top: 1em;
}
.speaker {
	width: 180px;
	text-align: center;
	color: gray;
	font-weight: bold;
}
.person {
	font-size: 120%;
}

#sponsors-senate {
	align: center;
	width: 75%;
	margin-left: auto;
	margin-right: auto;
	padding: 1em;
	text-align: center;
	font-size: 115%;
	background-color: #eeeeee;
	border-radius: 1em;
	color: #2e8b57;
}
#sponsors-senate a {
	font-weight: bold;
}
')
FM_MASTHEAD()

<div id="content">
FM_TITLE(`<center>Fruitful Minds Annual Symposium on Nutrition Education</center>')
<div id="event-body">

<div id="event-title">Sugar</div>
<div id="event-subtitle">
	<span>Perspectives and Practical Approaches for Healthy Living</span>
</div>

<div id="event-date">1 &ndash; 3 P.M. Saturday, April 19, 2014</div>
<div id="event-place">
2050 Valley Life Sciences Building<br />
UC Berkeley campus <span style="font-size: 90%;">[<a href="http://www.berkeley.edu/map/googlemap/?vlsb">map</a>]</span>
</div>


<table id="event-speakers">
<tr>
	<td class="speaker">
		<img src="media/symposium-2014/luiz-rodriguez.jpg" />
		<div class="person">Luis Rodriguez, RD</div>
		<div>UCB</div>
	</td>
	<td class="speaker">
		<img src="media/symposium-2014/robert-lustig.jpg" />
		<div class="person">Robert Lustig, MD</div>
		<div>UCSF</div>
	</td>
	<td class="speaker">
		<img src="media/symposium-2014/cindy-gershen.jpg" />
		<div class="person">Cindy Gershen</div>
		<div>Chef, author</div>
	</td>
</tr>
</table>

<div style="height: 180px; width: 75%; margin-left: auto; margin-right: auto; padding-top: 0.5em;">
<div id="event-paypal">
<form action="https://www.paypal.com/cgi-bin/webscr" method="post">
<fieldset>
<legend><img src="FM_ROOT()/commons/paypal_solution.png" alt="PayPal / Credit" height="50px" /></legend>
<input type="hidden" name="cmd" value="_cart" />
<input type="hidden" name="add" value="1" id="pp_request" />
<input type="hidden" name="business" value="TR3MG3H9S2C9A" />
<input type="hidden" name="return" value="http://www.fruitfulminds.org/symposium-2014.html" />
<input type="hidden" name="currency_code" value="USD" />
<input type="hidden" name="item_name" value="Student admission" id="pp_item" />

<input name="amount" type="radio" value="5.00" onClick="document.getElementById('pp_item').value='Student admission'"  />
<label>Student ($5, <small>student ID required at the door</small>)</label><br />
<input name="amount" type="radio" value="10.00" onClick="document.getElementById('pp_item').value='General admission'"  />
<label>Community Member ($10)</label><br />
<input name="amount" type="radio" value="50.00" onClick="document.getElementById('pp_item').value='VIP admission'"  />
<label>VIP ($50, <small>limited to 30 people</small>)</label>

<div style="margin-top: 0.5em; text-align: center">
	<input type="number" name="quantity" value="1" size="2" />
	<input type="submit" value="Add ticket(s)">
	<input type="submit" value="Review cart" onClick="document.getElementById('pp_request').name='display'" />
</div>
</fieldset>
</form>
</div>

<div id="event-info">
<p>
Dr. Robert Lustig, known for his research on sugar and authoring
<it>Fat Chance</it> and the <it>Fat Chance Cookbook</it>, is joined
by Cal's own Luis Rodriguez and chef/author Cindy Gershen who will
provide real-life examples of positive change, deepen our
understanding of the food plate, and discuss delicious recipes to
try at home.
</p>
<p>Audience members will be invited to taste and enjoy samples
before and after the event.
</p>

<hr />
<p><em>VIP tickets include admission one hour prior to the talks for an
intimate discussion with the panel.</em></p>

<!--
<p id="event-fm">
Fruitful Minds is a non-profit student group on campus that provides
access to nutrition education for children throughout the Bay Area.
Our main focus is to inspire young students to be the best they can
be through healthy choices while also providing college students with
professional development.
</p>
-->
</div>
</div>

<div id="sponsors-senate" class="clear">
Proudly sponsored and supported by
<a href="http://sd09.senate.ca.gov/">Senator Loni Hancock</a> and
<a href="http://sd07.senate.ca.gov/">Senator Mark DeSaulnier</a>
</div>

</div>
</div>
FM_FOOTER()
FM_END()
