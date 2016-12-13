var window_width = $(window).width();
var window_height = $(window).height();
$(function () {
	$(window).resize(function(){
		window_width = $(window).width();
		window_height = $(window).height();
		$('#org').datagrid('resize', {
	        height: $(window).height()-50,
	        width: $(window).width()
	    });
	});
        $('#org').datagrid({
            title : '角色列表',
            iconCls : 'icon-edit',
            nowrap : true,
            striped : true, //数据条纹显示
            url : path+'/roleControl/selectAllRole.do',
            method : 'post',
            width : window_width,
            height : window_height - 50,
            remoteSort : false,
            fitColumns : true,
            rownumbers:true,
			onLoadSuccess : function(){},
            columns : [
                    [	
                    {
                        field : 'rolename',
                        title : '角色名称',
                        width : window_width,
                        align:'center'
                    },
                    {
                        field : 'roledesc',
                        title : '角色描述',
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
                            return	"<a href='#' style='color:blue'  onclick='edit_mode(\"" + rec.roleid + "\")'>[分配菜单]</a>"+
                            	    "&nbsp;&nbsp;&nbsp;<a href='#' style='color:blue' onclick='update_mode(\"" + rec.roleid + "\")'>[修改]</a>"+
                                    "&nbsp;&nbsp;&nbsp;<a href='#' style='color:blue' onclick='delete_mode(\"" + rec.roleid + "\")'>[删除]</a>";
                        }
                    }
                ]
            ],
            pagination : true,
            pageList : [1,5,10],
        		toolbar: [{
        			iconCls: 'icon-add',
        			text: '新增角色',
        			handler: function(){
        				newuser();
        			}
        			
        		}
        		
        		]
        });
        $('#querySelect').combobox( { // 点击查询全部信息时，清空文本输入框
			onSelect : function(record) {
				$('#userName').val("");
				$('#org').datagrid('reload');//刷新grid
			}
		});

$('#querySelect').combobox( {
	data : [ {
		value : "ALL",
		name : "查询全部信息"
	}, {
		value : "rolename",
		name : "角色名称"
	}, {
		value : "roledesc",
		name : "角色描述"
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
$("#querybtn").click(  
		function() {
			var userNames = $("#userName").val();
			var typeName = $("#querySelect").combobox('getValue');  
			//过滤特殊字符
			if (userNames != ""){
				if(/^[^#$^&*<>'"]*$/.test(userNames)){
					
				}else{
					$tmp = $("#userName");
					$.messager.alert('提示：','请不要输入特殊字符！',"warning",function(){$tmp.select();});
					return;
				}
			}
		 
			$("#org").datagrid({
				url : path + '/roleControl/selectAllRole.do',
				queryParams : {
					'typeValue' : userNames,
					'typeName' : typeName
				}
			});
		});
    });

    //删除
	function delete_mode(roleId){
		 $.messager.confirm('提示','确定删除该条数据吗?',function(r){
			 		if(r){
			 			$.post(path+'/roleControl/deleteAllRole.do',{roleid:roleId},function(result){
		                        $('#org').datagrid('reload');
		                        $.messager.show({   
		                            title: '提示',  
		                            msg: result.msg 
		                        });  
		                },'json');  
			 		}else{
			 			return ;
			 		}
	                
	        });  
	}
	var url;
	//新增
	function newuser(){
		$('#showMessage').dialog({
			title: '新增角色',
			width: window_width*0.3,
			height: window_height*0.4,
			closed: false,
			cache: false
			});
        $("#fm").form("clear");
        url= path+'/roleControl/insertRole.do';
	}
	//保存
	function saveuser() {
		 $('#fm').form('submit',{  
				url: url,  
				onSubmit: function(){  
					return $(this).form('validate');  
				},  
				success: function(result){  
						$('#showMessage').dialog('close');      // close the dialog  
	                	$('#org').datagrid('reload');    // reload the user data 
	                	var data=eval('('+result+')');
	                	$.messager.show({   
                            title: '提示',  
                            msg: data.msg 
                        });
				}  
			});  
    }
	//修改
	function update_mode(ROLEID){
		$.ajax({
				url: path+'/roleControl/selectRoleById.do',
				async:false,
				data:{
					'roleid':ROLEID
				},
				type : 'post',
				dataType : 'json',
				success : function(data){
					$('#showMessage').dialog({
						title: '修改角色',
						width: window_width*0.3,
						height: window_height*0.4,
						closed: false,
						cache: false
					});
					$('#fm').form('load',data);
				}
			});
		url=path+'/roleControl/updateRole.do';
	}
	
//分配菜单	
function edit_mode(ROLEID){
		$('#ROLEID').val(ROLEID);
		$('#open_show').dialog({
			title: '新增角色',
			width: window_width*0.3,//弹出框宽度
			height: window_height*1,//弹出框高度
			top: (window_height - 350) * 0.5,    //上边距
	        left: (window_width - 531) * 0.5,    //左边距
	        title:"分配菜单",
	        draggable:true,							//定义是否窗口能被拖拽。
	        maximizable:true,						//定义是否显示最大化按钮
	        minimizable:true,						//定义是否显示最小化按钮
	        collapsible:true, 						//定义是否显示折叠按钮。
	        resizable : false,                       	//是否可拖动大小
	        modal : false,                       		//是否是一个模式窗口
	        closable : true,                       	//显示关闭按钮
	        shadow : false,
			cache: false,
	        onOpen :function(){
	        	 $.ajax({
               	  	url: path+'/roleControl/getFunctionTree.do',
           			async:false,
           			data:{
           				'roleid':ROLEID
           				},
           			type : 'post',
           			dataType : 'json',
           			success : function(data){
           			if(data!=""){
           						$('#tt').tree({   
           			      		 	data:eval(data),
           			      		 	checkbox:true

           			      		    	 })
           						
           			}
           			},
           			error : function(XMLHttpRequest, textStatus, errorThrown,data) {
//           			alert(data.ctree);
           			}
           		}); 
	        	
	        	
	        },
	        onBeforeClose:function(){
	        }
	    });
	    $('#open_show').window('open');
	
	}
function this_winowclose(){
    $('#open_show').window('close');
}

function this_winowsucess(data){
	$.messager.show({
		msg : data.msg,
		title : '提示'
	});
}

function checkPnode(node){
	var obj=$('#tt').tree('getParent',node);
	alert(obj);
}

function doSubmit(){
	var objArr=$('#tt').tree('getChecked');
	var objArr2=$('#tt').tree('getChecked','indeterminate');//实心部分
	var menuid="";
	if(objArr==null||objArr.length==0) {
		$.messager.show({   
            title: '提示',  
            msg: "请选择菜单"
        });
		return;
	}
	for(var i=0;i<objArr.length;i++){
		var obj=objArr[i];
		if(i!=0){
			menuid+=",";
		}
		menuid+=obj.id;
	}
	for(var i=0;i<objArr2.length;i++){
		var obj=objArr2[i];
		if(menuid!=""){
			menuid+=",";
		}
		menuid+=obj.id;
	}
	$.ajax({
		url: path+'/roleControl/addFunctionRole.do',
			async:false,
			data:{
				'roleid':$('#ROLEID').val(),
				'menuid':menuid
				},
			type : 'post',
			dataType : 'json',
			success : function(data){
				$('#open_show').dialog('close');      // close the dialog  
				$.messager.show({
					msg : data.msg,
					title : '提示'
				});
			},
			error : function(XMLHttpRequest, textStatus, errorThrown,data) {
			}
		}); 
}
function doReturn(){
	$('#open_show').dialog('close');
}
