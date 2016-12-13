<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="/WEB-INF/tld/c.tld" prefix="c"%>
<%
	String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
	String openid = request.getParameter("openid");
	String type = request.getParameter("type");
%> 
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0"/>
    <meta name="format-detection" content="telephone=no,email=no,date=no,address=no">
    <title>绿色加急通道</title>
    <link rel="stylesheet" type="text/css" href="../css/default.css" />
    <link rel="stylesheet" type="text/css" href="../css/aui.2.0.css" />
    <link rel="stylesheet" type="text/css" href="../css/commont.css" />
    <link rel="stylesheet" href="<%=basePath%>/Jwebui/lib/weui.min.css" />
	<link rel="stylesheet" href="<%=basePath%>/Jwebui/css/jquery-weui.css" />
	<link rel="stylesheet" href="<%=basePath%>/Jwebui/css/demos.css" />
    <script type="text/javascript" src="<%=basePath%>/Jwebui/lib/jquery-2.1.4.js"></script>
	<script type="text/javascript" src="<%=basePath%>/Jwebui/lib/fastclick.js"></script>
	<script type="text/javascript" src="<%=basePath%>/Jwebui/js/jquery-weui.js"></script>
	<script type="text/javascript" src="<%=basePath%>/webui/js/template-native.js"></script>
	<script type="text/javascript" src="<%=basePath%>/webui/js/jweixin-1.0.0.js"></script>
	<script>
		$(function() {
			FastClick.attach(document.body);
		});
	</script>
	<script type="text/javascript">
		var openid = '<%=openid%>';
		var path = '<%=path%>';
		var type = '<%=type%>';
		$(document).ready(function(){
			$.post(path + "/corecontroller/getSdk.do",{"url":location.href.split('#')[0]},function(data){
				wx.config({
					debug: false, // 开启调试模式,调用的所有api的返回值会在客户端alert出来，若要查看传入的参数，可以在pc端打开，参数信息会通过log打出，仅在pc端时才会打印。
					appId: 'wx4f8f9dc36160b515', // 必填，公众号的唯一标识
					timestamp: data.timestamp , // 必填，生成签名的时间戳
					nonceStr: data.nonceStr, // 必填，生成签名的随机串
					signature: data.signature,// 必填，签名，见附录1
					jsApiList: ['uploadImage','chooseImage','downloadImage','startRecord','stopRecord','uploadVoice','playVoice']// 必填，需要使用的JS接口列表，所有JS接口列表见附录2
				});
			},'json');
		});
		//拍照、本地选图
		/* var formVo = {
			wzms: "",//文字描述
			zmcl : {
				localId: [],
				serverId: []
			},//证明材料
			yyms : ""//语音描述
		};//上传证明材料 */
		
		var formVo = {
			wzms: "急啊圣诞节",//文字描述
			openid : openid,
			type : type,
			zmcl :[],//证明材料
			yyms : "333333"//语音描述		
		};
		var images =  {
				localId: ["111111","122222"],
				serverId: ["222222","233333"]
			};
		var imgMaxSize = 6;
		function save(){
			//formVo.wzms = $("#wzms").val();
			formVo.zmcl = images.serverId;
			$.post(path + "/proscenium/crjlstdywinfoController/weixin/insertCl.do",{"formVo":JSON.stringify(formVo)},function(data){
				data = $.parseJSON(data);
				var ywbh = data.obj;
				alert(data.msg);
			})
		}
		function chooseImage(){
			wx.chooseImage({
				success: function (res) {
					if ($('.weui_uploader_file').length >= imgMaxSize) {
						$.alert( '最多只能上传' + imgMaxSize + '张图片');
						return;
					}
					images.localId = images.localId.concat(res.localIds); //合并数组
					uploadImage(res.localIds);
					setTimeout(function() {
						initImgList(res);//待图片上传完成之后，渲染图片列表
					},  images.localId.length*1000);
				}
			});
		};
		//渲染图片列表
		function initImgList(res){
			for(var i=0;i<res.localIds.length;i++){
				var $preview = $('<li class="weui_uploader_file img_file_li" style="width:70px;height:70px;background-image:url('+res.localIds[i]+')"  onclick="showImage(this,\'' + res.localIds[i] + '\')"></li>');
				$('#image_ul').append($preview);
			}
		}
		//上传照片
		function uploadImage(localIds){
			var i = 0, length = localIds.length;
			function upload() {
				wx.uploadImage({
					localId: localIds[i],
					success: function (res) {
						i++;
						images.serverId.push(res.serverId);
						if (i < length) {
							upload();
						}
					},
					fail: function (res) {
					}
				});
			}
			upload();
		}
		//浏览照片
		function showImage(obj,url){
			$.modal({
				title: "",
				text: '<img src="'+url+'" style="max-width: 270px;max-height: 290px;">',
				buttons: [
					{ text: "删除",
						onClick: function(){
							var index = $("ul li").index(obj);
							$('#image_ul').find('li').eq(index).remove();
							images.localId.splice(index,1);
							images.serverId.splice(index,1);
						}
					},
					{ text: "确定", className: "default"}
				]
			});
		}
		
		var secondCount;
		var timeOutObj;
		var localRecordId;//录音的本地资源id 
		function voiceFunc(){
			var obj = $('#statusImg');
			var obj_src = obj.attr("src");
			if(obj_src == "../image/djly_icon.png"){
				$('#statusImg').attr("src","../image/tzly_icon.png");
				secondCount = 0;
				timedCount();
				//开始计时
				wx.startRecord();
			}else{
				stopCount();
				$('#statusImg').attr("src","../image/djly_icon.png");
				wx.stopRecord({
					success: function (res) {
						localRecordId = res.localId;
						wx.uploadVoice({
							localId: localRecordId, // 需要上传的音频的本地ID，由stopRecord接口获得
							isShowProgressTips: 1,// 默认为1，显示进度提示
							success: function (res) {
								formVo.yyms = res.serverId; // 返回音频的服务器端ID
							}
						});
					}
				});
			}
		}
		function playRecord(){
			wx.playVoice({
				localId: localRecordId // 需要播放的音频的本地ID，由stopRecord接口获得
			});
		}
		function timedCount(){
			secondCount++
			$("#playBtn").css("display","none");
			$(".time_results").css("display","");
			$(".time_results").html(secondCount+"s");
			timeOutObj=setTimeout("timedCount()",1000);
		}
		function stopCount(){
			if(secondCount>0){
				$("#playBtn").css("display","");
			}
			clearTimeout(timeOutObj)
		}
    </script>
</head>
<body>
  <div>
        <header id="header">
            <img src="../image/2_banenr.jpg" alt="" width="100%" />
            <div class="tip_box">
                <img src="../image/tip_icon.png" alt="" width="15" height="15" />
                <p>提示：请上传相关证明材料</p>
            </div>
        </header>
        <section class="aui-content-padded">
            <div class="aui-card-list">
                <div class="aui-info aui-margin-t-10 aui-padded-l-10 aui-padded-r-10">
                    <div class="aui-info-item border_bottom">
                        <img src="../image/2_icon1.png" style="width:1.5rem" class="aui-img-round" /><span class="aui-margin-l-5 aui-card-list-header">证明材料</span>
                    </div>
                </div>
				<div class="weui_uploader">
					<div class="weui_uploader_bd" style="margin-left: 15px;">
						<ul id="image_ul" class="weui_uploader_files">
						</ul>
						<div id="image_div" class="weui_uploader_input_wrp"  style="width:70px;height:70px;">
							<input onclick="chooseImage()" class="weui_uploader_input" type="button" />
						</div>
					</div>
				</div>
                <p class="tip_text">＊请您上传清晰的大使馆死亡证明通知书。</p>
            </div>
        </section>
      <section class="aui-content-padded">
          <div class="aui-card-list">
              <div class="aui-info aui-margin-t-10 aui-padded-l-10 aui-padded-r-10">
                  <div class="aui-info-item">
                      <img src="../image/2_icon2.png" style="width:1.5rem" class="aui-img-round" /><span class="aui-margin-l-5 aui-card-list-header">文字描述</span>
                  </div>
              </div>
              <div style="position: relative;">
                  <textarea name="wzms" id="wzms" class="textarea" placeholder="请您对事件进行简要描述"></textarea><span id="wordCountShow"></span>
              </div>
              <p class="tip_text">＊如您无法提供证明材料，请详细填写事件描述。</p>
          </div>
      </section>
      <section class="aui-content-padded">
          <div class="aui-card-list">
              <div class="aui-info aui-margin-t-10 aui-padded-l-10 aui-padded-r-10">
                  <div class="aui-info-item">
                      <img src="../image/2_icon3.png" style="width:1.5rem" class="aui-img-round" /><span class="aui-margin-l-5 aui-card-list-header">语音描述</span>
                  </div>
              </div>
              <div class="voice_box">
                  <span class="time_results" style="display:none"></span>
                  <a href="#this" class="padding_right" onClick="voiceFunc()"><img id="statusImg" src="../image/djly_icon.png" alt="" width="70" height="91"/></a>
                  <!--<a href="#this" class="padding_right"><img id="statusImg" src="../image/tzly_icon.png" alt="" width="70" height="91"/></a>-->
                  <a href="#this"><img id="playBtn" style="display:none;" src="../image/bf_icon.png" onClick="playRecord()" alt="" width="35" height="35"/></a>
              </div>
              <!--<div class="time_number">
                    00:00:00
              </div>-->
          </div>
      </section>
        <div class="aui-content-padded ">
            <p class="padding_top"><div class="aui-btn aui-btn-blue aui-btn-block"  onclick="save()">确 定</div></p>
        </div>
    </div>
</body>
</html>