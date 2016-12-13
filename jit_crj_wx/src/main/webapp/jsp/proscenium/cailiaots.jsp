<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="/WEB-INF/tld/c.tld" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
//微信用户唯一标识
String openid = request.getParameter("openid");
String els = request.getParameter("els");
String Strid = request.getParameter("Strid");
%> 
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta name="viewport" content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0"/>
    <meta name="format-detection" content="telephone=no,email=no,date=no,address=no">
    <title>提示材料</title>
    <link href="style/contents.css" rel="stylesheet" type="text/css" />
    <link href="css/aui.2.0.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="js/jquery.1.8.2.min.js"></script>
    <script type="text/javascript">
var path= '<%=path%>';
var openid='<%=openid%>';
var els='<%=els%>';
var Strid='<%=Strid%>';
</script>
    <script type="text/javascript">
        $(document).ready(function() {
           var gaflag=getCookie('gaflag');
           var twflag=getCookie('twflag');
           if(gaflag=='1'){
        	   $("#gaqzcl").show();
           }
       if(twflag=='1'){
    	   
    	   $("#twqzcl").show();
           }
        });
    </script>
    <script type="text/javascript">
    function hide(qzlx,num){
    	var qzlxid= '#'+qzlx.id;
    	var c =$(qzlxid).val();
    	var text ='#'+ qzlx.id+num;
    	if($(qzlxid).val()=='查看'){
    		$(text).show();
    		$(qzlxid).val('隐藏');
    	}else{
    		$(text).hide();
    		$(qzlxid).val('查看');
    		
    	}
    	
    	
    }

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
		location ="wx_tsxx.jsp?Strid="+Strid+"&openid="+openid;
	  }
	function getCookie(name)
	{
	var arr,reg=new RegExp("(^| )"+name+"=([^;]*)(;|$)");
	if(arr=document.cookie.match(reg))
	return unescape(arr[2]);
	else
	return null;
	}
	</script>
    
    <style>
	html {background:#f5f5f5}
        .icon_select { position: relative; padding-right: 2rem; background: url("image/select_del.png") no-repeat 95% center; }
		.icon_select p { padding-right:10%;}
        .icon_select_vi { position: absolute; right: 0.57rem; top: 50%; margin: -10px; }
    </style>
</head>
<body>
	<div id="wrap">
    	<header id="header" onClick="laod();"><h3>签注所需材料</h3></header>
        <section class="aui-content-padded">
            <div class="aui-card-list">
                <div class="aui-content aui-margin-b-15">
                   
                    <div id ="gaqzcl" style="display: none">
                     <ul class="aui-list aui-media-list">
                        <li class="aui-list-item aui-list-item-middle">
                            <div class="aui-media-list-item-inner">
                                <div id="hzss">
                                                                    港澳通行证<a>旅游签注 </a>        <input type = "button" onclick="hide(this,1)" id="gaqzlv" value="查看" />
                                    <p id="gaqzlv1" style="display: none">1.有效往来港澳通行证;2.军人、登记备案的国家工作人员，应当提交本人所属单位或者上级主管单位按照人事管理权限审批后出具的同意办理出入境证件的函</p>
                                </div>
                            </div>
                        </li>
                        <li class="aui-list-item aui-list-item-middle">
                                <div  id="gass">
                                    港澳通行证<a>探亲签注</a>  <input type = "button" onclick="hide(this,1)" id="gaqztq" value="查看" />
                                    <div id = "gaqztq1" style="display: none">
                                    <p> <a id="gdj" onclick="hides(this,1)">亲属在香港定居</a></p><p id="gdj1">提交香港居民身份证、港澳居民来往内地通行证复印件，亲属是外国籍的，提交香港永久性居民身份证、外国护照复印件；交验亲属关系证明原件，并提交复印件。两年内再次申请赴香港或者澳门探望同一亲属（配偶和姻亲除外）的，免交亲属关系证明。</p>
                                    <p> <a id="gjz" onclick="hides(this,1)">亲属在香港长期居住</a></p><p id="gdj1">提交香港居民身份证、有效期一年以上的有效香港进入许可以及有效旅行证件复印件；交验亲属关系证明原件，并提交复印件。两年内再次申请赴香港或者澳门探望同一亲属（配偶和姻亲除外）的，免交亲属关系证明。</p>
                                     <p> <a id="gjy" onclick="hides(this,1)">亲属在香港就业、就学</a></p><p id="gjy1">亲属在香港就业、就学的，提交相应香港进入许可复印件以及有效旅行证件复印件，交验亲属关系证明原件，并提交复印件。两年内再次申请赴香港或者澳门探望同一亲属（配偶和姻亲除外）的，免交亲属关系证明。</p>
                                     <p> <a id="adj" onclick="hides(this,1)">亲属在澳门定居</a></p><p id="adj1">提交澳门居民身份证、港澳居民来往内地通行证复印件，亲属是外国籍的，提交澳门永久性居民身份证、外国护照复印件，交验亲属关系证明原件，并提交复印件。两年内再次申请赴香港或者澳门探望同一亲属（配偶和姻亲除外）的，免交亲属关系证明。</p>
                                     <p> <a id="ajz" onclick="hides(this,1)">亲属在澳门长期居住</a></p><p id="ajz1">提交澳门居民身份证或者澳门特别逗留证、有效旅行证件复印件，交验亲属关系证明原件，并提交复印件。两年内再次申请赴香港或者澳门探望同一亲属（配偶和姻亲除外）的，免交亲属关系证明。</p>
                                     <p> <a id="ajy" onclick="hides(this,1)">亲属在澳门就业</a></p><p id="ajy1">提交澳门主管部门批准在澳门就业的证明文件复印件、有效旅行证件复印件，交验亲属关系证明原件，并提交复印件。两年内再次申请赴香港或者澳门探望同一亲属（配偶和姻亲除外）的，免交亲属关系证明。</p>
                                       <p> <a id="ajx" onclick="hides(this,1)">亲属在澳门就学</a></p><p id="ajx1">提交澳门主管部门批准在澳门就业的证明文件复印件、有效旅行证件复印件，交验亲属关系证明原件，并提交复印件。两年内再次申请赴香港或者澳门探望同一亲属（配偶和姻亲除外）的，免交亲属关系证明。</p>
                                    
                                </div>
                            </div>
                        </li>
                        <li class="aui-list-item aui-list-item-middle">
                                <div  id="gass">
                                    港澳通行证<a>逗留签注</a><input type = "button" onclick="hide(this,1)" id="gaqzdl" value="查看" />
                                    <div id = "gaqzdl1" style="display: none">
                                    <p> <a >赴香港随任</a></p><p>验相应（随任）的入境许可原件，提交复印件，有效的港澳通行证</p>
                                    <p> <a >赴香港就学</a></p><p>交验相应（就学）的入境许可原件，提交复印件，有效的港澳通行证。</p>
                                     <p> <a >赴香港就业</a></p><p>交验相应（就业）的入境许可原件，提交复印件，有效的港澳通行证。</p>
                                     <p> <a >赴香港居留</a></p><p>交验相应（居留）的入境许可原件，提交复印件，有效的港澳通行证。</p>
                                     <p> <a >赴香港培训</a></p><p>交验相应（培训）的入境许可原件，提交复印件，有效的港澳通行证。</p>
                                     <p> <a >赴香港受养人</a></p><p>交验相应（受养人）的入境许可原件，提交复印件，有效的港澳通行证。</p>
                                       <p> <a >赴澳门随任</a></p><p>须提交中央人民政府驻澳门特别行政区联络办公室人事部出具的《驻澳门内派人员未成年子女随任身份证明表》，有效的港澳通行证。</p>
                                       <p> <a >赴澳门随任</a></p><p>须交验澳门治安警察局出入境事务厅出具的《“外地雇员逗留许可”名单》或者澳门人力资源办公室、澳门社会文化司出具的有申请人姓名的批准文件原件，并提交复印件；通过劳务经营公司申请赴澳门就业，还须提交有关地方商务主管部门出具的《对澳门特别行政区劳务合作项目审核表》复印件；逗留签注有效期届满，继续申请逗留签注的，提交澳门治安警察局出入境事务厅出具的有申请人姓名的续期名单表，或者交验澳门人力资源办公室、澳门社会文化司出具的有申请人姓名的批准文件原件，并提交复印件，有效期内的港澳通行证。</p>
                                       <p> <a >赴澳门就学</a></p><p>须交验澳门高等教育辅助办公室出具的《确认录取证明书》及澳门高等院校录取通知书原件，并提交复印件；逗留签注有效期届满，继续申请逗留签注的，提交澳门高等院校出具的在学证明原件，有效期内的港澳通行证。</p>
                                </div>
                            </div>
                        </li>
                        <li class="aui-list-item aui-list-item-middle">
                            <div >
                                <div  id="gass">
                                    港澳通行证<a>商务签注</a> <input type = "button" onclick="hide(this,1)" id="gaqzsw" value="查看" />
                                    <p id="gaqzsw1" style="display: none"> 须交验营业执照副本或者有关登记证书、税务登记证书并提交复印件；企业机构人员还须提交企业机构为本人交纳社会保险的凭证（申请多次商务签注的，须连续6个月以上缴纳社会保险）或者本人属于该企业机构的有关证明文件；企业机构出具的赴港澳商务活动事由说明。企业机构在备案时已提交过上述有关证明材料的，企业机构人员在备案有效期内申请商务签注时无须重复提交有关证明材料。</p>
                                </div>
                            </div>
                        </li>
                         <li class="aui-list-item aui-list-item-middle">
                            <div >
                                <div  id="gass">
                                    港澳通行证<a>其他签注</a>  <input type = "button" onclick="hide(this,1)" id="gaqzqt" value="查看" />
                                    <div id = "gaqzqt1" style="display: none">
                                    <p> 治病:申请事由（治病）相关的申请材料和有效的港澳通行证</p>
                                     <p> 奔丧:申请事由（奔丧）相关的申请材料和有效的港澳通行证</p>
                                      <p> 探望危重病人:申请事由（探望危重病人）相关的申请材料和有效的港澳通行证</p>
                                       <p> 诉讼:申请事由（诉讼）相关的申请材料和有效的港澳通行证</p>
                                        <p> 应试:申请事由（应试）相关的申请材料和有效的港澳通行证</p>
                                         <p> 学术交流:申请事由（学术交流）相关的申请材料和有效的港澳通行证</p>
                                          <p> 定居国外的中国公民:申请事由相关材料，中国护照和定居国外证明原件并提交复印件。</p>
                                          </div>
                                </div>
                            </div>
                        </li>
                        </ul>
                        </div>
                         </section>
                         <section class="aui-content-padded">
                        <div id = "twqzcl" style="display: none">
                         <ul class="aui-list aui-media-list">
                        <li class="aui-list-item aui-list-item-middle">
                            <div >
                                <div  id="gass">
                                    台湾通行证<a>旅游签注</a> <input type = "button" onclick="hide(this,1)" id="twlv" value="查看" />
                                    <div id="twlv1" style="display: none">
                                    <p> <a >长春市居民</a></p><p>往来台湾通行证</p>
                                    <p> <a >非长春市及外省户籍居民</a></p><p>提交往来台湾通行证，根据下面两种情况准备相应材料：，1、长春市户籍人员的非本市户籍的配偶、未满十六周岁的子女提交本人户口薄、身份证及配偶或父（母）的户口本，身份证及亲属关系证明材料。2、非长春市户籍暂（居）住在长春市所辖区的人员及其配偶、未满十六周岁的子女提交本人户口本、身份证及社保证明出具的在暂（居）住地连续一年以上缴纳社会保险的证明或暂（居）住地居住一年以上的居住证明。其配偶及子女还需提交居（暂）住地公安机关出具的在暂（居）住地居住6个月（含）以上的居住证明，入户口本不能证明亲属关系，则需提交其他证明材料。3、在我省全日制院校就读的学生及其配偶、未满十六周岁的子女提交本人或集体户口本、身份证及所在学校出具的在校学习证明。其配偶、子女还需提交（暂）居住地公安机关出具的公安机关出具的在暂（居）住地居住六个月（含）以上的居住证明，如户口本不能证明亲属关系，则需提交其他证明材料。</p>
                                </div>
                                </div>
                            </div>
                        </li>
                           <li class="aui-list-item aui-list-item-middle">
                            <div >
                                <div  id="gass">
                                    台湾通行证<a>探亲签注</a> <input type = "button" onclick="hide(this,1)" id="twtq" value="查看" />
                                    <div id="twtq1" style="display: none">
                                    <p> <a >长春市居民</a></p><p>往来台湾通行证、台湾出入境业务主管部门签发的探亲类或居留类入台许可</p>
                                    <p> <a >非长春市及外省户籍居民</a></p><p>除按照流动人员办证提交的材料外，还须提交往来台湾通行证、台湾出入境业务主管部门签发的探亲类或居留类入台许可。</p>
                               </div>
                                </div>
                            </div>
                        </li>
                                                                           <li class="aui-list-item aui-list-item-middle">
                            <div >
                                <div  id="gass">
                                    台湾通行证<a>定居签注</a>  <input type = "button" onclick="hide(this,1)" id="twdj" value="查看" />
                                     <div  id="twdj1" style="display: none">
                                    <p> <a >长春市居民</a></p><p>往来台湾通行证、台湾出入境业务主管部门签发的定居类入台许可</p>
                                    <p> <a >非长春市及外省户籍居民</a></p><p>除按照流动人员办证提交的材料外，还须提交往来台湾通行证、台湾出入境业务主管部门签发的定居类入台许可</p>
                                </div>
                                </div>
                            </div>
                        </li>
                                                   <li class="aui-list-item aui-list-item-middle">
                            <div >
                                <div  id="gass">
                                    台湾通行证<a>应邀签注 </a><input type = "button" onclick="hide(this,1)" id="twyy" value="查看" />
                                    <div  id="twyy1" style="display: none">
                                    <p> <a >长春市居民</a></p><p>提交国务院台办及其授权的地方台办出具的“赴台批件”、往来台湾通行证</p>
                                    <p> <a >非长春市及外省户籍居民</a></p><p>除按照流动人员办证提交的材料外，还须提交往来台湾通行证、台湾出入境业务主管部门签发的探亲类或居留类入台许可。</p>
                               </div>
                                </div>
                            </div>
                        </li>
                                                                           <li class="aui-list-item aui-list-item-middle">
                            <div >
                                <div  id="gass">
                                    台湾通行证<a>商务签注</a>  <input type = "button" onclick="hide(this,1)" id="twsw" value="查看" />
                                    <div  id="twsw1" style="display: none">
                                    <p> <a >长春市居民</a></p><p>提交国务院台办及其授权的地方台办出具的“应邀赴台立项的批复”、往来台湾通行证</p>
                                    <p> <a >非长春市及外省户籍居民</a></p><p>台湾证、经吉林省台办盖章确认的“立项批复”复印件</p>
                                </div>
                                </div>
                            </div>
                        </li>
                                                                           <li class="aui-list-item aui-list-item-middle">
                            <div >
                                <div  id="gass">
                                    台湾通行证<a>学习签注</a> <input type = "button" onclick="hide(this,1)" id="twxx" value="查看" />
                                    <div  id="twxx1" style="display: none">
                                    <p> <a >长春市居民</a></p><p>往来台湾通行证、开放赴台就学省份的设区以上台办出具的《赴台学习证明》</p>
                                    <p> <a >非长春市及外省户籍居民</a></p><p>除按照流动人员办证提交的材料外，还须提交往来台湾通行证、《赴台学习证明》。</p>
                                </div>
                                </div>
                            </div>
                        </li>
                        
                                                                                                   <li class="aui-list-item aui-list-item-middle">
                            <div >
                                <div  id="gass">
                                    台湾通行证乘务签注  <input type = "button" onclick="hide(this,1)" id="twcw" value="查看" />
                                    <p id="twcw1" style="display: none"> 往来台湾通行证、国务院台办及其授权的地方台办出具的《赴台批件》</p>
                                </div>
                            </div>
                        </li>
                                                                                                   <li class="aui-list-item aui-list-item-middle">
                            <div >
                                <div  id="gass">
                                    台湾通行证其他签注 <input type = "button" onclick="hide(this,1)" id="twqt" value="查看" />
                                    <div id="twqt1" style="display: none">
                                    <p> <a >长春市居民</a></p><p>往来台湾通行证、台湾出入境业务主管部门签发的相关事由相应的入台许可</p>
                                    <p> <a >非长春市及外省户籍居民</a></p><p>除按照流动人员办证提交的材料外，还须提交往来台湾通行证、台湾出入境业务主管部门签发的相关事由相应的入台许可</p>
                                </div>
                                </div>
                            </div>
                        </li>

                         </ul>
                        </div>
                   
<!--                 </div> -->
<!--             </div> -->
        </section>
        <div class="aui-content-padded">
            <p class="padding_top" ><div class="aui-btn aui-btn-blue aui-btn-block" onClick="submit();">返  回</div></p>
        </div>
    </div>
</body>
</html>