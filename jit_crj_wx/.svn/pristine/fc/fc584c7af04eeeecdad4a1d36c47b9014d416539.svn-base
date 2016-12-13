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
	getJigouTree("USERDEP",path,"","")
	centerTabs = $("#showOrg").tabs( { //设置DIV为选项卡
		border : false
	});
	var url = path + '/userControl/selectAllUser.do';
	$(function() {
		$('#org')
				.datagrid(
						{
							title : '用户信息列表',
							iconCls : 'icon-edit',
							nowrap : true,
							height : window_height - 50,
							width : window_width,
							striped : true, // 数据条纹显示
							url : url,
							singleSelect : false,// 是否单选，默认false
							remoteSort : false, //定义是否访问服务器给数据排序,默认true,false为控件自己排序，不提交服务器
							fitColumns : true,
							idField : 'userid', // 表明该列是一个唯一列。
							/*frozenColumns : [ [ { // 在最左侧定义一个checkbox列
								field : 'checkbox',
								checkbox : true
							} ] ],*/
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
								 }, 10);
							},
							onLoadSuccess : function(){},
							columns : [ [
							       
									{
										field : 'usercode',
										title : '登录账号',
										align : 'center',
										width : window_width ,
										sortable : true
									},
									{
										field : 'username',
										title : '真实姓名',
										align : 'center',
										width : window_width ,
										sortable : true
									},
									{
										field : 'userpwd',
										title : '用户密码',
										align : 'center',
										width : window_width ,
										sortable : true,
										hidden : true
									},
									{
										field : 'rolename',
										title : '所属角色',
										align : 'center',
										width : window_width ,
										sortable : true,
										hidden : false
									},
									{
										field : 'usertel',
										title : '用户手机',
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
											return "<a href='#' style='color:blue' onclick='edit_mode(\"" + rec.userid + "\",\"" + rec.username + "\")'>[分配角色]</a>"
													+ "&nbsp;&nbsp;&nbsp;<a href='#' style='color:blue' onclick='update_mode(\""
													+ rec.userid
													+ "\")'>[修改]</a>"
													+ "&nbsp;&nbsp;&nbsp;<a href='#' style='color:blue' onclick='delete_mode(\""
													+ rec.userid
													+ "\")'>[删除]</a>";
										}
									} ] ],
							pagination : true,
							rownumbers : true,
							pageList : [ 5, 10 ],
							toolbar : [ {
								iconCls : 'icon-add',
								text : '新增用户',
								handler : function() {
									newuser();
								}
							}
							/*
							, '-', {
								iconCls : 'icon-remove',
								text : '批量删除',
								handler : function() {
								var rows = $('#org').datagrid('getSelections');
								
		        				if(rows.length==0){
		        					$.messager.alert('提示:','请选择一条记录!');
		        					return;
		        				}
								$.messager.confirm('提示', '确定删除该条数据吗?', function(r) {
									if (r) {
										  var rowData = $('#org').datagrid('getSelections');  //选中的记录  
										  var count=$('.datagrid-row-selected td:nth-child(3) div').length; //选中总数
										  var ids = [];   
										   $.each(rowData, function(i, rowval) {   
										        if (i)   
										           ids += ',';   
										           ids += rowval.userid;   
										   }); 
										$.ajax({
											url : path + '/userControl/deleteAllUser.do',
											data : {
												'ids' :ids
											},
											type : 'post',
											dataType : 'text',
											async : false,//设置为同步 
											success : function(data) {
												var data=eval('('+data+')');
												$('#org').datagrid('reload'); 
												$.messager.show({
															title : '提示',
															msg : data.msg
														});
											},
											error : function(XMLHttpRequest, textStatus, errorThrown) {
												$.messager.progress('close');
												$.messager.show({
															msg : "删除失败",
															title : '提示'
														});
											}
										});
									}
								});
								}
							} */
							
							]
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
			value : "USERCODE",
			name : "登录账号"
		}, {
			value : "USERNAME",
			name : "真实姓名"
		}, {
			value : "USERTEL",
			name : "用户手机"
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
					url : path + '/userControl/selectAllUser.do',
					queryParams : {
						'typeValue' : userNames,
						'typeName' : typeName
					}
				});
			});
});


var url;
//新增
function newuser(){
	$('#showMessage').dialog({
		title: '新增用户',
		width: window_width*0.4,
		height: window_height*0.7,
		closed: false,
		cache: false
		});
	
    $("#strform").form("clear");
    getJigouTree("USERDEP",path,"");
    url= path+'/userControl/insertUser.do';
}
//保存
function saveuser() {
	 $('#strform').form('submit',{  
			url: url, 
			onSubmit: function(){  
				return $(this).form('validate');  
			},  
			success: function(result){  
					var data=eval('('+result+')');
					$('#showMessage').dialog('close');      // close the dialog  
                	$('#org').datagrid('reload');    // reload the user data 
                	$.messager.show({   
                        title: '提示',  
                        msg: data.msg
                    });
			}  
		});  
}
//修改
function update_mode(userId){
	var userDep ;
	$.ajax({
			url: path+'/userControl/selectUserById.do',
			async:false,
			data:{
				'userid':userId
			},
			type : 'post',
			dataType : 'json',
			success : function(data){
				$('#showMessage').dialog({
					title: '修改用户',
					width: window_width*0.4,
					height: window_height*0.7,
					closed: false,
					cache: false
					});
				$('#strform').form('load',data);
				getJigouTree("USERDEP",path,data.userdep);
			}
		});
	url=path+'/userControl/updateUser.do';
}
//删除
function delete_mode(userId) {
	$.messager.confirm('提示', '确定删除该条数据吗?', function(r) {
		if (r) {
			$.post(path + '/userControl/deleteAllUser.do', {
				userid : userId
			}, function(result) {
				var data=eval('('+result+')');
					$('#org').datagrid('reload'); // reload the user data
					$.messager.show({   
                        title: '提示',  
                        msg: data.msg  
                    });  
			}, 'text');
		}
	});
}
//分配角色
function edit_mode(userId,userName){
	document.getElementById("userid").value = userId;
	document.getElementById("uname").innerHTML=userName;
	document.getElementById("pager").style.display="";
	var url = path + '/userControl/selectAllRolesName.do';
	var urlmr=path + '/userControl/selectRoleName.do';
	$('#roleid').combobox({  
		url:url,
	    valueField:'roleid',   
	    textField:'rolename',
	    onLoadSuccess:function(){
		var userdata;
		$.ajax({ //ajax拿到初始化编号和当前日期，以及下拉菜单的值
			url : urlmr,
			data : {
			'userId' :userId
			},
			dataType : 'json',
			cache : false,
			async : false,
			type  : 'post',
			success : function(data) {
			userdata=data.userdata;
			},
			error : function() {
			}
			
		});
		$('#roleid').combobox("setValue",userdata);//这里写设置默认值
	}	
	});
	
	$("#pager").dialog({
		width: window_width*0.3,
		height: window_height*0.4,
		buttons:[{
			text:'保存',
			iconCls:'icon-save',
			handler:function(){
			var role = $("#roleid").combobox('getValue');
			if(role==''){
				var message;
				
					message = '您需要选择一个角色！';
					
					$.messager.show( {
						msg : message,
						title : '提示'
					});
				
			}else{
				var urlrole = path + '/userControl/addRolesName.do';	
				$('#fm').form('submit',{   
				    url:urlrole,   
				    onSubmit: function(){   
					return $(this).form('validate');  
				    },   
				    success:function(data){  
				    	var data=eval('('+data+')');
							$.messager.show({
										msg : data.msg,
										title : '提示'
									});
				        $('#pager').dialog('close');
				        $('#org').datagrid('reload');
				    }   
				});   
			}
			}
		},{
			text:'取消',
			iconCls : 'icon-cancel',
			handler:function(){
				$('#pager').dialog('close');
			}
		}],
		title: '分配角色'
		});
	}