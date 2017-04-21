<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<base href="<%=basePath%>" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Garden &mdash; 100% Free Fully Responsive HTML5 Template
	by FREEHTML5.co</title>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta name="description" content="Free HTML5 Template by FREEHTML5" />
<meta name="keywords"
	content="free html5, free template, free bootstrap, html5, css3, mobile first, responsive" />
<!-- Facebook and Twitter integration -->
<meta property="og:title" content="" />
<meta property="og:image" content="" />
<meta property="og:url" content="" />
<meta property="og:site_name" content="" />
<meta property="og:description" content="" />
<meta name="twitter:title" content="" />
<meta name="twitter:image" content="" />
<meta name="twitter:url" content="" />
<meta name="twitter:card" content="" />

<!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
<link rel="shortcut icon" href="favicon.ico" />

<link
	href='https://fonts.googleapis.com/css?family=Source+Sans+Pro:400,700,300'
	rel='stylesheet' type='text/css' />

<!-- Animate.css -->
<link rel="stylesheet" href="css/animate.css" />
<!-- Icomoon Icon Fonts-->
<link rel="stylesheet" href="css/icomoon.css" />
<!-- Bootstrap  -->
<link rel="stylesheet" href="css/bootstrap.css" />
<!-- Superfish -->
<link rel="stylesheet" href="css/superfish.css" />

<link rel="stylesheet" href="css/style.css" />


<!-- Modernizr JS -->
<script src="js/modernizr-2.6.2.min.js"></script>
<!-- FOR IE9 below -->
<!--[if lt IE 9]>
	<script src="js/respond.min.js"></script>
	<![endif]-->
<script src="js/jquery-1.9.1.min.js"></script>

</head>
<body>
	<div id="fh5co-wrapper">
		<div id="fh5co-page">
			<div id="fh5co-header">
				<header id="fh5co-header-section">
				<div class="container">
					<div class="nav-header">
						<a href="#" class="js-fh5co-nav-toggle fh5co-nav-toggle"><i></i></a>
						<h1 id="fh5co-logo">
							<a href="home/index">Gar<span>den</span></a>
						</h1>
						<!-- START #fh5co-menu-wrap -->
						<nav id="fh5co-menu-wrap" role="navigation">
						<ul class="sf-menu" id="fh5co-primary-menu">
						<c:if test="${USER_MENU!=null }"> 
						<c:forEach items="${USER_MENU }" var="menus" varStatus="status">
						 <c:if test="${menus.pmenuId=='menu_root' }"> 
						 <li>
						 <a href="${menus.morderId }">${menus.menuName}</a>
												 <ul class="fh5co-sub-menu">
						
						 <c:forEach items="${USER_MENU }" var="pmenus" varStatus="status">
						 <c:if test="${pmenus.pmenuId==menus.menuId }">
						 <li><a href="${pmenus.morderId }">${pmenus.menuName}</a></li>
						
						 </c:if>
						 </c:forEach>
						  </ul>
						 </li>
						 </c:if>
						</c:forEach>
						</c:if>
						  <c:if test="${USER_MENU==null&&USERONLINE!=null }">
						  <li><a href="home/index">首页</a></li>
							<li><a href="home/tree" class="fh5co-sub-ddown">成长树</a></li>
							<li><a href="#">幼儿资讯</a>
								<ul class="fh5co-sub-menu">
									<li><a href="home/infos?infoCategoryId=1">爱学习</a></li>
									<li><a href="home/infos?infoCategoryId=3">爱生活</a></li>
									<li><a href="home/infos?infoCategoryId=2">爱健康</a></li>
								</ul></li>
							<li><a href="question/show">趣味互动</a></li>
							<li><a href="#">个人中心</a>
								<ul class="fh5co-sub-menu">
									<li><a href="person/person_pwd">修改密码</a></li>
									<li><a href="login/loginout">注销</a></li>
								</ul></li>
						  </c:if>
							<!-- <li class="active"><a href="home/index">首页</a></li>
							<li><a href="home/tree" class="fh5co-sub-ddown">成长树</a></li>
							<li><a href="#">幼儿资讯</a>
								<ul class="fh5co-sub-menu">
									<li><a href="home/infos?infoCategoryId=1">爱学习</a></li>
									<li><a href="home/infos?infoCategoryId=3">爱生活</a></li>
									<li><a href="home/infos?infoCategoryId=2">爱健康</a></li>
								</ul></li>
							<li><a href="question/show">趣味互动</a></li>
							<li><a href="#">权限管理</a>
								<ul class="fh5co-sub-menu">
									<li><a href="person/users">用户角色管理</a></li>
									<li><a href="person/roles">角色菜单管理</a></li>
								</ul></li>
							<li><a href="#">个人中心</a>
								<ul class="fh5co-sub-menu">
									<li><a href="person/person_detail">个人资料</a></li>
									<li><a href="sch/schManger">日程安排</a></li>
									<li><a href="upload/files_upload">我的上传</a></li>
									<li><a href="upload/files_load">资源下载</a></li>
									<li><a href="person/person_pwd">修改密码</a></li>
									<li><a href="login/loginout">注销</a></li>
								</ul></li> -->
							<c:if test="${USERONLINE==null}">
							<li><a href="home/index">首页</a></li>
							<li><a href="home/tree" class="fh5co-sub-ddown">成长树</a></li>
							<li><a href="#">幼儿资讯</a>
								<ul class="fh5co-sub-menu">
									<li><a href="home/infos?infoCategoryId=1">爱学习</a></li>
									<li><a href="home/infos?infoCategoryId=3">爱生活</a></li>
									<li><a href="home/infos?infoCategoryId=2">爱健康</a></li>
								</ul></li>
							<li><a href="question/show">趣味互动</a></li>
								<li><a onclick="oo();">登录|注册</a></li>
							</c:if>
							<c:if test="${USERONLINE!=null }">
								<li>${USER_ROLE.roleName }:${USERONLINE.userName }</li>
							</c:if>
						</ul>
						</nav>
					</div>
				</div>
				</header>
				<iframe class="b" name="ifrtest" id="ifrtest"
					style="position:absolute;top:100px;left:500px;width: 500px;height: 500px;display: none;">
				</iframe>
				<%-- 			       <iframe class="C" name="ifrtest1" id="ifrtest1" style="border:1px solid salmon;position:absolute;top:50px;left:100px;height:750px; min-width: 760px;width: expression(document.body.clientWidth < 760? '760px': '100%') "> </iframe>
 --%>
			</div>

			<div class="fh5co-hero">
				<div class="fh5co-overlay"></div>
				<div class="fh5co-cover text-center"
					data-stellar-background-ratio="0.5"
					style="background-image: url(images/home-image.jpg);">
					<!--<div class="desc animate-box">
					<h2>Guardian Free HTML5 Template</h2>
					<span>Lovely Crafted by <a href="http://frehtml5.co/" target="_blank" class="fh5co-site-name">Freehtml5</a></span>
					<span><a class="btn btn-primary" href="#">Get Started</a></span>
				</div>-->
				</div>

			</div>
			<div class="copyrights"></div>
			<!-- end:header-top -->
			<div id="fh5co-work-section">
				<div class="container">
					<div class="row">
						<div
							class="col-md-8 col-md-offset-2 text-center heading-section animate-box">
							<h3>Selected Work</h3>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
								Velit est facilis maiores, perspiciatis accusamus asperiores
								sint consequuntur debitis.</p>
						</div>
					</div>
				</div>
				<div class="container">
					<div class="row">
						<div class="col-md-8 col-sm-8">
							<div class="fh5co-grid animate-box"
								style="background-image: url(images/work-1.jpg);">
								<a class="image-popup text-center" href="#">
									<div class="prod-title">
										<h3>Don’t Just Stand There</h3>
										<span>Illustration, Print</span>
									</div>
								</a>
							</div>
						</div>
						<div class="col-md-4 col-sm-4">
							<div class="fh5co-grid animate-box"
								style="background-image: url(images/work-2.jpg);">
								<a class="image-popup text-center" href="#">
									<div class="prod-title">
										<h3>Don’t Just Stand There</h3>
										<span>Illustration, Print</span>
									</div>
								</a>
							</div>
						</div>
						<div class="col-md-4 col-sm-4">
							<div class="fh5co-grid animate-box"
								style="background-image: url(images/work-3.jpg);">
								<a class="image-popup text-center" href="#">
									<div class="prod-title">
										<h3>Don’t Just Stand There</h3>
										<span>Illustration, Print</span>
									</div>
								</a>
							</div>
						</div>
						<div class="col-md-8 col-sm-8">
							<div class="fh5co-grid animate-box"
								style="background-image: url(images/work-4.jpg);">
								<a class="image-popup text-center" href="#">
									<div class="prod-title">
										<h3>Don’t Just Stand There</h3>
										<span>Illustration, Print</span>
									</div>
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- fh5co-work-section -->
			<div id="fh5co-services-section" class="fh5co-section-gray">
				<div class="container">
					<div class="row">
						<div
							class="col-md-8 col-md-offset-2 text-center heading-section animate-box">
							<h3>What We Do</h3>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
								Velit est facilis maiores, perspiciatis accusamus asperiores
								sint consequuntur debitis.</p>
						</div>
					</div>
				</div>
				<div class="container">
					<div class="row text-center">
						<div class="col-md-4 col-sm-4">
							<div class="services animate-box">
								<span><i class="icon-browser"></i></span>
								<h3>Web Development</h3>
								<p>Far far away, behind the word mountains, far from the
									countries Vokalia and Consonantia, there live the blind texts.</p>
							</div>
						</div>
						<div class="col-md-4 col-sm-4">
							<div class="services animate-box">
								<span><i class="icon-mobile"></i></span>
								<h3>Mobile Apps</h3>
								<p>Far far away, behind the word mountains, far from the
									countries Vokalia and Consonantia, there live the blind texts.</p>
							</div>
						</div>
						<div class="col-md-4 col-sm-4">
							<div class="services animate-box">
								<span><i class="icon-tools"></i></span>
								<h3>UX Design</h3>
								<p>Far far away, behind the word mountains, far from the
									countries Vokalia and Consonantia, there live the blind texts.</p>
							</div>
						</div>
						<div class="col-md-4 col-sm-4">
							<div class="services animate-box">
								<span><i class="icon-video"></i></span>
								<h3>Video Editing</h3>
								<p>Far far away, behind the word mountains, far from the
									countries Vokalia and Consonantia, there live the blind texts.</p>
							</div>
						</div>
						<div class="col-md-4 col-sm-4">
							<div class="services animate-box">
								<span><i class="icon-search"></i></span>
								<h3>SEO Ranking</h3>
								<p>Far far away, behind the word mountains, far from the
									countries Vokalia and Consonantia, there live the blind texts.</p>
							</div>
						</div>
						<div class="col-md-4 col-sm-4">
							<div class="services animate-box">
								<span><i class="icon-cloud"></i></span>
								<h3>Cloud Based Apps</h3>
								<p>Far far away, behind the word mountains, far from the
									countries Vokalia and Consonantia, there live the blind texts.</p>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- fh5co-services-section -->
			<div id="fh5co-content-section">
				<div class="container">
					<div class="row">
						<div
							class="col-md-8 col-md-offset-2 text-center heading-section animate-box">
							<h3>What Others Say</h3>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
								Velit est facilis maiores, perspiciatis accusamus asperiores
								sint consequuntur debitis.</p>
						</div>
					</div>
				</div>
				<div class="container">
					<div class="row">
						<div class="col-md-10 col-md-offset-1">
							<div class="fh5co-testimonial text-center animate-box">
								<figure> <img src="images/user-1.jpg" alt="user" /> </figure>
								<blockquote>
									<p>“Creativity is just connecting things. When you ask
										creative people how they did something, they feel a little
										guilty because they didn’t really do it, they just saw
										something. It seemed obvious to them after a while.”</p>
								</blockquote>
								<span>Steve Jobs, Apple Inc.</span>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- fh5co-content-section -->
			<div id="fh5co-blog-section" class="fh5co-section-gray">
				<div class="container">
					<div class="row">
						<div
							class="col-md-8 col-md-offset-2 text-center heading-section animate-box">
							<h3>Recent From Blog</h3>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
								Velit est facilis maiores, perspiciatis accusamus asperiores
								sint consequuntur debitis.</p>
						</div>
					</div>
				</div>
				<div class="container">
					<div class="row">
						<div class="col-lg-4 col-md-4">
							<div class="fh5co-blog animate-box">
								<a href="#"><img class="img-responsive"
									src="images/blog-1.jpg" alt="" /></a>
								<div class="image-popup">
									<div class="prod-title">
										<h3>
											<a href="#">45 Minimal Worksspace Rooms for Web Savvys</a>
										</h3>
										<span class="posted_by">Posted by: Admin</span> <span
											class="comment"><a href="">21<i
												class="icon-bubble22"></i></a></span>
										<p>Far far away, behind the word mountains, far from the
											countries Vokalia and Consonantia, there live the blind
											texts.</p>
										<a href="#" class="btn btn-primary">Read More</a>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-4 col-md-4">
							<div class="fh5co-blog animate-box">
								<a href="#"><img class="img-responsive"
									src="images/blog-2.jpg" alt="" /></a>
								<div class="image-popup">
									<div class="prod-title">
										<h3>
											<a href="#">45 Minimal Worksspace Rooms for Web Savvys</a>
										</h3>
										<span class="posted_by">Posted by: Admin</span> <span
											class="comment"><a href="">21<i
												class="icon-bubble22"></i></a></span>
										<p>Far far away, behind the word mountains, far from the
											countries Vokalia and Consonantia, there live the blind
											texts.</p>
										<a href="#" class="btn btn-primary">Read More</a>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-4 col-md-4">
							<div class="fh5co-blog animate-box">
								<a href="#"><img class="img-responsive"
									src="images/blog-3.jpg" alt="" /></a>
								<div class="image-popup">
									<div class="prod-title">
										<h3>
											<a href="#">45 Minimal Worksspace Rooms for Web Savvys</a>
										</h3>
										<span class="posted_by">Posted by: Admin</span> <span
											class="comment"><a href="">21<i
												class="icon-bubble22"></i></a></span>
										<p>Far far away, behind the word mountains, far from the
											countries Vokalia and Consonantia, there live the blind
											texts.</p>
										<a href="#" class="btn btn-primary">Read More</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>


		</div>
		<!-- END fh5co-page -->

	</div>
	<!-- END fh5co-wrapper -->

	<!-- jQuery -->
	<script src="js/jquery.min.js"></script>
	<!-- <script src="js/jquery.min.js"></script> -->
	<!-- jQuery Easing -->
	<script src="js/jquery.easing.1.3.js"></script>
	<!-- Bootstrap -->
	<script src="js/bootstrap.min.js"></script>
	<!-- Waypoints -->
	<script src="js/jquery.waypoints.min.js"></script>
	<!-- Stellar -->
	<script src="js/jquery.stellar.min.js"></script>
	<!-- Superfish -->
	<script src="js/hoverIntent.js"></script>
	<script src="js/superfish.js"></script>

	<!-- Main JS (Do not remove) -->
	<script src="js/main.js"></script>
	<script type="text/javascript">
	function oo (){
		$(".b").css("display","block");
		document.getElementById("ifrtest").src="login/dl";
			}
	function b(){
		var url="login/dl";
	}
	$(document).ready(function(){$.each($(".fh5co-sub-menu"),function (index,domEle){
		 var a=$(domEle).children("li").size();
		 console.log(a+"hjkhk");
		 console.log(domEle)
		 if(a==0){
			 $(domEle).remove(); 
		 }
			 
		});})
	
	</script>
</body>

</html>

