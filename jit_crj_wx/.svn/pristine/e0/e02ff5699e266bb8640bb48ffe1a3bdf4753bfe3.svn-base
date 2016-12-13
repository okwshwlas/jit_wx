// 定义搜索的jqgrid的对象列表
var ids = [{
			gid : 'org'
		}, {
			gid : 'orgflex',// jqgrid的ID
			tid : 'title',// tab的内容div的ID
			fid : 'strform'// grid上方form的高度
		}];

window.onresize = function() {
	for (var index = 0; index < ids.length; index++) {
		var obj = ids[index];
		var grid = $('#' + obj['gid']);
		if (grid.length > 0) {// 说明是本页的jqgrid
			grid.setGridWidth($(window).width() - 5);
			if (obj['tid']) {// 说明是带form的新增页
				setTimeout(function() {
							resetHeight(obj['tid'], obj['fid'], grid)
						}, 1000);// 直接改变高度的话form和tab里的div高度还没有改变
			} else {// 说明是带查询的列表页
				grid.setGridHeight($(window).height() - 155);
			}
			break;
		}
	}
};

function resetHeight(tid, fid, grid) {// 重新设定表格高度，避免上面的form表单出现垂直滚动条
	var t = $("#" + tid);
	if (t.length > 0) {
		var h = t.height() - 130;
		var f = $("#" + fid);
		if (f.length > 0) {
			h = h - f.height();
		}
		grid.setGridHeight(h);
	}
}

function getCode() {// 获取唯一标识
	var code = '';
	$.ajax({
				url : 'scBaseAction!code.action',
				cache : false,
				async : false,
				success : function(data) {
//			alert(data); 如果action返回的json 根指定为obj,那么直接接收data,data则代表obj
					code = data.obj;
//					alert(data.o);
				},
				error : function() {
					$.messager.show({
								msg : '获取唯一标识失败，服务无法连接',
								title : '提示'
							});
				}
			});
	return code;
}