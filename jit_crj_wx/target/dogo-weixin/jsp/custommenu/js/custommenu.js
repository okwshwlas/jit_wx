var window_width = $(window).width();
var window_height = $(window).height();	
//生成自定义菜单
function createNode(){
		 $.messager.confirm('提示','确定重新生成自定义菜单 ?',function(r){
		 		if(r){
		 			$.messager.progress({ 
		 				title:'请稍后', 
		 				msg:'页面加载中...' 
		 				}); 
		 				$.ajax({
		 					url: path+'/customMenuController/createCustomMenu.do',
		 					async:true,
		 					type : 'post',
		 					success: function(data){  
		 						$.messager.progress('close');
		 						var data = eval('(' + data + ')');
				   				$.messager.show({title:'提示',msg:data.msg});
		 				    } 
		 				}); 
		 		}else{
		 			return ;
		 		}
            
    });  
}
    //撤销自定义菜单
	function repealNode(){
		 $.messager.confirm('提示','确定撤销自定义菜单?',function(r){
		 		if(r){
		 			$.messager.progress({ 
		 				title:'请稍后', 
		 				msg:'页面加载中...' 
		 				}); 
		 			$.ajax({
		 				url: path+'/customMenuController/repealAllCustommenus.do',
		 				async:true,
		 				type : 'post',
		 				success: function(data){  
		 					$.messager.progress('close');
		 					var data = eval('(' + data + ')');
			   				$.messager.show({title:'提示',msg:data.msg});
		 			    } 
		 			}); 
		 		}else{
		 			return ;
		 		}
 });  
}
		var id ;
		//编辑
		function edit(id){
			$("#strform").form("clear");
			$.ajax({
				url: path+'/customMenuController/selectCustomMenuById.do',
				async:false,
				data:{
					'id':id
				},
				type : 'post',
				dataType : 'json',
				success : function(data){
					$('#showMessage').dialog({
						title: '自定义菜单编辑',
						width: window_width*0.8,
						height: window_height,
						closed: false,
						cache: false
						});
					
					$('#strform').form('load',data);
					$("input[name='status'][value="+data.status+"]").attr("checked",true); 
					editor.html(data.content);
					editor.sync(); 
					
				}
				
			});
		}
	//保存	
	function save(){
		var formId = $('#id').val();
		var	formName= $.trim($('#name').val());
		var formKey = $('#keywordorurl').val();
		formStatus = $("input[name='status']:checked").val();
		var formContent =editor.html();
		if(formKey==""&&formContent==""){
			$.messager.show({   
                title: '错误提示',  
                msg: '关键词或远程链接、本地链接至少填写一项'  
            });
			return;
		}
		if(formId=="id1"||formId=="id2"||formId=="id3"){//父菜单验证
			if(formName==""){
				$.messager.show({   
                    title: '错误提示',  
                    msg: '菜单名称不能为空'  
                });
				return;
			}
			if(formName.length>4){
				$.messager.show({   
                    title: '错误提示',  
                    msg: '父菜单名称长度不能大于4'  
                });
				return;
			}
			if(formStatus=="不启用"){
				 $.messager.confirm('提示','不启用该父类菜单,将会关闭旗下所有子菜单?',function(r){
				 		if(r){
				 			$.post(path+'/customMenuController/updateChildCustomMenuStatusByParentid.do',{id:formId},
				 			function(result){
				 				 if (result.success){  
				 					$('#tt').treegrid('reload');
				 					$('#strform').form('submit',{  
				 						url: path+'/customMenuController/updateCustomMenu.do',
				 						onSubmit: function(){  
				 							//return $(this).form('validate');  
				 						},  
				 						
				 						success: function(result){  
				 								$('#showMessage').dialog('close');      
				 			                	$('#tt').treegrid('reload'); 
				 			                	var data = eval('(' + result + ')');
				 			   				    $.messager.show({title:'提示',msg:data.msg});
				 						}  
				 					});  
			                    } else {  
			                        $.messager.show({   
			                            title: '提示',  
			                            msg: '出错了'  
			                        });  
			                    }  
			                },'json');
				 			
				 		}else{
				 			return ;
				 		}
		       });  
				return;
			}
		}else{//子菜单验证
			if(formName.length>7){
				$.messager.show({   
                    title: '错误提示',  
                    msg: '子菜单名称长度不能大于7'  
                });
				return;
			}
		}
		 $('#strform').form('submit',{  
			    url: path+'/customMenuController/updateCustomMenu.do',
				onSubmit: function(){  
					//return $(this).form('validate');  
				},  
				
				success: function(result){  
						$('#showMessage').dialog('close');       
	                	$('#tt').treegrid('reload');     
	                	var data = eval('(' + result + ')');
		   				$.messager.show({title:'提示',msg:data.msg});
				}  
			});  
		
	}	