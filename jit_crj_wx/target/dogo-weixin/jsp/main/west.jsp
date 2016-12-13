<%
	/**
	 *  页面说明
	 *  1.名称：west.jsp
	 *  2.作用：导航树
	 *  3.参数： pList,cList
	 *  @author cSc 2013 4.26
	 */
%>
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page language="java"%>
<%@ page session="true"%>
<%@taglib uri="/WEB-INF/tld/c.tld" prefix="c"%>


<%
	//清除缓存
	response.setHeader("Pragma", "No-cache");
	response.setHeader("Cache-Control", "no-cache");
	response.setDateHeader("Expires", 0);
%>
<script type="text/javascript" charset="utf-8">
var json=${cList };  //接收子菜单 

var arr = new Array(json.length); //定义一个存放json的数组
 
for(var i=0;i<arr.length;i++) {
 	arr[i]=json[i]; //将子菜单追加到数组中
}

	$(function() {
		$('#menuAccordion').accordion({ //定义手风琴
			animate:false,
			fit : true,
			border : false
			//selected:true
		});
	});
	var setting = {
		data: {
			simpleData: {
				enable: true
			}
		},
		
		view: {
			fontCss: getFont,
			nameIsHTML: true
		},
		
		
		callback: {
			onClick:zTreeOnClick
		 }
	};

	function getFont(treeId, node) {
		return node.font ? node.font : {};
	}
	
	$(document).ready(function(){
		for(var i=0;i<json.length;i++) {
			$.fn.zTree.init($("#"+i+""), setting, json[i]); //遍历Json，生成zTree
		}
		
		
			 
	});
	function zTreeOnClick(event, treeId, treeNode) {
		
	    addTab(treeNode);
	};
	
</script>
<div id="menuAccordion">
	<c:set var="index" value="0" />
<c:forEach items="${pList}" var="li"  >
 	<div title="	${li.functionname }" style="overflow:auto;" id="${li.functionid }" >
 	<ul id="${index }" class="ztree"></ul>  <!-- 根据查出的父类菜单的数量生成对等的手风琴 -->
	</div>
	<c:set var="index" value="${index+1}" />
 	</c:forEach>
</div>
