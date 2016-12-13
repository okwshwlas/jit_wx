<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="/WEB-INF/tld/c.tld" prefix="c"%>
<%
	String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
    //微信用户唯一标识
    //String openid = request.getParameter("openid");
    String openid = "123456";
%>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0"/>
<script type="text/javascript">
var path= '<%=path%>';
var openid='<%=openid%>';
var basePath='<%=basePath%>';
</script>

<link href="<%=basePath%>/jsp/proscenium/lib/style/default.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="<%=basePath%>/jsp/proscenium/lib/style/index3.css">
<link rel="stylesheet" href="<%=basePath%>/jsp/proscenium/lib/Validform_v5.3.2/demo/css/style.css" type="text/css" media="all" />
<script type="text/javascript" src="<%=basePath%>/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/jsp/proscenium/lib/Validform_v5.3.2/demo/js/Validform_v5.3.2.js"></script>
<script type="text/javascript" src="<%=basePath%>/jsp/proscenium/lib/layer-v2.1/layer/layer.js"></script>
<!-- 短信验证js -->
<script type="text/javascript" src="js/duanxin.js"></script>
<script type="text/javascript">
//表单验证
var url = "";
$(function() {
	$("#loginform").Validform({
		tiptype:function(msg,o,cssctl){
			//自定义提示
			//msg：提示信息;
			//o:{obj:*,type:*,curform:*}, obj指向的是当前验证的表单元素（或表单对象），type指示提示的状态，值为1、2、3、4， 1：正在检测/提交数据，2：通过验证，3：验证失败，4：提示ignore状态, curform为当前form对象;
			//cssctl:内置的提示信息样式控制函数，该函数需传入两个参数：显示提示信息的对象 和 当前提示的状态（既形参o中的type）;
			if(!o.obj.is("form")){//验证表单元素时o.obj为该表单元素，全部验证通过提交表单时o.obj为该表单对象;
				var objtip=o.obj.siblings(".Validform_checktip");
				cssctl(objtip,o.type);
				objtip.text(msg);
			}
		},
		url:path + '/proscenium/crjRyjbxxController/vailidLogin.do',
		ajaxPost:true,
		callback:function(data){
			if(data.code=="1"){
				//信息不匹配 
				parent.layer.msg(data.msg,{icon:2,time:2000});
			}else if(data.code=="0"){
				//登录成功调到首页
				parent.layer.msg(data.msg,{icon:1,time:2000});
				window.location.href="main.jsp?idcard="+$("#idcard").val();
			}else if(data.code=="2"){
				parent.layer.msg(data.msg,{icon:1,time:2000});
				window.location.href="complete_regist.jsp";
				//跳转到信息补全页
			}
		},
		datatype:{
			"idcard":function(gets,obj,curform,datatype){
				var Wi = [ 7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2, 1 ];// 加权因子;
				var ValideCode = [ 1, 0, 10, 9, 8, 7, 6, 5, 4, 3, 2 ];// 身份证验证位值，10代表X;
				if (gets.length == 15) {   
					return isValidityBrithBy15IdCard(gets);   
				}else if (gets.length == 18){   
					var a_idCard = gets.split("");// 得到身份证数组   
					if (isValidityBrithBy18IdCard(gets)&&isTrueValidateCodeBy18IdCard(a_idCard)) {   
						return true;   
					}   
					return false;
				}
				return false;
				
				function isTrueValidateCodeBy18IdCard(a_idCard) {   
					var sum = 0; // 声明加权求和变量   
					if (a_idCard[17].toLowerCase() == 'x') {   
						a_idCard[17] = 10;// 将最后位为x的验证码替换为10方便后续操作   
					}   
					for ( var i = 0; i < 17; i++) {   
						sum += Wi[i] * a_idCard[i];// 加权求和   
					}   
					valCodePosition = sum % 11;// 得到验证码所位置   
					if (a_idCard[17] == ValideCode[valCodePosition]) {   
						return true;   
					}
					return false;   
				}
				
				function isValidityBrithBy18IdCard(idCard18){   
					var year = idCard18.substring(6,10);   
					var month = idCard18.substring(10,12);   
					var day = idCard18.substring(12,14);   
					var temp_date = new Date(year,parseFloat(month)-1,parseFloat(day));   
					// 这里用getFullYear()获取年份，避免千年虫问题   
					if(temp_date.getFullYear()!=parseFloat(year) || temp_date.getMonth()!=parseFloat(month)-1 || temp_date.getDate()!=parseFloat(day)){   
						return false;   
					}
					return true;   
				}
				
				function isValidityBrithBy15IdCard(idCard15){   
					var year =  idCard15.substring(6,8);   
					var month = idCard15.substring(8,10);   
					var day = idCard15.substring(10,12);
					var temp_date = new Date(year,parseFloat(month)-1,parseFloat(day));   
					// 对于老身份证中的你年龄则不需考虑千年虫问题而使用getYear()方法   
					if(temp_date.getYear()!=parseFloat(year) || temp_date.getMonth()!=parseFloat(month)-1 || temp_date.getDate()!=parseFloat(day)){   
						return false;   
					}
					return true;
				}
				
			}
			
		}
	});
});

</script>
</head>
<!-- <body>
          <form action="" method="post" id="loginform">
            <table width="100%">
                <tr>
                    <td>
                                                              身份证：
                    </td>
                    <td>
                    <input type="text" value="" name="idcard" class="inputxt"  datatype="idcard"  errormsg="身份证格式不正确" />
                    <div class="Validform_checktip"></div>
                    </td>
                </tr>
                <tr>
                    <td>
                                                              手机号：
                    </td>
                    <td>
                    <input type="text" value="" name="phonenum"  class="inputxt" datatype="m"  errormsg="电话号格式不正确"/>
                    <div class="Validform_checktip"></div>
                    </td>
                </tr>
                <tr>
                    <td>
                                                             验证码：
                    </td>
                    <td>
                    <input type="text" value="" name="code" class="inputxt" datatype="*"/>
                    <div class="Validform_checktip"></div>
                    </td>
                </tr>
                <tr>
                    
                    <td>
                        <input type="submit" value="提 交" /> 
                    </td>
                </tr>
            </table>
        </form>
</body>
</html> -->

<body>
	<div class="bj">
		<!-- logo -->
		<div class="logo1box" ><img style="margin-top:10px;" src="<%=basePath%>/jsp/proscenium/lib/image/images/logo01.png"></div>
		<div class="logo2box"><img src="<%=basePath%>/jsp/proscenium/lib/image/images/logo02.png"></div>
		<form action="" method="post" id="loginform">
			<!--身份证号-->
			<div class="yonghuming" >
				<input type="text"  id="idcard" name="idcard" value="" datatype="idcard"  errormsg="身份证格式不正确" placeholder="身份证号" class="shurukuang" >
				<div class="Validform_checktip"></div>
			</div>
			<!--手机号-->
			<div class="shoujihao">
 				<input type="text" id="phone" name="phonenum" value="" datatype="m"  errormsg="手机号格式不正确" placeholder="手机号" class="shurukuang">
				<div class="Validform_checktip"></div>
			</div>

			<!--验证码-->
			<div style="width:92%;height:50px;">
	            <div class="yanzhengbox" style="float:left">
	               <input id="code" name="code" class="yanzheng" placeholder="验证码">
	            </div>
	            <div style="float:left; width:30%; margin-top:14px;">
	            	<input class="huoqu" type="button" value="获取" onclick="settime(this)" >
	            </div>
			</div>
			<!--登录-->
			<div class="loginbox"  >
				<input type="submit" value="登录" class="login" >
			</div>
		</form>
	</div>
</body>
</html>



