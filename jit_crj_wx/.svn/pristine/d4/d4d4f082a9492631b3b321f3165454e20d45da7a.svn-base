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
	var dict_value = document.getElementById("dict_value");
	var dict_order = document.getElementById("dict_order");
	var dict_valueid=document.getElementById("dict_valueid");
	var dict_id =document.getElementById("dict_id");
	if (isEmpty(dict_value.value)) {
			alert("字典值名称不能为空，请输入字典值名称!");
			dict_value.focus();
			return;

	}
	if(!checkAreaLength(dict_value.value,20)){
			alert("字典值名称最多允许输入10个汉字!");
			dict_value.focus();
			return;
	} 
	if (isEmpty(dict_order.value)) {
		alert("字典值顺序不能为空，请输入字典值顺序!");
		dict_order.focus();
		return;

	}
	if(!checkAreaLength(dict_order.value,20)){
		alert("字典值名称最多允许输入20位!");
		dict_order.focus();
		return;
	} 
	if (isEmpty(dict_valueid.value)) {
		alert("字典值ID不能为空，请输入字典ID!");
		dict_valueid.focus();
		return;

	}
	if(!checkAreaLength(dict_valueid.value,20)){
		alert("字典值ID多允许输入20位!");
		dict_valueid.focus();
		return;
	} 

	systemValidater.selectCountDictDetailByID(dict_id.value,dict_valueid.value,function callBack(s){
		if(s=="0"){
			 alert("该字典名称中已存在此ID");
		 }else{
			 if (!confirm("您确定要新增此字典吗?")) {
					return;
			 } 
			 form1.submit();
		 }
		
	});
	} 
	function doLoad() {
		document.getElementById("dict_value").focus();
		document.getElementById("dict_order").focus();
	}
	function doreset() {
		document.getElementById("form1").reset();
		doLoad();
	}
	function Return(){
		var form1 = document.getElementById("form1");
		form1.action='<c:url value="/selectDictDetail.do"/>';
		form1.submit();
	}
</script>
<title></title>
</head>
<body topmargin=0 leftmargin=0 onLoad="doLoad();">
<form id="form1"  name="form1" action="<c:url value="/InsertDic.do" />" method="post">
<table width="100%"  border="0" cellpadding="0" cellspacing="0">
<tr>
<td colspan="2">
<table width="100%"  border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td colspan="3" class="wz">&nbsp;&nbsp;当前位置：首页-系统管理-字典新增</td>
        </tr>
      <tr>
         <td width="49" background="<c:url value="/jsp/login/images/common/tpbg.gif"/>"><img src="<c:url value="/jsp/login/images/common/tabbttb.gif"/>" width="49" height="34"></td>
		 <td width="783" background="<c:url value="/jsp/login/images/common/tpbg.gif"/>" class="bt">字典新增</td>
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
	<span class="tab-bt">字典值ID:</span>
	</td> 
	<td align="left" style="background-color:#F3F9FC;">&nbsp;<input type="text" name="dict_valueid" class="txt" style="width:200px;" id="dict_valueid"><font color="#FF0000">*</font></td>
  </tr>
  <tr height="35px">
    <td align="right" valign="middle" height="6" style="background-color:#F3F9FC;"> 
	<span class="tab-bt">字典值名称:</span>
	</td> 
	<td align="left" style="background-color:#F3F9FC;">&nbsp;<input type="text" name="dict_value" class="txt" style="width:200px;" id="dict_value"><font color="#FF0000">*</font></td>
  </tr>
   <tr height="35px">
    <td align="right" valign="middle" height="6" style="background-color:#F3F9FC;"> 
	<span class="tab-bt">字典值顺序:</span>
	</td> 
	<td align="left" style="background-color:#F3F9FC;">&nbsp;<input type="text" name="dict_order" class="txt" style="width:200px;" id="dict_order" maxlength="20"><font color="#FF0000">*</font></td>
	</tr>
    <tr height="35px">
    <td align="right" valign="middle" height="6" style="background-color:#F3F9FC;">
	<span class="tab-bt">字典名称:</span>
	</td> 
	<td align="left" style="background-color:#F3F9FC;">
	&nbsp;<select id="dict_id" name="dict_id" class="txt" style="width:200px;">
	<option value="">---请选择---</option>
	<c:forEach items="${DicInfoList}" var="DicInfoList">
	<option value="${DicInfoList.dict_id}">${DicInfoList.dict_name}</option> 
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