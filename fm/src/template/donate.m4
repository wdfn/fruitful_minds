include(`include/common.m4')dnl
FM_START(`Team')
FM_MASTHEAD()

FM_COLUMNS(`FM_TITLE(`Donate')',
`<p>Fruitful Minds appreciates donations in many forms.  You may choose from items listed below or make a cash/check donation via PayPal or regular mail. Please indicate if you would like your donation to be anonymous.</p>

<div id="donate-paypal">
FM_DONATE
</div>

<div id="donate-wishlist">
<h3>Wish List</h3>
<ul>
	<li>Gift cards to:<br />Office Depot<br />Toys &quot;R&quot; Us<br />Lakeshore Learning Store</li>
	<li>Publishing assistance</li>
</ul>
</div>

<div id="donate-address">
Donations are tax deductible and can be mailed to:
<blockquote><p>Fruitful Minds<br />191 Sandringham Road<br />Piedmont, CA 94611</p></blockquote>
</div>',

`FM_SIDEBAR_ABOUT(`donate')')

FM_FOOTER()
FM_END()
