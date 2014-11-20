include(`include/common.m4')dnl
define(`FM_ROOT', `..')dnl
dnl
dnl
dnl
dnl
define(`FM_TEAM_BIO',
`FM_START(`$1 | Team')
FM_MASTHEAD()

FM_COLUMNS(`',
`<h2>$1</h2>
<span class="person-title">$2</span><span style="float:right;">
<a href="FM_ROOT()/team.html#$3">&#8592; back to list</a></span>
$4',
`FM_SIDEBAR_ABOUT(`team')')

FM_FOOTER()
FM_END()
')dnl
