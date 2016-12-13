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
<%@ include file="/jsp/include_my_head.jsp" %>
<script type="text/javascript" src="<c:url value="/jsp/role/js/rolelist.js" />"></script>

<script type="text/javascript">
	var path='<%=path%>';
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
			id="userName" type="text" disabled="disabled" /></td>
		<td valign="middle" style="padding-left: 10px;"><a href="#"
			id="querybtn">查询</a></td>
		<td>&nbsp;</td>
	</tr>
</table>
<table id="org">
</table>
</div>
</div>
<div id="showMessage" class="easyui-dialog" style="padding:5px;width:400;height:200;"  closed="true" buttons="#dlg-buttons"  maximizable="true" minimizable="true" collapsible="true" resizable="true">
	<form id="fm" method="post">
	<table class="table-diy" border="0">

	<tr>
		<th class="specalt">角色名称</th>
		<td>
		<input id="ROLENAME" name="rolename" class="easyui-validatebox" missingMessage="角色名称必须填写" maxlength="25" required="true">  
	</tr>
	
	<tr>
		<th class="specalt">角色描述</th>
		<td>
		 <input id="ROLEDESC" name="roledesc" class="easyui-validatebox" missingMessage="角色描述必须填写" maxlength="100" required="true">  
	</tr>
		
        </table>
        <input type="hidden" name="roleid" id="ROLEID" /> 
        
        
	</form>
</div>
<div id="dlg-buttons">
        <a href="javascript:void(0)" class="easyui-linkbutton" onclick="saveuser()" iconcls="icon-save">保存</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" onclick="javascript:$('#showMessage').dialog('close')" iconcls="icon-cancel">取消</a>
</div>
<div id="open_show" class="easyui-window" closed="true" buttons="#dlg-buttons2">
		<ul id="tt">  
	
	 	</ul>
<div id="dlg-buttons2"><a href="#" class="easyui-linkbutton"
					onClick="doSubmit();" iconcls="icon-save">保存</a> <a href="#"
					class="easyui-linkbutton" onClick="doReturn();" iconcls="icon-cancel">取消</a>
				</div>
</div>
</body>
</html>