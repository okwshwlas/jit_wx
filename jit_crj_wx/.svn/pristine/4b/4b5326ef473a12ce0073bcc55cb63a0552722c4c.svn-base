<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	String path = request.getContextPath();
	String ywbh = request.getParameter("ywbh");
%>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0"/>
    <meta name="format-detection" content="telephone=no,email=no,date=no,address=no">
    <title>绿色加急通道</title>
    <script type="text/javascript" src="../js/jquery.1.8.2.min.js"></script>
    <link rel="stylesheet" type="text/css" href="../css/default.css" />
    <link rel="stylesheet" type="text/css" href="../css/commont.css" />
    <link rel="stylesheet" type="text/css" href="../css/aui.2.0.css" />
    <style>
        .aui-list::after { background-color: #fff;}
        .aui-list .aui-list-item::after{ background-color: #fff;}
        .aui-list::before{ background-color: #fff;}
        .aui-card-list-header { font-size: 0.7rem; color: #626262;}
    </style>
    <script type="text/javascript" >
	    Date.prototype.format = function(format) {
	        var date = {
	               "M+": this.getMonth() + 1,
	               "d+": this.getDate(),
	               "h+": this.getHours(),
	               "m+": this.getMinutes(),
	               "s+": this.getSeconds(),
	               "q+": Math.floor((this.getMonth() + 3) / 3),
	               "S+": this.getMilliseconds()
	        };
	        if (/(y+)/i.test(format)) {
	               format = format.replace(RegExp.$1, (this.getFullYear() + '').substr(4 - RegExp.$1.length));
	        }
	        for (var k in date) {
	               if (new RegExp("(" + k + ")").test(format)) {
	                      format = format.replace(RegExp.$1, RegExp.$1.length == 1
	                             ? date[k] : ("00" + date[k]).substr(("" + date[k]).length));
	               }
	        }
	        return format;
	 	}
  	    $(document).ready(function(){
  	    	var ywbh = '<%=ywbh%>';
  	    	var path= '<%=path%>';
  	    	$.post(path+"/proscenium/crjlstdywinfoController/weixin/selectByYwbh.do",{"ywbh":ywbh},function(data){
  	    		data = $.parseJSON(data);
  	    		var data = data.obj;
  	    		var d = new Date(data.createDate).format('yyyy-MM-dd');
  	    		if(data.ywType=="1"){
  	    			var lb = '<p style="width: 90%; margin: 0 auto; line-height: 28px;">您于'+d+'提交的加急旅游签注（出国奔丧）';
  	    		}else if(data.ywType=="2"){
  	    			var lb = '<p style="width: 90%; margin: 0 auto; line-height: 28px;">您于'+d+'提交的加急旅游签注（出国探望危重病人）';
  	    		}else if(data.ywType=="3"){
  	    			var lb = '<p style="width: 90%; margin: 0 auto; line-height: 28px;">您于'+d+'提交的加急旅游签注（前往过许可或签证即将签满）';
  	    		}else if(data.ywType=="4"){
  	    			var lb = '<p style="width: 90%; margin: 0 auto; line-height: 28px;">您于'+d+'提交的加急旅游签注（赴出境治疗紧急重症）';
  	    		}else if(data.ywType=="5"){
  	    			var lb = '<p style="width: 90%; margin: 0 auto; line-height: 28px;">您于'+d+'提交的加急旅游签注（出境留学开学日期临近的）';
  	    		}else if(data.ywType=="6"){
  	    			var lb = '<p style="width: 90%; margin: 0 auto; line-height: 28px;">您于'+d+'提交的加急旅游签注（已定前往国机票）';
  	    		}else if(data.ywType=="7"){
  	    			var lb = '<p style="width: 90%; margin: 0 auto; line-height: 28px;">您于'+d+'提交的加急旅游签注（紧急商务活动）';
  	    		}else if(data.ywType=="8"){
  	    			var lb = '<p style="width: 90%; margin: 0 auto; line-height: 28px;">您于'+d+'提交的加急旅游签注（赴境外处理突发事件）';
  	    		}else if(data.ywType=="9"){
  	    			var lb = '<p style="width: 90%; margin: 0 auto; line-height: 28px;">您于'+d+'提交的加急旅游签注（应邀赴台湾地区，日期临近的）';
  	    		}else{
  	    			var lb = '<p style="width: 90%; margin: 0 auto; line-height: 28px;">您于'+d+'提交的加急旅游签注（其他事由）';
  	    		}
  	    		lb += '<span class="tip_text">审核中</span>，请耐心等待结果。';
  	    		lb += '</p>';
  	    		$("#form").append(lb);
  	    	})
  	  	});
    </script>
</head>
<body>
<div>
    <header><img src="../image/banner_bs_1.jpg" alt="" width="100%;"/></header>
    <section>
        <div class="operating_box">
            <div class="pad_top" id="form">
                
                <div style="position: absolute; bottom: -10px; right: -10px;"><img src="../image/tag_shz.png" alt="" width="60" height="50"/></div>
            </div>
        </div>
    </section>
    <section>
        <div class="why_box">
            <h2 class="tit_why_text">原 因</h2>
            <p><img src="../image/tip_icon.png" alt="" width="20" height="20"/>
                	您的申请已经提交，正在审核中，请耐心等待。。
            </p>
        </div>
    </section>
    <div class="aui-content-padded ">
        <a href="bsjd.jsp"><p class="padding_top"><div class="aui-btn aui-btn-block">返 回</div></p></a>
    </div>
</div>
</body>
</html>