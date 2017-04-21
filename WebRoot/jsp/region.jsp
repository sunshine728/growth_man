<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


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
	    <title>注册</title>
	    <base href="<%=basePath%>">
	    
        <meta name="description" content="">
        <meta name="author" content="templatemo">
        <!-- 
        Visual Admin Template
        http://www.templatemo.com/preview/templatemo_455_visual_admin
        -->
	    <link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,400italic,700" rel="stylesheet" type="text/css">
	    <link href="css/font-awesome.min.css" rel="stylesheet">
	    <link href="css/bootstrap.min.css" rel="stylesheet">
	    <link href="css/templatemo-style.css" rel="stylesheet">
	    <script src="js/jquery-1.9.1.min.js"></script>
	    
		<script>
		
		var names=[];
		<c:forEach items="${users }" var ="user" varStatus="status" >
    		names.push("${user.userName}")
    	</c:forEach>
		console.log(names)
				//确认注册
		function resigister() {
			var username = $.trim($("#username").val());
			var password = $.trim($("#password").val());
			console.log(username)
			var confirm_password = $.trim($("#confirm_pwd").val());
			if (username == "" || password == ""||confirm_password=="") {
				alert("用户名/密码/确认密码不能为空");
				return;
			}
			if(names.indexOf(username)>=0){
				alert("用户名已存在")
				return;
			}
			if(!(password==confirm_password)){
					alert("密码确认密码不一致，请重新输入！");				
				return;
			}
			
				$.post("login/reg",{"userName":username,"pwd":password},function(data){
					if(data=='reg'){
						window.location='login/zc';
					}else{
						console.log(data)
						var sd =$.parseJSON(data)
						var s=sd.substring(1,sd.length-1).split(",")
						console.log(s[0]+"----"+s[1])
						$.post("login/loginnow",{
							"userName":s[0],
							"userPwd":s[1]
						},function(data){
							var res =  $.parseJSON(data);
							if("nullUser"==res){
								/* alert("用户不存在！"); */
							}
							if("erroPassword"==res){
								alert("密码错误！");
							}
							if("yes"==res){
								/* alert("登录成功，跳转页面！"); */
							top.location.href = "login/loginIn";
							}
						});
					};
					
					
				})			

		};
		function exit_this_window() {
			top.location.href = "login/loginIn";	
		};
		</script>
	    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
	    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
	    <!--[if lt IE 9]>
	      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
	      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	    <![endif]-->
	</head>
	<body class="light-gray-bg">
		<div class="templatemo-content-widget templatemo-login-widget white-bg">
			<header class="text-center">
<!--	          <div class="square"></div>
-->	          <h1>注册</h1>
	        </header>
	        <form  class="templatemo-login-form">
	        	<div class="form-group">
	        		<div class="input-group">
	        		<div class="input-group-addon" >用户名</div>	        		
	              	<input type="text" class="form-control" id="username">           
		          	</div>	
	        	</div>
	        	<div class="form-group">
	        		<div class="input-group">
		        		<div class="input-group-addon" >密		码</div>	        		
	              	<input type="password" class="form-control" id="password">           
		          	</div>	
	        	</div>	    
	        		<div class="form-group">
	        		<div class="input-group">
	        		<div class="input-group-addon" >确认密码</div>	        		
	              	<input type="password" class="form-control" id="confirm_pwd">           
		          	</div>	
	        	</div>	 
				<div class="form-group">
					<button type="button" class="templatemo-blue-button width-100" onclick="resigister();">确认注册</button>
					<br /><br />
					<button type="button" class="templatemo-blue-button width-100" onclick="exit_this_window();">退出</button>
				</div>
	        </form>
		</div>

	</body>
		
</html>