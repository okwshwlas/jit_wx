var centerTabs;
var maiheight = document.documentElement.clientHeight;
var h = maiheight - 155;
if (h < 0) {
	h = 200;
}
var k = 0;// 表格的rowid
var window_width = $(window).width();
var window_height = $(window).height();
$(window).resize(function(){
	window_width = $(window).width();
	window_height = $(window).height();
	$('#userList').datagrid('resize', {
        width: $(window).width()
    });
});
$(function() {
	var url = path + '/weixinuserControl/chkAllUser.do';
	$(function() {
		$('#userList').datagrid(
						{
							title : '用户信息列表',
							iconCls : 'icon-edit',
							nowrap : true,
							width : window_width,
							striped : true, // 数据条纹显示
							url : url,
							singleSelect : false,// 是否单选，默认false
							remoteSort : false, //定义是否访问服务器给数据排序,默认true,false为控件自己排序，不提交服务器
							fitColumns : true,
							idField : 'openid', // 表明该列是一个唯一列。
							/*frozenColumns : [ [ { // 在最左侧定义一个checkbox列
								field : 'checkbox',
								checkbox : true
							} ] ],*/
							onLoadSuccess : function(){ //点击行不选中checkbox
							function bindRowsEvent(){
								var panel = $('#userList').datagrid('getPanel');
								var rows = panel.find('tr[datagrid-row-index]');
								rows.unbind('click').bind('click',function(e){
									 return false;
								});
								rows.find('div.datagrid-cell-check input[type=checkbox]').unbind().bind('click', function(e){
									var index = $(this).parent().parent().parent().attr('datagrid-row-index');
									if ($(this).attr('checked')){
										$('#userList').datagrid('selectRow', index);
									}else{
										$('#userList').datagrid('unselectRow', index);
									}
									e.stopPropagation();
									});
								}
								setTimeout(function(){
									bindRowsEvent();
								 }, 10);
							},
							onLoadSuccess : function(){},
							columns : [ [
							          {

											field : 'openid',
											title : '用户标识',
											align : 'center',
											width : window_width/6+100,
											sortable : true	 
							          },
							          {

											field : 'nickname',
											title : '用户昵称',
											align : 'center',
											width : window_width/6 ,
											sortable : true	 
							          },
							          {

											field : 'sex',
											title : '用户性别',
											align : 'center',
											width : window_width/6 ,
											sortable : true	 ,
											formatter:function(cellvalue, options, rowObject){//formatter事件 根据当前数据进行格式化 cellvalue即为当前要被格式化的数据
												var a= '';
												if(cellvalue=='1'){//根据cellvalue数据 进行格式化
													a='男';
												}else if(cellvalue=='2'){
													a='女';
												}else{
													a='未知';
												}
												
												return a;//s即为最后的return值 会赋值给当前数据
											}
										},
							           {

											field : 'province',
											title : '地区',
											align : 'center',
											width : window_width /6,
											sortable : true	 
							          },
							          {

											field : 'subscribe_time',
											title : '最后关注时间',
											align : 'center',
											width : window_width/6 ,
											sortable : true	,
											formatter:function(cellvalue, options, rowObject){//formatter事件 根据当前数据进行格式化 cellvalue即为当前要被格式化的数据
												return new Date(parseInt(cellvalue) * 1000).toLocaleString();//s即为最后的return值 会赋值给当前数据
											}
							          },
							          {

											field : 'remark',
											title : '备注',
											align : 'center',
											width : window_width/6 ,
											sortable : true	 
							          } ] ],
							pagination : true,
							rownumbers : true,
							pageList : [ 10,15,20 ],
							toolbar : [ {
								iconCls : 'icon-add',
								text : '导出',
								handler : function() {
									fileExport();
								}
							}]
						});
	});
	$('#querySelect').combobox({
		 url:path + '/weixinuserControl/chkGroup.do',
		 valueField:'id',
		 textField:'name',
		 multiple:false
	});
	$('#querybtn').linkbutton( {
		iconCls : 'icon-search'
	});
	$("#querybtn").click( // 查询，支持模糊查询
			function() {
				var groupid = $("#querySelect").combobox('getValue');
				var nickname=$("#queryName").val();
				$("#userList").datagrid({
					url : path + '/weixinuserControl/chkAllUser.do',
					queryParams : {
						'groupid' : groupid,
						'nickname': nickname
					}
				});
			});
});
function fileExport(){
	window.location.href =path + '/weixinuserControl/exportExcel2.do';
}
function clearparam(){
	$("#selectForm").form("clear");
}
