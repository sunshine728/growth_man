<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<html>
<head>
<base href="<%=basePath%>">
<link href='fullcalendar/fullcalendar.min.css' rel='stylesheet' />
<link href='fullcalendar/fullcalendar.print.min.css' rel='stylesheet' media='print' />
<script src='fullcalendar/lib/moment.min.js'></script>
<script src='fullcalendar/lib/jquery.min.js'></script>
<script src='fullcalendar/fullcalendar.min.js'></script>
<script>

	$(document).ready(function() {
		var data=${acts}
		console.log(data)
		var arr=[]
		data.forEach(function(e){
			console.log(e)
			var d={
					id: e.actityId,
					title:e.actityTitle,
					start: moment(e.actityStartdate).format("YYYY-MM-DD"),
					end:moment(e.actityEnddate).format("YYYY-MM-DD")
				}
			arr.push(d)
		})
		
		
		$('#calendar').fullCalendar({
			header: {
				left: 'prev,next today',
				center: 'title',
				right: 'month,agendaWeek,agendaDay,listWeek'
			},
			defaultDate: '2017-04-12',
			navLinks: true, // can click day/week names to navigate views

			weekNumbers: true,
			weekNumbersWithinDays: true,
			weekNumberCalculation: 'ISO',

			editable: true,
			eventLimit: true, // allow "more" link when too many events
			events:arr,
			eventClick:function(calEvent, jsEvent, view){
				console.log(calEvent)
				console.log(calEvent.id)
				window.location="sch/schDetail?act="+calEvent.id;
			},
			dayClick:function(dayDate, allDay, jsEvent, view){
				
				console.log(dayDate._i)
				window.location="sch/schDetail?act="+dayDate._i;
			}
			
		});
		
		
		
		
	});

</script>
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
	#calendar {
		max-width: 900px;
		margin: 0 auto;
	}
#header, #intro, #container, #breadcrumb, #footer, #copyright{
	position:relative;
	margin:0 auto 0;
	display:block;
	width:960px;
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
			<li>日程管理</li>
			<li>&#187;</li>
			<li><a href="home/index">返回首页</a></li>
		</ul>
	</div>
</div>
	
	<div id="calendar"></div>
</body>
</html>
