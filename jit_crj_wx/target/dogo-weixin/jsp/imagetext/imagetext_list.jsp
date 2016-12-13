<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="/WEB-INF/tld/c.tld" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	String path = request.getContextPath();
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<%@ include file="/jsp/include_my_head.jsp" %>
<link type="text/css" rel="stylesheet" href="<c:url value="/nresources/default/css/jquery.hiAlerts.css"/>" type="text/css" />
<script type="text/javascript" src="<c:url value="/jsp/imagetext/js/imagetext_list.js" />"></script>
<script type="text/javascript" src="<c:url value="/js/gridresize.js" />"></script>
<script type="text/javascript">
var path= '<%=path%>';
</script>
</head>
<body>
<!-- 页面显示 -->
<div class="easyui-layout" fit="true"><!-- easyUI布局 -->
<div region="center" border="false" split="false"><!-- layout panel 属性设置-->
<table height="35px;" align="center">
	<tr>
		<td width="77" style="padding-left: 10px;"><input name="select1"
			id="querySelect" /></td>
		<td width="100" style="padding-left: 10px;"><input class="text"
			id="userName" type="text" disabled="disabled"/></td>
		<td valign="middle" style="padding-left: 10px;"><a href="#"
			id="querybtn">查询</a></td>
		<td>&nbsp;</td>
	</tr>
</table>
<table id="org">
	<!-- dataGrid 呈现 -->
</table>

</div>
</div>


</body>
</html>