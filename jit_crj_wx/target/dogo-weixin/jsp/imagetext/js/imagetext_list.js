var centerTabs;
var maiheight = document.documentElement.clientHeight;
var h = maiheight - 155;
if (h < 0) {
	h = 200;
}
var k = 0;// 表格的rowid
$(function() {
	centerTabs = $("#showOrg").tabs( { //设置DIV为选项卡
		border : false
	});
	var url = path + '/tuwenControl/selectAllTuwen.do';
	var window_width = $(window).width();
	var window_height = $(window).height();

	$(function() {
		$('#org')
				.datagrid(
						{
							title : '自定义图文回复信息',
							iconCls : 'icon-edit',
							nowrap : true,
							height : window_height - 50,
							width : window_width,
							striped : true, // 数据条纹显示
							url : url,
							singleSelect : false,// 是否单选，默认false
							remoteSort : false, //定义是否访问服务器给数据排序,默认true,false为控件自己排序，不提交服务器
							fitColumns : true,
							idField : 'id', // 表明该列是一个唯一列。
							onLoadSuccess : function(){ 
							},
							columns : [ [
									{
										field : 'id',
										title : '编号',
										sortable : false, // 是否可排序
										align : 'center',
										width : window_width ,
										checkbox : false,
									    sortable : true,
									    hidden : true
									// 如果为true 该列为checkbox
									},
									{
										field : 'sign',
										title : '关键词标识',
										align : 'center',
										width : window_width ,
										sortable : true,
										formatter : function(value, rec) { // rec为你选中的一列数据map
											if(rec['keywords']!=null){
												return rec['keywords'].sign;
											}
										}
									},
									{
										field : 'context',
										title : '关键词',
										align : 'center',
										width : window_width ,
										sortable : true,
										formatter : function(value, rec) { // rec为你选中的一列数据map
											if(rec['keywords']!=null){
												return rec['keywords'].context;
											}
										}
									},
									{
										field : 'title',
										title : '标题',
										align : 'center',
										width : window_width ,
										sortable : true
									},
									{
										field : 'miaoshu',
										title : '简介',
										align : 'center',
										width : window_width ,
										sortable : true
									},
									{
										field : 'distribution',
										title : '操作',
										align : 'center',
										width : window_width ,
										sortable : false,
										formatter : function(value, rec) { // rec为你选中的一列数据map
											return "<a href='#' style='color:blue' onclick='update_mode(\""
													+ rec.id
													+ "\")'>[修改]</a>"
													+ "&nbsp;&nbsp;&nbsp;<a href='#' style='color:blue' onclick='delete_mode(\""
													+ rec.id
													+ "\")'>[删除]</a>";
										}
									} ] ],
							pagination : true,
							rownumbers : true,
							pageList : [5,10],
							toolbar : [ {
								iconCls : 'icon-add',
								text : '新增图文',
								handler : function() {
									add();
								}
							} ]
						});
	});
	// 指标设置
	$('#querySelect').combobox( { // 点击查询全部信息时，清空文本输入框
				onSelect : function(record) {
					$('#userName').val("");

				}
			});

	$('#querySelect').combobox( {
		data : [ {
			value : "ALL",
			name : "查询全部信息"
		}, {
			value : "context",
			name : "关键词"
		}, {
			value : "title",
			name : "标题"
		}],
		editable : false,
		valueField : 'value',
		textField : 'name',
		onChange:function(newValue,oldValue){
			if(newValue=='ALL'){
				$('#userName').attr('disabled',true);
			}else{
				$('#userName').attr('disabled',false);
			}
		},
		value : 'ALL'
	});
	$('#querybtn').linkbutton( {
		iconCls : 'icon-search'
	});
	$("#querybtn").click( // 查询，支持模糊查询
			function() {
				var userNames = $("#userName").val();
				var typeName = $("#querySelect").combobox('getValue'); // 查询的条件
				$("#org").datagrid({
					url : path + '/tuwenControl/selectAllTuwen.do',
					queryParams : {
						'typeValue' : userNames,
						'typeName' : typeName
					}
				});
			});
});

function update_mode(id){
	
	window.location.href='imagetext_edit.jsp?id='+id;
}

//新增
function add(){
	//window.location.href=path + '/tuwenControl/addTuwen.do';
	window.location.href='imagetext_add.jsp';
}

//删除
function delete_mode(id) {
	$.messager.confirm('提示', '确定删除该条数据吗?', function(r) {
		if (r) {
			$.post(path + '/tuwenControl/deleteAllTuwenById.do', {
				ids : id
			}, function(result) {
				var data = eval('(' + result + ')');
				if(true == data.success){
					$.messager.show({
						title : '提示',
						msg : '删除成功'
					});
					$('#org').datagrid('reload'); 
				}else{
					$.messager.show({
						title : '提示',
						msg : '删除失败'
					});
				}

			}, 'text');
		}
	});
}




