<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="/WEB-INF/tld/c.tld" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="/jsp/include_my_head.jsp" %>
</head>
<body>
<div id="aa" class="easyui-accordion" style="width:450px;height:300px;float:left;">
<div title="系统须知" data-options="iconCls:'icon-ok'" style="overflow:auto;padding:10px;" >
<h3 style="color:#0099FF;">系统须知</h3>
<p>1.页面浏览需要屏幕分辨率为 1280*800 或以上才能达到最佳浏览效果。</p>
<p>2.需要浏览器为 IE8.0以上 或火狐，谷歌浏览器才能正常运行，建议使用火狐，谷歌浏览器已获得更好的体验。</p>
<p>3.Microsoft Windows NT Pack 4 OR LaterR /Win2000/WinXP/Win7/Win8。</p>
</div>
</div>


<div id="bb" class="easyui-accordion" style="width:450px;height:300px;">
<div title="系统时间" data-options="iconCls:'icon-ok'" style="overflow:auto; " align="center">
<div class="easyui-calendar"  style="width:448px;height:270px;"></div>
</div>
</div>


<script type="text/javascript">
function selectPanel(){
$.messager.prompt('Prompt','Please enter the panel title:',function(s){
if (s){
$('#aa').accordion('select',s);
}
});
}
var idx = 1;
function addPanel(){
$('#aa').accordion('add',{
title:'Title'+idx,
content:'<div style="padding:10px">Content'+idx+'</div>'
});
idx++;
}
function removePanel(){
var pp = $('#aa').accordion('getSelected');
if (pp){
var index = $('#aa').accordion('getPanelIndex',pp);
$('#aa').accordion('remove',index);
}
}
</script>
   
   
</body>
</html>