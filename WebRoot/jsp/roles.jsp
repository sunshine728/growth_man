<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
<link rel="stylesheet" href="css/templatemo-style.css" type="text/css" />

<link rel="stylesheet" href="css/bootstrap.min.css" />
<link rel="stylesheet" href="css/bootstrap-table.min.css" />
<link rel="stylesheet" href="css/bootstrap-theme.min.css" />
<link rel="stylesheet" href="css/layout.css" type="text/css" />

<script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="js/jquery.innerfade.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js" ></script>
<script type="text/javascript" src="js/bootstrap-table.min.js" ></script>
	<script src="js/bootstrap-table.min.js"></script>
<script src="js/bootstrap-table-zh-CN.min.js"></script>	
<style>
body {
		margin: 40px 10px;
		padding: 0;
		font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
		font-size: 14px;
		 background:#585C3F;
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
/* 	color: red;
 */}
 
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
			<li>角色菜单管理</li>
			<li>&#187;</li>
			<li><a href="home/index">返回首页</a></li>
		</ul>
	</div>
</div>
<!-- ####################################################################################################### -->
<div class="wrapper col3">
	<div class="myCenter">
	<!--  不用写JS直接启用表格 设置为 true时，按回车触发搜索方法， -->
	<!-- 设置为 true 会有隔行变色效果   设置为 true 会在表格底部显示分页条 -->
	<!-- 是否启用搜索框   是否显示 内容列下拉框-->
	<!-- 是否显示 刷新按钮    是否显示 切换试图（table/card）按钮-->
	<!-- 设置为 true 可以显示详细页面模式。-->
	<button type="button" class="templatemo-white-button width-30" onclick="addRole();" >新增</button>
	<table id="showRoles" 	data-toggle="table" data-search-on-enter-key="true" 
	data-striped="true" data-pagination="true"
	data-search="true" data-show-columns="true"
	data-show-refresh="true" data-show-toggle="true"
	data-pagination="true" 
	></table>	
	
	</div>
	<div id="role_detail" style="display:none;position:absolute;top:130px;left:500px;width:500px;height:300px;color:black;"></div>
	</div>

</body>
	<script type="text/javascript">
	$("#showRoles").bootstrapTable("destroy").bootstrapTable({
	        striped: true,
	        pagination: true,
	        sortable: true,
	        sortOrder: "asc",
	        sidePagination: "client",
	        showColumns: true,
	        pageSize: 10,
	       /*  toolbar: "#toolbar", */
	        data: ${roles},
	        ////exportDataType: "all",
	        ////cdataExport:"cdataExport",
	        showExport:true,
	        search: true,
	        //showRefresh: true,
	        //align: "center",
	        columns: [
				{
				    field: "roleId",
				    title: "roleID",
				    //editable: true,
				    sortable: true,
				   //visible:false 
				},
	             
	           {
	                field: "roleName",
	                title: "角色名称",
	                //editable: true,
	                sortable: true,
	               /*  visible:false */
	            },
	           {
	                field: "roleDescription",
	                title: "角色描述",
	                //editable: true,
	                sortable: true,
	               /*  visible:false */
	            }/* ,
	            {
	                field: "op",
	                title: "操作",
	                editable: true,
	                sortable: true,
	                align:"center",
	                width:"50px",
	                formatter:function(value){
				    	var val='<a href="#"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span></a><a href="#"><span class="glyphicon glyphicon-minus" aria-hidden="true"></span></a>';
				    	return val;
				    } } */
	            
	        ]

	    });
	
	$('#showRoles').on('click-row.bs.table',function(row,tr){
		console.log(tr.roleId);
		 var url= "javascript:$('#role_detail').load('user_role/role_menu_detail?roleId="+tr.roleId+"')";
			console.log(url);
			 location.href=url;

		
/* 			document.getElementById("role_detail").src="user_role/role_menu_detail?roleId="+tr.roleId+"";
 */		 $("#role_detail").css("display","block");
	});
	function addRole(){
		 var url= "javascript:$('#role_detail').load('user_role/add')";
		 location.href=url;
		 $("#role_detail").css("display","block");
	}
/* 	$(".detail-icon").on('expand-row.bs.table',function(index, row, $detail){
		 var row = $("#showRoles").bootstrapTable("getSelections");
		 console.log(row);
		$detail.val();
	}); */
		
	</script>


</html>
