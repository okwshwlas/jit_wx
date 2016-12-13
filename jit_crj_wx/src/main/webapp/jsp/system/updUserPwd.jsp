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
function doSave() {
	var form1 = document.getElementById("form1");
	if(form1.userOldPwd.value==null||form1.userOldPwd.value==""){
		alert("用户旧密码不能为空！");
		form1.userOldPwd.focus;
		return;
		}
	if(form1.userPwd.value==null||form1.userPwd.value==""){
		alert("用户密码不能为空！");
		form1.userPwd.focus;
		return;
		}
	if(form1.userPwd.value!=form1.userPwdRe.value){
		alert("密码不一致！");
		return;
	}
	if(!checkAreaLength(form1.userPwd.value,16)){
		alert("用户密码最多允许输入16位!");
		form1.userPwd.focus();
		return;
	} 
	form1.action='<c:url value="/updateUserPwd.do"/>?userCode=${loginUser.userCode}';
	form1.submit();
}
function func_checkPwd(){
	var form1 = document.getElementById("form1");
	var userPwd=form1.userPwd.value;
	var userPwdRe=form1.userPwdRe.value;
	if(userPwd!=userPwdRe){
		form1.userPwdRe.focus;
		document.all.rePwd.style.display = "";
	}else{
		document.all.rePwd.style.display = "none";
	}
}
function doReturn(){
	form1.action='<c:url value="/jsp/login/main.jsp"/>';
	form1.submit();
}
</script>
<title></title>
</head>
<body topmargin=0 leftmargin=0>
<form id="form1"  name="form1" action="<c:url value="/InsertSystemVo.do" />" method="post">
<table width="100%"  border="0" cellpadding="0" cellspacing="0">
<tr>
<td colspan="2">
<table width="100%"  border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td colspan="3" class="wz">&nbsp;&nbsp;当前位置：首页-系统管理-用户管理</td>
        </tr>
      <tr>
         <td width="49" background="<c:url value="/jsp/login/images/common/tpbg.gif"/>"><img src="<c:url value="/jsp/login/images/common/tabbttb.gif"/>" width="49" height="34"></td>
		 <td width="783" background="<c:url value="/jsp/login/images/common/tpbg.gif"/>" class="bt">密码修改</td>
		 <td background="<c:url value="/jsp/login/images/common/tpbg.gif"/>">&nbsp;</td>
      </tr>
    </table>
</td>
</tr>
<tr>
<td width="832" valign="top" align="center">
<table  width="350"  border="0" cellpadding="0" cellspacing="0" style="margin-top: 20px;">
	 <tr>
 	<td align="left" valign="middle" height="6">
 		<font color="red">${pmessage}</font>
 	</td>
 </tr>
</table>
<table width="350"  border="0" cellpadding="0" cellspacing="1" style="margin-top: 20px;" style="margin-top: 20px;background-color: #A0D3F5;" >
 <tr height="35px">
    <td align="right" valign="middle" height="6" style="background-color:#F3F9FC;"> 
	<span class="tab-bt">原密码:</span>
	</td> 
	<td align="left" style="background-color:#F3F9FC;">&nbsp;<input type="password" name="userOldPwd" class="txt" style="width:200px;" id="userOldPwd" maxlength="20"><font color="#FF0000">*</font></td>
  </tr>
  <tr height="35px">
    <td align="right" valign="middle" height="6" style="background-color:#F3F9FC;"> 
	<span class="tab-bt">新密码:</span>
	</td> 
	<td align="left" style="background-color:#F3F9FC;">&nbsp;<input type="password" name="userPwd" class="txt" style="width:200px;" id="userPwd" maxlength="20"><font color="#FF0000">*</font></td>
  </tr>
   <tr height="35px">
    <td align="right" valign="middle" height="6" style="background-color:#F3F9FC;"> 
	<span class="tab-bt">确认密码:</span>
	</td> 
	<td align="left" style="background-color:#F3F9FC;">&nbsp;<input type="password" name="userPwdRe" class="txt" style="width:200px;" id="userPwdRe" maxlength="20"><font color="#FF0000">*</font></td>
  </tr>
</table>
<table height="50px">
  <tr>
  	<td align="center">
  	<span class="btn_s0"><input type="button" value="确定" class="btn0 bhl" style="width:64px;"   onClick="doSave();"></span>&nbsp;&nbsp;
  	<span class="btn_s0"><input type="button" value="返回" class="btn0 bhl" style="width:64px;" onClick="doReturn();"></span>
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