<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="/WEB-INF/tld/c.tld" prefix="c"%>
<%
	String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
    String openid = request.getParameter("openid");//微信用户唯一标识
	String code = request.getParameter("code");
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
    <script type="text/javascript" src="../script/jquery-1.8.2.js"></script>
    <script type="text/javascript">
		var code = '<%=code%>';
		var openid = '<%=openid%>';
		var path = '<%=path%>';
		var suibian =' <span class="icon_select_vi"><img src="../image/select.png" alt="" width="48"  height="25" /> </span>';
        $(document).ready(function() {
            $(".aui-list .aui-media-list-item-inner").click(function(){
                    $(".aui-media-list-item-inner").find('span').remove();
                    $(this).append(suibian)
            })
        });
        function clickFun(type){
        	if(type==1){
        		$("#type").val("1");
        	}else if(type==2){
        		$("#type").val("2");
        	}else if(type==3){
        		$("#type").val("3");
        	}else if(type==4){
        		$("#type").val("4");
        	}else if(type==5){
        		$("#type").val("5");
        	}else if(type==6){
        		$("#type").val("6");
        	}else if(type==7){
        		$("#type").val("7");
        	}else if(type==8){
        		$("#type").val("8");
        	}else if(type==9){
        		$("#type").val("9");
        	}else{
        		$("#type").val("10");
        	}
        }
        function click1(){
        	var type= $("#type").val();
        	window.location.href="yw_form.jsp?type="+type+"&openid="+openid;
        }
    </script>
</head>
<body>
    <div>
        <header id="header">
            <img src="../image/1_banner.jpg" alt="" width="100%" />
            <div class="tip_box">
                <img src="../image/tip_icon.png" alt="" width="15" height="15" />
                <p>提示：办理事项仅限护照、港澳证及大陆证首申及换、补发</p>
            </div>
        </header>
        <section class="aui-content-padded">
            <div class="aui-card-list">
                <div class="aui-card-list-header">
                    	请选择旅游通道事由
                </div>
                <div class="aui-card-list-footer border_top">
                    	＊申请人需选择相应事由进行办理！
                </div>
                <div class="aui-card-list">
                    <div class="aui-content aui-margin-b-15">
                        <ul class="aui-list aui-media-list">
                            <li class="aui-list-item aui-list-item-middle">
                                <div class="aui-media-list-item-inner">
                                    <div class="aui-list-item-media" style="width: 3rem;">
                                        <img src="../image/icon_1.png" class=" aui-list-img-sm">
                                    </div>
                                    <div class="aui-list-item-inner icon_select" onclick="clickFun(1);">
                                        	出国奔丧
                                    </div>
                                </div>
                            </li>
                            <li class="aui-list-item aui-list-item-middle">
                                <div class="aui-media-list-item-inner">
                                    <div class="aui-list-item-media" style="width: 3rem;">
                                        <img src="../image/icon_2.png" class=" aui-list-img-sm">
                                    </div>
                                    <div class="aui-list-item-inner icon_select" onclick="clickFun(2);">
                                       	 出国探望危重病人
                                    </div>
                                </div>
                            </li>
                            <li class="aui-list-item aui-list-item-middle">
                                <div class="aui-media-list-item-inner">
                                    <div class="aui-list-item-media" style="width: 3rem;">
                                        <img src="../image/icon_3.png" class=" aui-list-img-sm">
                                    </div>
                                    <div class="aui-list-item-inner icon_select" onclick="clickFun(3);">
                                        	前往国许可或签证即将届满
                                    </div>
                                </div>
                            </li>
                            <li class="aui-list-item aui-list-item-middle">
                                <div class="aui-media-list-item-inner">
                                    <div class="aui-list-item-media" style="width: 3rem;">
                                        <img src="../image/icon_2.png" class=" aui-list-img-sm">
                                    </div>
                                    <div class="aui-list-item-inner icon_select" onclick="clickFun(4);">
                                        	赴出境治疗紧急重症
                                    </div>
                                </div>
                            </li>
                            <li class="aui-list-item aui-list-item-middle">
                                <div class="aui-media-list-item-inner">
                                    <div class="aui-list-item-media" style="width: 3rem;">
                                        <img src="../image/icon_4.png" class=" aui-list-img-sm">
                                    </div>
                                    <div class="aui-list-item-inner icon_select" onclick="clickFun(5);">
                                        	出境留学开学日期临近的
                                    </div>
                                </div>
                            </li>
                            <li class="aui-list-item aui-list-item-middle">
                                <div class="aui-media-list-item-inner">
                                    <div class="aui-list-item-media" style="width: 3rem;">
                                        <img src="../image/icon_1.png" class=" aui-list-img-sm">
                                    </div>
                                    <div class="aui-list-item-inner icon_select" onclick="clickFun(6);">
                                        	已订前往国机票
                                        <p class="p_right">日期临近，且证件丢失或有效期即将届满的</p>
                                    </div>
                                </div>
                            </li>
                            <li class="aui-list-item aui-list-item-middle">
                                <div class="aui-media-list-item-inner">
                                    <div class="aui-list-item-media" style="width: 3rem;">
                                        <img src="../image/icon_3.png" class=" aui-list-img-sm">
                                    </div>
                                    <div class="aui-list-item-inner icon_select" onclick="clickFun(7);">
                                        	紧急商务活动
                                        <p class="p_right">如临时性国际商务会议、会谈等</p>
                                    </div>
                                </div>
                            </li>
                            <li class="aui-list-item aui-list-item-middle">
                                <div class="aui-media-list-item-inner">
                                    <div class="aui-list-item-media" style="width: 3rem;">
                                        <img src="../image/icon_4.png" class=" aui-list-img-sm">
                                    </div>
                                    <div class="aui-list-item-inner icon_select" onclick="clickFun(8);">
                                        	赴境外处理突发事件
                                        <p class="p_right">如境外继承遗憾、处理经济纠纷诉讼、仲裁等事项日
                                            	期临近的
                                        </p>
                                    </div>
                                </div>
                            </li>
                            <li class="aui-list-item aui-list-item-middle">
                                <div class="aui-media-list-item-inner">
                                    <div class="aui-list-item-media" style="width: 3rem;">
                                        <img src="../image/icon_3.png" class=" aui-list-img-sm">
                                    </div>
                                    <div class="aui-list-item-inner icon_select" onclick="clickFun(9);">
                                       	 应邀赴台湾地区，日期临近的
                                    </div>
                                </div>
                            </li>
                            <li class="aui-list-item aui-list-item-middle">
                                <div class="aui-media-list-item-inner">
                                    <div class="aui-list-item-media" style="width: 3rem;">
                                        <img src="../image/icon_2.png" class=" aui-list-img-sm">
                                    </div>
                                    <div class="aui-list-item-inner icon_select" onclick="clickFun(10);">
                                       	 其他事由
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </section>
        <div class="aui-content-padded ">
        	<input type="hidden" id="type" value="">
            <p class="padding_top"><div class="aui-btn aui-btn-blue aui-btn-block"  onclick="click1();">确 定</div></p>
        </div>
    </div>
</body>
</html>