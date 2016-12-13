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

<script type="text/javascript">
$(function() {
	 $.ajax({
		url: path+'/proscenium/tzggController/selectAllTzgg.do',
		async:true,
		data:{
			'idcard':idcard
		},
		type : 'post',
		dataType : 'json',
		success : function(data){
			//var data=eval('('+r+')');
			if(data.length>0){
				var str = "";
				for (var int = 0; int < data.length; int++) {
					str+= "<li>";
					str+="<dl class=\"dllist\">";
					str+="<dt class=\"dtBrand\"></dt>";
					str+="<dd class=\"ddBrand\">";
					str+="<p class=\" pheight\">"+data[int].biaoti+"</p>";
					str+="<p>"+data[int].ctime+"</p>";
					str+="</dd>";
					str+="</dl>";
					str+="<a href='detail.jsp?id="+data[int].id+"' class='enterIcon'><img src='<%=basePath%>/jsp/proscenium/lib/image/icon/icon1.png'  width=\"8\" height=\"14\"></a>";
					str+="</li>";
				}
				$(".listMain").html(str);
			}else{
				var str = "<p>无消息通知</p>";
				$(".listMain").html(str);
			}
		}
	});
});


</script>
</head>
<body>
<!-- wraps -->
<div id="wrap">
	<div class="listWrap">
		<ul class="listMain">
		</ul>
	</div>
</div>
</body>
</html>