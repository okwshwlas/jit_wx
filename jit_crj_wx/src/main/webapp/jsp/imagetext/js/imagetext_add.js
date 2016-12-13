var id;
$(function() {
	$.ajax({
		url: path+'/tuwenControl/addTuwen.do',
		async:true,
		type : 'post',
		dataType : 'json',
		success : function(data){
			$("#id").val(data);
			 url= path+'/tuwenControl/selectAllKeywordsNotpage.do';
			    //获取下拉列表的值
			    $('#keyword').combobox({  
					url:url,
				    valueField:'id',   
				    textField:'context',
				    editable:false,
				  //列表改变事件
				    onSelect:function(record){
			    	//$.messager.alert('提示:',record.id);
				    var tuwenid = $("#id").val();
			    	$.ajax({
						url: path+'/tuwenControl/selectisNotkeyword.do',
						async:true,
						data:{
			    		'keyword_id':record.id,
			    		'tuwenid':tuwenid
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
			
		}
	});
});

function saveparent(){
	var title = $("#title").val();
	var miaoshu = $("#miaoshu").val();
	var url1 = $("#url").val();
	var neirong =editor1.html(); 
	var keyword = $("#keyword").combobox('getValue');
	if(keyword==''||keyword=='---请选择---'){
		$.messager.show({msg : '您需要选择一个关键词！',title : '提示'});
	    return;
    }
	if(title==''){
		$.messager.show( {msg : '标题不能为空！',title : '提示'});
		return;
	}
	if(miaoshu==''){
		$.messager.show( {msg : '简介不能为空！',title : '提示'});
	    return;
    }
    if(url1==''){
    	$.messager.show( {msg : '请上传一张图文封面！',title : '提示'});
	    return;
    }
    
    /*if(editor1.isEmpty()&&link==''){
		$.messager.show( {
			msg : '链接地址和详细内容至少填写一项！',
			title : '提示'
		});
	return;
    }*/
	url = path + '/tuwenControl/insertTuwenParent.do';	
	$('#fm').form('submit',{   
	    url:url,
	    type : 'post',
		dataType : 'json',
		contentType: "application/x-www-form-urlencoded; charset=utf-8", 
	    onSubmit: function(){   
		return $(this).form('validate');  
	    },   
	    success:function(data){  
	    	var data = eval('(' + data + ')');
	    	if (true == data.success) {
	    		window.location.href='imagetext_list.jsp';
				$.messager.show({msg : "保存成功",title : '提示'});
				
			} else {
				$.messager.show({msg : "保存失败",title : '提示'
				});
			}
	        $('#showMessage').dialog('close');
	    }   
	});   
}


//暂时不用
function savechild(){
	var title2 = $("#title2").val();
	var url2 = $("#url2").val();
	var neirong2 = editor2.html();
	if(title2==''){
		$.messager.show( {msg : '标题不能为空！',title : '提示'});
		return;
	}
	
    if(url2==''){
    	$.messager.show( {msg : '请上传一张图文封面！',title : '提示'});
	return;
    }
    
 /*if(neirong2==''){
		
		$.messager.show( {
			msg : '详细内容不能为空！',
			title : '提示'
		});
	return;
    }*/
		$('#strform').form('submit',{   
		    url:url,
		    type : 'post',
			contentType: "application/x-www-form-urlencoded; charset=utf-8", 
		    onSubmit: function(){   
			//return $(this).form('validate');  
		    },   
		    success:function(data){  
		    		var json = eval('(' + data + ')'); 
		    		 //增加<tr/>
		    		if ($("tr[id='"+json.id+"']").length > 0){
		    			$($("tr[id='"+json.id+"']")).children('td').eq(1).html(json.title);
		    		}else {
		    			//$("tr[id='"+json.id+"']").remove();//删除当前行
			            var _len = $("#tab tr").length;        
			            $("#tab").append("<tr id="+json.id+" align='center'>"
			                               +"<td>"+_len+"</td>"
			                               +"<td>"+json.title+"</td>"
			                               +"<td><a href=\'#\' onclick=\"editchild('"+json.id+"')\">编辑</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href=\'#\' onclick=\"delchild('"+json.id+"')\">删除</a></td>"
			                            +"</tr>");   
		    			
		    		}
					$.messager.show({msg : "保存成功",title : '提示'});
		            $('#showMessage').dialog('close');
		    }   
		});   
}

function delchild(id){
	var parentId = $("#id").val();
	$.messager.confirm('提示', '确定删除该条数据吗?', function(r) {
		if (r) {
			$.post(path + '/tuwenControl/deletePatentId.do', {
				'id' : id,'parentId':parentId
			}, function(result) {
				var data = eval('(' + result + ')');
				if(true == data.success){
					$.messager.show({title: '提示',msg: '删除成功'});  
					$("tr[id='"+id+"']").remove();//删除当前行
					//重置下序号
					$('#tab tr').each(function(index,element){
						if(index!=0){
							$(this).children('td').eq(0).html(index);
						}
						
					});
				} else {
					$.messager.show({title : 'Error',msg : data.msg});
				}
			}, 'text');
		}
	});
}

function editchild(id){
	$.ajax({
		url: path+'/tuwenControl/selectParentTuwenById.do',
		async:true,
		type : 'post',
		dataType : 'json',
		data:{
			'id':id
		},
		success : function(data){
		$("#strform").form("clear");
		
		$("#showMessage").dialog("open").dialog('setTitle', '自动回复内容');
			$("#id2").val(data.id);
			$("#title2").val(data.title);
			editor2.html(data.neirong);
			editor2.sync(); 
			$("#parent_id2").val(data.parent_id);
			$('#img2').attr('height',100);
			$('#img2').attr('width',100);
			$('#img2').attr('src',path+data.url).css('visibility','visible');
			$("#url2").val(data.url);
			
		}
	});
	 url = path + '/tuwenControl/updateTuwenById.do';	//修改的地址
}

//图片上传
function uploadImage() {
    //判断是否有选择上传文件
        var imgPath = $("#file").val();
        if (imgPath == "") {
        	$.messager.alert('提示:','请选择上传图片！');
            return;
        }
        //判断上传文件的后缀名
        var strExtension = imgPath.substr(imgPath.lastIndexOf('.') + 1);
        if (strExtension != 'jpg' 
        && strExtension != 'png' ) {
        	$.messager.alert('提示:','图片格式不正确！只支持jpg或png');
            return;
        }
        $('#fm').form('submit',{   
    		url: path+'/fileUploadController/uploadImg.do',
    	    onSubmit: function(){   
    	    },   
    	    success:function(data){  
    	    	if ("fail" != data) {
    				$.messager.show({msg : "上传成功",title : '提示'});
    				$('#img').attr('height',100);
    				$('#img').attr('width',100);
    				data = data.substring(1,data.length-1);
    				$('#img').attr('src',path+data).css('visibility','visible');
    				$("#url").val(data);
    			} else {
    				$.messager.show({msg : "上传失败",title : '提示'
    						});
    			}
    	    }   
    	});
    }

//图片上传
function uploadImage2() {
    //判断是否有选择上传文件
        var imgPath = $("#file2").val();
        if (imgPath == "") {
        	$.messager.alert('提示:','请选择上传图片！');
            return;
        }
        //判断上传文件的后缀名
        var strExtension = imgPath.substr(imgPath.lastIndexOf('.') + 1);
        if (strExtension != 'jpg'&& strExtension != 'png' ) {
        	$.messager.alert('提示:','图片格式不正确！只支持jpg或png');
            return;
        }
        $('#strform').form('submit',{   
    		url: path+'/fileUploadController/uploadImg.do',
    	    onSubmit: function(){   
    	    },   
    	    success:function(data){  
    	    	if ("fail" != data) {
    				$.messager.show({msg : "上传成功",title : '提示'});
    				$('#img2').attr('height',100);
    				$('#img2').attr('width',100);
    				$('#img2').attr('src',path+data).css('visibility','visible');
    				$("#url2").val(data);
    			} else {
    				$.messager.show({msg : "上传失败",title : '提示'});
    			}
    	    }   
    	});
    }

function OpenFrame() {
	id = $("#id").val();
    $("#parent_id2").val(id);
    $('#if1').attr('src','imagetext_child.jsp');
	$("#showChild").dialog("open").dialog('setTitle', '选择多图文');


}
//点击弹出新增图文的弹窗
function toAddTuwen(){
	 $('#if2').attr('src',path+'/jsp/imagetext/imagetext_dialog.jsp');
	 $("#showList").dialog("open").dialog('setTitle', '新增图文');
	 $("#showList").dialog('move',{left:30,top:40}); 
}
//关闭新增图文的弹窗
function closeDialog(){
	$('#showList').dialog('close');
}
//关闭新增图文的弹窗并刷新子图文列表
function closeDialogAndReload(){
	$('#showList').dialog('close');
	if1.window.reloadList();//刷新子图文列表
	$.messager.show({
		msg : "保存成功",
		title : '提示'
	});
}
function addchild(){
	var _len = $("#tab tr").length;  
	if(_len>9){
		$.messager.show({
			msg : "添加多图文最多为9条",
			title : '提示'
		});
		return;
	}
	$("#strform").form("clear");
	$('#img2').css('visibility','hidden');
	editor2.html(""); 
	$("#showMessage").dialog("open").dialog('setTitle', '自动回复内容');
	
    var id = $("#id").val();
    $("#parent_id2").val(id);
    url = path + '/tuwenControl/insertTuwenChild.do';
    
}

function del_child(id){
	$("tr[id='"+id+"']").remove();//删除当前行
	//重置行序号
	$('#tab tr').each(function(index,element){
		if(index!=0){
			$(this).children('td').eq(0).html(index)
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
//关闭对话框
function cancel(){
	$('#showMessage').dialog('close');
}


$(function() {
	
	$('#qiehuanButton').linkbutton( {
		iconCls : 'icon-add'
	});
	$('#savelist').linkbutton( {
		iconCls : 'icon-add' 
	});
	$('#savelist1').linkbutton( {
		iconCls : 'icon-ok' 
	});
	
	$('#savelist2').linkbutton( {
		iconCls : 'icon-ok' 
	});
	$('#cancellist2').linkbutton( {
		iconCls : 'icon-cancel' 
	});
	
	
});
