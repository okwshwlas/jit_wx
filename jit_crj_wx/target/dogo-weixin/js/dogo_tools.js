/**
 * 获取机构树（下拉列表）
 * @param id 	控件ID
 * @param path	项目路径
 * @param morenzhi 默认值
 * @return
 */
function getJigouTree(id,path,morenzhi){
	$.ajax({
		url: path+'/organizationController/selectJigouTree.do',
		async:false,
		type : 'post',
		//data:{'type':type},
		dataType : 'json',
		success : function(data){
			$('#'+id).combotree({  
				onlyLeafCheck : "true",
				editable:false,
				onBeforeSelect:function(node){//节点选中前触发事件
					//当选中节点不是叶子节点时取消操作
					if(!$('#'+id).tree('isLeaf', node.target)){
						return false;
					}
				},
				 data:eval("("+data.tree+")")

			});
			if(morenzhi!=null&&morenzhi!=""){
				if(morenzhi.indexOf(",")!=-1){
					$('#'+id).combotree('setValues', morenzhi.split(","));
				}else{
					$('#'+id).combotree('setValue', morenzhi);
				}
			}
		}
	});

};
/**
 * 加载人员属性树
 * @param id
 * @param path
 * @param morenzhi
 */
function getAttributeTree(id,path,morenzhi){
	$.ajax({
		url: path+'/personnelAttributeController/selectAttributeTree.do',
		async:false,
		type : 'post',
		//data:{'type':type},
		dataType : 'json',
		success : function(data){
			$('#'+id).combotree({  
				onlyLeafCheck : "true",
				editable:false,
				multiple : true,
				onBeforeSelect:function(node){//节点选中前触发事件
					//当选中节点不是叶子节点时取消操作
					if(!$('#'+id).tree('isLeaf', node.target)){
						return false;
					}
				},
				 data:eval("("+data.tree+")")

			});
			if(morenzhi!=null&&morenzhi!=""){
				if(morenzhi.indexOf(",")!=-1){
					$('#'+id).combotree('setValues', morenzhi.split(","));
				}else{
					$('#'+id).combotree('setValue', morenzhi);
				}
			}
		}
	});

};

