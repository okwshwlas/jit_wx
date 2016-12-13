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
<link rel="StyleSheet" href="<c:url value="/css/cdtree.css"/>"
	type="text/css" />
<script type="text/javascript" src="<c:url value="/js/cdtree.js"/>"></script>
<script type="text/javascript">
	var path='<%=path%>';
	function doSubmit(){
		var form1 = document.getElementById("form1");
		var menuId = document.getElementById("menuId");
		var roleId = document.getElementById("roleId");
		var ids = "";
		for (var i=0; i<form1.elements.length; i++) {
			var element = form1.elements[i];
			if (element.name == "id" && element.type=='checkbox'){
				if( element.checked == true ){ 
						ids = ids + element.value + "|";
				}
			}
		}
		if(ids==""||ids.length==0) {
			alert("请选择菜单!");
			return;
		} else { 
			returnValue = ids.substring(0,ids.length-1);
			menuId.value = returnValue;
			$.ajax({
				cache:false,
 				url: path+'/roleControl/addFunctionRole.do',
 				data:{
 					'menuid':menuId.value,
 					'roleid':roleId.value
 				},
 				success : function(msg){
 					var data=eval('('+msg+')');
				    	parent.this_winowsucess(data);
				    	parent.this_winowclose();
 				},
 				error: function(XMLHttpRequest, textStatus, errorThrown){
 					alert("数据异常");
 				}
 			});
		}
	}

	function doReturn(){
		parent.this_winowclose();
	}	
</script>
</head>
<body>
	<input type="hidden" id="menuId" name="menuId" value="">
	<input type="hidden" id="roleId" name="roleId" value="${roleId}">
	<table width="100%" border="0" cellpadding="0" cellspacing="1"
		style="background-color: #A0D3F5;">
		<tr height="35px;">
			<td align="left" style="background-color: #F3F9FC;" height="100%" width="50%" colspan="4">
				<div class="dtree" style="overflow: auto; margin-top: 1px">
					<script 	language="javascript">
							d = new dTree('d','<%=path%>','form1');
							d.add('0','-1','权限菜单');
					</script>
					<c:forEach items="${menuRs}" var="menuRs" varStatus="i">
						<script language="javascript">		
			        		d.add('${menuRs.functionid }','${menuRs.parentfunction }','${menuRs.functionname }');
			          	</script>
					</c:forEach>
					<script language="javascript">	
						document.write(d);
					</script> 
					<c:choose>
						<c:when test="${roleMenu != null}">
							<c:forEach items="${roleMenu}" var="roleMenu" varStatus="i">
								<script language="javascript">	
			               			 var form1 = document.getElementById("form1");
			               			 for (var i=0; i<form1.elements.length; i++) {
			                			var element = form1.elements[i];
			                			if (element.name == "id" && element.type=='checkbox'){  
			                    			var s=	element.value.split(":");
			                				if(s[0] == '${roleMenu.functionid }'){
			        							element.checked = true;	
				            				}		
						   				}	
			      		  			}
			                	</script>
							</c:forEach>
						</c:when>
					</c:choose>
				</div>
			</td>
		</tr>
		<tr height="50px">
			<td align="center" style="background-color: #F3F9FC;" colspan="4">
				<div id="dlg-buttons"><a href="#" class="easyui-linkbutton"
					onClick="doSubmit();" iconcls="icon-save">保存</a> <a href="#"
					class="easyui-linkbutton" onClick="doReturn();" iconcls="icon-cancel">取消</a>
				</div>
			</td>
		</tr>
	</table>
</body>
</html>