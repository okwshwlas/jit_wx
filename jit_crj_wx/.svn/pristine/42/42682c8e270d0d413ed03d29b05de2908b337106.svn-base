<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="/WEB-INF/tld/c.tld" prefix="c"%>
<%@page import="java.util.List" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	String path = request.getContextPath();
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title></title>
<%@ include file="/jsp/include_my_head.jsp" %>
<link type="text/css" rel="stylesheet" href="<%=path%>/jsp/publicaccounts/css/tablecss_nocoler.css" />
<script type="text/javascript" src="<c:url value="/jsp/publicaccounts/js/publicaccounts_add.js" />"></script>
<script type="text/javascript">
	var path='<%=path%>';
</script>
</head>
<body>
<!-- 页面显示 -->
<div class="easyui-layout" fit="true"><!-- easyUI布局 -->
<div region="center" border="false" split="false"><!-- layout panel 属性设置-->
<div id="open_show" class="easyui-window" closed="true"></div>

<form id="fm" name="fm"  method="post">
<!-- 因为id只有一个,这里写死了 -->
<input type="hidden" id="id" name="id">
<table cellpadding="0" cellspacing="0" class="table-input" border="0">
 	 <tr>
		<th class="specalt" width="20%">公众账号名称</th>
		<td align="left" width="80%">
			<input type="text" id="account" name="account" size="50" maxlength="25"/>
		</td>
	</tr>
	<tr>
		<th class="specalt">账号TOKEN</th>
		<td><input type="text" id="token" name="token"  size="50" maxlength="50"/></td>
	</tr>
	<tr>
		<th class="specalt">微信号</th>
		<td><input type="text" id="weixin" name="weixin"  size="50" maxlength="50"/></td>
	</tr>
	<tr>
		<th class="specalt">账号描述</th>
		<td>
			<textarea cols="65" rows="7"  id="accountDepict" name="accountDepict"  onKeyUp="CountStrByte('accountDepict',1000,'reman');"></textarea>
			<div><font color="red">您还可以输入<span id="reman">1000</span>字</font></div>
		</td>
	</tr>
	<tr>
		<th class="specalt">账号APPID</th>
		<td><input type="text" id="accountAppid" name="accountAppid"  size="50" maxlength="50"/></td>
	</tr>
	<tr>
		<th class="specalt">账号APPSECRET</th>
		<td><input type="text" id="accountAppsecret" name="accountAppsecret"  size="50" maxlength="50"/></td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<a href="javascript:void(0)" id="savelist1" onclick="savefunction()">保存</a>
			<a href="javascript:void(0)" id="savelist2" onclick="closeTab()">关闭</a>
		</td>
	</tr>
</table>
</form>
</body>
</html>