<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="/WEB-INF/tld/c.tld" prefix="c"%>
<%@ page import="dogo.model.User"%>
<%
	User user = (User) request.getSession().getAttribute(
			"loginUser");
	String userName = user.getUsername();
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="/jsp/include_my_head.jsp"%>

<link rel="stylesheet"
	href="<c:url value="/zTree/css/zTreeStyle/zTreeStyle.css"/>"
	type="text/css"></link>

<script type="text/javascript"
	src="<c:url value="/zTree/js/jquery.ztree.all-3.2.min.js"/>"></script>

<title>吉林省公安出入境管理局微信管理平台</title>
</head>
<body class="easyui-layout" id="cclayout">
	<div region="north" style="height: 80px; overflow: hidden;" href="<c:url value="/jsp/main/north.jsp"/>"></div>
	<div region="south" style="height: 25px; overflow: hidden;" href="<c:url value="/jsp/main/south.jsp"/>"></div>
	<div region="west" title="  " id="leftmenu" style="width: 210px; height: 300px; overflow-y: auto; overflow-x: hidden" href="<c:url value="/userControl/showTreeMenu.do"/>"></div>
	<div region="center" title="欢迎您 :<%=userName%>" style="overflow: hidden;" href="<c:url value="/jsp/main/center.jsp" />"></div>
</body>
</html>