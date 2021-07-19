<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>中科大学生管理系统</title>
<link href="css/ui-lightness/jquery-ui-1.10.4.custom.css"
	rel="stylesheet">
<script src="js/jquery-1.10.2.js"></script>
<script src="js/jquery-ui-1.10.4.custom.js"></script>
<script type="text/javascript">
	function judgeFun(){
		var $login = $("input[name=login]");
		$login.bind("click", function(){
		if($.trim($("input[name=username]").val())=="")
		{
			$(".ErrorStyle").empty();
			$("#usernameError").text("用户名不能为空");
			return;
		}
		if($.trim($("input[name=password]").val())=="")
		{
			$(".ErrorStyle").empty();
			$("#passwordError").text("密码不能为空");
			return;
		}
		if($.trim($("input[name=certCode]").val())=="")
		{
			$(".ErrorStyle").empty();
			$("#certCodeError").text("验证码错误");
			return;
		}
		$.ajax(
			{
				type:"post",
				url:"loginJudge.action",
				dataType:"json",
				data:{
					username:$("input[name=username]").val(),
					password:$("input[name=password]").val(),
					certCode:$("input[name=certCode]").val(),
					userRole:$("input[name=userRole]:checked").val()
				},
				success : function(data) {
					var d = eval("(" + data + ")");
					if(d.judge=="certCodeFail")
					{
						$(".ErrorStyle").empty();
						$("#certCodeError").text("验证码错误");
						return;
					}
					if(d.stuFound)
					{
					/* 	alert("找到了学生信息"); */
					window.location.href="stuMain.action";
						return ;
					}
					else if(d.teacherFound)
					{
						/* alert("找到了教师信息"); */
						window.location.href="teacherMain.action";
						return;
					}
					else if(d.administratorFound)
					{
						window.location.href="adminMain.action";
					}
					else{
						alert("用户名或密码错误，系统拒绝了您的访问请求");
						changeimg();
						return ;
					}
					
				},
				error : function() {
					alert("系统异常，请稍后重试！");
				}
			}
			);
		});
	}
	function changeimg()
	{
		var myimg = document.getElementById("code");
		now = new Date();
		myimg.src = "makeCertPic.jsp?code=" + now.getTime();
	}
	$(function (){
		$("input[name=login]").button();
		judgeFun();
	});
</script>
<style type="text/css">

	.test{
		background-image: url("image/loginBg.jpg") ;
		background-repeat: no-repeat;
		background-size: 100% 100%;
		background-attachment: fixed;
	}
	.test1{
		position: relative;
		margin-top: 200px;
	}
	.datalist{
	border:1px solid #0058a3;	/* 表格边框 */
	font-family:Arial;
	border-collapse:collapse;	/* 边框重叠 */
	background-color:#eaf5ff;	/* 表格背景色 */

	font-size:18px;
}

.datalist caption{
	padding-bottom:10px;
	font:bold 1.8em;
	text-align:center;
}
.datalist th{
	border:1px solid #0058a3;	/* 行名称边框 */
	background-color:#4bacff;	/* 行名称背景色 */
	color:#FFFFFF;				/* 行名称颜色 */
	font-weight:bold;
	padding-top:8px; padding-bottom:8px;
	padding-left:16px; padding-right:16px;
	text-align:center;
}
.datalist td{
	border:1px solid #0058a3;	/* 单元格边框 */
	text-align:left;
	padding-top:6px; padding-bottom:6px;
	padding-left:12px; padding-right:12px;
}
.ErrorStyle{
	color: #ff0000;
	padding-left:6px;
}
</style>
</head>
<body class="test" >
	<div class="test1" align="center">
		<form action="loginCheck.jsp" method="post" id="form1">
		<table class="datalist">
		<caption style="color: blue;font-size: 40px">

				中科大学生成绩管理系统登陆

		</caption>
			<tr><th>用户名：</th><td colspan="2"><input type="text" name="username" /><span id="usernameError" class="ErrorStyle"></span></td> </tr>
			<tr><th> 密&nbsp;&nbsp;&nbsp;&nbsp;码：</th><td colspan="2"><input
				type="password" name="password" /><span id="passwordError" class="ErrorStyle"></span></td></tr>
			<tr><th>验证码：</th><td><input
				type="text" name="certCode" /> <img id="code" src="makeCertPic.jsp"><a
				href="javascript:changeimg()">看不清，换一张 </a></td><td width="120px"><span id="certCodeError" class="ErrorStyle"></span></td></tr>
				<tr>
				<th>角&nbsp;&nbsp;&nbsp;&nbsp;色：</th>
				<td colspan="2">
				<input type="radio" name="userRole" value="学生" checked="checked">学生
				<input type="radio" name="userRole" value="教师">教师
				<input type="radio" name="userRole" value="管理员">管理员
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input
				type="button" name="login" value="登录" /></td></tr>
		</table>
		</form>

			<div class="ui-widget">
				<div class="ui-state-highlight ui-corner-all" style="margin-top: 20px; padding: 0 .7em;">
						<p><span class="ui-icon ui-icon-info" style="float: left; margin-right: .3em;"></span>
					<strong>学生：</strong> 学号；<strong>教师：</strong>教师编号；<strong>管理员：</strong>姓名</p>
				</div>
			</div>
		</div>
</body>
</html>