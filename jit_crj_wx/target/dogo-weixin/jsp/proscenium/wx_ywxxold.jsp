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
%> 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0"/>
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
</script>

<title>吉林省公安出入境微信平台</title>
    <link href="style/default.css" rel="stylesheet" type="text/css" />
    <link href="style/contents.css" type="text/css"  rel="stylesheet"  />
    <script type="text/javascript" src="js/jquery.1.8.2.min.js"></script>   
</head>
 <script type="text/javascript">
	     var suibian ='<div class="layer_selected"><img src="image/icon/select_1.png" alt="" width="25" height="25" /></div>';
		$(document).ready(function() {
            $(".buse_ul li").click(function(){
				var count=$(this).find("div").length;
				if(count>0){
					$(this).find('div').remove();
 				}else{
					$(this).append(suibian);
				}
			})
        });
		
    </script>
  <script type="text/javascript">

	// 初始化页面
	function time_box(yybhs){
		window.location.href="wx_tsxx.jsp?openid="+openid+"&Strid="+yybhs;
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
		var hbflength = $("#hbf").children("div").length;
		var count=$('#time_box').find("div").length;
		if(count!='0'&&count!=hbflength){
			setCookie('flag','1');
			
		}
		var url="dutuyy.jsp?els="+els+"&count="+count+"&openid="+openid+"&dhhm="+dhhm+"&adrxq="+adrxq+"&newlatitude="+newlatitude+"&newlongitude="+newlongitude+"&adr="+adr+"&adrcs="+adrcs;
		 
		window.location.href=url;
	  }
	</script>
<body>
	<div id="wrap">
    	<header id="header" onClick="laod();">业务选择</header>
    	<div class="hit_main">
	    	<p class="hit">请选择您要办理的业务类型</p>
    	</div>
        <div class="busi_box" style="clear:both;">
        	<!-- 首次申请 -->
        	<div>
            	<h2 class="busi_tit">首次申请</h2>
                <ul class="buse_ul">
                	<li id="id_box">
                    	<p><img src="image/icon/huzhao_icon1.png" alt="" width="40" height="53" /></p>
                        <p>护照申请</p>
                     </li>
                    <li>
                    	<p><img src="image/icon/huzhao_icon2.png" alt=""  width="40" height="53" /></p>
                        <p>港澳证申请</p>
                     </li>
                    <li>
                    	<p><img src="image/icon/huzhao_icon3.png" alt=""  width="40" height="53" /></p>
                        <p>赴台证申请</p>
                    </li>
                </ul>
            </div>
            <!-- 再次申请 -->
            <div>
            	<h2 class="busi_tit busi_tit_again">再次申请</h2>
                <ul class="buse_ul padding_no" id="time_box">
                	<li id = "hbf">
                    	<p><img src="image/icon/two_icon1.png" alt="" width="40" height="40" /></p>
                        <p>护照<span class="span_dis">(换发、补发)</span></p>
                     </li>
                    <li>
                    	<p><img src="image/icon/two_icon2.png" alt="" width="40" height="40" /></p>
                        <p>港澳证签注 <span class="span_dis"></span></p>
                    </li>
                    <li>
                    	<p><img src="image/icon/two_icon3.png" alt="" width="40" height="40" /></p>
                        <p>赴台证签注<span class="span_dis"></span></p>
                    </li>
                </ul>
            </div>
            
        </div>
        <section id="footer">
             <div style="width:100%; text-align:center;"><a class="btn_confirm btn_width" onClick="submit();">确 定</a></div>
        </section>

    </div>
</body>
</html>