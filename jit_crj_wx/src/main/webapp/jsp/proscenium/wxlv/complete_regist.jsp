<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String zczh=(String)session.getAttribute("loginZczh");
%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>吉林省公安厅出入境管理局－登录</title>
<link href="../style/default.css" type="text/css" rel="stylesheet" />
<link href="../style/layout.css" type="text/css" rel="stylesheet" />
<link href="../style/commont.css" type="text/css" rel="stylesheet" />
<link href="../style/list.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="../js/jquery.1.8.2.min.js"></script>
<script type="text/javascript" src="../js/hover.js"></script>
<style>
	<!--
	html { background:url(../image/images/bg_01.jpg) no-repeat center center fixed;}
	-->
</style>
<!-- 基础js -->
<script type="text/javascript"  src="<%=basePath%>basics/js/basics_systemJQuery.js" charset="utf-8"></script>
<!-- 基础js -->
<script type="text/javascript"  src="<%=basePath%>basics/js/basics_systemJQuery.js" charset="utf-8"></script>
<script type="text/javascript"  src="<%=basePath%>basics/js/basics_systemJIT.js" charset="utf-8"></script>
<!-- 时间js -->
<script type="text/javascript" src="<%=basePath%>basics/plugin/My97Date/WdatePicker.js" charset="utf-8"></script>
<!-- 私有js -->
<script type="text/javascript" src="<%=basePath%>/jsp/proscenium/wxlv/js/newLogin.js"></script>
<script type="text/javascript" src="<%=basePath%>/jsp/proscenium/wxlv/js/cookie.js"></script>
<!-- 弹框 -->
<script type="text/javascript" src="<%=basePath%>basics/plugin/layer-v2.1/layer/layer.js"></script>
<script>var basePath= "<%=basePath%>";</script>




</head>
<body>
<!-- wrap -->
 
<div id="wrap">
	<!-- 
	<div>
		<div class="header_bg"><a href="#this">个人中心 ｜ </a><a href="login_.jsp">登 录 ｜</a> <a href="#this">补全信息</a></div>       
        <div class="login_title"><h1><img src="../image/title/logo1.png" alt="吉林省公安厅出入境管理局" /></h1></div> 
    </div>
    wrap -->
    
    <div id="list">
    	<div id="list_"> 
            <div class="login inpor_box" id="login_pop">
                <div class="login_box inpor_box">
                     <h2 class="login_tit"><span>补全信息</span></h2>
                     <div class="from_box">
<!--                      <dl class="from_box_dl"> -->
<!--                             <dt><label for="tel" >真实姓名：</label></dt> -->
<!--                             <dd><input type="text" id="name" name="name" class="phone_"/></dd> -->
<!--                         </dl> -->
<!--                      <dl class="from_box_dl"> -->
<!--                             <dt><label for="tel" >性别：</label></dt> -->
<!--                             <dd> -->
<!--                             <select  id="gender" name="gender" class="from_box_dl" style='width:400px;height:30px;font-size: 16px' > -->
<!--                              <option value='男'>男</option> -->
<!--                              <option value='女'>女</option> -->
<!--                             </select> -->
<!--                             </dd> -->
<!--                         </dl> -->
                      <dl class="from_box_dl">
                            <dt><label for="psw1" >汉字姓：</label></dt>
                            <dd><input type="text" id="x" name="x" onchange="getPinyinX(this)" class="input_user"/></dd>
                        </dl>
                         <dl class="from_box_dl">
                            <dt><label for="psw1" >汉字名：</label></dt>
                            <dd><input type="text" id="m" name="m"  onchange="getPinyinM(this)" class="input_user"/></dd>
                        </dl>
                        <dl class="from_box_dl">
                            <dt><label for="name" >拼音姓：</label></dt>
                            <dd><input type="text" id="pyX" name="pyX" class="input_psw" /></dd>
                        </dl>
                        <dl class="from_box_dl">
                            <dt><label for="psw" >拼音名：</label></dt>
                            <dd><input type="text" id="pyM" name="pyM" class="input_psw" /></dd>
                        </dl>
<!--                        <dl class="from_box_dl">  -->
<!--                              <dt><label for="tel" >民族：</label></dt>  -->
<!--                              <dd> -->
<!--                              <select  id="nation" name="nation" class="from_box_dl" style='width:400px;height:30px;font-size: 16px text-align:center' > -->
                             
<!-- <option value='汉族' >汉族</option> -->
<!-- <option value='朝鲜族' >朝鲜族</option> -->
<!-- <option value='回族' >回族</option> -->
<!-- <option value='满族' >满族</option> -->
<!-- <option value='蒙古族' >蒙古族</option> -->
<!-- <option value='锡伯族' >锡伯族</option> -->
<!-- <option value='土家族' >土家族</option> -->
<!-- <option value='土族' >土族</option> -->
<!-- <option value='门巴族' >门巴族</option> -->
<!-- <option value='水族' >水族</option> -->
<!-- <option value='毛南族' >毛南族</option> -->
<!-- <option value='乌孜别克族' >乌孜别克族</option> -->
<!-- <option value='布依族' >布依族</option> -->
<!-- <option value='布朗族' >布朗族</option> -->
<!-- <option value='东乡族' >东乡族</option> -->
<!-- <option value='仡佬族' >仡佬族</option> -->
<!-- <option value='仫佬族' >仫佬族</option> -->
<!-- <option value='白族' >白族</option> -->
<!-- <option value='达斡尔族' >达斡尔族</option> -->
<!-- <option value='佤族' >佤族</option> -->
<!-- <option value='壮族' >壮族</option> -->
<!-- <option value='羌族' >羌族</option> -->
<!-- <option value='阿昌族' >阿昌族</option> -->
<!-- <option value='纳西族' >纳西族</option> -->
<!-- <option value='拉祜族' >拉祜族</option> -->
<!-- <option value='苗族' >苗族</option> -->
<!-- <option value='侗族' >侗族</option> -->
<!-- <option value='京族' >京族</option> -->
<!-- <option value='柯尔克孜族' >柯尔克孜族</option> -->
<!-- <option value='哈尼族' >哈尼族</option> -->
<!-- <option value='哈萨克族' >哈萨克族</option> -->
<!-- <option value='保安族' >保安族</option> -->
<!-- <option value='俄罗斯族' >俄罗斯族</option> -->
<!-- <option value='独龙族' >独龙族</option> -->
<!-- <option value='怒族' >怒族</option> -->
<!-- <option value='珞巴族' >珞巴族</option> -->
<!-- <option value='高山族' >高山族</option> -->
<!-- <option value='基诺族' >基诺族</option> -->
<!-- <option value='鄂伦春族' >鄂伦春族</option> -->
<!-- <option value='鄂温克族' >鄂温克族</option> -->
<!-- <option value='维吾尔族' >维吾尔族</option> -->
<!-- <option value='塔吉克族' >塔吉克族</option> -->
<!-- <option value='塔塔尔族' >塔塔尔族</option> -->
<!-- <option value='景颇族' >景颇族</option> -->
<!-- <option value='傣族' >傣族</option> -->
<!-- <option value='傈僳族' >傈僳族</option> -->
<!-- <option value='畲族' >畲族</option> -->
<!-- <option value='普米族' >普米族</option> -->
<!-- <option value='裕固族' >裕固族</option> -->
<!-- <option value='瑶族' >瑶族</option> -->
<!-- <option value='赫哲族' >赫哲族</option> -->
<!-- <option value='撒拉族' >撒拉族</option> -->
<!-- <option value='德昂族' >德昂族</option> -->
<!-- <option value='黎族' >黎族</option> -->
<!-- <option value='藏族' >藏族</option> -->
<!-- <option value='彝族' >彝族</option> -->
<!--                             </select> -->
<!--                              </dd>  -->
<!--                         </dl>  -->
<!--                          <dl class="from_box_dl">  -->
<!--                              <dt><label for="tel" >出生日期：</label></dt>  -->
<!--                              <dd><input type="text" id="csrq" name="csrq" class="phone_" class="Wdate easyui-validatebox" onclick="WdatePicker({dateFmt:'yyyy/MM/dd'});"/></dd> -->
<!--                          </dl>  -->
<!--                          <dl class="from_box_dl">  -->
<!--                              <dt><label for="tel" >户口所在地：</label></dt>  -->
<!--                              <dd><input type="text" id="hkszd" name="hkszd" class="phone_"/></dd>  -->
<!--                          </dl>  -->
<!--                          <dl class="from_box_dl">  -->
<!--                              <dt><label for="tel" >出生地：</label></dt>  -->
<!--                              <dd><input type="text" id="csd" name="csd" class="phone_"/></dd>  -->
<!--                          </dl>  -->
                         <dl class="from_box_dl"> 
                             <dt><label for="tel" >紧急联系人姓名：</label></dt> 
                             <dd><input type="text" id="urgentLink" name="urgentLink" class="input_user"/></dd> 
                         </dl> 
                         <dl class="from_box_dl"> 
                             <dt><label for="tel" >紧急联系人电话：</label></dt> 
                             <dd><input type="text" id="linkPhone" name="linkPhone" class="phone_"/></dd> 
                         </dl> 
<!--                        <dl class="from_box_dl">  -->
<!--                              <dt><label for="tel" >通讯地址：</label></dt>  -->
<!--                              <dd><input type="text" id="address" name="address" class="phone_"/></dd>  -->
<!--                         </dl>  -->
<!--                         <dl class="from_box_dl">  -->
<!--                             <dt><label for="tel" >QQ：</label></dt>  -->
<!--                             <dd><input type="text" id="qq" name="qq" class="phone_"/></dd>  -->
<!--                         </dl>  -->
<!--                          <dl class="from_box_dl">  -->
<!--                              <dt><label for="tel" >微信：</label></dt>  -->
<!--                             <dd><input type="text" id="weChat" name="weChat" class="phone_"/></dd>  -->
<!--                         </dl>  -->
<!--                          <dl class="from_box_dl">  -->
<!--                             <dt><label for="tel" >邮箱：</label></dt>  -->
<!--                             <dd><input type="text" id="email" name="email" class="phone_"/></dd>  -->
<!--                         </dl>  -->
                        <div style="text-align:center; padding-bottom:15px;padding-top:15px">
                            
                            <a href="#" class="btn_sty btn_blue" id="completeRegist" onclick="completeRegist();">保存</a>
<!--                             <a href="login_.jsp" class="btn_sty btn_orange" onclick="cancelbtn('login_pop')">取  消</a> -->
                        </div>
                     </div>
                </div>
            </div>
        </div>
    </div>
    
</div>



<script type="text/javascript">
            (function () {

                //引用的JS文件路径
                var oceaniframejs = "http://218.27.41.243:81/js/iframautoht.js",
                    //引入的ifram路径
                    oceanIframsrc = "http://218.27.41.243:81/ThirdPage/ReferPage/setmidifr";
                function Createifrm(ifrid) {
                    var ifr = null;
                    ifr = document.getElementById(ifrid);
                    if (!ifr) {
                        ifr = document.createElement("iframe");
                        ifr.id = ifrid;
                    }
                    ifr.src = oceanIframsrc;
                    ifr.style.display = "none";

                    document.body.appendChild(ifr);
                };

                function AddJsFile(id, newJS) {
                    var oldjs = null;
                    var t = null;
                    var oldjs = document.getElementById(id);
                    if (oldjs) oldjs.parentNode.removeChild(oldjs);
                    var scriptObj = document.createElement("script");
                    scriptObj.src = newJS;
                    scriptObj.type = "text/javascript";
                    scriptObj.id = id;
                    document.getElementsByTagName("head")[0].appendChild(scriptObj);
                };
                AddJsFile("ocean_ifrmjs", oceaniframejs); Createifrm("myifr");

               

            })();


    </script>


</body>
</html>
