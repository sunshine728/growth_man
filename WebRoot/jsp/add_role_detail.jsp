<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<base href="<%=basePath%>">


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
	<!--  <div class="modal fade" id="myModal2" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">  -->
		<div class="modal-dialog">
			<div class="modal-content">
				 <div class="input-group">
  	<span class="input-group-addon" id="myModalLabel">新增角色菜单</span>

	 </div><br/>
				<div class="modal-body"><span class="spanStyle">角色名：</span><input  type="text" id="roleName" ></div>
				<div class="modal-body"><span class="spanStyle">选择菜单：</span>
				 <c:if test="${menu!=null }">
				 <c:forEach items="${menu}" var="menus" varStatus="status">
				  
				<input type="checkbox"  value="${menus.menuId }" name="menuId" style="display:inline;">${menus.menuName }
				
				</c:forEach>
				</c:if> 
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary"   data-dismiss="modal"  onclick="addRole();">提交</button>
					<button type="button" class="btn btn-primary"  data-dismiss="modal"  onclick="exit_add_window();">关闭</button>				
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	<!-- </div> -->
	<!-- /.modal -->
	<script>
 $(function () { 
	$('#myModal2').modal({
	keyboard: true
})});  
 
 function exit_add_window(){
	 $("#role_detail").css("display","none");
}
 function addRole(){
	var roleName= $("#roleName").val();
		var menuId =[]; 
		$('input[name="menuId"]:checked').each(function(){ 
			menuId.push($(this).val()); 
		}); 
	console.log(menuId);
	console.log(roleName);
	$.ajax({
	    url:'user_role/add_role_detail',
	    type:'POST', //GET
	    async:true,    //或false,是否异步
	    traditional: true,
	    data:{
	    	menuId:menuId,
	    	roleName:roleName
	    },
	    timeout:5000,    //超时时间
	    dataType:'json',    //返回的数据格式：json/xml/html/script/jsonp/text
	    beforeSend:function(xhr){
	        console.log(xhr)
	        console.log('发送前')
	    },
	    success:function(data,textStatus,jqXHR){
	        console.log(data)
	        console.log(textStatus)
	        console.log(jqXHR)
	    },
	    error:function(xhr,textStatus){
	        console.log('错误')
	        console.log(xhr)
	        console.log(textStatus)
	    },
	    complete:function(){
	        console.log('结束');
	        $(".fade.in").remove();
	        window.location.href='person/roles';
	    }
	})
	/*  var url="user_role/update_role_detail?roleId="+roleId+"&menuId="+menuId;
	$.get(url, function(data){
 }); */
 }
 
 
</script>

