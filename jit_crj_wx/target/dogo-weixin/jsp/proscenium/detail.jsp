<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="/WEB-INF/tld/c.tld" prefix="c"%>
<%
	String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
    //微信用户唯一标识
    //String openid = request.getParameter("openid");
    String openid = "123456";
    String id = request.getParameter("id");
%>    
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="<%=basePath%>/jsp/proscenium/lib/style/default.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="<%=basePath%>/jsp/proscenium/lib/style/index3.css">
<script type="text/javascript" src="<%=basePath%>/js/jquery.1.8.2.min.js"></script>
<script type="text/javascript">
var path= '<%=path%>';
var openid='<%=openid%>';
var id='<%=id%>';
</script>
<script type="text/javascript">
$(function() {
	$.ajax({
		url: path+'/proscenium/tzggController/selectById.do',
		async:true,
		data:{
			'id':id
		},
		type : 'post',
		dataType : 'json',
		success : function(data){
				var str = "<p class=\"conter_p\">";
				str=data.neirong;
				str+="</p>";
				$(".detail_title").html(data.biaoti);
				$(".detail_wrap").html(str);
		}
	});
	
});

</script>

</head>
<body>
<!-- wraps -->
<div id="wrap">
	<h2 class="detail_title"></h2>
	<div class="detail_wrap">
	</div>
	
	<div style="text-align:center; padding-top:15px;padding-bottom:15px;">
 		<a href="#this" style="margin-left:-20px;" class="btn_sty btn_orange" onclick="history.go(-1)">返 回</a>
	</div>
</div>
</body>
</html>