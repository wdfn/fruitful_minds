include(`include/common.m4')dnl
FM_START(`Contact Us',
`
#compose { margin: 1em 0 0 1.5em; }
#compose fieldset { border: 0; }
#compose td { vertical-align: top; }
.required { color: red; }
')
FM_MASTHEAD()

FM_COLUMNS(`FM_TITLE(`Contact Us')',
`Thank you for your interest in Fruitful Minds.

<div id="compose">
<form action="FM_ROOT()/mail.cgi" method="post" enctype="application/x-www-form-urlencoded" accept-charset="utf-8">
<fieldset>
	<legend><b>Send us a message</b></legend>
	<table>
		<tbody>
		<tr>
			<td><label>Your name<span class="required">*</span></label></td>
			<td><input type="text" name="name" size="25" /></td>
		</tr>
		<tr>
			<td><label>Email address<span class="required">*</span></label></td>
			<td><input type="text" name="address" size="25" /></td>
		</tr>
		<tr>
			<td><label>Phone number</label></td>
			<td>
				<small>(Optional, but recommended)</small><br />
				<input type="text" name="phone" size="25" /></td>
			</td>
		</tr>
		<tr>
			<td><label>Subject</label></td>
			<td>
			<select name="subject" id="subject">
				<option value="" selected="selected">(Please select a subject)</option>
				<option value="Scheduling a workshop">Schedule a workshop</option>
				<option value="Inviting Fruitful Minds to teach at my school">Invite Fruitful Minds to teach at my school</option>
				<option value="Starting Fruitful Minds at my college">Start Fruitful Minds at my college</option>
				<option value="Becoming a UC Berkeley Student Ambassador">Become a UC Berkeley Student Ambassador</option>
				<option value="Becoming a Community Advisor">Become a Community Advisor</option>
				<option value="">Other</option>
			</td>
		</tr>
		<tr>
			<td colspan="2">
			<label>Message<span class="required">*</span></span></label><br />
			<textarea name="message" rows="10" cols="65"></textarea>
			</td>
		</tr>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="2">
				<input name="submit" type="submit" value="Send" />
				<small><span class="required">*</span> Required</small>
				</td>
			</tr>
		</tfoot>
	</table>
</fieldset>
</form>
</div> <!-- id:compose -->',

`FM_SIDEBAR_ABOUT(`mission')
<blockquote><p>
Fruitful Minds, Inc.
</p><p>
2150 Allston Way Suite 400<br />
Berkeley, CA 94704
</p><p>
191 Sandringham Road<br />
Piedmont, CA 94611
</p></blockquote>')

FM_FOOTER()
FM_END()
