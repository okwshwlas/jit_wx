function smrz(sjhm,gmsfhm,xm,openid1){
	var token = getCookie('token');
	var openid1 = openid1;
	setCookie("openid",openid1);
	var openid = getCookie('openid');
	var guid='';
	var url = basePath+'/crj/wxqz/getZhuCe.do'
		$.ajax({
			url : url,
			data : {
				"token": token,
				"userName" :sjhm,
//				"userCode" :'',
//				"guid" :'',
				"usertype" : '1'
				},
		    async:false,
			type : "post",
			dataType : 'json',
			success : function(data) {
				var obj =data.data;
				if(obj !=null){
					var code = obj.code;
					var date =obj.data[0];
					var succ = obj.succ;
					if(code == '100001'){
						guid= date.guid;
						//进行实名认证
						var smurl = basePath+'/crj/wxqz/smrzSave.do'
						$.ajax({
							url : smurl,
							data : {
								"token": token,
								"gmsfhm" :gmsfhm,
								"guid" :guid,
								"xm" : xm
								},
						    async:false,
							type : "post",
							dataType : 'json',
							success : function(data) {
								
								var code = data.data.code;
								var msg = data.data.msg;
								var hjszd = '220000';
								if(code =='100001'){
									 alert(msg+',稍后请查看实名认证结果');
					            		location = 'login.jsp?openid='+openid1;
					}else{
						alert('实名认证出错!请重新点击认证');
						
						 
					}
							}
				
			});
					}
				}
				else{
					
					
					alert('获取人员信息出错请重新进入');
					
					
				}
			}
	});
					
	
}
function findSjhmByOpenid(openid){
	
	var sjhm='';
	$.ajax({
		url :"http://221.8.52.247:8445/jit_crj/crj/WxRy/findWxryxx.do",
		data : {
			"openid":openid
		},
		type : "post",
		dataType:"JSON",
		async:false,
		success:function(data) {
			var flag = data.flag;
			if(flag == '1'){
				sjhm = data.sjhm;
			}else if(flag == '2'){
				sjhmget = data.wxryxx.sjhm;
				sjhm = sjhmget;
			}
			
		}
	});
	
	return sjhm;


}

	
	
	
	
	
