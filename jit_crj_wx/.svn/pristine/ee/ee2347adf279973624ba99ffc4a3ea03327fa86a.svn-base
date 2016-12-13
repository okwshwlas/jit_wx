//修改
function update_mode(){
	$.ajax({
		url: path+'/gongzhongZhanghaoController/selectGongzhongZhanghaoById.do',
		async:false,
		data:{
			'id':1
		},
		type : 'post',
		dataType : 'json',
		success : function(data){
			$("#id").val(data.id);
			$("#account").val(data.account);
			$("#token").val(data.token);
			$("#weixin").val(data.weixin);
			$("#accountDepict").val(data.accountDepict);
			$("#reman").html(1000-$('#accountDepict').val().length);//重新计算字符数
			$("#accountAppid").val(data.accountAppid);
			$("#accountAppsecret").val(data.accountAppsecret);
		}
		
	});
   
}

//修改保存
function savefunction() {
	url=path+'/gongzhongZhanghaoController/updateGongzhongZhanghao.do';       
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
//关闭tab
function closeTab(){
	parent.centerTabs.tabs('close','公众账号管理');
}
$(function () {
	update_mode();
	
	$('#savelist1').linkbutton( {
		iconCls : 'icon-ok' 
	});
	$('#savelist2').linkbutton( {
		iconCls : 'icon-cancel' 
	});
});