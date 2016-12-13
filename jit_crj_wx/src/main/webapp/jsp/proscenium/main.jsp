<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="/WEB-INF/tld/c.tld" prefix="c"%>
<%
	String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
    //微信用户唯一标识
    //String openid = request.getParameter("openid");
    String openid = "123456";
    String idcard = request.getParameter("idcard");
%> 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0"/>
<link href="<%=basePath%>/jsp/proscenium/lib/style/default.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="<%=basePath%>/jsp/proscenium/lib/style/index3.css">
<script type="text/javascript" src="<%=basePath%>/js/jquery.1.8.2.min.js"></script>
<script type="text/javascript">
var path= '<%=path%>';
var openid='<%=openid%>';
var idcard = '<%=idcard%>';
</script>
<style>
html {
	background: #fff;
}
</style>
  <!-- Modernizr -->
   <script src="<%=basePath%>/jsp/proscenium/lib/js/swipe.js"></script>
   <script src="<%=basePath%>/jsp/proscenium/lib/js/jepto.js"></script>
  <!-- FlexSlider -->
  <script type="text/javascript">
     $(window).load(function(){
      $('.flexslider').flexslider({
        animation: "auto",
        start: function(slider){
          $('body').removeClass('loading');
        }
      });
    });
     $(function() {
    	 $.ajax({
 			url: path+'',
 			async:true,
 			data:{
 				'idcard':idcard
 			},
 			type : 'post',
 			dataType : 'json',
 			success : function(data){
 				
 			}
 		});
     });
  </script>
</head>
 <body>
<!-- wraps -->
<div id="wrap">
	<section class="slider">
		<div class="flexslider">
			<ul class="slides">
 				<li> <img src="<%=basePath%>/jsp/proscenium/lib/image/images/banner.jpg" alt="" height="160" /></li>
			</ul>
			<div class="flex-show"></div>
		</div>
	</section>
	<!-- 模块 -->
 <div class="contWrap">
 	<div>
		<div class="head_box">
			 <img src="<%=basePath%>/jsp/proscenium/lib/image/images/head_img.jpg" alt="" />
		</div>
		<p style=" position:absolute; top:-10%; left:42%;color:#fff; font-size:18px;">XXX</p>
	</div>
 	<ul class="ul_box">
		<li>
			<a href="xxtz.jsp?idcard=<%=idcard%>">
				<span style="height:22px; display:block;">
					<img src="<%=basePath%>/jsp/proscenium/lib/image/icon/xiaoxi.jpg" alt="" height="22" />
				</span>
				<span class="span_text">消息通知</span>
			</a>
		</li>
		<li>
			<a href="html/schedule.html">
				<span style="height:22px; display:block;">
					<img src="<%=basePath%>/jsp/proscenium/lib/image/icon/banzheng.png" alt="" width="30" />
				</span>
				<span class="span_text">办事进度</span>
			</a>
		</li>
	</ul>
	<ul class="conter_box">
		<li>
			<a href="html/passport.html" class="aColor2"><img src="<%=basePath%>/jsp/proscenium/lib/image/icon/putong_01.png" alt="" /></a>
			<p>普通护照</p>
		</li>
		<li>
			<a href="html/notice.html" class="aColor3"><img src="<%=basePath%>/jsp/proscenium/lib/image/icon/putong_02.png" alt="" /></a>
			<p>港澳通行证</p>
		</li>
		<li>
			<a href="html/taiwan.html" class="aColor4"><img src="<%=basePath%>/jsp/proscenium/lib/image/icon/putong_03.png" alt="" /></a>
			<p>台湾通行证</p>
		</li>
		 
	</ul>
</div>

</div>
</body>
</html>
