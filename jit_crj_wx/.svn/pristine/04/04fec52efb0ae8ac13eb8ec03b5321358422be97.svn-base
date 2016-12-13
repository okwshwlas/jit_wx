<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="/WEB-INF/tld/bui.tld" prefix="bui"%>
<%@taglib uri="/WEB-INF/tld/c.tld" prefix="c"%>
<%
	String path = request.getContextPath();
    String openid = request.getParameter("openid");
    //表单类型 
    String ftype = request.getParameter("ftype");
    String content = (String)request.getAttribute("content");
    
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0" />
<meta name="apple-mobile-web-app-capable" content="yes" />
<meta name="format-detection" content="telephone=no" />
<style>
body {
	-webkit-touch-callout: none;
	-webkit-text-size-adjust: none;
}

body {
	font: normal 100% Helvetica, Arial, sans-serif;
}

img {
	max-width: 100%;
}
</style>
<!-- 此文件为了显示Demo样式，项目中不需要引入 -->

<%-- <link href="<c:url value="/css/dpl.css"/>" rel="stylesheet">
  <link href="<c:url value="/css/bui.css"/>" rel="stylesheet"> --%>
<link href="http://g.alicdn.com/bui/bui/1.1.10/css/bs3/dpl.css" rel="stylesheet">
<link href="http://g.alicdn.com/bui/bui/1.1.10/css/bs3/bui.css" rel="stylesheet">
<%-- <%@ include file="/jsp/proscenium/weixinphone.jsp" %> --%>

</head>
<body>
	<div class="demo-content">
		<div class="doc-content">
			<div class="row">
				<div class="span10">
					<div class="tips tips-large tips-warning">
						<span class="x-icon x-icon-error">×</span>
						<div class="tips-content">
							<h2><%=content%></h2>
							<p class="auxiliary-text">你可以继续操作以下内容：</p>
							<p>
								<a class="direct-lnk" title="返回列表页" href="<%=request.getContextPath()%>/jsp/proscenium/formlist.jsp?openid=<%=openid%>&ftype=<%=ftype%>">返回列表页</a>
							</p>
						</div>
					</div>
				</div>
			</div>
			<hr>
		</div>
	</div>
</body>
</html>
