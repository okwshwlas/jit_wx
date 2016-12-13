<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="/WEB-INF/tld/c.tld" prefix="c"%>
<%@ taglib uri="/WEB-INF/tld/FCKeditor.tld" prefix="FCK" %>

<%@page import="java.util.List" %>
<%-- <%@ page import="com.work.user.vo.UserVo"%> --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	String path = request.getContextPath();
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<%@ include file="/jsp/include_my_head.jsp" %>
<script type="text/javascript" src="<c:url value="/jsp/attention/js/text.js" />"></script>
<link type="text/css" rel="stylesheet" href="<%=path%>/nresources/default/taskPage.css" />
<script type="text/javascript">
	var path='<%=path%>';
</script>
</head>
<body>




<!-- 页面显示 -->
<div class="easyui-layout" fit="true"><!-- easyUI布局 -->
<div region="center" border="false" split="false"><!-- layout panel 属性设置-->

<form id="fm" name="fm"  method="post" action="">
<input type="hidden" id="id" name="id">
<table cellpadding="0"  cellspacing="0" class="table-input" border="0" >
	 <tr>
         <th colspan="4" align="center" class="first" style="text-align:left">欢迎语</th>
 	 </tr>
	<tr>
		<td colspan="3">
		<textarea cols="100" rows="10" id="neirong" name="neirong" class="easyui-validatebox" missingMessage="内容必须填写" maxlength="600" required="true"></textarea>
		
		
		
		<br><font color="red">必填, 用户添加您的时候自动回复欢迎语(文图和图文都启用默认提示为文本) </font>
		</td>
	</tr>
	
	
	<tr>
		<th class="specalt">是否启用</th>
		<td><input type="radio" name="status" class="easyui-radio" value="0" /> 启用
        <input type="radio" name="status" class="easyui-radio" value="1" checked="checked"/> 不启用  
        </td>
	</tr>
	
	<!--<tr>
		<td colspan="3">
		
	<textarea id="editor_id" name="content" style="width:700px;height:300px;">
&lt;strong&gt;HTML内容&lt;/strong&gt;
</textarea>
	</td>
	</tr>
	
	
	-->
	
	
	
	
	<tr>
    <td  colspan="5" align="center" style="padding:0px">
	<a href="javascript:void(0)" id="savelist" onclick="saveHuanying()">保存</a>
	<a href="javascript:void(0)" class="easyui-linkbutton" onclick="qiehuan()">切换图文</a>
	</td>
</tr>
	
</table>

<table id="appOrg">
</table>


 </form>

</body>
</html>