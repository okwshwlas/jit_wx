  <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@page import="java.util.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>操作失败</title>
<link href="<c:url value="/css/style.css"/>" rel="stylesheet"
	type="text/css" />
<script type="text/javascript">
function func_return() {
	 window.history.back(-1);
	
}
function func_show() {
	if (document.getElementById("showResult").style.display == "none") {
		document.getElementById("showResult").style.display="";
	} else {
		document.getElementById("showResult").style.display= "none";
	}
}
</script>
</head>
<body>
<form name="okForm" action="" method="post">
 
<table border="0" width="100%" height="300px">
<tr>
<td align="center" valign="middle">

<table border="0" width="100%" height="200px" cellpadding="0" cellspacing="0">
<tr>
<td width="100%" align="left" colspan="3">&nbsp;</td>
</tr>
<tr>
<td align="left" valign="top" width="15%" rowspan="4"><img src="<c:url value="/images/stop.gif"/>"/></td>
<td width="75%" align="left">
&nbsp;
<!-- <font style="font-weight: bold">操作失败</font> -->
</td>
<td width="15%" align="left">&nbsp;</td>
</tr>
<tr>
<td width="70%" align="left">&nbsp;</td>
<td width="15%" align="left">&nbsp;</td>
</tr>
<tr>
<td width="70%" align="left">&nbsp;</td>
<td width="15%" align="left">&nbsp;</td>
</tr>
<tr>
<td width="70%" align="left">&nbsp;</td>
<td width="15%" align="left">&nbsp;</td>
</tr>
<tr>
<td width="15%">&nbsp;</td>
<td width="70%" align="center"><h1>操作已失败</h1></td>
<td width="15%" align="left">&nbsp;</td>
</tr>
<tr>
<td width="15%">&nbsp;</td>
<td width="70%" align="left"><font style="font-weight: bold">原因:</font>&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:func_show()">&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;</a></td>
<td width="15%" align="left">&nbsp;</td>
</tr>
<tr>
<td width="100%" colspan="3">
<div id="showResult" style="display: none" align="left">
<%
Exception ex = (Exception) request.getAttribute("exception");
%>
<h2>Data access failure: <%= ex.getMessage() %></h2>
<p />
<%
ex.printStackTrace(new java.io.PrintWriter(out));
%>
</div>
</td>
</tr>
<tr>
<td width="15%">&nbsp;</td>
<td width="70%" align="right"></td>
<td width="15%" align="left"></td>
</tr>
<tr>
<td width="15%">&nbsp;</td>
<td width="70%" align="left">&nbsp;</td>
<td width="15%" align="left">&nbsp;</td>
</tr>
<tr>
<td width="15%">&nbsp;</td>
<td width="70%" align="left">&nbsp;</td>
<td width="15%" align="left">&nbsp;</td>
</tr>
</table>

</td>
</tr>
</table>
</form>
</body>
</html>