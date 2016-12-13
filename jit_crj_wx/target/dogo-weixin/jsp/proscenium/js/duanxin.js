	var code = "";
	//短信验证码
	function sendCode(){
		var phone = $("#phone").val();
		$.ajax({
	        url: basePath+"/proscenium/sendCodeCommon/sendCodeCommon.do",
	        data:{
	       	  "phone" : phone
	          },
	        type: "post",
	        dataType : 'json',
	        success: function(data) {
	        	if (data.code == "000001") {
	        		countdown = 0;
		       	 	alert("发送失败！请重新发送");
	        	} else {
	        		code = data.code;
	        	}
	        },
	        error:function(){
	        	countdown = 0;
	       	 	alert("发送失败！请重新发送");
	        } 
	    });
	}
	
	// 短信验证
	function duanxinValidate(){
		if($("#code").val() == ""){
			return "验证码不能为空！";
		} else {
			if(code != $("#code").val()) {
				return "验证码不正确！";
			} else {
				return "1";
			}
		}
	}
	
	var countdown = 60; 
	function settime(obj) {
		var phone = $("#phone").val();
		if (phone == "") {
			alert('请输入手机号码！'); 
	        return false; 
		}
	    var result = isPhoneNum();
	    if(result){
	    	if(countdown == 60){
				sendCode();
			}
		    if (countdown == 0) { 
		        obj.removeAttribute("disabled");    
		        obj.value="获取验证码"; 
		        countdown = 60;
		        //code = "";
		        return;
		    } else { 
		        obj.setAttribute("disabled", true); 
		        obj.value = countdown + "s";
		        countdown--; 
		    } 
			setTimeout(function() {
			    settime(obj);
			} ,1000);
	    }
	}
	
	//校验手机号是否合法
	function isPhoneNum(){
		var phone = $("#phone").val();
	    var myreg = /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1}))+\d{8})$/; 
	    if(!myreg.test(phone)){ 
	        alert('请输入有效的手机号码！'); 
	        return false; 
	    }else{
	        return true;
	    }
	}
