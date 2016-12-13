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
<script type="text/javascript" src="<c:url value="/jsp/custommenu/js/custommenu.js" />"></script>
<script type="text/javascript">
	var path='<%=path%>';
</script>
<script charset="utf-8" src="<c:url value="/kindeditor-4.1.10-zh-CN/kindeditor.js"/>"></script>
<script charset="utf-8" src="<c:url value="/kindeditor-4.1.10-zh-CN/lang/zh_CN.js"/>"></script>
<script>
        KindEditor.ready(function(K) {
              window.editor = K.create('#editor_id', { 
            	    cssPath :  path+'/kindeditor-4.1.10-zh-CN/plugins/code/prettify.css',//引入图片上传和图片空间所需css和jsp
	          		uploadJson : path+'/kindeditor-4.1.10-zh-CN/jsp/upload_json.jsp',
	          		fileManagerJson : path+'/kindeditor-4.1.10-zh-CN/jsp/file_manager_json.jsp',
	          		allowFileManager : true,
                    afterCreate : function() { 
                     this.sync(); 
                    }, 
                    afterBlur:function(){ 
                        this.sync(); 
                    }                 
                });

        });
	</script>
</head>
<body>
	<div class="demo-info">
		<div class="demo-tip icon-tip"></div>
		<div><font color="red">注意事项: <br/>
		             1、级菜单最多只能开启3个，2级子菜单最多开启5个! <br/>
					 2、"关键词"必须和关键词管理相对应,"链接地址"应以http://开头，如http://www.baidu.com<br/>
					 3、"链接地址"和"本地页面"至少填写一项.即会选择填写的这一项作为链接，如果都填写优先选择"本地页面"作为链接 ，父菜单下如果启用子菜单，父菜单链接或标识请填0
		     </font>
		</div>
	</div>
	<table id="tt" title="菜单列表" class="easyui-treegrid" 
	        data-options="
            url: '<%=path%>/customMenuController/selectAllCustomMenu.do',
			method: 'post',
			rownumbers: true,
			toolbar: '#tb',
			fitColumns:true,
			idField: 'id',
			treeField: 'name'
			">
		<thead>
			<tr>
				<th field="name" width="100" >菜单名称</th>
				<th field="keywordorurl" width="150"  align ="center">关键词标识或链接地址</th>
				<th field="defaultpath" width="150" align ="center">编辑本地页面</th>
				<th field="status" width="80" align ="center">启用状态</th>
				
			</tr>
		</thead>
	</table>
	<div id="tb" style="height:auto">
	<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true" onclick="createNode()">生成自定义菜单</a>
	<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true" onclick="repealNode()">撤销自定义菜单</a>
	</div>

      <div id="showLog"></div>   
	<div id="showMessage" class="easyui-dialog" closed="true" style="padding:5px;width:900px;height:400px;"  buttons="#dlg-buttons" maximizable="true" minimizable="true" collapsible="true" resizable="true"> 
 		<form id="strform" name="strform" method="post">
        <input type="hidden" id="id" name="id">
        <table cellpadding="0" cellspacing="0" class="table-input" border="0">
     
	    <tr>
			<th class="specalt">菜单名称</th>
			<td align="left">
		
			<input type="text" id="name" name="name" class="easyui-validatebox" style="width: 250px;"/> </td>
	    </tr>
		<tr>
			<th class="specalt">关键词标识或者远程链接</th>
			<td align="left"><input type="text" maxlength="255" id="keywordorurl" name="keywordorurl" class="easyui-validatebox" style="width: 250px;"/> </td>
		</tr>
	    <tr>
			<th class="specalt">是否启用该菜单</th>
			<td align="left"><input type="radio" name="status" class="easyui-radio" value="启用" /> 启用
	        <input type="radio" name="status" class="easyui-radio" value="不启用" /> 不启用  </td>
	    </tr>
	    <tr>
			<th class="specalt">本地链接页内容</th>
			<td colspan="3">
		    <textarea id="editor_id" name="content" style="width:600px;height:350px;">
	        </textarea>
		    </td>
	    </tr>
		</table>
		</form>
		</div>
		<div id="dlg-buttons">
        <a href="javascript:void(0)" class="easyui-linkbutton" id="save" onclick="save()" iconcls="icon-save">保存</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" onclick="javascript:$('#showMessage').dialog('close')" iconcls="icon-cancel">取消</a>
    </div> 
		
	</body>
</html>