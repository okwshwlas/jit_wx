<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String sfzh =request.getParameter("idCard");
String hkszdpcs =request.getParameter("hjszd");
String sjhm =request.getParameter("sjhm");
String qwert =request.getParameter("qwert");


%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="viewport" content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0"/>
<meta name="format-detection" content="telephone=no,email=no,date=no,address=no">
<title>个人信息补全</title>
<script type="text/javascript" src="../../js/jquery.1.8.2.min.js"></script>
<link rel="stylesheet" type="text/css" href="../css/aui.2.0.css" />
<!-- 私有js -->
<script type="text/javascript" src="<%=basePath%>/jsp/proscenium/wxlv/js/newLogin.js"></script>
<script type="text/javascript" src="<%=basePath%>/jsp/proscenium/wxlv/js/cookie.js"></script>
<!-- 弹框 -->
<script>var basePath= "<%=basePath%>";</script>
    <style type="text/css">
        .aui-list .aui-list-item-media {
            width: 6rem;
        }
        .aui-media-list .aui-list-item-inner {
            display: block;
            padding-top: 0.8rem;
            padding-bottom: 0.8rem;
        }
        .aui-list-item-input input,.aui-list-item-input select { color: #959494!important;}
        .aui-list-item-input select { padding: 0 0.6rem;}
    </style>
    <script type="text/javascript" >
    var sfzh='<%=sfzh%>';
	var hkszdpcs='<%=hkszdpcs%>';
	var sjhm='<%=sjhm%>';
	var qwert='<%=qwert%>';
    </script>
</head>
<body>
<div class="aui-content" style="padding-bottom: 3rem;">
    <div class="aui-card-list-content">
        <img src="../image/banner_02.jpg" alt="" />
    </div>
    <div class="aui-content aui-margin-b-15 aui-content-padded">
        <ul class="aui-list aui-form-list">
            <li class="aui-list-item">
                <div class="aui-list-item-inner">
                    <div class="aui-list-item-label">中文姓</div>
                    <div class="aui-list-item-input">
                        <input type="text" id="x" name="x" onchange="getPinyinX(this)" placeholder="请输入中文姓">
                    </div>
                </div>
            </li>
            <li class="aui-list-item">
                <div class="aui-list-item-inner">
                    <div class="aui-list-item-label">中文名 </div>
                    <div class="aui-list-item-input">
                        <input type="text" id="m" name="m"  onchange="getPinyinM(this)" placeholder="请输入中文名">
                    </div>
                </div>
            </li>
            <li class="aui-list-item">
                <div class="aui-list-item-inner">
                    <div class="aui-list-item-label">拼音姓 </div>
                    <div class="aui-list-item-input">
                        <input type="text" id="pyX" name="pyX"  placeholder="">
                    </div>
                </div>
            </li>
            <li class="aui-list-item">
                <div class="aui-list-item-inner">
                    <div class="aui-list-item-label">拼音名 </div>
                    <div class="aui-list-item-input">
                        <input type="text" id="pyM" name="pyM" placeholder="">
                    </div>
                </div>
            </li>
        </ul>
    </div>
    <div class="aui-card-list aui-content-padded">
        <div class="aui-card-list">
            <div class="aui-card-list-header">紧急联系人姓名</div>
            <div class="aui-list-item-inner">
                <div class="aui-list-item-input">
                    <input type="text"  id="urgentLink" name="urgentLink" placeholder="请输入姓名" style="padding: 0 0.65rem;">
                </div>
            </div>
        </div>
    </div>
    <div class="aui-card-list aui-content-padded">
        <div class="aui-card-list">
            <div class="aui-card-list-header">紧急联系人电话</div>
            <div class="aui-list-item-inner">
                <div class="aui-list-item-input">
                    <input type="number"  id="linkPhone" name="linkPhone" placeholder="请输入电话" style="padding: 0 0.65rem;">
                </div>
            </div>
        </div>
    </div>
    <div class="aui-card-list aui-content-padded">
        <div class="aui-btn aui-btn-info aui-btn-block aui-btn-sm" id="completeRegist" onclick="completeRegist()">
            <span class="aui-iconfont aui-icon-correct"></span>提 交
        </div>
    </div>
</div>
</body>
<script type="text/javascript" src="../script/api.js" ></script>
<script type="text/javascript" src="../script/aui-dialog.js"></script>
<script type="text/javascript">
    // onclick="openDialog('text')"
    var dialog = new auiDialog({})
    function openDialog(type){
        switch (type) {
            case "text":
                dialog.alert({
                    title:"提示",
                    msg:'系统检测您还没有住宿登记记录,请到公安局办理报住宿后方可办理',
                    buttons:['取消','确定']
                },function(ret){
                    console.log(ret)
                })
                break;
            case "callback":
                dialog.alert({
                    title:"提示",
                    msg:'系统检测您还没有住宿登记记录，请到公安局办理报住宿后方可办理。',
                    buttons:['取消','确定']
                },function(ret){
                    if(ret){
                        dialog.alert({
                            title:"提示",
                            msg:"您点击了第"+ret.buttonIndex+"个按钮",
                            buttons:['确定']
                        });
                    }
                })
                break;
        }
    }
</script>
</html>