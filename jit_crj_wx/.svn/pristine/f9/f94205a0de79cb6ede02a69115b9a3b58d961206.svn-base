<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="/WEB-INF/tld/c.tld" prefix="c"%>
<%
	String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
    //微信用户唯一标识
   String openid = request.getParameter("openid");
   String code = request.getParameter("code");
   String sqid = request.getParameter("sqid");
   String ywid=request.getParameter("ywid");
   String jdbt=request.getParameter("jdbt");
   //String openid = "123456";
%> 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0"/>
    <meta name="format-detection" content="telephone=no,email=no,date=no,address=no">
    
    
    <meta content="yes" name="apple-mobile-web-app-capable">
    <meta content="black" name="apple-mobile-web-app-status-bar-style">
    <meta content="telephone=no" name="format-detection">
    <meta content="email=no" name="format-detection">
    
    
    <title>上门取件地址</title>
    <link rel="stylesheet" type="text/css" href="../css/aui.2.0.css" />
    <link rel="stylesheet" href="../css/LArea.css">
            <script type="text/javascript" src="<%=basePath%>/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/js/jweixin-1.0.0.js"></script>
<script type="text/javascript" src="<%=basePath%>/jsp/proscenium/lib/Validform_v5.3.2/demo/js/Validform_v5.3.2.js"></script>
<script type="text/javascript" src="<%=basePath%>/jsp/proscenium/lib/layer-v2.1/layer/layer.js"></script>
	<script type="text/javascript" src="<%=basePath%>/js/My97Date/WdatePicker.js" charset="utf-8"></script>
	<script type="text/javascript" src="<%=basePath%>/jsp/proscenium/wxlv/js/cookie.js"></script>
	<script type="text/javascript" src="<%=basePath%>/jsp/proscenium/wxlv/js/findyw.js"></script>
		<script type="text/javascript" src="../script/aui-dialog.js"></script>
	<script type="text/javascript" src="../script/api.js" ></script>
<script type="text/javascript" src="../script/aui-toast.js" ></script>
      <style type="text/css">
    * {
        margin: 0;
        padding: 0;
        -webkit-appearance: none; //去掉浏览器默认样式
        -webkit-tap-highlight-color: rgba(0, 0, 0, 0);
        -webkit-touch-callout: none;
        box-sizing: border-box;
    }
    
    html,
    body {
        margin: 0 auto;
        width: 100%;
        min-height: 100%;
        overflow-x: hidden;
        -webkit-user-select: none;
    }
    
    body {
        font-family: Helvetica Neue, Helvetica, Arial, sans-serif;
        -webkit-text-size-adjust: 100%; //关闭自动调整字体
        -webkit-overflow-scrolling: touch;
        overflow-scrolling: touch;
    }
    
    input {
        width: 90%;
        height: 40px;
        font-size: 18px;
        border: 1px solid #b72f20;
        border-radius: 5px;
        margin: 20px 5% 0 5%;
        padding: 5px;
    }
    
    h1 {
        background-color: #b72f20;
        color: #fff;
        font-size: 25px;
        text-align: center;
        padding: 10px;
    }
    </style>
    <link rel="stylesheet" href="../css/LArea.css">
    <script type= "text/javascript">
    var sqid= "<%=sqid%>";
    var ywid = '<%=ywid%>';
	var ywcode = '<%=ywid%>';
	var jdbt = '<%=jdbt%>';
    $(function(){
    	$.ajax({
    		url :"http://221.8.52.247:8445/jit_crj/crj/WxYj/findDw.do",
    		data : {
    			"sqid":"<%=sqid%>"
    			
    		},
    		type : "post",
    		dataType : 'json',
    		success : function(data) {
    			var dwmc=data.dwmc;
    			var dwxx=data.dwxx;
    			setCookie('dwxx','办理单位:'+dwmc+',单位地址:'+dwxx.dz+',代办人员:'+dwxx.name+',代办电话:'+dwxx.lxdh);
    			setCookie('dwmc',dwmc);
    			setCookie('dwdz',dwxx.dz);
    			setCookie('dbmc',dwxx.name);
    			setCookie('dbdh',dwxx.lxdh);
    			$('#dwmc').html('办理单位:'+dwmc);
    			$('#dwdz').html('单位地址:'+dwxx.dz);
    			$('#dwxm').html('代办人员:'+dwxx.name);
    			$('#dwdh').html('代办电话:'+dwxx.lxdh);
    		}
    	});
    
	});
    //上门取件地址信息
    function qjdzxx(){
    	//根据地址插件分割出省市县3级 上门取件
    	var sfx = $("#demo2").val();
    	var qjxx_province;
    	var qjxx_city;
    	var qjxx_country;
    	var strs= new Array(); //定义一数组
    	strs=sfx.split(","); //字符分割
    	if(strs.length == 2){
    		qjxx_province = strs[0];
            qjxx_city = strs[1];
        	qjxx_country = strs[1];
    	}else{
    		qjxx_province = strs[0];
            qjxx_city = strs[1];
        	qjxx_country = strs[2];
    	}
    	
   	    var dialog = new auiDialog({});
   	    
   	 
   	    
    	if($("#qjxx_xm").val()==''){
    		dialog.alert({
                title:"提示",
                msg:'请填写上门取件姓名',
                buttons:['确定']
            })
            return;
    	}
    	if($("#qjxx_dh").val()==''){
    		dialog.alert({
                title:"提示",
                msg:'请填写上门取件电话',
                buttons:['确定']
            })
            return;
    		
    	}
    	if($("#demo2").val()==''){
     		dialog.alert({
                 title:"提示",
                 msg:'请填写上门取件省市县',
                 buttons:['确定']
             },function(ret){
             	
             })
             return;
     	}
    	if($("#qjxx_yb").val()==''){
    		dialog.alert({
                title:"提示",
                msg:'请填写上门取件邮编',
                buttons:['确定']
            })
            return;
    	}
    	if($("#qjxx_dz").val()==''){
    		dialog.alert({
                title:"提示",
                msg:'请填写上门取件详细地址',
                buttons:['确定']
            })
            return;
    	}
    	setCookie("qjxx_xm",$("#qjxx_xm").val());
    	setCookie("qjxx_dh",$("#qjxx_dh").val());
    	setCookie("qjxx_yb",$("#qjxx_yb").val());
    	setCookie("qjxx_dz",$("#qjxx_dz").val());
    	
    	setCookie("sfx",sfx);
    	setCookie("qjxx_province",qjxx_province);
    	setCookie("qjxx_city",qjxx_city);
    	setCookie("qjxx_country",qjxx_country);
    	
    	location ="thegoods_address.jsp?sqid="+sqid+"&ywid="+ywid+"&ywcode="+ywid+"&jdbt="+jdbt;
    	
    	
    	
    	
    }
    
    </script>
   
   
</head>
<body>
<div class="aui-content" style="padding-bottom: 3rem;">
    <div class="aui-card-list-content">
        <img src="../image/banner04.jpg" alt="" />
    </div>
    <section class="aui-content-padded">
        <div class="aui-card-list">
            <div class="aui-card-list-content-padded" id="dwmc">
<!--                 办理单位：长春市公安局出入境管理局 -->
            </div>
            <div class="aui-card-list-content-padded" id = "dwdz">
<!--                 单位地址：人民广场光明路688号 -->
                </div>
                <div class="aui-card-list-content-padded" id="dwxm">
<!--                 姓名：许强强 -->
            </div>
            <div class="aui-card-list-footer" id="dwdh">
<!--                 电话：13039004253 -->
            </div>
        </div>
    </section>
    <div class="aui-content aui-margin-b-15">
        <ul class="aui-list aui-form-list">
            <li class="aui-list-item">
                <div class="aui-list-item-inner">
                    <div class="aui-list-item-input">
                        <input type="text" id="qjxx_xm" placeholder="上门取件姓名">
                    </div>
                </div>
            </li>
            <li class="aui-list-item">
                <div class="aui-list-item-inner">
                    <div class="aui-list-item-input">
                        <input type="number" id="qjxx_dh" placeholder="上门取件手机号码">
                    </div>
                </div>
            </li>
            <li class="aui-list-item">
                <div class="aui-list-item-inner">
<!--                    <div class="content-block"> -->
<!--                    <input id="demo1" type="text" name="input_area" readonly="" placeholder="省，市，县(区)"  value=""/> -->
<!--                    <input id="value1" type="hidden" value=""/> -->
<!--                    </div> -->
                    <div class="content-block">
            <input id="demo2" type="text" readonly="" placeholder="上门取件省，市，县(区)" />
            <input id="value2" type="hidden"  />
        </div>
                    <div class="aui-list-item-label-icon">
                        <i class="aui-iconfont aui-icon-right"></i>
                    </div>
                </div>
            </li>
            <li class="aui-list-item">
                <div class="aui-list-item-inner">
                    <div class="aui-list-item-input">
                        <input type="text" id="qjxx_yb" placeholder="上门取件邮政编码">
                    </div>
                </div>
            </li>
            <li class="aui-list-item">
                <div class="aui-list-item-inner">
                    <div class="aui-list-item-input">
                        <textarea name="" id="qjxx_dz" placeholder="上门取件详细地址"></textarea>
                    </div>

                </div>
            </li>
        </ul>
    </div>
    <div class="aui-card-list aui-content-padded">
        <div class="aui-btn aui-btn-info aui-btn-block aui-btn-sm" tapmode onclick="qjdzxx();">
            下一步
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
    <script src="../js/LAreaData1.js"></script>
    <script src="../js/LAreaData2.js"></script>
    <script src="../js/LArea.js"></script>
    <script>
    var area1 = new LArea();
//     area1.init({
//         'trigger': '#demo1', //触发选择控件的文本框，同时选择完毕后name属性输出到该位置
//         'valueTo': '#value1', //选择完毕后id属性输出到该位置
//         'keys': {
//             id: 'id',
//             name: 'name'
//         }, //绑定数据源相关字段 id对应valueTo的value属性输出 name对应trigger的value属性输出
//         'type': 1, //数据源类型
//         'data': LAreaData //数据源
//     });
//     area1.value=[1,13,3];//控制初始位置，注意：该方法并不会影响到input的value
    var area2 = new LArea();
    area2.init({
        'trigger': '#demo2',
        'valueTo': '#value2',
        'keys': {
            id: 'value',
            name: 'text'
        },
        'type': 2,
        'data': [provs_data, citys_data, dists_data]
    });
    </script>
</html>