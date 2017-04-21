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
/*   * {

            margin: 0;

            padding: 0;

            font-size: 12px;

            font-family:'Microsoft YaHei';

        }
 */
#nav1 {
	/*鐩掓ā鍨�/

            display: -webkit-box;

            display: -moz-box;

            display: box;

            /**/
	margin: auto;
	margin-top: 50px;
	border: 5px dashed lightgrey;
}

#nav1 {
	width: 1000px;
	min-height: 600px;
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
	background: lightgrey;
}

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
.col2{color:#B6B6B6; background:#362C20;}
.col2 a{color:#FF9900; background-color:#362C20;}

</style>
</head>
<body>
<div class="wrapper col2">
	<div id="breadcrumb">
    <ul>
      <li class="first">当前位置</li>
      <li>&#187;</li>
      <li>爱学习</li>
      <c:if test="${info!=null }">
      	<li>&#187;</li>
      	<li>${info.infoTitle }</li>
      	<li>&#187;</li>
			<li><a href="home/index">返回首页</a></li>
      	
      </c:if>
      
    </ul>
  </div>
</div>
<div class="wrapper col3">
	<div class="myCenter">
		<div id="nav1">
				<div id="box1">
				  		<c:if test="${info!=null }">  		
					<div id="pic1">
						<img src="images/bicycle.jpg" />
					</div>
					<div id="first_line">
						<div id="title1">标题：${info.infoTitle }</div>
						<div id="date1">日期：${info.infoDate}</div>
						<div id="author1">作者：${info.createUserId}</div>
						<div id="author1">正文：${info.infoContent }</div>					
					</div>					
					<div>
					
				</div>
				</c:if>
		</div>
	</div>
</div>
</div>
</body>
</html>
<%-- <div class="wrapper col3">
  <div class="myCenter">
  		<c:if test="${info!=null }">
  			${info.createUserId }----${info.infoContent }
  		</c:if>
  </div>
</div> --%>
