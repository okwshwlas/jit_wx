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
$(function(){
	$("#org").datagrid({
		title : '关键词列表',
		iconCls : 'icon-edit',
		nowrap : true,
		striped : true,
		url : path+'/keywordsController/selectAllKeywords.do',
        method : 'post',
        height : window_height - 50,
        width : window_width,
        remoteSort : false,
        fitColumns : true,
    	idField : 'id', // 表明该列是一个唯一列。
        rownumbers:true,
		onLoadSuccess : function(){ //点击行不选中checkbox
		},
		columns : [[
		            {
                        field : 'sign',
                        title : '标识',
                        width : window_width,
                        align:'center'
		            },
		            {
                        field : 'context',
                        title : '关键词',
                        width : window_width,
                        align:'center'
		            },
		            {
                        field:'handler',
                        title : '操作',
                        width : window_width,
                        align:'center',
                        sortable : false ,
                        formatter : function(value, rec) {
                            return "&nbsp;&nbsp;&nbsp;<a href='#' style='color:blue' onclick='update_mode(\"" + rec.id + "\")'>[修改]</a>"+
                                    "&nbsp;&nbsp;&nbsp;<a href='#' style='color:blue' onclick='delete_mode(\"" + rec.id + "\")'>[删除]</a>";
                        }
                    }
		  ]],
		  pagination : true,
          pageList : [1,5,10],
          toolbar: [{
  			iconCls: 'icon-add',
  			text: '新增关键字',
  			handler: function(){
  				newfunction();
  			}
  			
  		}]
	});
});
	$('#querySelect').combobox( { // 点击查询全部信息时，清空文本输入框
		onSelect : function(record) {
			$('#userName').val("");
			//$('#org').datagrid('reload');

		}
	});

	$('#querySelect').combobox( {
	data : [ {
	value : "ALL",
	name : "查询全部信息"
	}, {
	value : "sign",
	name : "标识"
	}, {
	value : "context",
	name : "关键词"
	}, {
	value : "parentid",
	name : "上级ID"
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
		// 查询ajax连接action
		$("#org").datagrid({
			url : path + '/keywordsController/selectAllKeywords.do',
			
			queryParams : {
				'typeValue' : userNames,
				'typeName' : typeName
			}
		});
		//$('#org').datagrid('reload'); // 重新设置option属性值，并且重新加载jqGrid
	});
});



//删除单个
function delete_mode(id){
	 $.messager.confirm('提示','将删除本条记录及其关联的文本和图文数据?',function(r){
		 		if(r){
		 			$.post(path+'/keywordsController/deleteKeywords.do',{id:id},
		 					function(result){
		 				var data = eval(result);
		 				if (true == data.success){  
	                        $('#org').datagrid('reload');
	                        $.messager.show({   
	                            title: '提示',  
	                            msg: '删除成功'  
	                        });  
	                    } else {  
	                        $.messager.show({   
	                            title: '提示',  
	                            msg: '删除失败'  
	                        });  
	                    }  
	                },'json');  
		 		}else{
		 			return ;
		 		}
               
       });  
}

//新增
var url;
function newfunction(){
	$("#showMessage").dialog("open").dialog('setTitle', '新增关键词');
    $("#fm").form("clear");
    url= path+'/keywordsController/insertKeywords.do';
}



//修改
function update_mode(id){
	$.ajax({
		url: path+'/keywordsController/selectKeywordsById.do',
		async:false,
		data:{
			'id':id
		},
		type : 'post',
		dataType : 'json',
		success : function(data){
			$("#showMessage").dialog("open").dialog('setTitle', '修改关键字');
			$('#fm').form('load',data);
		}
		
	});
    url=path+'/keywordsController/updateKeywords.do';       
   
	}

//修改保存
function savefunction() {
	 $('#fm').form('submit',{  
			url: url,  
			onSubmit: function(){  
				return $(this).form('validate');  
			}, 
			success: function(result){  
					$('#showMessage').dialog('close');      // close the dialog  
                	$('#org').datagrid('reload');    // reload the function data 
                	var data = eval('('+result+')');
                	if(true == data.success){
                		$.messager.show({   
                			title: '提示',  
                			msg: '保存成功'  
                		});
                	}else{
                		$.messager.show({   
                			title: '提示',  
                			msg: '保存失败'  
                		});
                	}
			}  
		});  
}

function this_winowclose(){
$('#open_show').window('close');
}

