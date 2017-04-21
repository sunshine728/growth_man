<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<base href="<%=basePath%>">

<!-- <link rel="stylesheet"
	href="css/bootstrap.min.css">
<script src="js/jquery-1.9.1.min.js"></script>
<script
	src="js/bootstrap.min.js"></script> -->
</head>
<style>

.spanStyle{
display: inline-block;
text-align: justify;
width:80px;
line-height:36px;
font-size: 16px;
}
</style>

	<!-- 模态框（Modal） -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				 <div class="input-group">
  	<span class="input-group-addon" id="myModalLabel">修改用户角色</span>

	 </div><br/>
			<!-- 	<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">×</button>
					<h4 class="modal-title" id="myModalLabel">修改用户角色</h4>
				</div> -->
				<div class="modal-body"><span class="spanStyle"></span><c:if test="${user!=null }"><input  type="hidden" readonly value="${user.userId}" id="userId"> </c:if></div>
				<div class="modal-body"><span class="spanStyle">昵称：</span><c:if test="${user!=null }"><input  type="text" readonly value="${user.userName}" >   </c:if></div>
				<div class="modal-body"><span class="spanStyle">选择角色：</span>
				<select id="roleId">
				 <c:if test="${roles!=null }">
				 <c:forEach items="${roles }" var="role" varStatus="status">
				<option value="${role.roleId }"  <c:if test="${role.roleId==u_r }">selected</c:if> >	${role.roleName }
				</option>
				</c:forEach>
				</c:if> 
				</select>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary"   data-dismiss="modal" onclick="updateUserRole('upd');">提交修改</button>
					<button type="button" class="btn btn-primary"   data-dismiss="modal" onclick="updateUserRole('del');">删除用户</button>
					<button type="button" class="btn btn-primary" data-dismiss="modal">关闭</button>				
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->
	<script>
 $(function () { 
	$('#myModal').modal({
	keyboard: true
})}); 
 
 function updateUserRole(op){
	var userId= $("#userId").val();	 
	var roleId= $("#roleId").val();
	 var url="user_role/role_detail?userId="+userId+"&roleId="+roleId+"&op="+op;
/* 	 console.log(url)
 */	$.get(url, function(data){
     $(".fade.in").remove();
     window.location.href="person/users";
 });
 }
 
 
</script>


