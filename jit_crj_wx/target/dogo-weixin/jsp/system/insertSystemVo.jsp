<%@ 
page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
 <%@taglib uri="/WEB-INF/tld/c.tld" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="<c:url value="/css/common.css"/>">
<link rel="stylesheet" type="text/css" href="<c:url value="/css/system.css"/>">
<script type='text/javascript' src="<c:url value='/js/data_check.js'/>"></script>
<script type='text/javascript' src='<c:url value="/dwr/interface/systemValidater.js"/>'></script>
<script type='text/javascript' src='<c:url value="/dwr/engine.js"/>'></script>
<script type='text/javascript' src='<c:url value="/dwr/util.js"/>'></script>
<script src="<c:url value='/js/system.js'/>"></script> 
<style type="text/css">
.thl { behavior:url('<c:url value='/jsp/login/js/tablehl.htc'/>'); }
.bhl { behavior:url('<c:url value='/jsp/login/js/buttonhl.htc'/>'); }
.ichg { behavior:url('<c:url value='/jsp/login/js/imagechg.htc'/>'); }
</style>
<script language="javascript">
function doSubmit() {
	var userCode = document.getElementById("userCode");
	var userName = document.getElementById("userName");
	var userPwd = document.getElementById("userPwd");
	var depId = document.getElementById("depCode");
	var roleId = document.getElementById("roleId");
	var form1 = document.getElementById("form1");
	if(isEmpty(userCode.value)){
		alert("用户账号不能为空，请输入用户账号!");
		userCode.focus();
		return;
	}
	if (isEmpty(userName.value)) {
			alert("用户名称不能为空，请输入用户名称!");
			 userName.focus();
			return;

	}
	if(!checkAreaLength(userName.value,20)){
			alert("用户名称最多允许输入10个汉字!");
			userName.focus();
			return;
	} 
	if(!checkAreaLength(userCode.value,16)){
		alert("用户账号最多允许输入16位!");
		userCode.focus();
		return;
	} 
	if(!checkAreaLength(userPwd.value,16)){
		alert("用户密码最多允许输入16位!");
		userPwd.focus();
		return;
	} 
	if (isEmpty(userPwd.value)) {
			alert("用户密码不能为空，请输入用户密码!");
			userPwd.focus();
			return;

	}
	if (isEmpty(depId.value)) {
			alert("管理部门不能为空，请选择管理部门!");
			depId.focus();
			return;

	}
	if (isEmpty(roleId.value)) {
			alert("用户角色不能为空，请选择用户角色!");
			roleId.focus();
			return;

	}
	systemValidater.ValUserCodeIsTheSame(userCode.value, function callBack(s){
		if(s=="0"){
			 alert("该用户账号已存在");
		 }else{
			 if (!confirm("您确定要新增此用户吗?")) {
					return;
			 } 
			 form1.submit();
		 }
		
	});
	} 
	function doLoad() {
		document.getElementById("userCode").focus();
		document.getElementById("userName").focus();
		document.getElementById("userPwd").focus();
	}
	function doreset() {
		document.getElementById("form1").reset();
		doLoad();
	}
	function Return(){
		var form1 = document.getElementById("form1");
		form1.action='<c:url value="/selectAllSystemVo.do" />'
		form1.submit();
	}
</script>
<title></title>
</head>
<body topmargin=0 leftmargin=0 onLoad="doLoad();">
<form id="form1"  name="form1" action="<c:url value="/InsertSystemVo.do" />" method="post">
<table width="100%"  border="0" cellpadding="0" cellspacing="0">
<tr>
<td colspan="2">
<table width="100%"  border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td colspan="3" class="wz">&nbsp;&nbsp;当前位置：首页-系统管理-用户新增</td>
        </tr>
      <tr>
         <td width="49" background="<c:url value="/jsp/login/images/common/tpbg.gif"/>"><img src="<c:url value="/jsp/login/images/common/tabbttb.gif"/>" width="49" height="34"></td>
		 <td width="783" background="<c:url value="/jsp/login/images/common/tpbg.gif"/>" class="bt">用户新增</td>
		 <td background="<c:url value="/jsp/login/images/common/tpbg.gif"/>">&nbsp;</td>
      </tr>
    </table>
</td>
</tr>
<tr>
<td width="832" valign="top" align="center">
<table width="400"  border="0" cellpadding="0" cellspacing="1" style="margin-top: 20px;background-color: #A0D3F5;" >
 
 <tr height="35px">
    <td align="right" valign="middle" height="6" style="background-color:#F3F9FC;"> 
	<span class="tab-bt">用户账号:</span>
	</td> 
	<td align="left" style="background-color:#F3F9FC;">&nbsp;<input type="text" name="userCode" class="txt" style="width:200px;" id="userCode" maxlength="20"><font color="#FF0000">*</font></td>
  </tr>
  <tr height="35px">
    <td align="right" valign="middle" height="6" style="background-color:#F3F9FC;"> 
	<span class="tab-bt">用户名称:</span>
	</td> 
	<td align="left" style="background-color:#F3F9FC;">&nbsp;<input type="text" name="userName" class="txt" style="width:200px;" id="userName"><font color="#FF0000">*</font></td>
  </tr>
   <tr height="35px">
    <td align="right" valign="middle" height="6" style="background-color:#F3F9FC;"> 
	<span class="tab-bt">用户密码:</span>
	</td> 
	<td align="left" style="background-color:#F3F9FC;">&nbsp;<input type="password" name="userPwd" class="txt" style="width:200px;" id="userPwd" maxlength="20"><font color="#FF0000">*</font></td>
	</tr>
    <tr height="35px">
    <td align="right" valign="middle" height="6" style="background-color:#F3F9FC;">
	<span class="tab-bt">管理部门:</span>
	</td> 
	<td align="left" style="background-color:#F3F9FC;">
	&nbsp;<select id="depCode" name="depCode" class="txt" style="width:200px;">
	<option value="">---请选择---</option>
	<c:forEach items="${depList}" var="depList">
	<option value="${depList.depCode}">${depList.depName}</option> 
	</c:forEach>
	</select><font color="#FF0000">*</font>
	</td>  
  </tr>
      <tr height="35px">
    <td align="right" valign="middle" height="6" class="txt" style="background-color:#F3F9FC;">
	<span class="tab-bt">用户角色:</span>
	</td>
	<td align="left" style="background-color:#F3F9FC;">
	&nbsp;<select id="roleId" name="roleId" class="txt" style="width:200px;">
	<option value="">---请选择---</option>
	<c:forEach items="${roleList}" var="roleList">
	<option value="${roleList.roleCode}">${roleList.roleName}</option>
	</c:forEach>
	</select><font color="#FF0000">*</font>
	</td>  
  </tr>
  </table>
<table height="50px">
  <tr>
  	<td align="center">
  	<span class="btn_s0"><input type="button" value="确定" class="btn0 bhl" style="width:64px;"  onClick="doSubmit();"></span>&nbsp;&nbsp;
  	<span class="btn_s0"><input type="button" value="清空" class="btn0 bhl" style="width:64px;"  onClick="doreset();"></span>&nbsp;&nbsp;
  	<span class="btn_s0"><input type="button" value="返回" class="btn0 bhl" style="width:64px;" onClick="Return();"></span>
  	</td>
  </tr>
</table> 
</td>
<td align="right">  
</td>
</tr>
</table>
</form>
</body>
</html>