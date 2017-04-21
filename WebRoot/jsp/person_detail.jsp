<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<base href="<%=basePath%>"/>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/font-awesome.min.css" rel="stylesheet"/>
<link rel="stylesheet" href="css/bootstrap.min.css" />
<link rel="stylesheet" href="css/bootstrap-table.min.css" />
<link rel="stylesheet" href="css/bootstrap-theme.min.css" />
<link rel="stylesheet" href="css/layout.css" type="text/css" />
<link rel="stylesheet" href="css/templatemo-style.css" type="text/css" />
<script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="js/jquery.innerfade.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js" ></script>
<script type="text/javascript" src="js/bootstrap-table.min.js" ></script>
<style>
body {
		margin: 40px 10px;
		padding: 0;
		font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
		font-size: 14px;
		 background:#dff0d8;
	}
div.wrapper{
	display:block;
	width:100%;
	margin:0;
	text-align:left;
	}
.myCenter {
	width: 80%;
	height:700px;
	margin: 10px 10%;
}
#breadcrumb{
	padding:15px 0;
	}

#breadcrumb ul{
	margin:0;
	padding:0;
	list-style:none;
	}
	#breadcrumb ul li{display:inline;}
#breadcrumb ul li.current a{text-decoration:underline;}
.col2{color:#B6B6B6; background:#362C20;}
.col2 a{color:#FF9900; background-color:#362C20;}

</style>
</head>
<body>

<script>
		//确认修改
		function update_person_pwd() {
			var user_id=${user.userId};
			var old_psd = ${user.userPwd};
			var old_pwd = $.trim($("#old_pwd").val());
			var new_pwd = $.trim($("#new_pwd").val());
			var confirm_pwd = $.trim($("#confirm_pwd").val());
			if (old_pwd == "" || new_pwd == ""||confirm_pwd == "") {
				alert("当前有为空的密码框，请重新输入");
				return;
			}
			if(old_pwd!=old_psd){
				alert("当前输入的原密码不正确,请重新输入");
				old_pwd="";
				new_pwd="";
				confirm_pwd="";
				return;
			}
			if(old_pwd==old_psd&&new_pwd==old_psd&&confirm_pwd==new_pwd){
				alert("当前输入的新密码和原密码一致，请重新输入");
				old_pwd="";
				new_pwd="";
				confirm_pwd="";
				return;
			}
			if(old_pwd==old_psd&&new_pwd==old_psd){
				alert("当前输入的确认密码和新密码不一致，请重新输入");
				old_pwd="";
				new_pwd="";
				confirm_pwd="";
				return;
			}
			if(old_pwd==old_psd&&new_pwd!=old_psd&&confirm_pwd==new_pwd){
				$.post("person/person_update_pwd",{userId:user_id,userPwd:new_pwd},function(data){
					var res =  $.parseJSON(data);
					if("yes"==res){
						alert("密码修改成功");
						window.location.href = "home/index";
					}else{
						alert("密码修改失败");
					}
				});
			}
	//		if($("#c1").attr("checked")){
	//		setCookie(username,password,7);	
	//		}
			
		};
		function exit_this_window() {
			window.location.href = "login/loginIn";
			
		};		
		</script>
<div class="wrapper col2">
	<div id="breadcrumb">
		<ul>
			<li class="first">当前位置</li>
			<li>&#187;</li>
			<li>个人中心</li>
			<li>&#187;</li>
			<li>修改密码</li>
			<li>&#187;</li>
			<li><a href="home/index">返回首页</a></li>
		</ul>
	</div>
</div>
<div class="wrapper col3">
<div class="myCenter">
	<div
		class="templatemo-content-widget templatemo-login-widget white-bg panel panel-info" style="top:130px;">
		<form class="templatemo-login-form" >
			<div class="form-group" >
				<div class="input-group">
					<div class="input-group-addon">原密码</div>
					<input type="hidden" class="form-control" id="user_id"
						value="${user.userId }"/> <input type="password"
						class="form-control" id="old_pwd"/>
				</div>
			</div>
			<div class="form-group">
				<div class="input-group">
					<div class="input-group-addon">新密码</div>
					<input type="password" class="form-control" id="new_pwd"/>
				</div>
			</div>
			<div class="form-group">
				<div class="input-group">
					<div class="input-group-addon">确认新密码</div>
					<input type="password" class="form-control" id="confirm_pwd"/>
				</div>
			</div>
			<div class="form-group">
				<button type="button" class="templatemo-blue-button width-100"
					onclick="update_person_pwd();">修改密码</button>
				<br />
				<br />
				<button type="button" class="templatemo-blue-button width-100"
					onclick="window.location='home/index'">返回</button>
			</div>
		</form>
	</div>
</div>
</div>
</body>
</html>
