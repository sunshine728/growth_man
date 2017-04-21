<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style>
/** {

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
</style>
<div class="wrapper col2">
	<div id="breadcrumb">
		<ul>
			<li class="first">当前位置</li>
			<li>&#187;</li>
			<li>个人中心</li>
			<li>&#187;</li>
			<li>资源中心</li>
		</ul>
	</div>
</div>
<!-- ####################################################################################################### -->
<div class="wrapper col3">
	<div class="myCenter">
	<a href="resource/download?reIds=9&op=download">xiazai</a>
	<div id="toolbar" class="col-md-12 col-sm-12 col-xs-12">
							
                            <button id="delete" class="btn btn-default col-md-4 col-sm-4 col-xs-4" style="width: 150px">删除选中文件</button>
                            <button id="download" class="btn btn-default col-md-4 col-sm-4 col-xs-4" style="width: 150px">下载选中文件</button>
                        </div>
		<table id="showResources" data-toggle="table" data-show-export="true"
			data-pagination="true">

		</table>

	</div>
	<div id="user_role_detail"></div>
	<script>
	window.load=function(){
		
	}
	$("#delete").click(function () {
        var arr = $("#showResources").bootstrapTable("getAllSelections");
        console.log(arr);
        var res=[];
        arr.forEach(function(e){
        	res.push(e.resourceId)
        })
        console.log(res);
        if(res.length>0){
        	var reIds=res.join("_");
        	$.post("resource/del",{"reIds":reIds,"op":"del"},function(data){
        		if(data=="delErr"){
        			alert("删除错误！")
        			getLoad('.content_center','resource/re')
        		}else{
        			getLoad('.content_center','resource/re')
        		}
        	})
        }
        
        
	});
	
	
	$("#download").click(function () {
        var arr = $("#showResources").bootstrapTable("getAllSelections");
        console.log(arr);
        var res=[];
        arr.forEach(function(e){
        	res.push(e.resourceId)
        })
        console.log(res);
        if(res.length>0){
        	var reIds=res.join("_");
        	/* $.get("resource/download",{"reIds":reIds,"op":"download"},function(data){
        		console.log(data)
        		if(data=="downErr"){
        			alert("下载错误！")
        			//getLoad('.content_center','resource/re')
        		}else{
        			//getLoad('.content_center','resource/re')
        		}
        	}) */
        	window.location="resource/download?reIds="+reIds+"&op=download";
        }
        
        
	});
	
	
	$("#showResources").bootstrapTable("destroy").bootstrapTable({
	        striped: true,
	        pagination: true,
	        sortable: true,
	        sortOrder: "asc",
	        sidePagination: "client",
	        showColumns: true,
	        pageSize: 20,
	       toolbar: "#toolbar", 
	        data: ${resources},
	        ////exportDataType: "all",
	        ////cdataExport:"cdataExport",
	        showExport:true,
	        search: true,
	        //showRefresh: true,
	        //align: "center",
	        columns: [
				{
				    checkbox: true
				},    
				{
				    field: "resourceId",
				    title: "ID",
				    //editable: true,
				    sortable: true,
				   visible:false 
				},
	           {
	                field: "resPath",
	                title: "路径",
	                //editable: true,
	                sortable: true,
	               visible:false 
	            },
	           {
	                field: "resName",
	                title: "名称",
	                //editable: true,
	                sortable: true,
	               /*  visible:false */
	            },
	            {
	                field: "createdate",
	                title: "时间",
	                //editable: true,
	                sortable: true,
	               /*  visible:false */
	            },
	           {
	                field: "userId",
	                title: "用户ID",
	                //editable: true,
	                sortable: true,
	               visible:false ,
	               
	               
	               
	           }
    
	        ]

	    });
	/* $('#showUsers').on('click-row.bs.table',function(row,tr){
		console.log(tr.userId);
		 var url= "javascript:$('#user_role_detail').load('user_role/detail?userId="+tr.userId+"')";
		 location.href=url;
	}); */
	   
	/* $("#showUsers").on('dbl-click-row.bs.table',function(row,tr){
		console.log(row);
		console.log(tr);
	}); */

		
	</script>
</div>
