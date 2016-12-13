<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	String path = request.getContextPath();
	String ywbh = request.getParameter("ywbh");
	//String ywbh = "123";
%>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0"/>
    <meta name="format-detection" content="telephone=no,email=no,date=no,address=no">
    <title>绿色加急通道</title>
    <link rel="stylesheet" type="text/css" href="../css/default.css" />
    <link rel="stylesheet" type="text/css" href="../css/aui.2.0.css" />
    <link rel="stylesheet" type="text/css" href="../css/commont.css" />
    <script type="text/javascript" src="../script/jquery-1.8.2.js"></script>
    <script type="text/javascript" src="../js/IDValidator.js"></script>
    <script type="text/javascript">
    	var ywbh = '<%=ywbh%>';
    	var path = '<%=path%>';
        function appendli()
        {
            var suibian =' <p class="p_bottom position">';
            suibian =suibian + '<input type="text" name="xxr" placeholder="请您输入偕行人身份证号" class="input_bor" maxlength="18"/>';
            suibian =suibian + '<a href="#this" onclick="deleteRow(this)" class="delete_box"><img src="../image/icon_close.png" alt="" width="22" height="22"  /></a>';
            suibian =suibian + '</p>';
            var len = $("#id_box .position").length;
            if(len<3){
                jQuery("#id_box").append(suibian);
            }
        }
        function deleteRow(cor){
            $(cor).parents(".position").remove();
        }
      	//新建普通实例
        var Validator = new IDValidator();
        function changeFun(value){
        	var i = Validator.isValid(value);
        	if(i==true){
        		alert("")
        	}
        }
        
        function addFun(){
        	var list = $("input[name=xxr]");
        	var xxr = "";
        	for(var i=0;i<list.length;i++){
        		if(list[i].value==""){
        			alert("请输入偕行人身份证号码");
        			return false;
        		}else{
        			xxr += list[i].value+",";	
        		}
            }
        	$.post(path+"/proscenium/crjlstdywinfoController/weixin/updateXxr.do",{"ywbh":ywbh,"xxr":xxr},function(data){
        		
        	});
        }
    </script>

</head>
<body>
  <div>
        <header id="header">
            <img src="../image/4_banner.jpg" alt="" width="100%" />
        </header>
      <section style="min-height: 240px;">
        <div class="add_xxr_box" >
            <div id="id_box">
                <p class="tip_text">＊最多添加3个偕行人。</p>
                <p class="p_bottom position"><input type="text" name="xxr" placeholder="请您输入偕行人身份证号" maxlength="18" class="input_bor" onchange="changeFun(this.value)"/> </p>
            </div>
            <p class="add_btn" onclick="appendli();"><img src="../image/upload_btn.jpg" alt="" width="50" height="50"/></p>
        </div>
      </section>
      <div class="aui-content-padded " style="width: 80%; margin: 0 auto!important;">
          <p class="padding_top"><div class="aui-btn aui-btn-blue aui-btn-block"  onclick="addFun()">确定添加</div></p>
          <p class="padding_top m_top" style='margin-bottom: 10px;'><div class="aui-btn aui-btn-blue1 aui-btn-block">跳过</div></p>
      </div>
    </div>
</body>
</html>