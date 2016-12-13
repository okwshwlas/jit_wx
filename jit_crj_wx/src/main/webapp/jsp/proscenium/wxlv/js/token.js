function getToken(){

	var appId ='100081';
	var secrectKey ='KbaHD6Rrs9DVr3mXs';
	var result;
	var url = basePath+'/crj/wxqz/getToken.do';
		$.ajax({
			url : url,
			data : {
				
				},
		    async:false,
			type : "post",
			dataType : 'json',
			success : function(data) {
				data =data.data;
				var code =data.code;
				var data_data = data.data;
				var succ = data.succ;
//				var succ = data.succ;
				if(code == '140100'){
					result = data_data;
				}else{
					result = succ;
					 
				}
			}
	});
		return result;
	
}
function tokenTime(token){
	
	
	var url = basePath+'/crj/wxqz/getTokenTime.do';
		$.ajax({
			url : url,
			data : {
				"token" :token
				},
		    async:false,
			type : "get",
			dataType : 'json',
			success : function(data) {
				var code = data.code;
				var data_data = data.data;
				var succ = data.succ;
				var succ = data.succ;
				if(code == '140600'){
					return data_data;
				
					
				}else{
				 return succ;
					 
				}
			}
	});
	
	
	
	
	
	
}
	
	
	
	
	
