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
<script type="text/javascript" src="<c:url value="/jsp/keywords/js/keywords.js" />"></script>
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
</table>
</div>
</div>
<div id="showMessage" class="easyui-dialog" style="padding:5px;width:400px;height:200px;"  closed="true" buttons="#dlg-buttons" maximizable="true" minimizable="true" collapsible="true" resizable="true">
	<form id="fm" method="post">
	<input type="hidden" name="id" id="id"/>
		<table style="width: 100%">
			<tr style="height: 30px">
				<td style="width: 25%" align="right">标  识:</td>
				<td style="width: 75%"><input id="sign" name="sign" class="easyui-validatebox" required="true" maxlength="25"></td>
			</tr>
			<tr>
				<td  align="right">关键字:</td>
				<td><input id="context" name="context" class="easyui-validatebox" required="true" maxlength="50"></td>
			</tr>
		</table>
	</form>
</div>
<div id="dlg-buttons">
        <a href="javascript:void(0)" class="easyui-linkbutton" onclick="savefunction()" iconcls="icon-save">保存</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" onclick="javascript:$('#showMessage').dialog('close')" iconcls="icon-cancel">取消</a>
</div>
<div id="open_show" class="easyui-window" closed="true">
</div>
</body>
</html>