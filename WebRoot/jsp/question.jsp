<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/font-awesome.min.css" rel="stylesheet"/>
<link rel="stylesheet" href="css/bootstrap.min.css" />
<link rel="stylesheet" href="css/bootstrap-table.min.css" />
<link rel="stylesheet" href="css/bootstrap-theme.min.css" />
<link rel="stylesheet" href="css/layout.css" type="text/css" />
<script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="js/jquery.innerfade.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js" ></script>
<script type="text/javascript" src="js/bootstrap-table.min.js" ></script>
	
<!-- 新 Bootstrap 核心 CSS 文件 -->
<!-- <link rel="stylesheet" href="css/bootstrap.min.css">
table控件
<link href="css/bootstrap-table.min.css" rel="stylesheet">
jQuery文件。务必在bootstrap.min.js 之前引入
<script src="js/jquery-1.9.1.min.js"></script>

最新的 Bootstrap 核心 JavaScript 文件
<script src="js/bootstrap.min.js"></script> -->
<style>
body {
		margin: 40px 10px;
		padding: 0;
		font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
		font-size: 14px;
		 background:#dff0d8;
		 color:black;
	}
div.wrapper{
	display:block;
	width:100%;
	margin:0;
	text-align:left;
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
input {
background-color:black;
}
</style>
</head>
	<body>   		
	<div class="wrapper col2">
	<div id="breadcrumb">
		<ul>
			<li class="first">当前位置</li>
			<li>&#187;</li>
			<li>益智互动题库</li>
			<li>&#187;</li>
			<li><a href="home/index">返回首页</a></li>
		</ul>
	</div>
</div>
<div class="wrapper col3">

	<table id="question_table" class="table table-striped"   data-toggle="table"
                               data-show-export="true"
                               data-pagination="true"
                               data-striped="true"
                               data-show-refresh="true"></table>
	<button id="chooseOne" onclick="showQuestionDetail();">选择</button>
	<!--  <div id="question_details" class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
   				 <div class="modal-content">
   				  	<div class="input-group">
  						<span class="input-group-addon" id="basic-addon1">题目列表明细</span>
					</div><br>
 					<div class="input-group">
  						<span class="input-group-addon" id="basic-addon1">题目内容</span>
 						 <input id="questionTitle" type="text" class="form-control" aria-describedby="basic-addon1" readonly>
					</div><br>
					 <div class="input-group">
					  	<input name="option" type="radio">
  						A.<input  id="chooseA"  type="text" readonly style="border:none">
					</div><br>
					 <div class="input-group">
					  <input name="option" type="radio">
  						B.<input  id="chooseB"  type="text" readonly style="border:none">				
					</div><br>
					<div class="input-group">
					<input name="option" type="radio">
  						C.<input  id="chooseC"  type="text"  readonly style="border:none">						
					</div><br>
					<div class="input-group">
					<input name="option" type="radio">
  						D.<input  id="chooseD"  type="text"  readonly style="border:none">					
					</div><br>
					<div id="right" style="display:none">正确答案：<input  id="questionRight"  type="text"   readonly style="border:none" value="as"></div>
		    <button   type="button" class="btn btn-primary" data-toggle="button" aria-pressed="false" autocomplete="off" onclick="showTrueAnswer();">确认</button>	
    		<button  type="button" class="btn btn-primary" data-toggle="button" aria-pressed="false" autocomplete="off" onclick="closeThisWindow();">返回</button>	
    </div>
  </div>
  
</div>  -->
<!-- <div id="question_details" class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
 --> <div id="question_details" style="display:none;position:absolute;top:100px;left:200px;width:300px;color:black;"> 
	<div class="modal-dialog modal-lg">
	 <div class="modal-content">
	 <div class="input-group">
  	<span class="input-group-addon" id="basic-addon1">题目列表明细</span>
	 </div><br/>
	<span id="questionTitle"></span><br/>
	<input type="radio"  name="op" value="">A.<span class="opa"></span ><br/>
	<input type="radio"  name="op" value="">B.<span class="opb"></span ><br/>
	<input type="radio"   name="op" value="">C.<span class="opc"></span><br/>
	<input type="radio"   name="op" value="">D.<span  class="opd"></span><br/>
<!-- 	<button id="ensure" onclick="shouAn()">确定</button> -->
	<span class="trueAnswer"></span><br/>
	  <button   type="button" class="btn btn-primary" data-toggle="button" aria-pressed="false" autocomplete="off" onclick="shouAn();">确认</button>	
 		<button  type="button" class="btn btn-primary" data-toggle="button" aria-pressed="false" autocomplete="off" onclick="closeThisWindow();">返回</button>	
</div>
</div>
 </div>  
 </div>
<!-- table控件 -->
<script src="js/bootstrap-table.min.js"></script>
<script src="js/bootstrap-table-zh-CN.min.js"></script>

	</body>
	<script type="text/javascript">
	  $("#question_table").bootstrapTable("destroy").bootstrapTable({
	        striped: true,
	        pagination: true,
	        sortable: true,
	        sortOrder: "asc",
	        sidePagination: "client",
	        showColumns: true,
	        pageSize: 20,
	        data:${questions},    
	        showExport:true,
	        search: true,
	        columns: [
	                  
	                  {field : "opr",checkbox : true}, 
					    {field : "questionId",title : "題目编号"},
					    {field : "questionTitle",title : "题目"},
					    {field : "questionType",title : "题目类型",formatter:function(value){
					    	if(value=="1"){
					    		return "益智题";
					    	}else if(value=="2"){
					    		return "趣味题";
					    	}
					    }}]
					  

	    }) ;
	     
/* 	$.ajax({
        dataType:'json',//数据传输格式：json
        url:"question/show",//请求的路径
  /*       error:function(){
            //请求失败处理函数
            alert('亲，请求失败！');
        }, 
        success:function(data){
        	alert(data); //返回的是一个字符串 我想得到一个json数组s
        }
    });	
  showQuestionList(); 
	  function showQuestionList(){ 
		  */
	
/* 			$("#question_table").bootstrapTable({
				url : "question/show",
				cache : false,
				height:400,
				pagination : true,
				search : true,
				showColumns : true,
				columns : [
				    {field : "opr",checkbox : true}, 
				    {field : "questionId",title : "題目编号"},
				    {field : "questionTitle",title : "题目"},
				    {field : "questionType",title : "题目类型"}]
			});
		}  */ 
	 
	  //查看明细
	  function showQuestionDetail(){
		 /*  var ids = getIdArr();
		  if (ids.length != 1) {
			  alert("请选中单行操作！");
			  return ;
		  }
		  var title = getTitle();
		  var questionA = getQuestionA();
		  var questionB = getQuestionB();
		  var questionC = getQuestionC();
		  var questionD = getQuestionD();
		  var questionRight = getRight();
		  $("#questionTitle").attr("value",title);
		  $("#chooseA").attr("value",questionA);
		  $("#chooseB").attr("value",questionB);
		  $("#chooseC").attr("value",questionC);
		  $("#chooseD").attr("value",questionD);
		  $("#questionRight").attr("value",questionRight); */
		 //$("#question_details").modal("show");
		  var ids = getIdArr();
		  if (ids.length != 1) {
			  alert("请选中单行操作！");
			  return ;
		  }
		 var row = $("#question_table").bootstrapTable("getSelections");
		
		 var rows=row[0];
		 $("#questionTitle").text("题目："+rows.questionTitle)
		 $(".opa").text(rows.questionA);
		 $(".opb").text(rows.questionB);
		 $(".opc").text(rows.questionC);
		 $(".opd").text(rows.questionD);
		 $(".trueAnswer").hide().text("正确答案："+rows.questionRight);
		 $("#question_details").show();
	  }
	  
	  function shouAn(){
		  $(".trueAnswer").show();
	  }
	  //显示正确选项
	  function showTrueAnswer() {
		  $("#right").css("display","block");
	  }
	  //返回上一层
	   function closeThisWindow() {
		   var $browsers = $("input[name=op]"); 
		   $("#question_details").hide();
		   $("#right").css("display","none");
		   $browsers.attr("checked",false);			  
		   $("#question_table").bootstrapTable("refresh");
	  }
		//获取选中行id数组
		function getIdArr() {
			var rows = $("#question_table").bootstrapTable("getSelections");
			var row_ids = [];
			$.each(rows, function(i, n) {
				row_ids.push(n.id);
			});
			return row_ids;
		}
		
		function getTitle() {
			var rows = $("#question_table").bootstrapTable("getSelections");
			var row_ids = [];
			$.each(rows, function(i, n) {
				row_ids.push(n.questionTitle);
			});
			return row_ids;
		}
		
		function getQuestionA() {
			var rows = $("#question_table").bootstrapTable("getSelections");
			var row_ids = [];
			$.each(rows, function(i, n) {
				row_ids.push(n.questionA);
			});
			return row_ids;
		}
		function getQuestionB() {
			var rows = $("#question_table").bootstrapTable("getSelections");
			var row_ids = [];
			$.each(rows, function(i, n) {
				row_ids.push(n.questionB);
			});
			return row_ids;
		}
		function getQuestionC() {
			var rows = $("#question_table").bootstrapTable("getSelections");
			var row_ids = [];
			$.each(rows, function(i, n) {
				row_ids.push(n.questionC);
			});
			return row_ids;
		}
		function getQuestionD() {
			var rows = $("#question_table").bootstrapTable("getSelections");
			var row_ids = [];
			$.each(rows, function(i, n) {
				row_ids.push(n.questionD);
			});
			return row_ids;
		}
		function getRight() {
			var rows = $("#question_table").bootstrapTable("getSelections");
			var row_ids = [];
			$.each(rows, function(i, n) {
				row_ids.push(n.questionRight);
			});
			return row_ids;
		}
	</script>
</html>
