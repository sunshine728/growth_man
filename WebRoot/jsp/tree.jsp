<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<base href="<%=basePath%>" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/font-awesome.min.css" rel="stylesheet"/>
<link rel="stylesheet" href="css/bootstrap.min.css" />
<link rel="stylesheet" href="css/layout.css" type="text/css" />
<script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="js/jquery.innerfade.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js" ></script>
<style>
body {
		margin: 40px 10px;
		padding: 0;
		font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
		font-size: 14px;
	}
	div.wrapper{
	display:block;
	width:100%;
	margin:0;
	text-align:left;
	}
	div.wrapper h1, div.wrapper h2, div.wrapper h3, div.wrapper h4, div.wrapper h5, div.wrapper h6{
	margin:0 0 15px 0;
	padding:0 0 8px 0;
	font-size:20px;
	font-weight:normal;
	font-family:Georgia, "Times New Roman", Times, serif;
	border-bottom:1px dotted #362C20;
	}
#nav1 {
	/*鐩掓ā鍨�/

            display: -webkit-box;

            display: -moz-box;

            display: box;

            /**/
	margin: auto;
	margin-top: 50px;
/* 	border: 5px dashed lightgrey;
 */}

#nav1 {
	width: 1000px;
	min-height: 700px;
	/*绾靛悜*/
	-webkit-box-orient: vertical;
	-moz-box-orient: vertical;
	box-orient: vertical;
}

#box1 {
	height: 200px;
	/*            background: #F39C12;
*/
}

#pic1 {
	float: left;
	margin-left: 10px;
	margin-top: 10px;
}

#first_line {
	float: left;
	margin-left: 10px;
	margin-top: 10px;
}

#knowmore {
	float: right;
	font: 20px;
	margin-top: 10px;
/* 	background: lightgrey;
 */}

.myCenter {
	width: 80%;
	margin: 20px 10%;
}

.myCenter li {
	height: 50px;
	color: red;
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
.col1{color:#FFFFFF; background-color:#CBCFB5; border-top:5px solid #362C20;}
.col2{color:#B6B6B6; background:#362C20;}
.col2 a{color:#FF9900; background-color:#362C20;}
.col3{color:#666666; background-color:#FFFFFF;}
.col4{color:#666666; background-color:#C8CCB3;}
.col4 a{color:#55392B; background-color:#C8CCB3;}
.col5, .col5 a{color:#FFFFFF; background-color:#585C3F;}	
</style>
</head>



<body>
<div class="wrapper col2">
	<div id="breadcrumb">
		<ul>
			<li class="first">当前位置</li>
			<li>&#187;</li>
			<li>成长树</li>
			<li>&#187;</li>
			<li><a href="home/index">返回首页</a></li>
		</ul>
	</div>
</div>
<!-- ####################################################################################################### -->
<div class="wrapper col3">
<c:if test="${err!=null }">
		<div style="color:red">${err }</div>
	</c:if>
	<c:if test="${err==null }">
	<div class="myCenter">
	<div style="height:400px">
	<div style="margin:0 auto;border:1px solid red ;width:400px ;height:200px;">
		<img alt="tree" style="float:left" src="images/tree<fmt:formatNumber type="number" value="${years/10}" maxFractionDigits="0"/>.png" />
	<span >小树陪伴你长大！</span>
	</div>
	<div style="width:1000px;color:green;font-size:1em;padding:0px 80px;">
	<span style="margin-left:100px">您的生日是：</span><span style="color:green;font-size:2em">${borth }</span>
	<span style="margin-left:100px;">年龄</span><span style="color:green;font-size:2em">${years }</span><span>岁</span>
	<span style="margin-left:100px;">总共</span><span style="color:green;font-size:2em">${days }</span><span>天</span>
	</div>
	</div>
	<span style="color:green;font-size:2em;"> 您最近的活动：</span>
	<div style="min-height:300px;" >
	
	<c:forEach items="${acts }" var="act" varStatus="status">
			<c:if test="${status.count<5 }">
			<div style="height:100px;margin-top:15px;border-bottom:1px dashed green">
			<div>活动标题：${act.actityTitle }</div>
			<div>活动内容：${act.actityContent }</div>
			<span>开始时间：<fmt:formatDate value="${act.actityStartdate }" pattern="yyyy-MM-dd" /></span>
			<span style="margin-left:100px">结束时间：<fmt:formatDate value="${act.actityEnddate }" pattern="yyyy-MM-dd" /></span>
			</div>
			</c:if>
	</c:forEach>	
	</div>		
	</div>
	</c:if>
</div>
</body>
</html>
