<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="/WEB-INF/tld/c.tld" prefix="c"%>
<%
	String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
%>        
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
var path= '<%=path%>';
</script>
<link rel="stylesheet" href="<%=basePath%>/jsp/proscenium/lib/Validform_v5.3.2/demo/css/style.css" type="text/css" media="all" />
<script type="text/javascript" src="<%=basePath%>/js/jquery.1.8.2.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/jsp/proscenium/lib/Validform_v5.3.2/demo/js/Validform_v5.3.2.js"></script>
<script type="text/javascript" src="<%=basePath%>/jsp/proscenium/lib/layer-v2.1/layer/layer.js"></script>

<script type="text/javascript">

var url = "";
$(function() {
	$("#loginform").Validform({
		url:'',
		ajaxPost:true,
		callback:function(data){
			if(data.code=="1"){
				//信息补全失败
				parent.layer.msg(data.msg,{icon:2,time:2000});
			}else if(data.code=="0"){
				//登录成功调到首页
				parent.layer.msg(data.msg,{icon:1,time:2000});
				window.location.href="main.jsp";
			}
		},
		datatype:{
			"z1-4" : /^[\u4E00-\u9FA5\uf900-\ufa2d]{1,4}$/
		},
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
	});
});


//获取拼音姓
function getPinyinX(obj){
	
	if(obj.value!=null&&obj.value!=""){
		if(ckChinese(obj.value)){
			$.ajax({
		        url: path+"/proscenium/pinyinCommonController/getPinyin.do",
		        data:{
		       	  "name" : obj.value
		          },
		        type: "post",
		      	dateType:"json",
		        success: function(data) {
		        	var data=eval('('+data+')');
		        	//成功
		        	if(data.code="0"){
		        		if(data.msg.split(",").length>1){
			        		var str = "<div style=\"padding:20px;\">该汉字为多音字，请选择<p>";
			        		for (var int = 0; int < data.msg.split(",").length; int++) {
								str+="<input type=button value="+data.msg.split(",")[int]+" onclick=\"checkname(this,'pyX')\">"
							}
			        		str+="</div>";
			        		layer.open({
			        	        type: 1,
			        	        area: ['200px', '250px'],
			        	        //offset: ['100px', '800px'],
			        	        closeBtn:0,
			        	       // move: true,
			        	        content: str
			        	    });
			        	}else{
			        		$("#pyX").val(data.msg);	
			        	}
		        	}else {
		        		//失败
		        		parent.layer.msg(data.msg,{icon:2,time:2000});
		        	}
		        	
		        }
		    });
		}
	}else{
		$("#pyX").val("");
	}
}
	
//获取拼音名
function getPinyinM(obj){
	if(obj.value!=null&&obj.value!=""){
		if(ckChinese(obj.value)){
			$.ajax({
		        url: path+"/proscenium/pinyinCommonController/getPinyin.do",
		        data:{
		       	  "name" : obj.value
		          },
		        type: "post",
		      	dateType:"json",
		        success: function(data) {
		        	var data=eval('('+data+')');
		        	if(data.code=="0"){
		        		//成功
		        		if(data.msg.split(",").length>1){
			        		var str = "<div style=\"padding:20px;\">该汉字为多音字，请选择<p>";
			        		for (var int = 0; int < data.msg.split(",").length; int++) {
								str+="<input type=button value="+data.msg.split(",")[int]+" onclick=\"checkname(this,'pyM')\">"
							}
			        		str+="</div>";
			        		layer.open({
			        	        type: 1,
			        	        area: ['200px', '250px'],
			        	        //offset: ['100px', '800px'],
			        	        closeBtn:0,//是否有关闭按钮
			        	        //move: true,
			        	        content: str
			        	    });
			        	}else{
			        		$("#pyM").val(data.msg);	
			        	}
		        	}else {
		        		//失败
		        		parent.layer.msg(data.msg,{icon:2,time:2000});
		        	}
		        	
		        	
		        }
		    });
		}
	}else{
		$("#pyM").val("");
	}
}


//验证是否是汉字
function ckChinese(str){
	var reg=/^[\u4E00-\u9FA5]+$/; 
    if (reg.test(str)==true){
       return true;
    }else{
       return false;
    }
}

//选择多音的拼音
function checkname(obj,id){
	$("#"+id).val(obj.value);
	layer.closeAll();
	
}

</script>

</head>
<body>
<form action="" method="post" id="loginform">
            请补全信息
            <table width="100%">
                <tr>
                    <td>
                                                                 姓：<input type="text" value="" id="x" name="x" class="inputxt"  datatype="z1-4"  errormsg="中文名为1~4个中文字符！" onchange="getPinyinX(this)"/>
                     <div class="Validform_checktip"></div>                                       
                    </td>
                </tr>
                <tr>
                    <td>
                                                              名：<input type="text" value="" id="m" name="m"  class="inputxt" datatype="z1-4"  errormsg="中文名为1~4个中文字符！" onchange="getPinyinM(this)"/>
                    <div class="Validform_checktip"></div>
                    </td>
                </tr>
                <tr>
                    <td>
                                                            拼音姓：<input type="text" value="" id="pyX" name="pyX" class="inputxt" datatype="*"/>
                    <div class="Validform_checktip"></div>                                  
                   </td>
                </tr>
                <tr>
                    <td>
                                                           拼音名：<input type="text" value="" id="pyM" name="pyM" class="inputxt" datatype="*"/>
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
</html>