include(`include/common.m4')dnl
FM_START(`Team')
FM_MASTHEAD()

define(`FM_PERSON', `ifelse(`$3',, `<span class="person">$1</span>', `<a class="person" href="FM_ROOT()/team/$3">$1</a>') <span class="person-title">$2</span><br />')dnl

FM_COLUMNS(`FM_TITLE(`Team')',
`<p>The Fruitful Minds team is composed of our student board at UC Berkeley, support staff, an Advisory Board of professionals in the areas of education, dietetics and business operations, and our Board of Directors.</p>

<div class="toc">
	<a href="#directors">Board of Directors</a> |
	<a href="#advisors">Advisory Board</a> |
dnl	<a href="#staff">Support Staff</a> |
	<a href="#students">Student Board</a>
</div>

<div id="directors">
	<h3>Board of Directors</h3>
	FM_PERSON(`Allyson Cesario', `Executive Director, Fruitful Minds', `allyson-cesario.html')
	FM_PERSON(`Paulina Altshuler', `Student Board Representative, Molecular Toxicology, UC Berkeley', `paulina-altshuler.html')
	FM_PERSON(`Sarah French', `Founder, Med Student, UCSF', `sarah-french.html')
	FM_PERSON(`Kai Ouye', `Pediatrician, Highland Hospital, Oakland, CA', `kai-ouye.html')
	FM_PERSON(`Teresa Tucker', `Administrative Assistant, Nogales Lab at the Howard Hughes Medical Institute, UC Berkeley', `teresa-tucker.html')
</div>

<div id="advisors">
<h3>Advisory Board</h3>
	FM_PERSON(`Debra Israel', `Coordinator, Project EAT, Alameda County Office of Education')
	FM_PERSON(`Bill Kell', `Attorney, UC Berkeley Practicum')
	FM_PERSON(`Kathleen Ouye', `Non-profit Consultant, Fundraiser')
	FM_PERSON(`Stella Kennedy', `Middle School Teacher, PUSD')
	FM_PERSON(`Joel Soppet', `President, Ramsell Information Technologies')
	FM_PERSON(`Moses Cesario', `Chief Operating Officer, MogoTXT.com')
	FM_PERSON(`Mikelle McCoin', `MPH, RD, Interim Director, Dietetic Nutrition Program, College of Natural Resources, UC Berkeley; Lecturer')
	FM_PERSON(`Jeff Tinker', `SVP Wells Fargo Bank, National Sales Manager')
	FM_PERSON(`Bob Katter', ` VP Sales and Marketing, First Data Bank; Board President, La Clinica de La Raza')
	FM_PERSON(`Joanne P. Ikeda', `MA, RD Nutritionist Emeritus, Department of Nutritional Sciences, UC Berkeley')
</div>

dnl<div id="staff">
dnl	<h3>Support Staff</h3>
dnl	<p><i>Under construction</i></p>
dnl</div>
dnl
<div id="students">
<h3>Student Board (2013&ndash;2014)</h3>
	FM_PERSON(`Paulina Altshuler', `Student Director, Molecular Toxicology', `paulina-altshuler.html')
	FM_PERSON(`Connie Tien', `Social Media, Communications, and Data Management Director, Nutritional Sciences', `connie-tien.html')
	FM_PERSON(`Eunice Lam', `Finance Director, Economics/Business', `eunice-lam.html')
	FM_PERSON(`Lauren McAvoy', `Program Manager, Nutritional Science', `lauren-mcavoy.html')
	FM_PERSON(`Christine Bowlus', `DeCal Instructor, Nutritional Science')
	FM_PERSON(`Kuntal Chowdhary', `DeCal Instructor, Integrative Biology')
	FM_PERSON(`Tori Brodsky', `Co-Grant Director, Nutritional Science')
	FM_PERSON(`Sylvia Lin', `Co-Grant Director, Nutritional Science')
	FM_PERSON(`Ginger Min', `Curriculum Director, Public Health')
	FM_PERSON(`Caroline Chou', `Recruitment Director, Public Health')
	FM_PERSON(`Crystal Tsai', `Spring Benefit Director, Nutritional Science')
dnl
dnl <h4>Student Board Alumni</h4>
dnl	FM_PERSON(`Erin Dunn', `Student Board Director, Molecular and Cell Biology', `alumni/erin-dunn.html')
dnl	FM_PERSON(`Colleen Lynch', `DeCal Instructor (2010&dash;2011), MPH 2011', `alumni/colleen-lynch.html')
dnl	FM_PERSON(`Julie Lee', `Program Manager (2010&dash;2011), Nutritional Science', `alumni/julie-lee.html')
dnl	FM_PERSON(`Regine Leger', `Marketing, Communications Director (2010&dash;2011), Nutritional Science', `alumni/regine-leger.html')
dnl	FM_PERSON(`Karen Yang', `DeCal Coordinator and Curriculum Development Director, Nutritional Science', `alumni/karen-yang.html')
dnl	FM_PERSON(`Stephanie Yan', `DeCal Coordinator and Program Manager, Nutritional Science', `alumni/stephanie-yan.html')
dnl	FM_PERSON(`Mai Hoang', `Marketing Director, Media Studies', `alumni/mai-hoang.html')
dnl	FM_PERSON(`Jessica Jew', `Curriculum Review Director, Nutritional Science', `alumni/jessica-jew.html')
dnl	FM_PERSON(`Anne Kim', `Marketing Director, Nutritional Science', `alumni/anne-kim.html')
dnl	FM_PERSON(`Daniela Santana', `Recruitment Director, Media Studies', `alumni/daniela-santana.html')
dnl	FM_PERSON(`Yuvadee Srijongsirikul', `Curriculum Development Director, Nutritional Science', `alumni/yuvadee-srijongsirikul.html')
dnl	FM_PERSON(`Samantha Louie', `DeCal Coordinator, Nutritional Science', `alumni/samantha-louie.html')
dnl	FM_PERSON(`Lauren Tarver', `Grant Director, Practice of Art')
</div>',

`FM_SIDEBAR_ABOUT(`team')')

FM_FOOTER()
FM_END()
