
/**
 * 用户名密码验证
 * @param USERCODE
 * @param USERPWD
 * @returns {Boolean}
 */
function loginCheck(USERCODE, USERPWD) {
	if (USERCODE == "") {
		alert("用户名不能为空");
		return false;
	}
	if (USERPWD == "") {
		alert("密码不能为空");
		return false;
	}
	return true;
}
/**
 * 表单提交
 */
function form_submit() {
	var USERCODE = document.getElementById("USERCODE").value;
	var USERPWD = document.getElementById("USERPWD").value;
	
	if (loginCheck(USERCODE, USERPWD)) {
		$.ajax( {
			url : basePath + "userControl/loginVal.do",
			async : false,
			data : {
				'usercode' : USERCODE,
				'userpwd' : USERPWD
			},
			dataType : 'json',
			success : function(msg) {
				if (msg == 0) {
					alert("用户名或密码错误");
				} else {
					var loginform = document.getElementById("loginform");
					loginform.action = basePath
							+ "userControl/loginBackstage.do";
					loginform.submit();
				}
			},
			error : function(XMLHttpRequest, textStatus, errorThrown) {
				alert("链接超时");
			}
		});
	}

	// $('#loginform').form({
	// url:basePath+"UserControl/queryUserOrPassword.do",
	// onSubmit:function(){
	// return loginCheck();
	// },
	// success:function(data){
	// alert(data);
	// alert(111);
	// $('#loginform').submit();
	// }
	// });

}
function certLogin() {
	document.location.href = basePath + "jsp/main/login.jsp";
}