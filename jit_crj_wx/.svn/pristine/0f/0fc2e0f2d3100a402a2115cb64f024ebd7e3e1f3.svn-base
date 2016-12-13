<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="/WEB-INF/tld/c.tld" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<link type="text/css" rel="stylesheet" href="<c:url value="/nresources/default/listpage.css"/>" />
<link rel="stylesheet" href="<c:url value="/jquery-easyui/themes/icon.css"/>" type="text/css"></link>
<link rel="stylesheet" href="<c:url value="/jquery-easyui/themes/default/easyui.css"/>" type="text/css"></link>
<link rel="stylesheet" type="text/css" href="<c:url value="/grid/themes/redmond/jquery-ui-1.8.2.custom.css"/>" />
<link rel="stylesheet" type="text/css" href="<c:url value="/grid/themes/ui.jqgrid.css"/>" />
<script type="text/javascript" src="<c:url value="/jquery-easyui/jquery-1.7.2.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/jquery-easyui/jquery.easyui.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/jquery-easyui/locale/easyui-lang-zh_CN.js"/>"></script>
<script type="text/javascript" src="<c:url value="/grid/jquery.jqGrid.min.js" />"></script>
<script type="text/javascript" src="<c:url value="/grid/grid.locale-cn.js" />"></script>
<script type="text/javascript" src="<c:url value="/grid/jquery.cookie.js"/>" charset="utf-8"></script>
<script type="text/javascript" src="<c:url value="/js/data_check.js"/>" ></script><!-- 验证 -->
<script type="text/javascript" src="<c:url value="/jsp//sysgl/rygl/ryda/ryryda.js" />"></script>
<script type="text/javascript" src="<c:url value="/js/Date/WdatePicker.js" />"></script>
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
	form1.action='<c:url value="/updateUserPwd1.do"/>?userCode=${loginUser.userCode}';
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
	window.close();
}
	 
</script>
</head>
<body class="easyui-layout" fit="true" leftmargin="0" topmargin="0">
<div region="center" fit="true">
<div id="showOrg" fit="true">
<div id="title" title="密码修改">
<form id="form1"  name="form1" action="#" method="post">
<table  width="350"  border="0" cellpadding="0" cellspacing="0" style="margin-top: 20px;">
	 <tr>
 	<td align="left" valign="middle" height="6">
 		<font color="red">${pmessage}</font>
 	</td>
 </tr>
</table>
<table cellpadding="0"  cellspacing="0" class="table-input" width="40%">
<tr>
    <th class="specalt">原密码:</th>
    <td >
      <label>
      <input type="password" name="userOldPwd" style="width:200px;" id="userOldPwd" maxlength="20"><font color="#FF0000">*</font>
      </label>  
    </td>
 </tr> 
 <tr>   
     <th class="specalt">新密码:</th>
    <td >
      <label>
	<input type="password" name="userPwd" style="width:200px;" id="userPwd" maxlength="20"><font color="#FF0000">*</font>      
	</label>  
    </td>
  </tr>
  <tr>  
     <th class="specalt">确认密码:</th>
    <td >
      <label>
	<input type="password" name="userPwdRe" style="width:200px;" id="userPwdRe" maxlength="20"><font color="#FF0000">*</font>	</label>  
    </td>
  </tr>  
	<tr>
  	<td align="center" colspan="2">
  	<span class="btn_s0"><input type="button" value="确定" class="btn0 bhl" style="width:64px;"   onClick="doSave();"></span>&nbsp;&nbsp;
  	</td>
  </tr>
</table>
</div></div></div>
</body>