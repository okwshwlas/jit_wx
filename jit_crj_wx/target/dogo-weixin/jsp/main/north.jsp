<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="/WEB-INF/tld/c.tld" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<link type="text/css" rel="stylesheet" href="<c:url value="/nresources/default/css/table-input.css"/>" type="text/css" />
<link rel="stylesheet" href="<c:url value="/jquery-easyui-1.3.6/themes/icon.css"/>" type="text/css"></link>
<link rel="stylesheet" href="<c:url value="/jquery-easyui-1.3.6/themes/default/easyui.css"/>" type="text/css"></link>
<script type="text/javascript" src="<c:url value="/js/data_check.js"/>" ></script><!-- 验证 -->
<script type="text/javascript" charset="UTF-8">
 
	function login() {
		windows.location.href="<c:url value='/systemOut1.do'/>";
	}
	function cl() {
		window.top.opener='';
		window.top.close();
	}
	function userInfo() {
		//var args = "";
		//window.showModalDialog('<c:url value="/toUpdatePwd1.do" />', args ,"dialogHeight:300px,dialogWidth:200px;location:no;status;no;resizable:no;scrollbars:no;");
		}

	function qiandao(){
		$.ajax({
			url : 'signAction!insert.action',
			dataType : 'json',
			cache : false,
			async : false,
			success : function(data) {//data是你action里传回来的值
			 	if(data=="ok")
			 	{		 		
			 	//	$("#div").attr({"disabled":true});
				 //	$("#div1").attr({"disabled":false});
				 	document.getElementById('div').style.display='none';
				 	document.getElementById('div1').style.display='';
			 	}

			},
			error : function() {
			 
			}
		});	
	}
	function qiantui(){
		$.ajax({
			url : 'signAction!update.action',
			dataType : 'json',
			cache : false,
			async : false,
			success : function(data) {//data是你action里传回来的值
			
			if(data=='ok')
			{
				alert('签退成功');
			}
			},
			error : function() {
			 
			}
		});	
	}
//<c:url value="/toUpdatePwd1.do" />
	
	function new1(){
		window.location.href='<c:url value="/userControl/systemOut1.do"/>';
		window.target="_parent";
		
		
	}
</script>
<style>
.top-line{
	height: 95px;
	background-image: url(<%=request.getContextPath()%>/images/top-bg.png);
}

</style>
<div class="top-line">
  <div class="top-Right">
    <div align="left">
    </div>
  </div>
  <div class="top-left"><img src="<%=request.getContextPath()%>/images/logo.png" /></div>
</div>
<div style="position: absolute; right: 0px; bottom: 0px; ">
			<a href="javascript:void(0);" onclick="new1();"><img src="<%=request.getContextPath()%>/images/tuichu.PNG" width="65" height="70" border="0" /></a>
			<!-- <a href="javascript:void(0);" class="easyui-linkbutton"  onclick="upd();">修改密码</a>-->
</div>
<!--<div id="layout_north_kzmbMenu" style="width: 100px; display: none;">
	<div onclick="upd()">个人信息</div>
	<div id="div" onclick="qiandao()">签到</div>
	<div id="div1" onclick="qiantui()">签退</div>
</div>
--><!-- <div id="layout_north_zxMenu" style="width: 100px; display: none;">
	<div onclick="new1();">重新登录</div>
	<div onclick="new1();">退出系统</div>
</div> -->

<div id="strDialog1" style="padding:5px;width:400px;height:50px;display: none;" >
<form id="strform1"  name="strform1" action="#" method="post">
<table cellpadding="0"  cellspacing="0" class="table-input" width="40%">
<tr>
    <th class="specalt" width="100">原密码:</th>
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
	<!--<tr>
  	<td align="center" colspan="2">
  	<span class="btn_s0"><input type="button" value="确定" class="btn0 bhl" style="width:64px;"   onClick="doSave();"></span>&nbsp;&nbsp;
  	</td>
  </tr>
--></table>
</form>
</div>