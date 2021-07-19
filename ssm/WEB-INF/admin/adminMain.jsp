<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html>
  <head>
    <title>中科大学生管理系统</title>
    <link href="css/ui-lightness/jquery-ui-1.10.4.custom.css"
	rel="stylesheet">
<script src="js/jquery-1.10.2.js"></script>
<script src="js/jquery-ui-1.10.4.custom.js"></script>
<script type="text/javascript">
	$(function(){
		$("#accordion").accordion();
	});
</script>
<style type="text/css">
body {
	font: 72.5% "Trebuchet MS", sans-serif;
	margin: 50px;
	background-color:#7ecef4;

	background-repeat: no-repeat;

}

#info{
	height:400px;
}
</style>
  </head>

  <body>
    <jsp:include page="stuServiceNavigation.jsp"></jsp:include>
    <div id="accordion">
    	<h3>中科大学生成绩管理系统欢迎您的使用</h3>

    </div>
  </body>
</html>
