<%----------------------------------------------------------------
Description          ：系统登录页面
Version              : v1.0
JSP Version          : 2.0
Sr.       Date		Modified By		Why and What is Modified
1.    2011.02.23	    Jiaxin Wang		Initial Release 
-------------------------------------------------------------------%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="/WEB-INF/tld/c.tld" prefix="c"%>
<%
	//清除缓存
	response.setHeader("Pragma", "No-cache");
	response.setHeader("Cache-Control", "no-cache");
	response.setDateHeader("Expires", 0);

	String path = request.getContextPath();
	String basePath = "http://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>吉林省公安出入境管理局微信后台</title>
<style type="text/css">
<!--
body,td,th {font-family: 宋体;font-size: 14px;color:#DEF1FF; font-weight:bold; overflow:hidden;}
body {background:#3B9CFE url(<c:url value='/jsp/system/images1/bg_rep.jpg'/>) top repeat-x;margin:0px;}
img{border:0}
-->
</style>
<%@ include file="/jsp/include_my_head.jsp"%>
<!-- 
<script type='text/javascript' src='<c:url value="/dwr/interface/systemValidater.js"/>'></script>
<script type='text/javascript' src='<c:url value="/dwr/engine.js"/>'></script>
<script type='text/javascript' src='<c:url value="/dwr/util.js"/>'></script>
<script type="text/javascript">
	/*
	 *验证用户帐号
	 */
	function func_login(){
		var form1= document.getElementById("form1");
		if (isEmpty(form1.userCode.value)){
				alert("账号不能为空!");
				form1.userCode.focus();
				return;
			}
		if (isEmpty(form1.userPwd.value)){
			alert("密码不能为空!");
			form1.userPwd.focus();
			return;
		}
		var userCode = document.all.userCode.value;
		var userPwd = document.all.userPwd.value;	
		systemValidater.loginVal(userCode,userPwd, function callBack(s){
			if (s == "0") {
				alert("用户名或者密码错误，请重新登录!");
				document.all.userCode.value = "";
				document.all.userPwd.value = "";
				document.all.userCode.focus();
				return;
			} else if(s == "2"){
				alert("该账户已被停用!");
				document.all.userCode.value = "";
				document.all.userPwd.value = "";
				document.all.userCode.focus();
				return;
			}else if(s == "3"){
				alert("该账户的角色未被分配菜单，请在分配菜单之后再行登陆!");
				document.all.userCode.value = "";
				document.all.userPwd.value = "";
				document.all.userCode.focus();
				return;
			}else{
				form1.action='<c:url value="/systemControl/loginBackstage.do"/>';
				form1.submit();
			}

		});
	} 
	/**
	  *获得焦点
	  *
	  */
	function func_load() {
		var form1= document.getElementById("form1");
		form1.userCode.focus();
	}
	document.onkeydown = function(e){
		   if(!e) e = window.event;//火狐中是 window.event
		   if((e.keyCode || e.which) == 13){
			   func_login();       
		   }
		} 
	function func_Rest(){
		var form1= document.getElementById("form1");
		form1.reset();
	}
	</script>
	 -->
<script type="text/javascript" charset="UTF-8">
	var basePath = '<%=basePath%>';
	</script>
	<script type="text/javascript" src="<c:url value="/js/main/login.js"/>" charset="utf-8"></script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>吉林省公安出入境管理局微信后台</title>
<link href="<%=request.getContextPath()%>/css/reset.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/css/commons.css" rel="stylesheet" type="text/css" />
</head>

<body>
<form id="loginform" method="post" action="">
<div>
  <div class="biaoti1"><img src="<%=request.getContextPath()%>/images/login-logo.png" width="636" height="160" /></div>
</div>
<div class="login">
  <div class="login-dl">
    <div class="login-denglukung">
      <div class="login-biandan1"></div>
      <div style="height:40px" class="yonghu"></div>
      <div class="biandanwite">
        <label>
        <input type="text" name="usercode" id="USERCODE" style=" border:0;border-bottom:1 solid white;background:;color:#1d60c2" size="32" width="223px" height="30px" />
        </label>
        <label>
        </label>
</div>
      <div class="biandanwite1">
        <input type="password" name="userpwd" id="USERPWD" style=" border:0;border-bottom:1 solid white;background:;color:#1d60c2" size="32" width="223px" height="30px" />
      </div>
      <div class="cuowu"><span class="login-biandan1" onclick="form_submit()"><span class="huise"><a href="#"><img src="<%=request.getContextPath()%>/images/denglu.png" width="236" height="40" border="0" /></a></span></span></div>
    </div>
  </div>
</div>
<div>
  <p align="center"><br />
    <span class="foot_style">吉林省公安出入境管理局微信管理平台</span></p>
  <p align="center" class="foot_style"></p>
  <p align="center" class="foot_style"></p>
</div>
</form>
</body>
</html>