<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
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
</style>
<div class="wrapper col2">
	<div id="breadcrumb">
		<ul>
			<li class="first">当前位置</li>
			<li>&#187;</li>
			<li>个人中心</li>
			<li>&#187;</li>
			<li>我要上传</li>
		</ul>
	</div>
</div>
<!-- ####################################################################################################### -->
<script type="text/javascript" src="js/fileinput.min.js" ></script>
<link rel="stylesheet" href="css/fileinput.min.css" />
<div class="wrapper col3">
	<div class="myCenter">

		<div  style="width:800px;margin: 20px auto ;">
			<label class="control-label" style="color: red;">点击选择按钮进行上传。 </label>
		<input id="input_1" name="file" type="file" class="file-loading" multiple data-show-upload="true" data-show-caption="true">
	
		</div>
	</div>
	
	<script>
		
		//初始化fileinput控件（第一次初始化）
function initFileInput(ctrlName, uploadUrl) {    
    var control = $('#' + ctrlName); 

    control.fileinput({
        language: 'zh', //设置语言
        uploadUrl: uploadUrl, //上传的地址
        allowedFileTypes:['image', 'html', 'text', 'video', 'audio', 'flash', 'object'],
        //allowedFileExtensions : ['jpg', 'png','gif'],//接收的文件后缀
        dropZoneEnabled: true,
        maxFileCount: 10, 
        showUpload: true, //是否显示上传按钮
        showCaption: true,//是否显示标题
        browseClass: "btn btn-primary", //按钮样式             
        previewFileIcon: "<i class='glyphicon glyphicon-king'></i>", 
    }).on('fileuploaded', function(event, data, previewId, index) {
     var result=data.response;
     		if(result.indexOf("notLongin")>-1){
     			window.location="login/dl";
     		}else if(result.indexOf("err")>-1){
     			alert("上传错误！")
     		}else if(result.indexOf("success")>-1){
     			
     		}
    		
}) ;
}

		
		initFileInput("input_1", "resource/upfile");

	
	</script>
</div>

