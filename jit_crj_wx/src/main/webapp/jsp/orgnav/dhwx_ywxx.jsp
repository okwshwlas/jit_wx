<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="/WEB-INF/tld/c.tld" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
//微信用户唯一标识
String openid = request.getParameter("openid");
String els = request.getParameter("els");
String dhhm = request.getParameter("dhhm");
//String openid = "123456";
 String newlatitude = request.getParameter("newlatitude");
 String newlongitude = request.getParameter("newlongitude");
 String adr = request.getParameter("adr");
 String adrcs = request.getParameter("adrcs");
 String adrxq = request.getParameter("adrxq");
 String dhjgdwid = request.getParameter("dhjgdwid");
 String dhjgdwname = request.getParameter("jgdwname");

%> 
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta name="viewport" content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0"/>
    <meta name="format-detection" content="telephone=no,email=no,date=no,address=no">
    <title>业务选择</title>
    <link href="<%=basePath%>/jsp/proscenium/style/contents.css" rel="stylesheet" type="text/css" />
    <link href="<%=basePath%>/jsp/proscenium/css/aui.2.0.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="<%=basePath%>/jsp/proscenium/js/jquery.1.8.2.min.js"></script>
    <script type="text/javascript">
var path= '<%=path%>';
var openid='<%=openid%>';
var els='<%=els%>';
var dhhm='<%=dhhm%>';
var basePath='<%=basePath%>';

var newlatitude = '<%=newlatitude%>';
var newlongitude ='<%=newlongitude%>';
var adr = '<%=adr%>';
var adrcs='<%=adrcs%>';
var adrxq='<%=adrxq%>';
var dhjgdwid='<%=dhjgdwid%>';
var jgdwname='<%=dhjgdwname%>';

</script>
    <script type="text/javascript">
        var suibian =' <span class="icon_select_vi"><img src="<%=basePath%>/jsp/proscenium/image/select.png" alt="" width="40"  height="20" /> </span>';
        $(document).ready(function() {
            $(".aui-list .aui-media-list-item-inner").click(function(){
                var count=$(this).find("span").length;
                if(count>0){
                    $(this).find('span').remove();
                }else{
                    $(this).append(suibian)
                }
            })
            if(dhjgdwid.substr(4,6).indexOf("00")==-1 )
                {
            	$("#zjhbf").hide();
            	$("#ga").hide();
            	$("#tw").hide();
          }
           
        });
    </script>
    <script type="text/javascript">

	// 初始化页面
	function time_box(yybhs){
		window.location.href="dhwx_tsxx.jsp?openid="+openid+"&Strid="+yybhs;
	  }
	//写cookies
	function setCookie(name,value)
	{
	var Days = 30;
	var exp = new Date();
	exp.setTime(exp.getTime() + Days*24*60*60*1000);
	document.cookie = name + "="+ escape (value) + ";expires=" + exp.toGMTString();
	}
	function submit(){
	    getqzflag();
		var count=$('#ga').find("span").length+$('#tw').find("span").length;
		if(count>0){
			setCookie('flag','1');
			
		}
		var url="dhdutuyy.jsp?els="+els+"&count="+count+"&openid="+openid+"&dhhm="+dhhm+"&adrxq="+adrxq+"&newlatitude="+newlatitude+"&newlongitude="+newlongitude+"&adr="+adr+"&adrcs="+adrcs+"&dhjgdwid="+dhjgdwid+"&jgdwname="+jgdwname;
		 
		window.location.href=url;
	  }
	  function getqzflag(){
		
		var gacount=$('#ga').find("span").length;
		var twcount=$('#tw').find("span").length;
		if(gacount>0){
			setCookie('gaflag','1');
			
		}
		if(twcount>0){
			setCookie('twflag','1');
			
		}
	
	}
	</script>
    
    <style>
	html {background:#f5f5f5}
        .icon_select { position: relative; padding-right: 2rem; background: url("<%=basePath%>/jsp/proscenium/image/select_del.png") no-repeat 95% center; }
		.icon_select p { padding-right:10%;}
        .icon_select_vi { position: absolute; right: 0.57rem; top: 50%; margin: -10px; }
    </style>
</head>
<body>
	<div id="wrap">
    	<header id="header" onClick="laod();"><h3>请选择您要预约办理的业务(可多选)</h3></header>
        <section class="aui-content-padded">
            <div class="aui-card-list">
                <div class="aui-content aui-margin-b-15">
                    <ul class="aui-list aui-media-list">
                        <li class="aui-list-item aui-list-item-middle" id="hzss">
                            <div class="aui-media-list-item-inner">
                                <div class="aui-list-item-media" style="width: 3rem;">
                                    <img src="<%=basePath%>/jsp/proscenium/image/icon_hu.png" class=" aui-list-img-sm">
                                </div>
                                <div class="aui-list-item-inner icon_select" >
                                    护照申请
                                    <p>预约申请护照请选择此项</p>
                                </div>
                            </div>
                        </li>
                        <li class="aui-list-item aui-list-item-middle" id="gass">
                            <div class="aui-media-list-item-inner">
                                <div class="aui-list-item-media" style="width: 3rem;"  >
                                    <img src="<%=basePath%>/jsp/proscenium/image/icon_ao.png" class=" aui-list-img-sm">
                                </div>
                                <div class="aui-list-item-inner icon_select" >
                                    港澳证申请
                                    <p>预约申请往来港澳通行证请选择此项</p>
                                </div>
                            </div>
                        </li>
                        <li class="aui-list-item aui-list-item-middle" id="twss">
                            <div class="aui-media-list-item-inner">
                                <div class="aui-list-item-media" style="width: 3rem;">
                                    <img src="<%=basePath%>/jsp/proscenium/image/icon_tai.png" class=" aui-list-img-sm">
                                </div>
                                <div class="aui-list-item-inner icon_select" >
                                    赴台证申请
                                    <p>预约申请大陆居民赴台通行证请选择此项</p>
                                </div>
                            </div>
                        </li>
                        <li class="aui-list-item aui-list-item-middle"  id="zjhbf">
                            <div class="aui-media-list-item-inner">
                                <div class="aui-list-item-media" style="width: 3rem;">
                                    <img src="<%=basePath%>/jsp/proscenium/image/icon_hu.png" class=" aui-list-img-sm">
                                </div>
                                <div class="aui-list-item-inner icon_select"  >
                                   证照换补发
                                    <p>预约申请护照、港澳证、赴台证换补发请选择此项</p>
                                </div>
                            </div>
                        </li>
                        <li class="aui-list-item aui-list-item-middle" id="ga">
                            <div class="aui-media-list-item-inner">
                                <div class="aui-list-item-media" style="width: 3rem;">
                                    <img src="<%=basePath%>/jsp/proscenium/image/icon_ao.png" class=" aui-list-img-sm">
                                </div>
                                <div class="aui-list-item-inner icon_select">
                                    港澳证签注
                                    <p>预约申请港澳签注请选择此项</p>
                                </div>
                            </div>
                        </li>
                        <li class="aui-list-item aui-list-item-middle" id="tw">
                            <div class="aui-media-list-item-inner">
                                <div class="aui-list-item-media" style="width: 3rem;">
                                    <img src="<%=basePath%>/jsp/proscenium/image/icon_tai.png" class=" aui-list-img-sm">
                                </div>
                                <div class="aui-list-item-inner icon_select">
                                    赴台证签证
                                    <p>预约申请赴台签注请选择此项</p>
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </section>
        <div class="aui-content-padded">
            <p class="padding_top" ><div class="aui-btn aui-btn-blue aui-btn-block" onClick="submit();">确 定</div></p>
        </div>
    </div>
</body>
</html>