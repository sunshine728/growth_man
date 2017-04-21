<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1">  
	    <title>Visual Admin - Login</title>
	    <base href="<%=basePath%>">
        <meta name="description" content="">
        <meta name="author" content="templatemo">
	    <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,400italic,700"  type="text/css">
	    <link rel="stylesheet" href="css/font-awesome.min.css"  type="text/css" >
	    <link rel="stylesheet" href="css/bootstrap.min.css"  type="text/css" >
	    <link rel="stylesheet" href="css/templatemo-style.css" type="text/css" >
	     <script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
		<script>
		//确认登录
		function login() {
			var username = $.trim($("#loginname").val());
			var password = $.trim($("#pwd").val());
			
			if (username == "" || password == "") {
				alert("用户名/密码不能为空");
				return;
			}
	//		if($("#c1").attr("checked")){
	//		setCookie(username,password,7);	
	//		}
			$.post("login/loginnow",{
				userName:username,
				userPwd:password
			},function(data){
				var res =  $.parseJSON(data);
				if("nullUser"==res){
					alert("用户不存在！");
				}
				if("erroPassword"==res){
					alert("密码错误！");
				}
				if("yes"==res){
					/* alert("登录成功，跳转页面！"); */
					top.location.href = "login/loginIn";
				}
				if("nullMenus"==res){
					alert("您当前还没有被分配权限");
					top.location.href = "login/loginIn";
				}
			});
		};
		function exit_this_window() {
			top.location.href= "login/loginIn";
			
		};		
		</script>
	</head>
	<body class="light-gray-bg">
		<div class="templatemo-content-widget templatemo-login-widget white-bg">
			<header class="text-center">
<!--	          <div class="square"></div>
-->	          <h1>登录</h1>
	        </header>
	        <form class="templatemo-login-form">
	        	<div class="form-group">
	        		<div class="input-group">
		        		<div class="input-group-addon"><i class="fa fa-user fa-fw"></i></div>	        		
		              	<input type="text" class="form-control" id="loginname">           
		          	</div>	
	        	</div>
	        	<div class="form-group">
	        		<div class="input-group">
		        		<div class="input-group-addon"><i class="fa fa-key fa-fw"></i></div>	        		
		              	<input type="password" class="form-control" id="pwd">           
		          	</div>	
	        	</div>	          	
				<div class="form-group">
					<button type="button" class="templatemo-blue-button width-100" onclick="login();">登录</button>
					<br/><br/>
					<button type="button" class="templatemo-blue-button width-100" onclick="window.location='home/index'" >返回</button>

				</div>
	        </form>
		</div>
		<div class="templatemo-content-widget templatemo-login-widget templatemo-register-widget white-bg">
			<p>没有登录账号？<strong><a href="login/zc" class="blue-text">立即注册</a></strong></p>
		</div>
	</body>
</html>