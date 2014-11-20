include(`include/common.m4')dnl
FM_START(`News',
`
#title {
	font-size: 200%;
}
#news-main {
	width: 70%;
	float: left;
	margin: 0;
	padding: 0;
}
#news-main-body {
	padding-left: 1em;
}
#news-side {
	width: 30%;
	float: right;
	margin: 0;
	padding: 0;
}
#news-side-body {
	padding: 0 15px 0 15px;
}
h3 {
	color: #f08c37;
	border-bottom-color: #f08c37;
}
')
FM_MASTHEAD()

<div id="content">

<div id="news-main">
<h1 id="title">News</h1>
<img src="FM_ROOT()/media/poetryrecruit-20120406.jpg" width="100%" />

<div id="news-main-body">
	<h3>Announcements</h3>
	<ul>
		<li>Congratulations! Fruitful Minds received a prestigious &quot;Big Ideas At Cal&quot; award for community outreach and social justice. Erin Dunn, Student Board Director, accepted the award on behalf of her team on May 3rd, 2011.</li>
		<li>Fruitful Minds Summer Programs are happening: Urban Promise Summer Enrichment Youth Program and Samuel Merritt Youth in Medicine.  After six successful pilots, Fruitful Minds has officially launched to ten local elementary and middle schools, serving over 500 children this year.</li>
	</ul>
</div> <!-- id:news-main-body -->
</div> <!-- id:news-main -->

<div id="news-side">
<div id="news-side-body">
<h3>Newsletter</h3>
<p>The Fall edition of our new biannual newsletter is now available. Get updated on what&apos;s been going on with Fruitful Minds! <a href="FM_ROOT()/media/fm-newsletter_2011-11.pdf">Read</a> to find out about summer news, grants, new board members, student alumni, and our upcoming fundraiser.</p>

<h3>Follow Us</h3>
<script src="http://connect.facebook.net/en_US/all.js#xfbml=1"></script><fb:like-box href="http://www.facebook.com/pages/Fruitful-Minds/279566942066129" width="260" show_faces="true" stream="false" header="true"></fb:like-box>
</div> <!-- id:news-side-body -->
</div> <!-- id:news-side -->

<div class="clear"></div>
</div> <!-- id:content -->

FM_FOOTER()
FM_END()
