function bdryxx(openid,sjhm){
	var result ='';

	var url = 'http://221.8.52.247:8445/jit_crj/crj/WxRy/WxryxxSave.do';
		$.ajax({
			url : url,
			data : {
				"openid": openid,
				"sjhm" :sjhm
				},
		    async:false,
			type : "post",
			dataType : 'json',
			success : function(data) {
				var flag = data.flag;
				if(flag =='1'){
					alert('绑定出入境微信成功,未检测到您在大平台进行过注册，请先进行注册并实名认证');
					location = "zhuce.jsp?sjhm="+sjhm;
					
				}else{
					
					alert('绑定出入境微信失败,请重新进行绑定');
					
				}
//			

			}
	});
	
}

	
	
	
	
	
