<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="/WEB-INF/tld/c.tld" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	String path = request.getContextPath();
%>
<head>
<%@ include file="/jsp/include_my_head.jsp" %>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<script type="text/javascript" src="<c:url value="/jsp/weixinUser/js/weixinUser.js" />"></script>
<script type="text/javascript">
	var path='<%=path%>';
</script>
<body>
<div class="easyui-layout" fit="true"><!-- easyUI布局 -->
<div region="center" border="false" split="false"><!-- layout panel 属性设置-->
<form id="selectForm">
<table height="35px;" align="center">
	<tr>
	    <td>昵称查询：<input id="queryName"/></td>
	    <td>&nbsp;&nbsp;</td>
		<td>分组查询:<input name="select1" id="querySelect" /></td>
		<td><a href="#" id="querybtn">查询</a></td>
		<td><a href="#" id="clearparam"  class="easyui-linkbutton" onclick="clearparam()" iconcls="icon-cancel">清空</a></td>
	</tr>
</table>
</form>
   <table id="userList">
   </table>
</div>
</div>

</body>
</html>