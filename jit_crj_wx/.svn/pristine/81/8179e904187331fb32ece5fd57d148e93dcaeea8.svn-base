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
		var tuwenId = parent.id;//父页面的id
		$('#org')
				.datagrid(
						{
							title : '自定义图文信息列表',
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
//							frozenColumns : [ [ { // 在最左侧定义一个checkbox列
//								field : 'checkbox',
//								checkbox : true
//							} ] ],
							queryParams : {
								'tuwenId' : tuwenId
							},
							onLoadSuccess : function(){ //点击行不选中checkbox
							function bindRowsEvent(){
								var panel = $('#org').datagrid('getPanel');
								var rows = panel.find('tr[datagrid-row-index]');
								rows.unbind('click').bind('click',function(e){
									 return false;
								});
								rows.find('div.datagrid-cell-check input[type=checkbox]').unbind().bind('click', function(e){
									var index = $(this).parent().parent().parent().attr('datagrid-row-index');
									if ($(this).attr('checked')){
										$('#org').datagrid('selectRow', index);
									}else{
										$('#org').datagrid('unselectRow', index);
									}
									e.stopPropagation();
									});
								}
								setTimeout(function(){
									bindRowsEvent();
								 }, 5);
							},
							columns : [ [
									{
										field : 'id',
										title : '编号',
										sortable : false, // 是否可排序
										align : 'center',
										width : 10 ,
										checkbox : false,
									       sortable : true
									// 如果为true 该列为checkbox
									},
									{
										field : 'context',
										title : '关键词',
										align : 'center',
										width : 10 ,
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
										width : 10 ,
										sortable : true
									},
									{
										field : 'miaoshu',
										title : '简介',
										align : 'center',
										width : 10 ,
										sortable : true
									
									},
									{
										field : '操作',
										title : '操作',
										align : 'center',
										width : 10 ,
										sortable : true,
										formatter : function(value, rec) { // rec为你选中的一列数据map
											return "<a href='#' style='color:blue' onclick='add_child(\""
											+ rec.id+"\",\""+rec['title']
											+ "\")'>[添加]</a>"
											;
										}
									} 
									] ],
							pagination : true,
							rownumbers : true,
							pageList : [5],
							toolbar : [ {
								iconCls : 'icon-add',
								text : '新增图文',
								handler : function() {
									parent.toAddTuwen();
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
	
	window.location.href='tuwenedit.jsp?id='+id;
}

//新增
function add(){
	//window.location.href=path + '/tuwenControl/addTuwen.do';
	window.location.href='tuwenadd.jsp';
}

function reloadList(){
	$('#org').datagrid('reload');
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
function add_child(id,title){
	var _len = $("#tab tr",parent.document).length;  
	if(_len>9){
		$.messager.show({
			msg : "添加多图文最多为9条",
			title : '提示'
		});
		return;
	}
	var parentId = $("#id",parent.document).val();
	$.ajax({
		url: path+'/tuwenControl/updateTuwenById.do',
		async:false,
		type : 'post',
		dataType : 'json',
		data:{
			'id':id,
			'parentId':parentId,
			'flag':'addChild'
		},
		success : function(result){
			var data = eval(result);
			if(true == data.success){
				$.messager.show( {
					msg : '添加成功!',
					title : '提示'
				});
				$("#tab",parent.document).append("<tr id="+id+" align='center'>"
			            +"<td id='td_xuhao'>"+"_len"+"</td>"
			            +"<td>"+title+"</td>"
			           // +"<td><input type='text' name='desc"+data.id+"' id='desc"+_len+"' /></td>"
			            +"<td><a href=\'#\' onclick=\"delchild('"+id+"')\">删除</a></td>"
			         +"</tr>");
				//重置行序号
				$('#tab tr',parent.document).each(function(index,element){
					if(index!=0){
						$(this).children('td').eq(0).html(index);
					}
				});
				$('#org').datagrid('reload');
			}
			if(false == data.success){
				$.messager.show( {
					msg : data.msg,
					title : '提示'
				});
			}
		}
	});
	
}



