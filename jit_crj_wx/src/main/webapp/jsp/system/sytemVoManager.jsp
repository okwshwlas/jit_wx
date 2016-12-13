<%@ 
page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
 <%@taglib uri="/WEB-INF/tld/c.tld" prefix="c"%>
 <%@ page import="java.util.*" %>
<html>
<head>
<%  

%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="<c:url value="/css/common.css"/>">
<link rel="stylesheet" type="text/css" href="<c:url value="/css/system.css"/>">
<script src="<c:url value='/js/system.js'/>"></script> 
<style type="text/css">
.thl { behavior:url('<c:url value='/jsp/login/js/tablehl.htc'/>'); }
.bhl { behavior:url('<c:url value='/jsp/login/js/buttonhl.htc'/>'); }
.ichg { behavior:url('<c:url value='/jsp/login/js/imagechg.htc'/>'); }
</style>
<script language="javascript">
var  highlightcolor='#FAF1D4';//'#c1ebff';
//此处clickcolor只能用win系统颜色代码才能成功,如果用#xxxxxx的代码就不行,还没搞清楚为什么:(
var  clickcolor='#FAF1D4';
function  changeto(){
source=event.srcElement;
if  (source.tagName=="TR"||source.tagName=="TABLE")
return;
while(source.tagName!="TD")
source=source.parentElement;
source=source.parentElement;
cs  =  source.children;
//alert(cs.length);
if  (cs[1].style.backgroundColor!=highlightcolor&&source.id!="nc"&&cs[1].style.backgroundColor!=clickcolor)
for(i=0;i<cs.length;i++){
	cs[i].style.backgroundColor=highlightcolor;
}
}

function  changeback(){
if  (event.fromElement.contains(event.toElement)||source.contains(event.toElement)||source.id=="nc")
return
if  (event.toElement!=source&&cs[1].style.backgroundColor!=clickcolor)
//source.style.backgroundColor=originalcolor
for(i=0;i<cs.length;i++){
	cs[i].style.backgroundColor="";
}
}

function  clickto(){
source=event.srcElement;
if  (source.tagName=="TR"||source.tagName=="TABLE")
return;
while(source.tagName!="TD")
source=source.parentElement;
source=source.parentElement;
cs  =  source.children;
//alert(cs.length);
if  (cs[1].style.backgroundColor!=clickcolor&&source.id!="nc")
for(i=0;i<cs.length;i++){
	cs[i].style.backgroundColor=clickcolor;
}
else
for(i=0;i<cs.length;i++){
	cs[i].style.backgroundColor="";
}
}
/**
 * 全选
 */
function chkAll(){
	var chk = document.getElementsByName("chk"); 
	if (chk.length > 0) {
		 for(var i=0;i<chk.length;i++){
			 chk[i].checked = true;
		 }
	} else { 
		chk.checked= true; 
	} 
}
/**
 * 反选
 */
function unChkAll() {
	var chk = document.getElementsByName("chk"); 
	if (chk.length > 0) {
		 for(var i=0;i<chk.length;i++){
			 if (chk[i].checked) {
				 chk[i].checked = false;
			 } else {
				 chk[i].checked = true;
			 } 
		 }
	} else { 
		if(chk.checked) {
			chk.checked= false; 
		} else {
			chk.checked= true; 
		}
	} 
	
}
//分页
function func_toNextPage() { 
	var pageCount = '<c:out value="${pageCount}"/>';
	var currPage = '<c:out value="${curPage}"/>';
	if (currPage == pageCount) {
		alert("已经是最后一页了!");
		return;
	}
	form1.pagingFlag.value = "N"; 
	form1.action = '<c:url value="/selectAllSystemVo.do" />';
	form1.submit(); 
}
function func_toPrePage() { 
	var currPage = '<c:out value="${curPage}"/>';
	if (currPage == "1") {
		alert("已经是第一页了!");
		return;
	}
	form1.pagingFlag.value = "P"; 
	form1.action = '<c:url value="/selectAllSystemVo.do" />';
	form1.submit(); 
}

function func_toFirstPage() { 
	var currPage = '<c:out value="${curPage}"/>';
	if (currPage == "1") {
		alert("已经是第一页了!");
		return;
	}
	form1.pagingFlag.value = "F"; 
	form1.action = '<c:url value="/selectAllSystemVo.do" />';
	form1.submit(); 
}
 
function func_toLastPage() { 
	var pageCount = '<c:out value="${pageCount}"/>';
	var currPage = '<c:out value="${curPage}"/>';
	if (currPage == pageCount) {
		alert("已经是最后一页了!");
		return;
	}
	form1.pagingFlag.value = "L"; 
	form1.action = '<c:url value="/selectAllSystemVo.do" />';
	form1.submit(); 
}
function func_togoPage() { 
	var pageCount = '<c:out value="${pageCount}"/>';
	
	var toPage=form1.toPage.value;
	if(isNaN(toPage))
	{
		alert("请输入数字");
		form1.toPage.value="";
		return;
	}
	if (toPage*1 < 1) {
		alert("已经超过第一页了!");
		form1.toPage.value="";
		return;
	}

	if (toPage*1 > pageCount*1) {
		alert("已经超过最后一页了!");
		form1.toPage.value="";
		return;
	}
	form1.pagingFlag.value = "G"; 
	form1.action = '<c:url value="/selectAllSystemVo.do" />';
	form1.submit(); 
}
function fq() {
	form1.curPage.value ="";
	form1.beginPos.value ="";
	form1.pagingFlag.value=""; 
	form1.action = '<c:url value="/selectAllSystemVo.do" />';
	form1.submit(); 
	
} 
function add(){

	form1.action ='<c:url value="/toInsertSystemVo.do" />';
	form1.submit();
}
function deleuser_Inforr()
{
	var form1 = document.getElementById("form1");
	if(document.getElementById("checkbox")==null)
	{
		alert("没有可供删除的信息!");
		return ;
	}
	var radiolength = form1.chk.length;
	
	var flag = false;
	if (radiolength >1) {
		for (var i = 0; i < radiolength; i++) {
			if (form1.chk[i].checked == true) {
				flag = true;
			}
		}
		if (!flag) {
			alert("请您选择所要删除的信息!");
			return;
		}
	} else {
		if(form1.chk.checked == false){
			alert("请您选择所要删除的信息!");
			return;
		}
	}
	if (!confirm("您确定要删除这些用户吗?")) {
		return;
 	}
	form1.action='<c:url value="/deleteSystemVoALL.do"/>';
	form1.submit();

}
function doDelete(userCode,userName) {
	
	if(confirm("您确定要删除此用户吗?")) {

		window.location.href='deleteSystemVo.do?userCode='+userCode+'&userName='+userName;
	}
}
</script>
<title></title>
</head>
<body topmargin=0 leftmargin=0>
<form id="form1"  name="form1" action="#" method="post">
<input type="hidden" name="pagingFlag" value="">
<input type="hidden" name="curPage" value="<c:out value="${curPage}"/>">
<input type="hidden" name="beginPos" value="<c:out value="${beginPos}"/>">
<table width="100%"  border="0" cellpadding="0" cellspacing="0">
<tr>
<td colspan="2">
<table width="100%"  border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td colspan="3" class="wz">&nbsp;&nbsp;当前位置：首页-系统管理-用户管理</td>
        </tr>
      <tr>
         <td width="49" background="<c:url value="/jsp/login/images/common/tpbg.gif"/>"><img src="<c:url value="/jsp/login/images/common/tabbttb.gif"/>" width="49" height="34"></td>
		 <td width="783" background="<c:url value="/jsp/login/images/common/tpbg.gif"/>" class="bt">用户管理</td>
		 <td background="<c:url value="/jsp/login/images/common/tpbg.gif"/>">&nbsp;</td>
      </tr>
    </table>
</td>
</tr>
<tr>
<td width="832" valign="top" align="center">
<table width="832"  border="0" cellpadding="0" cellspacing="10" style="margin-top: 20px;">
  <tr>
    <td align="center" valign="middle" height="6">    
	<span class="tab-bt">用户名称:</span><input type="text" name="userName1" value="${userName1}" style="width:200px; border: #cccccc 1px solid; padding: 3px; height: 22px;" id="depName"  >&nbsp;&nbsp;<span class="btn_s0"><input type="button" value="查询" class="btn0 bhl" style="width:64px;cursor: hand;" onclick="fq()" ></span>
	</td>  
  </tr> 
</table> 
<table width="100%" border="0" cellpadding="3" cellspacing="1" id="tbl" >
<tr><td background="<c:url value="/jsp/login/images/other/kjleftiao.gif"/>"></td></tr>
</table>
<table width="800" border="0" cellpadding="3" cellspacing="1" id="tbl" >
<tr><td align="right">
<span class="btn_s0"><input type="button" value="全选" class="btn0 bhl" style="width:40px;cursor: hand;"  onClick="chkAll();"></span>&nbsp;<span class="btn_s0"><input type="button" value="反选" class="btn0 bhl"  style="width:40px;cursor: hand;"  onClick="unChkAll();"></span>&nbsp;<span class="btn_s0"><input type="button" value="新增" class="btn0 bhl"  style="width:40px;cursor: hand;"  onClick="add();"></span>&nbsp;<span class="btn_s0"><input type="button" value="删除" class="btn0 bhl"  style="width:40px;cursor: hand;"  onClick="deleuser_Inforr();" ></span></td>
</tr>
</table>
<table width="800" border="0" cellpadding="3" cellspacing="1" id="tbl" class="tab-soidnf thl" header="false" >
 			 <tr align="center" class="tab-bt tab-btbg" >
					
						<td width="5%" height="30" background="<c:url value="/jsp/login/images/common/tpbg.gif"/>">序号</td> 
						<td width="5%" background="<c:url value="/jsp/login/images/common/tpbg.gif"/>">选择</td>
						<td height="30" background="<c:url value="/jsp/login/images/common/tpbg.gif"/>">用户名称</td>
						<td height="30" background="<c:url value="/jsp/login/images/common/tpbg.gif"/>">管理部门</td>
						<td height="30" background="<c:url value="/jsp/login/images/common/tpbg.gif"/>">登录时间</td>
						<td height="30" background="<c:url value="/jsp/login/images/common/tpbg.gif"/>">登录IP</td>
						<td height="30" background="<c:url value="/jsp/login/images/common/tpbg.gif"/>">状态</td>
						<td width="51" background="<c:url value="/jsp/login/images/common/tpbg.gif"/>" align="center" class="blank dyg">停用/启用</td>
						<td width="40" background="<c:url value="/jsp/login/images/common/tpbg.gif"/>" align="center" class="blank dyg">编辑</td>
						<td width="40" background="<c:url value="/jsp/login/images/common/tpbg.gif"/>" align="center" class="blank dyg">删除</td>
				</tr>
			<c:if test="${SystemVoList != null }">
			<c:set var="index" value="0" />
			<c:forEach var="item" items="${SystemVoList}">
				<c:set var="index" value="${index+1 }" />
				  <tr align="center" class="tab-bt tab-btbg" onMouseOver="changeto()"  onmouseout="changeback()">
						<td width="5%" height="35px">${item.r}</td> 
						<td width="5%"><input type="checkbox" id="checkbox" name="chk" value="${item.userCode}" ></td>
						<td height="35px">${item.userName}</td> 
						<td height="35px">${item.depname}</td>
						<td height="35px">${item.lastDlsj}</td> 
						<td height="35px">${item.lastDlip}</td>
						<td><c:if test="${item.userState == '0'}">启用</c:if><c:if test="${item.userState == '1'}">停用</c:if></td>
						<td width="40" class="blank dyg" align="center"><c:if test="${item.userState == '0'}"><a style="cursor: hand;" href="<c:url value="/toStartOfStop.do?flag=1&&userCode=${item.userCode}&&userName=${item.userName}"/>">停用</a></c:if><c:if test="${item.userState == '1'}"><a style="cursor: hand;" href="<c:url value="/toStartOfStop.do?flag=0&&userCode=${item.userCode}&&userName=${item.userName}"/>">启用</a></c:if></td>
						<td width="40" class="blank dyg" align="center"><a style="cursor: hand;" href="<c:url value="/toUpdSystemVo.do?userCode=${item.userCode}&&olduserName=${item.userName}"/>">编辑</a></td>
						<td width="40" class="blank dyg" align="center"><a  style="cursor: hand;" href="javascript:doDelete('${item.userCode}','${item.userName}')">删除</a></td>
				</tr>
			</c:forEach>	
			</c:if>	
			<c:if test="${SystemVoList == null }">
				<TR align="center" class="tab-bt tab-btbg">
						<td colspan="10" height="35px">无记录</td>
				</TR>
			</c:if>
</table>
<table width="800" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
        <tr>
          <td width="33%"><div align="left"><span class="STYLE22">&nbsp;&nbsp;&nbsp;&nbsp;共有<strong>${recordsCount}</strong> 条记录，当前第<strong> ${curPage}</strong> 页，共 <strong>${pageCount}</strong> 页</span></div></td>
          <td width="67%"><table width="321" border="0" align="right" cellpadding="0" cellspacing="0">
              <tr>
                <td width="49"><div align="center"><img src="<c:url value="/jsp/login/images/main_54.gif"/>" width="40" height="15" onclick="func_toFirstPage()" style="cursor: hand;"/></div></td>
                <td width="49"><div align="center"><img src="<c:url value="/jsp/login/images/main_56.gif"/>" width="45" height="15" onclick="func_toPrePage()"  style="cursor: hand;"/></div></td>
                <td width="49"><div align="center"><img src="<c:url value="/jsp/login/images/main_58.gif"/>" width="45" height="15" onclick="func_toNextPage()" style="cursor: hand;"/></div></td>
                <td width="49"><div align="center"><img src="<c:url value="/jsp/login/images/main_60.gif"/>" width="40" height="15" onclick="func_toLastPage()" style="cursor: hand;"/></div></td>
                <td width="37" class="STYLE22"><div align="center">转到</div></td>
                <td width="22"><div align="center">
                    <input type="text" name="toPage" id="toPage"  style="width:20px; height:16px; font-size:12px; border:solid 1px #7aaebd;"/>
                </div></td>
                <td width="22" class="STYLE22"><div align="center">页</div></td>
                <td width="44"><img src="<c:url value="/jsp/login/images/main_62.gif"/>" width="26" height="15" onclick="func_togoPage()" style="cursor: hand;"/></td>
              </tr>
          </table></td>
        </tr>
      </table>
	  <table>
	  <tr>
	  	<td height="50px;">&nbsp;</td>
	  </tr>
	  
	  </table> 
</td>
<td align="right">  
</td>
</tr>
</table></form>
</body>
</html>