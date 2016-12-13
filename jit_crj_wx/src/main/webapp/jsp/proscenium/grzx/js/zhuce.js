function checkZhuce(sjhm,token){
	var result ='';

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
//				var myArray=new Array(data.data.data);
				
				var obj =data.data;
				if(obj !=null){
					var code = obj.code;
					var succ = obj.succ;
					if(code == '100001'){
						var date =obj.data[0];
						result = date;
					}else{
						result = false;
						 
					}
				}else{
					
					result = false;
					
				}
			}
	});
	return result;
	
}
function zhuCeSave(mobile,password){
	var token = getCookie('token');
	var url = basePath+'/crj/wxqz/zhuCeSave.do';
	var result;
	$.ajax({
		url : url,
		data : {
			"token":token,
			"mobile": mobile,
			"userType" :'1',
			"passwd" :password,
			"src" : '2'
			},
	    async:false,
		type : "post",
		dataType : 'json',
		success : function(data) {
			var obj =data.data;
			var code = obj.code;
			if(obj !=null){
				if(code == '100001'){
					alert('注册成功');
					location = 'renzheng.jsp?sjhm='+mobile+'openid='+openid;
				}
				else if(code == '100002'){
					alert=('缺少用户认证信息');
				}
				else if(code == '100003'){
					alert('用户已经注册请更换手机号码重新注册');
				}else{
					alert('用户注册失败');
					
				}
				
				
//				var date =obj.data[0];
				var succ = obj.succ;
				if(code == '100001'){
					result = date;
					alert(result);
				}else{
					result = succ;
					 
				}
			}else{
				
				alert('注册失败请重新注册');
				
				
			}
		}
});
}
function findzhucexx(openid){
	var token = getCookie('token');
	var sjhm='';
	var result;
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
				//没有身份证号码查询是都认证通过 如果认证通过把身份证号码维护到人员信息中
				
				result = checkZhuce(sjhm,token);
				
				if(result != false){
					var sfzh = result.idCard;
					$.ajax({
						url :"http://221.8.52.247:8445/jit_crj/crj/WxRy/WxryxxUpdate.do",
						data : {
							"openid":openid,
							"sfzh":sfzh
						},
						type : "post",
						dataType:"JSON",
						async:false,
						success:function(data) {
							
							
						}
					});
					
					
					
					
				}
				
				
			}else if(flag == '2'){
				sjhmget = data.wxryxx.sjhm;
				sjhm = sjhmget;
				result = checkZhuce(sjhm,token);
//				var url = basePath+'/crj/wxqz/getZhuCe.do'
//				$.ajax({
//					url : url,
//					data : {
//						"token": token,
//						"userName" :sjhm,
////						"userCode" :'',
////						"guid" :'',
//						"usertype" : '1'
//						},
//				    async:false,
//					type : "post",
//					dataType : 'json',
//					success : function(data) {
////						var myArray=new Array(data.data.data);
//						
//						var obj =data.data;
//						
//						if(obj !=null){
//							
//							
//							var date =obj.data[0];
//							var code = obj.code;
//							var succ = obj.succ;
//							
//							if(code == '100001'){
//								result = date;
//							}else{
//								result = succ;
//								 
//							}
//						}else{
//							
//							result = false;
//							
//						}
//					}
//			});
		
			}else{
				
				alert('系统检测到您还没有注册请先注册和认证');
				location = 'zhuce.jsp';
				
			}
			
		}
	});
	
	//根据注册的手机号码查询人员信息 已认证的把sfzh信息update到人员信息中，未通过的提供重新实名认证接口
	return result;
	
	
	
}
function setString(str, len,strlen) {  
    var strlen = 0;  
    var s = "";  
    var nums="";
    for (var i = 0; i < str.length; i++) {  
        if (str.charCodeAt(i) > 128) {  
            strlen += 2;  
        } else {  
            strlen++;  
        }  
        s += str.charAt(i);  
        if (strlen >= len) { 
        	for (var j =0;j<strlen;j++)
        		{
        		nums +="*";
        		
        		}
            return s+nums;  
        }  
    }  
    return s;  
}  
	
	
	
	
