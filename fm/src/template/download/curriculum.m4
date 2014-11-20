include(`include/common.m4')dnl
define(`FM_ROOT', `..')dnl
FM_START(`Curriculum',
`
table.files {
	margin: 0.5em auto 0 auto;
	min-width: 98%;
	border: 1px solid #a7d7f9;
}
table.files thead th {
	background: #eee;
	text-align: left;
}
table.files th, td {
	padding: 0 0.5em 0 0.5em;
}
table.files a {
	color: #6db23f;
}
table.files tr.file:hover td {
	background: #eee;
}
.file-size {
	font-size: 90%;
}
.file-group h3 {
	font-size: 110%;
	font-variant: normal;
	border-bottom: 1px dotted #a7d7f9;
	margin: 0.3em 0 0.2em 0;
}

#curriculum-col1 {
	width: 50%;
	float: left;
}
#curriculum-col1-body {
	padding: 0.5em 0 1.5em 30px;
}
#curriculum-col2 {
	width: 50%;
	float: right;
}
#curriculum-col2-body {
	padding: 0.5em 30px 1.5em 0;
}
')
FM_MASTHEAD()

<div id="content">
<h1 id="title">Curriculum Download</h1>

define(`FM_FILE_GROUP', `<tr><td class="file-group" colspan="2"><h3 id="$2">$1</h3></td></tr>')dnl
define(`FM_FILE', `<tr class="file"><td class="file-name"><a href="$2/$1" target="_blank">$1</a></td><td class="file-size">$3</td></tr>')dnl
<div id="curriculum-col1">
<div id="curriculum-col1-body">
<table class="files">
	<thead>
		<tr>
			<th scope="col">Filename</th>
			<th scope="col">Size</th>
		</tr>
	</thead>
	<tbody>
		FM_FILE_GROUP(`Surveys', `surveys')
		FM_FILE(`Combined pre-curriculum survey.pdf', `surveys', `400.5 KiB')
		FM_FILE(`Lesson 1 Survey  (Pre-curriculum survey I).pdf', `surveys', `296.2 KiB')
		FM_FILE(`Lesson 2 Survey  (Pre-curriculum survey II).pdf', `surveys', `157.0 KiB')
		FM_FILE(`Lesson 6 Survey  (Post-curriculum survey).pdf', `surveys', `399.4 KiB')

		FM_FILE_GROUP(`Lesson 1', `lesson01')
		FM_FILE(`Fruitful Notes Answer Key for all lessons.pdf', `lesson01', `42.2 KiB')
		FM_FILE(`Lesson 1 Fruitful Notes.pdf', `lesson01', `44.9 KiB')
		FM_FILE(`Lesson 1 Plan.pdf', `lesson01', `67.1 KiB')
		FM_FILE(`Lesson 1 Slide.ppt', `lesson01', `3.0 MiB')

		FM_FILE_GROUP(`Lesson 2', `lesson02')
		FM_FILE(`Fruitful Notes Answer Key for all lessons.pdf', `lesson02', `42.2 KiB')
		FM_FILE(`Lesson 2 Fruitful Notes.pdf', `lesson02', `182.8 KiB')
		FM_FILE(`Lesson 2 Plan.pdf', `lesson02', `81.1 KiB')
		FM_FILE(`Lesson 2 Slide.ppt', `lesson02', `2.1 MiB')

		FM_FILE_GROUP(`Lesson 3', `lesson03')
		FM_FILE(`Lesson 3 Fruitful Notes answer key.pdf', `lesson03', `47.2 KiB')
		FM_FILE(`Lesson 3 Fruitful Notes.pdf', `lesson03', `179.1 KiB')
		FM_FILE(`Lesson 3 Plan.pdf', `lesson03', `42.8 KiB')
		FM_FILE(`Lesson 3 Slide.pptx', `lesson03', `4.2 MiB')
		FM_FILE(`Lesson 3 Worksheet.pptx', `lesson03', `1.1 MiB')
	</tbody>
</table>
</div> <!-- id:curriculum-col1-body -->
</div> <!-- id:curriculum-col1 -->

<div id="curriculum-col2">
<div id="curriculum-col2-body">
<table class="files">
	<thead>
		<tr>
			<th scope="col">Filename</th>
			<th scope="col">Size</th>
		</tr>
	</thead>
	<tbody>

		FM_FILE_GROUP(`Lesson 4', `lesson04')
		FM_FILE(`Fruitful Notes Answer Key for all lessons.pdf', `lesson04', `42.2 KiB')
		FM_FILE(`Lesson 4 Fruitful Notes.pdf', `lesson04', `181.5 KiB')
		FM_FILE(`Lesson 4 Plan.pdf', `lesson04', `66.1 KiB')
		FM_FILE(`Lesson 4 Slide.ppt', `lesson04', `4.2 MiB')

		FM_FILE_GROUP(`Lesson 5', `lesson05')
		FM_FILE(`Fruitful Notes Answer Key for all lessons.pdf', `lesson05', `42.2 KiB')
		FM_FILE(`Lesson 5 Fruitful Notes.pdf', `lesson05', `177.8 KiB')
		FM_FILE(`Lesson 5 Plan.pdf', `lesson05', `49.2 KiB')
		FM_FILE(`Lesson 5 Slide.ppt', `lesson05', `3.9 MiB')

		FM_FILE_GROUP(`Lesson 6', `lesson06')
		FM_FILE(`Fruitful Notes Answer Key for all lessons.pdf', `lesson06', `42.2 KiB')
		FM_FILE(`Lesson 6 Fruitful Notes.pdf', `lesson06', `173.9 KiB')
		FM_FILE(`Lesson 6 Plan.pdf', `lesson06', `33.9 KiB')
		FM_FILE(`Lesson 6 Slide (jeopardy).pptx', `lesson06', `5.6 MiB')
		FM_FILE(`Lesson 6 Slide (tic tac toe).pptx', `lesson06', `1.9 MiB')
	</tbody>
</table>
</div> <!-- id:curriculum-col2-body -->
</div> <!-- id:curriculum-col2 -->

<div class="clear"></div>
</div> <!-- id:content -->

FM_FOOTER()
FM_END()
