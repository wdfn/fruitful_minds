define(`FM_ROOT', `..')
dnl
dnl
dnl
dnl
define(`FM_EXTERN',
`<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN"
	"http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<style type="text/css">
html, body {
	margin: 0;
	padding: 0;
	height: 100%;
}
#content {
	width: 100%;
	height: 99%;
}
#overlay {
	position: absolute;
	top: 0;
	left: 0;
	border: solid #aaa;
	border-width: 0 1px 1px 0;
	background: #fff;
	padding: 0.2em 0.5em 0.2em 0.5em;
	font: 100% Helvetica, sans-serif;
	text-align: center;
	z-index: 99;
}
.icon { vertical-align: middle; }
#overlay a { text-decoration: none; }
#return { color: #6db23f; }
#close {
	font-size: 90%;
	color: #e8a321;
}
	</style>
	<title>$1 | Fruitful Minds</title>
</head>
<body>

<object id="content" data="$2"></object>
<div id="overlay">
<img class="icon" src="FM_ROOT()/commons/left-arrow.png" alt="" width="30px" />
	<a id="return" href="FM_ROOT()/$3">return to <b>Fruitful Minds</b></a> |
	<a id="close" href="$2">close</a>
</div></div>

</body>
</html>')dnl
