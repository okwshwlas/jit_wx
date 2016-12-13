<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	String code = request.getParameter("code");
	String path = request.getContextPath();
	//String openid = request.getParameter("openid");
	String openid = "orOuKwNee0z5xZLzOcUZocuCXT5k";
%>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0"/>
    <meta name="format-detection" content="telephone=no,email=no,date=no,address=no">
    <script type="text/javascript" src="../js/jquery.1.8.2.min.js"></script>
    <title>绿色加急通道</title>
    <link rel="stylesheet" type="text/css" href="../css/default.css" />
    <link rel="stylesheet" type="text/css" href="../css/aui.2.0.css" />
    <link rel="stylesheet" type="text/css" href="../css/commont.css" />
    <style>
        .aui-list .aui-list-item::after { background-color: #dddddd;}
        .aui-list .aui-list-item-inner { font-size: 0.7rem;}
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
		var code = '<%=code%>';
    	var path= '<%=path%>';
		var openid;
    	$(document).ready(function(){
    	    /* $.get(path+"/corecontroller/getOpenId.do",{"code":code},function(data){
				data = $.parseJSON(data);
    			openid = data.data;
				onLoad();
    		}) */
    		
			function onLoad(){
				$.post(path+"/proscenium/crjlstdywinfoController/weixin/selectByOpenidPd.do",{"openid":openid},function(data){
					//data String类型转换成 Json 
					data = $.parseJSON(data);
					var dataType = data.obj;
					if(dataType==1){
						//没有历史，直接进入申请页面
						window.location.href="yw_type.jsp?openid="+openid;
					}else if(dataType.length>0){
						if(dataType[0].ywzt==0){
							$("#add").hide();
						}else if(dataType[0].ywzt==4){
							$("#add").hide();
						}else{
							$("#add").show();
						}
						for(var i= 0;i<dataType.length;i++){
							var d = new Date(dataType[i].createDate).format('yyyy-MM-dd');
							if(dataType[i].ywType==1){
								//出国奔丧
								if(dataType[i].ywzt==1){
									var lb = '<a href="bsjg_ytg.jsp?ywbh='+dataType[i].ywbh+'">'
								}else if(dataType[i].ywzt==2){
									var lb = '<a href="bsjg_wtg.jsp?ywbh='+dataType[i].ywbh+'">'
								}else if(dataType[i].ywzt==4){
									var lb = '<a href="bsjg_wwc.jsp?ywbh='+dataType[i].ywbh+'">'
								}else if(dataType[i].ywzt==0){
									var lb = '<a href="bsjg_shz.jsp?ywbh='+dataType[i].ywbh+'">'
								}else{
									var lb = '<a>';
								}
								lb += '<li class="aui-list-item aui-list-item-middle">';
								lb += '<div class="aui-media-list-item-inner">';
								lb += '<div class="aui-list-item-media" style="width: 3rem;">';
								lb += '<img src="../image/icon_1.png" class=" aui-list-img-sm">';
								lb += '</div>';
								lb += '<div class="aui-list-item-inner">';
								lb += '出国奔丧';
								lb += '<p>'+d+'</p>';
								lb += '</div>';
								if(dataType[i].ywzt==0){
									lb +='<div class="state"><img src="../image/tip_icon.png" alt="" width="16" height="16" /> 审核中 </div>';
								}else if(dataType[i].ywzt==1){
									lb += '<div class="state"><img src="../image/tip_cg.jpg" alt="" width="16" height="16" /> 已通过 </div>';
								}else if(dataType[i].ywzt==2){
									lb +='<div class="state"><img src="../image/tip_icon.png" alt="" width="16" height="16" /> 未通过 </div>';
								}else if(dataType[i].ywzt==3){
									lb +='<div class="state"><img src="../image/tip_icon.png" alt="" width="16" height="16" /> 已取消申请 </div>';
								}else{
									lb +='<div class="state"><img src="../image/tip_icon.png" alt="" width="16" height="16" /> 草稿</div>';
								}
								lb += '</div>';
								lb += '</li></a>';       
								$("#form").append(lb);
							}else if(dataType[i].ywType==2){
								//出国探望危重病人
								if(dataType[i].ywzt==1){
									var lb = '<a href="bsjg_ytg.jsp?ywbh='+dataType[i].ywbh+'">'
								}else if(dataType[i].ywzt==2){
									var lb = '<a href="bsjg_wtg.jsp?ywbh='+dataType[i].ywbh+'">'
								}else if(dataType[i].ywzt==4){
									var lb = '<a href="bsjg_wwc.jsp?ywbh='+dataType[i].ywbh+'">'
								}else if(dataType[i].ywzt==0){
									var lb = '<a href="bsjg_shz.jsp?ywbh='+dataType[i].ywbh+'">'
								}else{
									var lb = '<a>';
								}
								lb += '<li class="aui-list-item aui-list-item-middle">';
								lb += '<div class="aui-media-list-item-inner">';
								lb += '<div class="aui-list-item-media" style="width: 3rem;">';
								lb += '<img src="../image/icon_2.png" class=" aui-list-img-sm">';
								lb += '</div>';
								lb += '<div class="aui-list-item-inner">';
								lb += '出国探望危重病人';
								lb += '<p>'+d+'</p>';
								lb += '</div>';
								if(dataType[i].ywzt==0){
									lb +='<div class="state"><img src="../image/tip_icon.png" alt="" width="16" height="16" /> 审核中 </div>';
								}else if(dataType[i].ywzt==1){
									lb += '<div class="state"><img src="../image/tip_cg.jpg" alt="" width="16" height="16" /> 已通过 </div>';
								}else if(dataType[i].ywzt==2){
									lb +='<div class="state"><img src="../image/tip_icon.png" alt="" width="16" height="16" /> 未通过 </div>';
								}else if(dataType[i].ywzt==3){
									lb +='<div class="state"><img src="../image/tip_icon.png" alt="" width="16" height="16" /> 已取消申请 </div>';
								}else{
									lb +='<div class="state"><img src="../image/tip_icon.png" alt="" width="16" height="16" /> 草稿</div>';
								}
								lb += '</div>';
								lb += '</li></a>';       
								$("#form").append(lb);
							}else if(dataType[i].ywType==3){
								//前往过许可或签证即将签满
								if(dataType[i].ywzt==1){
									var lb = '<a href="bsjg_ytg.jsp?ywbh='+dataType[i].ywbh+'">'
								}else if(dataType[i].ywzt==2){
									var lb = '<a href="bsjg_wtg.jsp?ywbh='+dataType[i].ywbh+'">'
								}else if(dataType[i].ywzt==4){
									var lb = '<a href="bsjg_wwc.jsp?ywbh='+dataType[i].ywbh+'">'
								}else if(dataType[i].ywzt==0){
									var lb = '<a href="bsjg_shz.jsp?ywbh='+dataType[i].ywbh+'">'
								}else{
									var lb = '<a>';
								}
								lb += '<li class="aui-list-item aui-list-item-middle">';
								lb += '<div class="aui-media-list-item-inner">';
								lb += '<div class="aui-list-item-media" style="width: 3rem;">';
								lb += '<img src="../image/icon_3.png" class=" aui-list-img-sm">';
								lb += '</div>';
								lb += '<div class="aui-list-item-inner">';
								lb += '前往国许可或签证即将届满';
								lb += '<p>'+d+'</p>';
								lb += '</div>';
								if(dataType[i].ywzt==0){
									lb +='<div class="state"><img src="../image/tip_icon.png" alt="" width="16" height="16" /> 审核中 </div>';
								}else if(dataType[i].ywzt==1){
									lb += '<div class="state"><img src="../image/tip_cg.jpg" alt="" width="16" height="16" /> 已通过 </div>';
								}else if(dataType[i].ywzt==2){
									lb +='<div class="state"><img src="../image/tip_icon.png" alt="" width="16" height="16" /> 未通过 </div>';
								}else if(dataType[i].ywzt==3){
									lb +='<div class="state"><img src="../image/tip_icon.png" alt="" width="16" height="16" /> 已取消申请 </div>';
								}else{
									lb +='<div class="state"><img src="../image/tip_icon.png" alt="" width="16" height="16" /> 草稿</div>';
								}
								lb += '</div>';
								lb += '</li></a>';       
								$("#form").append(lb);
							}else if(dataType[i].ywType==4){
								//赴出境治疗紧急重症
								if(dataType[i].ywzt==1){
									var lb = '<a href="bsjg_ytg.jsp?ywbh='+dataType[i].ywbh+'">'
								}else if(dataType[i].ywzt==2){
									var lb = '<a href="bsjg_wtg.jsp?ywbh='+dataType[i].ywbh+'">'
								}else if(dataType[i].ywzt==4){
									var lb = '<a href="bsjg_wwc.jsp?ywbh='+dataType[i].ywbh+'">'
								}else if(dataType[i].ywzt==0){
									var lb = '<a href="bsjg_shz.jsp?ywbh='+dataType[i].ywbh+'">'
								}else{
									var lb = '<a>';
								}
								lb += '<li class="aui-list-item aui-list-item-middle">';
								lb += '<div class="aui-media-list-item-inner">';
								lb += '<div class="aui-list-item-media" style="width: 3rem;">';
								lb += '<img src="../image/icon_2.png" class=" aui-list-img-sm">';
								lb += '</div>';
								lb += '<div class="aui-list-item-inner">';
								lb += '赴出境治疗紧急重症';
								lb += '<p>'+d+'</p>';
								lb += '</div>';
								if(dataType[i].ywzt==0){
									lb +='<div class="state"><img src="../image/tip_icon.png" alt="" width="16" height="16" /> 审核中 </div>';
								}else if(dataType[i].ywzt==1){
									lb += '<div class="state"><img src="../image/tip_cg.jpg" alt="" width="16" height="16" /> 已通过 </div>';
								}else if(dataType[i].ywzt==2){
									lb +='<div class="state"><img src="../image/tip_icon.png" alt="" width="16" height="16" /> 未通过 </div>';
								}else if(dataType[i].ywzt==3){
									lb +='<div class="state"><img src="../image/tip_icon.png" alt="" width="16" height="16" /> 已取消申请 </div>';
								}else{
									lb +='<div class="state"><img src="../image/tip_icon.png" alt="" width="16" height="16" /> 草稿</div>';
								}
								lb += '</div>';
								lb += '</li></a>';       
								$("#form").append(lb); 
							}else if(dataType[i].ywType==5){
								//出境留学开学日期临近的
								if(dataType[i].ywzt==1){
									var lb = '<a href="bsjg_ytg.jsp?ywbh='+dataType[i].ywbh+'">'
								}else if(dataType[i].ywzt==2){
									var lb = '<a href="bsjg_wtg.jsp?ywbh='+dataType[i].ywbh+'">'
								}else if(dataType[i].ywzt==4){
									var lb = '<a href="bsjg_wwc.jsp?ywbh='+dataType[i].ywbh+'">'
								}else if(dataType[i].ywzt==0){
									var lb = '<a href="bsjg_shz.jsp?ywbh='+dataType[i].ywbh+'">'
								}else{
									var lb = '<a>';
								}
								lb += '<li class="aui-list-item aui-list-item-middle">';
								lb += '<div class="aui-media-list-item-inner">';
								lb += '<div class="aui-list-item-media" style="width: 3rem;">';
								lb += '<img src="../image/icon_4.png" class=" aui-list-img-sm">';
								lb += '</div>';
								lb += '<div class="aui-list-item-inner">';
								lb += '出境留学开学日期临近的';
								lb += '<p>'+d+'</p>';
								lb += '</div>';
								if(dataType[i].ywzt==0){
									lb +='<div class="state"><img src="../image/tip_icon.png" alt="" width="16" height="16" /> 审核中 </div>';
								}else if(dataType[i].ywzt==1){
									lb += '<div class="state"><img src="../image/tip_cg.jpg" alt="" width="16" height="16" /> 已通过 </div>';
								}else if(dataType[i].ywzt==2){
									lb +='<div class="state"><img src="../image/tip_icon.png" alt="" width="16" height="16" /> 未通过 </div>';
								}else if(dataType[i].ywzt==3){
									lb +='<div class="state"><img src="../image/tip_icon.png" alt="" width="16" height="16" /> 已取消申请 </div>';
								}else{
									lb +='<div class="state"><img src="../image/tip_icon.png" alt="" width="16" height="16" /> 草稿</div>';
								}
								lb += '</div>';
								lb += '</li></a>';       
								$("#form").append(lb);
							}else if(dataType[i].ywType==6){
								//已定前往国机票
								if(dataType[i].ywzt==1){
									var lb = '<a href="bsjg_ytg.jsp?ywbh='+dataType[i].ywbh+'">'
								}else if(dataType[i].ywzt==2){
									var lb = '<a href="bsjg_wtg.jsp?ywbh='+dataType[i].ywbh+'">'
								}else if(dataType[i].ywzt==4){
									var lb = '<a href="bsjg_wwc.jsp?ywbh='+dataType[i].ywbh+'">'
								}else if(dataType[i].ywzt==0){
									var lb = '<a href="bsjg_shz.jsp?ywbh='+dataType[i].ywbh+'">'
								}else{
									var lb = '<a>';
								}
								lb += '<li class="aui-list-item aui-list-item-middle">';
								lb += '<div class="aui-media-list-item-inner">';
								lb += '<div class="aui-list-item-media" style="width: 3rem;">';
								lb += '<img src="../image/icon_1.png" class=" aui-list-img-sm">';
								lb += '</div>';
								lb += '<div class="aui-list-item-inner">';
								lb += '已订前往国机票';
								lb += '<p>'+d+'</p>';
								lb += '</div>';
								if(dataType[i].ywzt==0){
									lb +='<div class="state"><img src="../image/tip_icon.png" alt="" width="16" height="16" /> 审核中 </div>';
								}else if(dataType[i].ywzt==1){
									lb += '<div class="state"><img src="../image/tip_cg.jpg" alt="" width="16" height="16" /> 已通过 </div>';
								}else if(dataType[i].ywzt==2){
									lb +='<div class="state"><img src="../image/tip_icon.png" alt="" width="16" height="16" /> 未通过 </div>';
								}else if(dataType[i].ywzt==3){
									lb +='<div class="state"><img src="../image/tip_icon.png" alt="" width="16" height="16" /> 已取消申请 </div>';
								}else{
									lb +='<div class="state"><img src="../image/tip_icon.png" alt="" width="16" height="16" /> 草稿</div>';
								}
								lb += '</div>';
								lb += '</li></a>';       
								$("#form").append(lb); 
							}else if(dataType[i].ywType==7){
								//紧急商务活动
								if(dataType[i].ywzt==1){
									var lb = '<a href="bsjg_ytg.jsp?ywbh='+dataType[i].ywbh+'">'
								}else if(dataType[i].ywzt==2){
									var lb = '<a href="bsjg_wtg.jsp?ywbh='+dataType[i].ywbh+'">'
								}else if(dataType[i].ywzt==4){
									var lb = '<a href="bsjg_wwc.jsp?ywbh='+dataType[i].ywbh+'">'
								}else if(dataType[i].ywzt==0){
									var lb = '<a href="bsjg_shz.jsp?ywbh='+dataType[i].ywbh+'">'
								}else{
									var lb = '<a>';
								}
								lb += '<li class="aui-list-item aui-list-item-middle">';
								lb += '<div class="aui-media-list-item-inner">';
								lb += '<div class="aui-list-item-media" style="width: 3rem;">';
								lb += '<img src="../image/icon_3.png" class=" aui-list-img-sm">';
								lb += '</div>';
								lb += '<div class="aui-list-item-inner">';
								lb += '紧急商务活动';
								lb += '<p>'+d+'</p>';
								lb += '</div>';
								if(dataType[i].ywzt==0){
									lb +='<div class="state"><img src="../image/tip_icon.png" alt="" width="16" height="16" /> 审核中 </div>';
								}else if(dataType[i].ywzt==1){
									lb += '<div class="state"><img src="../image/tip_cg.jpg" alt="" width="16" height="16" /> 已通过 </div>';
								}else if(dataType[i].ywzt==2){
									lb +='<div class="state"><img src="../image/tip_icon.png" alt="" width="16" height="16" /> 未通过 </div>';
								}else if(dataType[i].ywzt==3){
									lb +='<div class="state"><img src="../image/tip_icon.png" alt="" width="16" height="16" /> 已取消申请 </div>';
								}else{
									lb +='<div class="state"><img src="../image/tip_icon.png" alt="" width="16" height="16" /> 草稿</div>';
								}
								lb += '</div>';
								lb += '</li></a>';       
								$("#form").append(lb);
							}else if(dataType[i].ywType==8){
								//赴境外处理突发事件
								if(dataType[i].ywzt==1){
									var lb = '<a href="bsjg_ytg.jsp?ywbh='+dataType[i].ywbh+'">'
								}else if(dataType[i].ywzt==2){
									var lb = '<a href="bsjg_wtg.jsp?ywbh='+dataType[i].ywbh+'">'
								}else if(dataType[i].ywzt==4){
									var lb = '<a href="bsjg_wwc.jsp?ywbh='+dataType[i].ywbh+'">'
								}else if(dataType[i].ywzt==0){
									var lb = '<a href="bsjg_shz.jsp?ywbh='+dataType[i].ywbh+'">'
								}else{
									var lb = '<a>';
								}
								lb += '<li class="aui-list-item aui-list-item-middle">';
								lb += '<div class="aui-media-list-item-inner">';
								lb += '<div class="aui-list-item-media" style="width: 3rem;">';
								lb += '<img src="../image/icon_4.png" class=" aui-list-img-sm">';
								lb += '</div>';
								lb += '<div class="aui-list-item-inner">';
								lb += '赴境外处理突发事件';
								lb += '<p>'+d+'</p>';
								lb += '</div>';
								if(dataType[i].ywzt==0){
									lb +='<div class="state"><img src="../image/tip_icon.png" alt="" width="16" height="16" /> 审核中 </div>';
								}else if(dataType[i].ywzt==1){
									lb += '<div class="state"><img src="../image/tip_cg.jpg" alt="" width="16" height="16" /> 已通过 </div>';
								}else if(dataType[i].ywzt==2){
									lb +='<div class="state"><img src="../image/tip_icon.png" alt="" width="16" height="16" /> 未通过 </div>';
								}else if(dataType[i].ywzt==3){
									lb +='<div class="state"><img src="../image/tip_icon.png" alt="" width="16" height="16" /> 已取消申请 </div>';
								}else{
									lb +='<div class="state"><img src="../image/tip_icon.png" alt="" width="16" height="16" /> 草稿</div>';
								}
								lb += '</div>';
								lb += '</li></a>';       
								$("#form").append(lb);
							}else if(dataType[i].ywType==9){
								//应邀赴台湾地区，日期临近的
								if(dataType[i].ywzt==1){
									var lb = '<a href="bsjg_ytg.jsp?ywbh='+dataType[i].ywbh+'">'
								}else if(dataType[i].ywzt==2){
									var lb = '<a href="bsjg_wtg.jsp?ywbh='+dataType[i].ywbh+'">'
								}else if(dataType[i].ywzt==4){
									var lb = '<a href="bsjg_wwc.jsp?ywbh='+dataType[i].ywbh+'">'
								}else if(dataType[i].ywzt==0){
									var lb = '<a href="bsjg_shz.jsp?ywbh='+dataType[i].ywbh+'">'
								}else{
									var lb = '<a>';
								}
								lb += '<li class="aui-list-item aui-list-item-middle">';
								lb += '<div class="aui-media-list-item-inner">';
								lb += '<div class="aui-list-item-media" style="width: 3rem;">';
								lb += '<img src="../image/icon_3.png" class=" aui-list-img-sm">';
								lb += '</div>';
								lb += '<div class="aui-list-item-inner">';
								lb += ' 应邀赴台湾地区，日期临近的';
								lb += '<p>'+d+'</p>';
								lb += '</div>';
								if(dataType[i].ywzt==0){
									lb +='<div class="state"><img src="../image/tip_icon.png" alt="" width="16" height="16" /> 审核中 </div>';
								}else if(dataType[i].ywzt==1){
									lb += '<div class="state"><img src="../image/tip_cg.jpg" alt="" width="16" height="16" /> 已通过 </div>';
								}else if(dataType[i].ywzt==2){
									lb +='<div class="state"><img src="../image/tip_icon.png" alt="" width="16" height="16" /> 未通过 </div>';
								}else if(dataType[i].ywzt==3){
									lb +='<div class="state"><img src="../image/tip_icon.png" alt="" width="16" height="16" /> 已取消申请 </div>';
								}else{
									lb +='<div class="state"><img src="../image/tip_icon.png" alt="" width="16" height="16" /> 草稿</div>';
								}
								lb += '</div>';
								lb += '</li></a>';       
								$("#form").append(lb);
							}else{
								//其他事由
								if(dataType[i].ywzt==1){
									var lb = '<a href="bsjg_ytg.jsp?ywbh='+dataType[i].ywbh+'">'
								}else if(dataType[i].ywzt==2){
									var lb = '<a href="bsjg_wtg.jsp?ywbh='+dataType[i].ywbh+'">'
								}else if(dataType[i].ywzt==4){
									var lb = '<a href="bsjg_wwc.jsp?ywbh='+dataType[i].ywbh+'">'
								}else if(dataType[i].ywzt==0){
									var lb = '<a href="bsjg_shz.jsp?ywbh='+dataType[i].ywbh+'">'
								}else{
									var lb = '<a>';
								}
								lb += '<li class="aui-list-item aui-list-item-middle">';
								lb += '<div class="aui-media-list-item-inner">';
								lb += '<div class="aui-list-item-media" style="width: 3rem;">';
								lb += '<img src="../image/icon_2.png" class=" aui-list-img-sm">';
								lb += '</div>';
								lb += '<div class="aui-list-item-inner">';
								lb += ' 其他事由';
								lb += '<p>'+d+'</p>';
								lb += '</div>';
								if(dataType[i].ywzt==0){
									lb +='<div class="state"><img src="../image/tip_icon.png" alt="" width="16" height="16" /> 审核中 </div>';
								}else if(dataType[i].ywzt==1){
									lb += '<div class="state"><img src="../image/tip_cg.jpg" alt="" width="16" height="16" /> 已通过 </div>';
								}else if(dataType[i].ywzt==2){
									lb +='<div class="state"><img src="../image/tip_icon.png" alt="" width="16" height="16" /> 未通过 </div>';
								}else if(dataType[i].ywzt==3){
									lb +='<div class="state"><img src="../image/tip_icon.png" alt="" width="16" height="16" /> 已取消申请 </div>';
								}else{
									lb +='<div class="state"><img src="../image/tip_icon.png" alt="" width="16" height="16" /> 草稿</div>';
								}
								lb += '</div>';
								lb += '</li></a>';       
								$("#form").append(lb); 
							}
						}
					}
				})
			}
    	}); 
		
		
    	
    	function clickFun(){
    		var openid= '<%=openid%>';
    		window.location.href="yw_type.jsp?openid="+openid;
    	}
    </script>
</head>
<body>
    <div>
        <header id="header">
            <img src="../image/banner_bs.jpg" alt="" width="100%" />
        </header>
        <section class="aui-content-padded">
            <p class="tip_text">＊单击每条可查看审核结详细结果。</p>
            <div class="aui-card-list">
                <div class="aui-card-list">
                    <div class="aui-content aui-margin-b-15">
                        <ul class="aui-list aui-media-list" id="form">
                        </ul>
                    </div>
                </div>
            </div>
        </section>
        <div class="aui-content-padded" id="add" style="display:none">
            <a href="#" onclick="clickFun();"><p class="padding_top"><div class="aui-btn aui-btn-blue aui-btn-block">再次添加</div></p></a>
        </div>
    </div>
</body>
</html>