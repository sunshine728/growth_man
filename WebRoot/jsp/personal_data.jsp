<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<base href="<%=basePath%>"/>
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
	min-height: 500px;
	/*绾靛悜*/
	-webkit-box-orient: vertical;
	-moz-box-orient: vertical;
	box-orient: vertical;
}

#box1 {
	margin-top: 25px;
	margin-left: 50px;
	height: 450px;
	width: 900px;
}

#pic1 {
	float: left;
	margin-left: 10px;
	margin-top: 10px;
	width: 200px;
	height: 200px;
	z-index: 1;
}

#upload {
	float: left;
	position: relative;
	top: -180px;
	height: 200px;
	z-index: 2;
	filter: alpha(opacity : 0);
	opacity: 0;
	-moz-opacity: 0;
	-khtml-opacity: 0
}

#first_line {
	float: left;
	margin-left: 30px;
	margin-top: 10px;
	width: 600px;
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

/* .ts{
display: inline-block;
text-align: justify;
width:100px;
line-height:40px;
font-size: 20px;
}
select{
width:200px;
}
option{
height:50px;
font-size:18px;
} 
*/
</style>
</head>
<body>
<div class="wrapper col2">
	<div id="breadcrumb">
		<ul>
			<li class="first">当前位置</li>
			<li>&#187;</li>
			<li>个人中心</li>
			<li>&#187;</li>
			<li>宝宝个人档案</li>
			<li>&#187;</li>
			<li><a href="home/index">返回首页</a></li>
		</ul>
	</div>
</div>
<div class="wrapper col3">
	<div class="myCenter">
		<div id="nav1">
			<form id="person_info" method="post" enctype="multipart/form-data"
				name="tbUser">
				<c:if test="${user!=null }">
					<input type="hidden" readonly value="${user.userId}" name="userId"
						id="userId"/>
				</c:if>

				<div id="box1">
					<div id="pic1">
						<img alt="上传头像" src="${baby.babyNewPath }" id="showpic" style="height:200px;width:200px;" />
						<div id="upload">
							<input type="file" name="picUpload" id="picUpload"
								class="picUpload" style="height:200px;width:200px;" />
						</div>
					</div>

					<div id="first_line">
						<div class="panel panel-info" style="height:420px;">
							<div class="form-group">
								<label class="col-sm-3 control-label" style="margin-top:10px;">宝宝姓名
								</label>
								<div class="col-sm-8" style="margin-top:10px;">
									<input class="form-control" name="userName" id="userName"
										type="text"
										value="<c:if test="${baby!=null }">${baby.babyName }</c:if>" />
								</div>
							</div>
							<%-- 								<div class="form-group">
									<label class="col-sm-2 control-label" style="margin-top:10px;">真实姓名
									</label>
									<div class="col-sm-10" style="margin-top:10px;">
										<input class="form-control" name="userRealname" type="text"
											id="userRealname"
											value="<c:if test="${user!=null }">${user.userRealname }</c:if>" />
									</div>
								</div> --%>
							<div class="form-group">
								<label class="col-sm-3 control-label" style="margin-top:10px;">性别
								</label>
								<div class="col-sm-8" style="margin-top:10px;">
									<select name="userGender" class="form-control" id="userGender">
										<option value="1"
											<c:if test='${baby.babyGender==1}'>selected</c:if>>女</option>
										<option value="2"
											<c:if test='${baby.babyGender==2}'>selected</c:if>>男</option>
									</select>
								</div>
							</div>
							<%-- 								<div class="form-group">
									<label class="col-sm-2 control-label" style="margin-top:10px;">年龄
									</label>
									<div class="col-sm-10" style="margin-top:10px;">
										<input class="form-control" name="userAge" type="text"
											id="userAge"
											value="<c:if test="${user!=null }">${user.userAge }</c:if>" />
									</div>
								</div> --%>
							<div class="form-group">
								<label class="col-sm-3 control-label" style="margin-top:10px;">出生日期
								</label>
								<div class="col-sm-8" style="margin-top:10px;">
									<input class="form-control" name="userBorth" type="date"
										id="userBorth"
										value="<c:if test="${baby!=null }"><fmt:formatDate value="${baby.babyBirth }" pattern="yyyy-MM-dd" /></c:if>" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label" style="margin-top:10px;">体重(单位:kg)
								</label>
								<div class="col-sm-8" style="margin-top:10px;">
									<input class="form-control" name="babyWeight" type="text"
										id="babyWeight"
										value="<c:if test="${baby!=null }">${baby.babyWeight }</c:if>" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label" style="margin-top:10px;">身高(单位:m)
								</label>
								<div class="col-sm-8" style="margin-top:10px;">
									<input class="form-control" name="babyHeight" type="text"
										id="babyHeight"
										value="<c:if test="${baby!=null }">${baby.babyHeight }</c:if>" />
								</div>
							</div>
							<%-- 								<div class="form-group">
									<label class="col-sm-2 control-label" style="margin-top:10px;">现居地址
									</label>
									<div class="col-sm-10" style="margin-top:10px;">
										<input class="form-control" name="userWorkplace" type="text"
											id="userWorkplace"
											value="<c:if test="${user!=null }">${user.userWorkplace }</c:if>" />
									</div>
								</div> --%>
							<%-- 								<div class="form-group">
									<label class="col-sm-2 control-label" style="margin-top:10px;">手机号
									</label>
									<div class="col-sm-10" style="margin-top:10px;">
										<input class="form-control" name="userTel" type="text"
											id="userTel"
											value="<c:if test="${user!=null }">${user.userTel }</c:if>" />
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label" style="margin-top:10px;">邮箱
									</label>
									<div class="col-sm-10" style="margin-top:10px;">
										<input class="form-control" name="userMail" type="text"
											id="userMail"
											value="<c:if test="${user!=null }">${user.userMail }</c:if>" />
									</div>
								</div> --%>
							<div class="form-group">
								<div class="col-sm-10" style="margin-top:10px;">
									<input type="button" class="btn btn-primary"
										id="update_per_info" style="margin-left:100px;" value="确定修改"
										onclick="schOP();"/>
									<button type="button" class="btn btn-primary"
										data-dismiss="modal">返回</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>

<script>
	/* 	 $('#update_per_info').click(function(){
	 var date=$('#person_info').serialize();  
	 alert(date);
	 console.log(date);
	
	 $.post('person/update_person_info',
	 {data:date
	 },function(data){
	 alert("k")
	 }) */
	/*     	 function user(){
	 var userId;
	 var userName;
	
	 function setUserId(userId){
	 this.userId = userid;
	 }
	 function setUserName(userName){
	 this.userName = userName;
	 }
	 }; */
	$("#picUpload").on('change', function() {
		var formData = new FormData();
		formData.append('file', $('#picUpload')[0].files[0]);
		formData.append("fileType", "image");
		console.log($('#picUpload')[0].files[0]);
		$.ajax({
			url : "file/fileUpload",
			type : "post",
			cache : false,
			data : formData,
			processData : false,
			contentType : false
		}).done(function(res) {
			console.log(res);
			var r = $.parseJSON(res);
			console.log(r.filePath);
			if (r.errorCode == "1") {
				alert("上传成功");
				var src = r.filePath;
				$("#showpic").attr("src", src);
			} else if (r.errorCode=="0") {
				alert(r.errorMsg);
			}

		}).fail(function(res) {

		});
	});
	function schOP() {
		/* 			var changeUser = new user();
		 changeUser.setUserId($("#userId").val());
		 changeUser.setUserName($("#userName").val()); */

		/*          	var obj={
		
		 userId:$("#userId").val(),
		 userName:$("#userName").val()
		
		 };  */
		var s = {}
		s["userId"] = ${user.userId};
		s["babyName"] = $("#userName").val();
		s["babyGender"] = parseInt($("#userGender").val());
		s["babyWeight"]=parseFloat($("#babyWeight").val());
		s["babyHeight"]=parseFloat($("#babyHeight").val()); 
		s["babyBirth"] = $("#userBorth").val();
		/* 			 if($("#userRealname").val()!=""){
		 s["userRealname"]= $("#userRealname").val()
		 }
		 if($("#userAge").val()!=""){
		 s["userAge"]= $("#userAge").val()
		 } */
		if ($("#userGender").val() != "") {
		}
		if ($("#userBorth").val() != "") {
		}
/* 		
				

		*/
		/* 	 if($("#userWorkplace").val()!=""){
					s["userWorkplace"]= $("#userWorkplace").val()
				 }
			 if($("#userTel").val()!=""){
					s["userTel"]= $("#userTel").val()
				 }
			 if($("#userMail").val()!=""){
					s["userMail"]= $("#userMail").val()
				 } */
		$.post("person/update_person_info",

		/* 	userId : ${user.userId},
			 userName : $.trim($("#userName").val()), */
		/*userRealname : $.trim($("#userRealname").val()),
		userAge : $.trim($("#userAge").val()),
		userGender :$.trim($("#userGender").val()),
		userBorth : $.trim($("#userBorth").val()),
		userWorkplace : $.trim($("#userWorkplace").val()),
		userTel : $.trim($("#userTel").val()),
		userMail : $.trim($("#userMail").val()) */

		s, function(data) {
			var res = $.parseJSON(data);
			if ("yes" == res) {
				alert("个人资料修改成功");
				window.location.href = "home/index";
			} else {
				alert("个人资料修改失败");
			}
		});
	}

	//var res = $.parseJSON(obj);
	/* alert(obj);
		console.log(obj);
		alert(JSON.stringify(obj));
		 $.ajax({
		        url: 'person/update_person_info',
		        method: 'post',
		        contentType: 'application/json', // 这句不加出现415错误:Unsupported Media Type
		        data: {
	        		userId:$("#userId").val(),
	        		userName:$("#userName").val()
		        }, // 以json字符串方式传递
		        
		        success: function(data) {
		        	window.location="sch/schManger";
		        },
		        error: function(data) {
		        	window.location="sch/schManger";
		        }
		    });
	}; */
	/* 		$("#update_per_info").click(function() {
	 schOP();
	 }); */
	/*  $.ajax({  
	   url:'person/update_person_info',  
	   data:date,  
	   type:'post',  
	   success:function(data){  
	     alert(data);  
	   }  
	 }); */
</script>
</body>
</html>
