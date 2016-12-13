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
<script type="text/javascript" src="<c:url value="/jsp/user/js/userlist.js" />"></script>
<script type="text/javascript"
	src="<c:url value="/js/dogo_tools.js" />"></script>

<script type="text/javascript">
var path= '<%=path%>';
</script>

</head>
<body>
<div class="easyui-layout" fit="true"><!-- easyUI布局 -->
<div region="center" border="false" split="false"><!-- layout panel 属性设置-->
<!--<div id="showOrg" fit="true">  选项卡 -->
<!--<div id="title" title="物料入库信息">-->
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
	<!-- dataGrid 呈现 -->
</table>
</div>
</div>
<!--</div>-->
<!--</div>-->
<div id="showMessage" class="easyui-dialog"  closed="true" buttons="#dlg-buttons" maximizable="true" minimizable="true" collapsible="true" resizable="true">

<form id="strform" method="post">
<input type="hidden" name="userid" id="userId"/>
<table class="table-diy" border="0" style="width: 400px;height: 200px;" align="center">

	<tr>
		<th class="specalt">登录账号</th>
		<td><input name="usercode" id="userCode" class="easyui-validatebox"
			missingMessage="登录账号必须填写" maxlength="25" required="true" style="width: 155px;" ></td>
	</tr>
	 <tr>
		<th>真实姓名</th>
		<td><input name="username" id="userNames"  class="easyui-validatebox"
		missingMessage="用户姓名必须填写" maxlength="25" required="true" style="width: 155px;"></td>
	</tr>
	<tr>
		<th>用户密码</th>
		<td><input name="userpwd" id="userPwd"  class="easyui-validatebox"
			missingMessage="用户密码必须填写" maxlength="25" required="true" style="width: 155px;"></td>
	</tr>
	<tr>
		<th>用户手机</th>
		<td>
			<input id="userTel" name="usertel" class="easyui-validatebox" style="width: 155px;" maxlength="255">
		</td>
	</tr>
	<tr>
		<th>用户电话</th>
		<td><input name="usermobiletel" id="userMOBILETEL" class="easyui-validatebox" maxlength="50" style="width: 155px;" maxlength="255"></td>
	</tr>
</table>
</form>
</div>
<div id="dlg-buttons">
        <a href="javascript:void(0)" class="easyui-linkbutton" onclick="saveuser()" iconcls="icon-save">保存</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" onclick="javascript:$('#showMessage').dialog('close')" iconcls="icon-cancel">取消</a>
    </div>
<div id="pager" style="padding:5px;width:400;height:200;display:none"  maximizable="true" minimizable="true" collapsible="true" resizable="true">
	<form id="fm" method="post">
	    <input type="hidden" id="userid" name="userid">
	    <table class="table-diy" id="workTab" border="0" align="center">
	  
	    
	<tr>
	<td class="text-td" >真实姓名</td>
	<td >
	<div id="uname"></div>
	</td>
    </tr>
  
    <tr>
	<td class="text-td" >角色名称</td>
	<td >
	<input class="easyui-combobox" id="roleid" name="roleid" missingMessage="角色名称必须填写" required="true" style="width: 155px;" data-options="editable:false">
	</td>
  </tr>
	    </table>
		
	</form>

</div>


</body>
</html>