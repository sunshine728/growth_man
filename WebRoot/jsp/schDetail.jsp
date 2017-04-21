<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<html>
<head>
<base href="<%=basePath%>">
<link rel="stylesheet" href="css/bootstrap.min.css" />
<link rel="stylesheet" href="css/bootstrap-table.min.css" />
<link rel="stylesheet" href="css/bootstrap-theme.min.css" />
<link href='fullcalendar/fullcalendar.min.css' rel='stylesheet' />
<link href='fullcalendar/fullcalendar.print.min.css' rel='stylesheet' media='print' />
<script src='fullcalendar/lib/moment.min.js'></script>
<script src='fullcalendar/lib/jquery.min.js'></script>
<script src='fullcalendar/fullcalendar.min.js'></script>

<style>

 	body {
		margin: 40px auto;
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
			<li>日程详情管理</li>
			<li>&#187;</li>
			<li><a href="home/index">返回首页</a></li>
		</ul>
	</div>
</div>
<div class="panel panel-info" style="margin: 30px 280px;height:320px;">
 <input type="hidden" name="id" id="actId" value="<c:if test="${acts!=null }">${acts.actityId }</c:if>" />  
 <br/>
	<div class="form-group">
    <label  class="col-sm-2 control-label">日程标题</label>
    <div class="col-sm-10">
    <input class="form-control" name="title" id="title" type="text"  value="<c:if test="${acts!=null }">${acts.actityTitle }</c:if>"/>
    </div>
  </div>  <br/>
  <div class="form-group">
    <label  class="col-sm-2 control-label">日程内容</label>
    <div class="col-sm-10" style="margin-top:10px;">
    <textarea class="form-control" name="content" id="content" style="height:120px;" ><c:if test="${acts!=null }">${acts.actityContent }</c:if></textarea>
    </div>
  </div>  
    <div class="form-group">
    <label  class="col-sm-2 control-label">开始时间</label>
    <div class="col-sm-10" style="margin-top:10px;">
    <input class="rhui-field" name="start" id="start" type="date"  value="<c:if test="${start!=null }">${start }</c:if>"/>
    </div>
  </div> 
      <div class="form-group">
    <label  class="col-sm-2 control-label" >结束时间</label>
    <div class="col-sm-10" style="margin-top:10px;">
<input class="rhui-field" name="end" id="end" type="date" value="<c:if test="${end!=null }">${end }</c:if>"/>
    </div>
  </div>

  <div class="form-group">
    <div class="col-sm-offset-2 col-sm-10" style="margin-top:20px;">
          <c:if test="${btn==2 }">
           <button type="button" class="btn btn-primary" data-dismiss="modal" id="add">新增</button>
            </c:if> 
            <c:if test="${btn==1 }">
            <button type="button" class="btn btn-primary" data-dismiss="modal" id="change">修改</button>
            <button type="button" class="btn btn-primary" data-dismiss="modal" id="delete">刪除</button>
            </c:if>         
            <button type="button" class="btn btn-primary" data-dismiss="modal" id="re">返回</button>
    </div>
  </div>
</div>
            <%-- <!-- 日程id -->  
            <input type="hidden" name="id" id="actId" value="<c:if test="${acts!=null }">${acts.actityId }</c:if>" />  
            <table style="margin-left:25px;">  
                <tr>  
                    <td class="field-label">日程标题：</td>  
                    <td>
                    <input class="rhui-field" name="title" id="title" type="text"  value="<c:if test="${acts!=null }">${acts.actityTitle }</c:if>"/>
                    </td>  
                </tr>  
                <tr>  
                    <td class="field-label">日程内容：</td>  
                    <td>
                    <textarea class="rhui-field" name="content" id="content" style="height:62px;" ><c:if test="${acts!=null }">${acts.actityContent }</c:if></textarea>
                    </td>  
                </tr>  
                <tr>  
                    <td class="field-label">开始时间：</td>  
                    <td>
                    <input class="rhui-field" name="start" id="start" type="date"  value="<c:if test="${start!=null }">${start }</c:if>"/>
                    </td>  
                </tr>  
                <tr>  
                    <td class="field-label">结束时间：</td>  
                    <td><input class="rhui-field" name="end" id="end" type="date" value="<c:if test="${end!=null }">${end }</c:if>"/></td>  
                </tr>  
            </table>  --%>
         
        <script>
        $("#re").click(function(){
        	window.location="sch/schManger";
        })
        
        /* $("#delete").click(function(){
        	var obj={
        		"op":1,
        		"actId":$("#actId").val(),
        		"title":$("#title").val(),
        		"content":$("#content").val(),
        		"start":$("#start").val(),
        		"end":$("#end").val(),
        	}
        	
        	 $.ajax({
        	        url: 'sch/schOp',
        	        method: 'post',
        	        contentType: 'application/json', // 这句不加出现415错误:Unsupported Media Type
        	        data: JSON.stringify(obj), // 以json字符串方式传递
        	        success: function(data) {
        	        	window.location="sch/schManger";
        	        },
        	        error: function(data) {
        	        	window.location="sch/schManger";
        	        }
        	    });
        	
        }); */
        
        function schOP(op){
        	var obj={
            		"op":op,
            		"actId":$("#actId").val(),
            		"title":$("#title").val(),
            		"content":$("#content").val(),
            		"start":$("#start").val(),
            		"end":$("#end").val(),
            	}
            	console.log(obj)
            	 $.ajax({
            	        url: 'sch/schOp',
            	        method: 'post',
            	        contentType: 'application/json', // 这句不加出现415错误:Unsupported Media Type
            	        data: JSON.stringify(obj), // 以json字符串方式传递
            	        success: function(data) {
            	        	window.location="sch/schManger";
            	        },
            	        error: function(data) {
            	        	window.location="sch/schManger";
            	        }
            	    });
        }
        $("#add").click(function(){	
        	schOP("add")
        });
        $("#change").click(function(){
        	schOP("change")
        })
        $("#delete").click(function(){
        	schOP("del")
        })
        
        
        </script>
 
	
</body>
</html>
