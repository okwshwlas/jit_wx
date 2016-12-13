<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="/WEB-INF/tld/c.tld" prefix="c"%>
<%
	String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
    //微信用户唯一标识
    //String openid = request.getParameter("openid");
    String openid = "123456";
    String id = request.getParameter("id");
%> 
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="initial-scale=1, maximum-scale=3, minimum-scale=1, user-scalable=no">
    <meta name="format-detection" content="telephone=no">
    <title>智能咨询-小艾</title>
    <link href="<%=basePath%>/Liaotian/style/default.css" type="text/css" rel="stylesheet" />
    <link href="<%=basePath%>/Liaotian/style/commont.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="<%=basePath%>/Liaotian/js/jquery.1.8.2.min.js" ></script>
    <script type="text/javascript" src="<%=basePath%>/Liaotian/js/comment.js"></script>
</head>
<body>
<div id="wrap" >
<header class="header">
    <!--<a href="javascript:void(0);" class="return_btn"></a>-->
    <dl class="head_dl">
        <dt>
            <img src="<%=basePath%>/Liaotian/image/images/head_img.jpg" alt="" />
        </dt>
        <dd>
            <p>智能咨询小艾</p>
            <p style="font-size: 0.24rem;">欢迎咨询</p>
        </dd>
    </dl>
</header>
<section>
    <div id="content">
        <dl class="info_box">
            <dt><img src="<%=basePath%>/Liaotian/image/images/head_img.jpg" alt="" />
            </dt>
            <dd>
                <p class="session">您好！我是智能咨询员小艾，很高兴问您服务，我可以帮您解答平台内的相关业务。</p>
                <img src="<%=basePath%>/Liaotian/image/background/icon_1.png " alt="" class="icon_1"/>
            </dd>
        </dl>
        <!--<dl class="info_box info_box_right" >
            <dt><img src="${basePath}/static/Liaotian/image/images/img01.jpg" alt="" /></dt>
            <dd>
                <p class="session session_1">办理护照需要准备那些材料？</p>
                <p style="text-align: right;">20:08</p>
                <img src="${basePath}/static/Liaotian/image/background/icon_2.png " alt="" class="icon_2"/>
            </dd>
        </dl>
        <dl class="info_box" >
            <dt><img src="${basePath}/static/Liaotian/image/images/head_img.jpg" alt="" /></dt>
            <dd>
                <div class="session">下面是办理的一些步骤，您可以看一看：<br />
                    <ul style="list-style-type:  disc!important; padding-left: 0.25rem;">
                        <li><a href="info">护照申请携带资料</a> </li>
                        <li><a href="javascript:void(0);">护照申请携带资料</a> </li>
                        <li><a href="javascript:void(0);">护照申请携带资料</a> </li>
                        <li><a href="javascript:void(0);">护照申请携带资料</a> </li>
                        <li><a href="javascript:void(0);">护照申请携带资料</a> </li>
                        <li><a href="javascript:void(0);">护照申请携带资料</a> </li>
                    </ul>
                </div>
                <p>20:08</p>
                <img src="${basePath}/static/Liaotian/image/background/icon_1.png " alt="" class="icon_1"/>
            </dd>
        </dl>
        <dl class="info_box info_box_right" >
            <dt><img src="${basePath}/static/Liaotian/image/images/img01.jpg" alt="" /></dt>
            <dd>
                <p class="session session_1">灰常感谢！🙏</p>
                <p style="text-align: right;">20:08</p>
                <img src="${basePath}/static/Liaotian/image/background/icon_2.png " alt="" class="icon_2" />
            </dd>
        </dl>-->
    </div>
</section>
<footer id="footer">
    <div class="input_box">
        <input id="customer" type="text" placeholder="请输入您要咨询的问题" class="input_box_in" />
        <a href="javascript:void(0);" onclick="sendMess()" class="send_btn"><img src="<%=basePath%>/Liaotian/image/background/send_icon.png" alt=""/><p>发 送</p></a>
    </div>
</footer>
</div>
<div id="wrapInfo" style="display:none;">
    <header class="header">
        <a href="javascript:void(0);" class="return_btn" onclick="javascript :history.back(-1)"></a>
    </header>
    <section class="info_box">
        <div class="info_con">
            <h2 id="titleInfo">护照申请所需材料</h2>
            <p id="contentInfo">
                1、携带本人身份证或者户口簿到户口所在地公安分县局出入境管理部门领取《中国公民因私出国（境）申请审批表》(以下简称“申请表”) 并如实回答出入境民警的必要询问。 
                2、填写申请表。 
                3、提交申请。提交申请时必须携带下列材料：A、 本人身份证或者户口簿原件和户口簿首页、本人资料页、变更页及身份证的复印件。（申请人居民身份证、户口簿及复印件；在居民身份证领取、换领、补领期间，可以提交临时居民身份证。）  B、 填写完整的申请表原件。C、 符合要求的彩色照片1张。
                4、领取护照。公安局出入境管理处受理申请后，审批、制作和签发护照的时间是14个工作日（一般做不到，有可能一个月）。领取护照时，须携带本人身份证或者户口簿、领取护照《回执》和200元工本费。凡在《回执》上标明取证日期3个月后没有领取证件的公安局出入境管理处将予以销毁。特殊情形：1、未满16周岁的，申请时由其监护人陪同，提交其监护人出具的同意出境的意见、监护人的居民身份证或者户口簿、护照及复印件。2、属于登记备案国家工作人员，需提交本人所属工作单位或者上级主管单位按照人事管理权限审批后出具的同意出境的证明。3、现役军人申请普通护照的，由其所属部队驻地的县（区）级公安机关出入境管理部门受理，不需提交户口簿，需提交本人的身份证。
            </p>
        </div>
    </section>
</div>
<script src="<%=basePath%>/Jwebui/lib/jquery-2.1.4.js"></script>
<script src="<%=basePath%>/Jwebui/lib/fastclick.js"></script>
<script src="<%=basePath%>/Jwebui/js/jquery-weui.js"></script>
<script src="<%=basePath%>/webui/js/template.js"></script>
<script>
    $(function() {
        FastClick.attach(document.body);

    });
</script>
<script type="text/javascript">
    var touxiang='<img src="<%=basePath%>/Liaotian/image/images/head_img.jpg" id="me" alt="" type="hidden"/>';
    $(document).ready(function(){
        $.get("http://hkp1s.ngrok.natapp.cn/getHead",{},function(data){
            $("#me").attr("src",data.headimgurl);
            touxiang='<img src='+data.headimgurl+' id="me" alt="" type="hidden"/>';
        },'json')
    })

    var jsonContent;
    var myDate = new Date();
    //设置初使用页面样式 rem
    (function (doc, win) {
        var docEl = doc.documentElement,
                resizeEvt = 'orientationchange' in window ? 'orientationchange' : 'resize',
                recalc = function () {
                    var clientWidth = docEl.clientWidth;
                    if (!clientWidth) return;
                    docEl.style.fontSize = 100 * (clientWidth / 750) + 'px';
                };
        if (!doc.addEventListener) return;
        win.addEventListener(resizeEvt, recalc, false);
        doc.addEventListener('DOMContentLoaded', recalc, false);
    })(document, window);

    function sendMess(){
        var customerMess=$("#customer").val();
        if(customerMess==null||customerMess==""){
            return false;
        }
        $("#customer").val("");
        $("#content").append(
                '<dl class=" info_box info_box_right" >'+
                '<dt>'+touxiang+'</dt>'+
        '<dd>'+
        '<p class="session session_1">'+customerMess+'</p>'+
        '<img src="<%=basePath%>/Liaotian/image/background/icon_2.png " alt="" class="icon_2" />'+
        '</dd>'+
        '</dl>'
        );
        $.post("http://hkp1s.ngrok.natapp.cn/jeesite/f/weixin/wxjq/searchTitle",{"searchWord":customerMess},function(data){
            var titles="";
            jsonContent=data;
            if(data.length==0){
                robotSay("暂无"+customerMess+"相关内容","请输入关键字，如外国人.....");
                return false;
            }

            for(var i= 0;i<data.length;i++){
                titles='<li><a href="javascript:void(0);" onclick="showDetail(\''+data[i].id+'\');">'+data[i].title+'</a> </li>'+titles;
            }
            customerMess="下面是关于"+customerMess+"得内容";
            robotSay(customerMess,titles);
            $('#wrap').scrollTop($('#wrap')[0].scrollHeight);
        },"json");

        /*//头像
        $.get("https://api.weixin.qq.com/cgi-bin/user/info?access_token=ACCESS_TOKEN&openid=OPENID&lang=zh_CN",{"searchWord":customerMess},function(data){

        })*/
    }

    function showDetail(id){
       // window.location.href="http://2a5e553f.ngrok.natapp.cn/info"
        for(var i= 0;i<jsonContent.length;i++){
            if(id == jsonContent[i].id){
                $("#titleInfo").html(jsonContent[i].title);
                $("#contentInfo").html(jsonContent[i].content);
                $("#wrap").hide();
                $("#wrapInfo").show();
                //$("#content").append(jsonContent[i].content);
                //robotSay("您的问题:"+jsonContent[i].title+"<br/>我的回答:"+jsonContent[i].content);
                /*$("#content").append('<dl class="info_box" >'+
                        '<dt><img src="${basePath}/static/Liaotian/image/images/head_img.jpg" alt="" /></dt>'+
                        '<dd>'+
                        '<div class="session">'+jsonContent[i].title+'<br />'+
                        '<ul style="list-style-type:  disc!important; padding-left: 0.25rem;">'+
                        jsonContent[i].content+
                        '</ul>'+
                        '</div>'+
                        '<p>'+myDate.toLocaleTimeString()+'</p>'+
                        '<img src="${basePath}/static/Liaotian/image/background/icon_1.png " alt="" class="icon_1"/>'+
                        '</dd>'+
                        '</dl>');*/
            }
        }
        $('#wrap').scrollTop($('#wrap')[0].scrollHeight);
        if (window.history && window.history.pushState) {
            $(window).on('popstate', function () {
                var hashLocation = location.hash;
                var hashSplit = hashLocation.split("#!/");
                var hashName = hashSplit[1];
                if (hashName !== '') {
                    var hash = window.location.hash;
                    if (hash === '') {
                        $("#wrapInfo").hide();
                        $("#wrap").show();
                        $('#wrap').scrollTop($('#wrap')[0].scrollHeight);
                    }
                }
            });
            window.history.pushState('forward', null, 'liaotian');
        }
    }

    function robotSay(customerMess,titles){
        $("#content").append('<dl class="info_box" >'+
                '<dt><img src="<%=basePath%>/Liaotian/image/images/head_img.jpg" alt="" /></dt>'+
                '<dd>'+
                '<div class="session">'+customerMess+'<br />'+
                '<ul style="list-style-type:  disc!important; padding-left: 0.25rem;">'+
                titles+
                '</ul>'+
                '</div>'+
                '<img src="<%=basePath%>/Liaotian/image/background/icon_1.png " alt="" class="icon_1"/>'+
                '</dd>'+
                '</dl>');
    }


</script>
</body>
</html>
