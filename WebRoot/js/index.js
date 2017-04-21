window.onload=function(){
	
	var lis=$("#topnav").find("li");
	
	lis.click(function(){
		$("#topnav").find("li").removeClass("active")
		$(this).addClass("active")
	})
	
}

function getLoad(domId,url){
	$(domId).load(url)
}
