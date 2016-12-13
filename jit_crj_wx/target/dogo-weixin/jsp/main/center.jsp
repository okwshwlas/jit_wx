<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="/WEB-INF/tld/c.tld" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<script type="text/javascript" charset="utf-8">
	var centerTabs;
	function addTabFun(opts) {
		var options = $.extend({
			title : '',
			content : '<iframe src="' + opts.src + '" frameborder="0" style="border:0;width:100%;height:99.2%;"></iframe>',
			closable : true,
			iconCls : ''
		}, opts);
		if (centerTabs.tabs('exists', options.title)) {
			centerTabs.tabs('close', options.title);
		}
		centerTabs.tabs('add', options);
	};
	$(function() {
		centerTabs = $('#centerTabs').tabs({
			fit : true,
			border : false
		});
	});
	function addTab(node) {
		var name=node.name;
		if(name.indexOf('<')!=-1){
			name=node.name.substring(0,node.name.indexOf('<'))
		}
		if (centerTabs.tabs('exists', name)) {
			centerTabs.tabs('close', name);
		} 
		if (node.attributes!=null&&node.attributes.url!=null && node.attributes.url.length > 0) {
			centerTabs.tabs('add', {
				title :name ,
				closable : true,
				fit:true,
				border : false,
				content : '<iframe src="' + node.attributes.url + '" frameborder="0" style="border:0;width:100%;height:100%;"></iframe>'
			});
		}
		
	}
	$(function(){  
	 $("#btn").click(function(e){      
		 $('#menu').menu('show', {   
			  left: e.pageX,          
			  top: e.pageY     
	}); 
 	});
	 });
	$(function(){  
		//刷新    
		$("#m-refresh").click(function(){     
		 var currTab = $('#centerTabs').tabs('getSelected');  
		 //获取选中的标签项  
		 var url = $(currTab.panel('options').content).attr('src'); 
		 //获取该选项卡中内容标签（iframe）的 src 属性      
		/* 重新设置该标签 */     
	    $('#centerTabs').tabs('update',{ 
		    tab:currTab,options:{content: createTabContent(url)}})});
		$("#m-closeall").click(function(){ 
			$(".tabs li").each(function(i, n){       
			var title = $(n).text();  
			if("首页"!=title){    
			 $('#centerTabs').tabs('close',title);
			}   
			 });  
		 });
		$("#m-closeother").click(function(){
			var currTab = $('#centerTabs').tabs('getSelected');
			currTitle = currTab.panel('options').title; 
		 $(".tabs li").each(function(i, n){  
		 var title = $(n).text();  
		 if(currTitle != title&&"首页"!=title){         
		 $('#centerTabs').tabs('close',title);  
		    } });});
		 $("#m-close").click(function(){
			var currTab = $('#centerTabs').tabs('getSelected');
			currTitle = currTab.panel('options').title; 
			if("首页"!=currTitle){      
		 $('#centerTabs').tabs('close', currTitle); 
		}
		    });});
	$(function(){    
		 /*为选项卡绑定右键*/  
		  $(".tabs li").live('contextmenu',function(e){       
	    /* 选中当前触发事件的选项卡 */    
		var subtitle =$(this).text();      
		$('#centerTabs').tabs('select',subtitle);          
		//显示快捷菜单  
		$('#menu').menu('show', {
		left: e.pageX, 
		top: e.pageY  
		 });   
		 return false;   
		 });});    
</script>
<div id="centerTabs">
	<div title="首页" border="false">
	  <iframe src="<c:url value="/jsp/index/portal.jsp"/>" frameborder="0" style="border:0;width:100%;height:100%;"></iframe></div>
</div>
<div id="menu" class="easyui-menu" style="width:200px">  
     <div id="m-closeall">全部关闭</div>  
     <div id="m-closeother">除此之外全部关闭</div>   
     <div id="m-close">关闭</div></div>
     
    
     
     
     
     
     