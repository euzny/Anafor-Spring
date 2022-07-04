<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page session="false" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>대시보드</title>
<style type="text/css">

/*style.css*/
@charset "utf-8";
*{
	margin:0;
	padding:0;
	list-style:none;
	font-family:"malgun gothic";
	box-sizing:border-box;
}
a{text-decoration:none;color:inherit;}
.clear{clear:both;}
#container{background-color:#fff;width:1000px;}

/*v1*/
#nav-v1{width:150px;text-align:center;}
.menu-v1{
	line-height:2;
	border:1px solid #222;
}
.menu-v1:hover{background-color:#000;}
.menu-v1:hover>a{color:white;font-weight:bold;}
.menu-v1 .submenu{
	margin-top:7px;
	background-color:#fff;
	display:none;
}
.menu-v1 .submenu li:hover{
	background-color:#000;color:white;font-weight:bold;
}


</style>

<script type="text/javascript" src="js/admin.js"></script>

</head>
<body>

<div id="container">
		<!--세로형 1-->
		<br><p>세로형 메뉴바 1유형 : 드롭다운</p><br>
		<ul id="nav-v1">
			<li class="menu-v1"><a href="#">menu-1</a>
				<ul class="submenu">
					<li><a href="#">SubMenu 1</a></li>
					<li><a href="#">SubMenu 2</a></li>
					<li><a href="#">SubMenu 3</a></li>
					<li><a href="#">SubMenu 4</a></li>
				</ul>
			</li>
			<li class="menu-v1"><a href="#">menu-2</a>
				<ul class="submenu">
					<li><a href="#">SubMenu 1</a></li>
					<li><a href="#">SubMenu 2</a></li>
					<li><a href="#">SubMenu 3</a></li>
					<li><a href="#">SubMenu 4</a></li>
				</ul>				
			</li>
			<li class="menu-v1"><a href="#">menu-3</a>
				<ul class="submenu">
					<li><a href="#">SubMenu 1</a></li>
					<li><a href="#">SubMenu 2</a></li>
					<li><a href="#">SubMenu 3</a></li>
					<li><a href="#">SubMenu 4</a></li>
				</ul>				
			</li>
			<li class="menu-v1"><a href="#">menu-4</a>
				<ul class="submenu">
					<li><a href="#">SubMenu 1</a></li>
					<li><a href="#">SubMenu 2</a></li>
					<li><a href="#">SubMenu 3</a></li>
					<li><a href="#">SubMenu 4</a></li>
				</ul>				
			</li>
		</ul>
		<div class="clear"></div>
</div>





			
</body>
</html>