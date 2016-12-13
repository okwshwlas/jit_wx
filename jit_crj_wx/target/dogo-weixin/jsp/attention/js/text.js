




$(function(){
	
	$.ajax({
		url: path+'/huanyingController/selectHuanyingById.do',
		async:false,
		data:{
			'id':'1'
		},
		type : 'post',
		dataType : 'json',
		success : function(data){
			
			$("#neirong").val(data.neirong);
			$("#id").val(data.id);
			$("input[name='status'][value="+data.status+"]").attr("checked",true); 
			$('#fm').form('validate'); 
		}
	});
	
});



function saveHuanying(){
	
	$('#fm').form('submit',{   
		url: path+'/huanyingController/updateHuanyingById.do',
	    onSubmit: function(){   
		//return $(this).form('validate');  
	        //进行表单验证   
	        //如果返回false阻止提交   
	    },   
	    success:function(data){  
	    	var data = eval('('+data+')');
	    	if (true == data.success) {
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
	       // $('#showMessage').dialog('close');
	       // $('#org').datagrid('reload');
	    }   
	});
	
	
}



function qiehuan(){
	
	
	window.location.href='imagetext.jsp';
}









$(function() {
	
	$('#qiehuanButton').linkbutton( {
		iconCls : 'icon-add'
	});
	$('#savelist').linkbutton( {
		iconCls : 'icon-ok' 
	});
	$('#cancellist').linkbutton( {
		iconCls : 'icon-cancel' 
	});
});