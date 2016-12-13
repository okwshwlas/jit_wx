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
	$('#org').datagrid('resize', {
        height: $(window).height()-50,
        width: $(window).width()
    });
});
$(function() {
	var url = path + '/wenbenControl/selectAllWenben.do';
	$(function() {
		$('#org').datagrid(
						{
							title : '自定义文本回复信息',
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
										field : 'neirong',
										title : '内容',
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
								text : '新增文本',
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
		} ],
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
					url : path + '/wenbenControl/selectAllWenben.do',
					queryParams : {
						'typeValue' : userNames,
						'typeName' : typeName
					}
				});
			});
});



//新增
function add(){
	$("#showMessage").dialog("open").dialog('setTitle', '新增文本信息');
    $("#strform").form("clear");
    url= path+'/tuwenControl/selectAllKeywordsNotpage.do';
    //获取下拉列表的值
    $('#keyword').combobox({  
		url:url,
	    valueField:'id',   
	    textField:'context',
	    //列表改变事件
	    onSelect:function(record){
    	$.ajax({
			url: path+'/tuwenControl/selectisNotkeyword.do',
			async:false,
			data:{
    		'keyword_id':record.id
			},
			type : 'post',
			dataType : 'json',
			success : function(data){
				if (false == data.success) {
					$.messager.alert('提示:','该关键词已关联文本或图文，每个关键词只能关联一个文本或图文内容');
					$('#keyword').combobox("setValue","---请选择---");//这里写设置默认值
				} 
			}
		});
    	
        },
	    onLoadSuccess:function(){
		var keyworddata;
		
		$('#keyword').combobox("setValue","---请选择---");//这里写设置默认值
	   }	
	});
    $("#reman").html(1000);//重新计算字符数
    url = path + '/wenbenControl/insertWenben.do';	
}

//修改
function update_mode(id){
	$("#showMessage").dialog("open").dialog('setTitle', '修改文本信息');
    $("#strform").form("clear");
    var keyword_id;
	$.ajax({
			url: path+'/wenbenControl/selectWenbenById.do',
			async:false,
			data:{
				'id':id
			},
			type : 'post',
			dataType : 'json',
			success : function(data){
				$("#neirong").val(data.neirong);
				$("#reman").html(1000-$('#neirong').val().length);//重新计算字符数
				$("#id").val(data.id);
				keyword_id = data.keywordId;
				
			}
		});
	 //获取下拉列表的值
	url= path+'/tuwenControl/selectAllKeywordsNotpage.do';
	 $('#keyword').combobox({  
			url:url,
		    valueField:'id',   
		    textField:'context',
		    onLoadSuccess:function(){
			$('#keyword').combobox("setValue",keyword_id);//这里写设置默认值
			var val = $(this).combobox("getData");
		},
		 //列表改变事件
	    onSelect:function(record){
    	$.ajax({
			url: path+'/tuwenControl/selectisNotkeyword.do',
			async:false,
			data:{
				'keyword_id':record.id,
				'wenbenid':id
			},
			type : 'post',
			dataType : 'json',
			success : function(data){
				if (false == data.success) {
					$.messager.alert('提示:','该关键词已关联文本或图文，每个关键词只能关联一个文本或图文内容');
					$('#keyword').combobox("setValue","---请选择---");//这里写设置默认值
				} 
			}
		});
    	
        }
		});
	
	 url = path + '/wenbenControl/updateWenbenById.do';	//修改的地址
}



function saveWenben(){
	var keyword = $("#keyword").combobox('getValue');
	 var neirong = $("#neirong").val();
	if(keyword=='---请选择---'||keyword==''){
		$.messager.show( {
			msg : '您需要选择一个关键词！',
			title : '提示'
		});
		return;
	}
	if(neirong==''){
		$.messager.show( {
			msg : '内容不能为空！',
			title : '提示'
		});
		return;
	}
		$('#strform').form('submit',{   
		    url:url,   
		    onSubmit: function(){   
		    },   
		    success:function(data){  
		    	var data = eval('('+data+')');
		    	if (true==data.success) {
					$.messager.show({
						msg : "保存成功",
						title : '提示'
					});
				} else {
					$.messager.show({
						msg : "保存失败",
						title : '提示'
					});
				}
		        $('#showMessage').dialog('close');
		        $('#org').datagrid('reload');
		    }   
		});   
}
	//关闭对话框
	function cancel(){
		
		$('#showMessage').dialog('close');
		
	}
	

//删除
function delete_mode(id) {
	$.messager.confirm('提示', '确定删除该条数据吗?', function(r) {
		if (r) {
			$.post(path + '/wenbenControl/deleteWenben.do', {
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
//字节统计
function CountStrByte(textId,count,show){ 
	$('#'+show).html(count);
	var obj=$('#'+textId);
	var value=obj.val();
	var ByteCount = 0;
	var StrLength = value.length;
	var MaxValue  = count;
	if (StrLength>MaxValue) {
		obj.val(value.substring(0,count));
	}
	$('#'+show).html(MaxValue - value.length);
}



