function getLength(s){
 var len = 0;
   for(i=0;i<s.length;i++){
     var c = s.substr(i,1);
     var ts = escape(c);
     if(ts.substring(0,2) == "%u") {
      len+=2;
     } else {
      len+=1;
     }
   }
   return len;
}
function keydownevent( alowPoint, alowRail ){
        // 小键盘上面的数字键分别是96～105，普通数字键的分别是48～57
        // 小数点是190
        // 小数点是46
        // 横杆 - 的值是189
        // 横杆 - 的值是45
//        alert( window.event.keyCode );
        eventKeyCode = window.event.keyCode;
        var allowKeyCodeArray = new Array();
      
        allowKeyCodeArray[allowKeyCodeArray.length] = 96;
        allowKeyCodeArray[allowKeyCodeArray.length] = 97;
        allowKeyCodeArray[allowKeyCodeArray.length] = 98;
        allowKeyCodeArray[allowKeyCodeArray.length] = 99;
        allowKeyCodeArray[allowKeyCodeArray.length] = 100;
        allowKeyCodeArray[allowKeyCodeArray.length] = 101;
        allowKeyCodeArray[allowKeyCodeArray.length] = 102;
        allowKeyCodeArray[allowKeyCodeArray.length] = 103;
        allowKeyCodeArray[allowKeyCodeArray.length] = 104;
        allowKeyCodeArray[allowKeyCodeArray.length] = 105;

        allowKeyCodeArray[allowKeyCodeArray.length] = 48;
        allowKeyCodeArray[allowKeyCodeArray.length] = 49;
        allowKeyCodeArray[allowKeyCodeArray.length] = 50;
        allowKeyCodeArray[allowKeyCodeArray.length] = 51;
        allowKeyCodeArray[allowKeyCodeArray.length] = 52;
        allowKeyCodeArray[allowKeyCodeArray.length] = 53;
        allowKeyCodeArray[allowKeyCodeArray.length] = 54;
        allowKeyCodeArray[allowKeyCodeArray.length] = 55;
        allowKeyCodeArray[allowKeyCodeArray.length] = 56;
        allowKeyCodeArray[allowKeyCodeArray.length] = 57;
        
        if( alowPoint == true ){
            allowKeyCodeArray[allowKeyCodeArray.length] = 46;
         allowKeyCodeArray[allowKeyCodeArray.length] = 110;
            allowKeyCodeArray[allowKeyCodeArray.length] = 190;
        }

        if( alowRail == true ){
              allowKeyCodeArray[allowKeyCodeArray.length] = 45;
         allowKeyCodeArray[allowKeyCodeArray.length] = 109;        
            allowKeyCodeArray[allowKeyCodeArray.length] = 189;        
        }        
        
        // 回车
        allowKeyCodeArray[allowKeyCodeArray.length] = 13; 
        // Back Del
        allowKeyCodeArray[allowKeyCodeArray.length] = 8;
        // Del
//        allowKeyCodeArray[allowKeyCodeArray.length] = 46;
        
        var isLegal = false;
        for( var i = 0; i < allowKeyCodeArray.length; i++ ){
            if( eventKeyCode == allowKeyCodeArray[i] ){
                isLegal = true;
                break;
            }
        }
        
        if( isLegal == true ){
            return true;
        } else {
            window.event.returnValue = 0;
            return false;
        }

}


 

//调用的时候：onkeydown="return keydownevent( true, false );" value="0" style='ime-mode:Disabled; width:300px' onpaste='return false' ondragenter='return false'

//style='ime-mode:Disabled; 关闭输入法；

//onpaste='return false' ；禁止粘贴；

//ondragenter='return false'；禁止拖动；
 

/*去空格*/
function trim(str) {
    var returnstr="";
 
    if(str == null || str == "")
       return "";
    var i = 0;
    for(i = 0;i<str.length;i++) {
        if(str.charAt(i) == ' '){
            continue;
         }
        break;
    }
    str = str.substring(i,str.length);
    if(str =="")
       return "";
    for(i=str.length-1;i>=0;i--) {
        if(str.charAt(i)==' '){
            continue;
         }
         break;
     }
     returnstr = str.substring(0,i+1);
     return returnstr;
  }

/*转变成数字格式*/
function formatNumber(num,exponent) {
	  if (exponent<1) return num;
	  var str = num.toString();
	  if (str.indexOf(".")!=-1) {
	    if (str.split(".")[1].length>=exponent) {
	      return str;
	    } else {
	      return formatNumber(str+"0",exponent);
	    }
	  } else {
	    return formatNumber(str+".0",exponent);
	  }
}

function isReal(theStr,intLen,decLen) { //(输入值,整数部分长度,小数部分长度)
	 theStr = trim(theStr);
	
	 if(theStr.indexOf(" ")>0){
	   return "数字中间不允许出现空格";
	 }
	 if(isNaN(theStr*1))
      return "数字输入不合法";
	 
	 var v_ret=0;
	 var ret_mesg="ok";
	 
	 if (theStr.substring(0,1)=='-')   //负数
         theStr = theStr.substring(1);
     if(theStr.substring(0,1)=='.'){
     	theStr = '0'+theStr;
    }
    if (!isEmpty(theStr)) {
    var dot1st = theStr.indexOf('.');
    var dot2nd = theStr.lastIndexOf('.');

    if (dot1st == -1) {
        if (!isInt(theStr)) v_ret=1;
        else if (theStr.length>intLen) v_ret=2;
        else v_ret=0;
    }
    else if (dot1st != dot2nd) v_ret=1;
    else if (dot1st==0) v_ret=1;
    else {
         var intPart = theStr.substring(0,dot1st);
         var decPart = theStr.substring(dot2nd+1);
         if (intPart.length > intLen) v_ret=2;
         else if (decPart.length > decLen) v_ret=3;
         else if (!isInt(intPart) || !isInt(decPart)) v_ret=1;
         else if ( isEmpty(decPart)) v_ret=1;
         else v_ret=0;
    }
   }
    if (v_ret==0) ret_mesg="ok";
    else if (v_ret==1) ret_mesg="数字输入不合法";
    else if (v_ret==2) ret_mesg="整数部分超长(最多"+intLen+"位)";
    else if (v_ret==3) ret_mesg="小数部分超长(最多"+decLen+"位)";
    else  ret_mesg="检查出错";

    return ret_mesg;
}

var space = "                                                                ";
var zero = "000000000000000000000000000000000000000000000000000000000000000";
function exact(val,len,decimal) {
	var nav = 0;

	if(decimal == null) decimal = 2;
	var scale = Math.pow(10, decimal);
	var t = Math.round(parseFloat(val) * scale);
	if(t < 0){ nav = 1; t = 0 - t; }
	var tStr = "" + t;
	if(tStr == "NaN") return "";

	if(tStr.length <= decimal) {
	  tStr = zero.substr(0,decimal - tStr.length + 1) + tStr;
	}

  var str = "";
  if(decimal > 0) {
  	str = "." + tStr.substring(tStr.length - decimal,tStr.length);
  }

	for(var i=tStr.length-decimal-1, j=0 ; i>=0; i--) {
		if(++j > 3) {
			str = "," + str;
			j = 1;
		}
		str = tStr.substring(i, i+1) + str;
	}
	if(nav == 1) str = "-" + str;
	str = space.substr(0,len - str.length + 1) + str;
	return str;
}

function toExact(value,len,dec) {
	var val = trimNum(value);
	if((ret = isReal(val,len - dec,dec)) != "ok") { alert(ret);  return false; }
	ob.value = exact(val,ob.size,dec);
	return true;
}

   /*判断是否是日期，格式为YYYYMMDD*/
   function isDate(theStr) {
         if (theStr.length!=8)   return false;
          var y = theStr.substring(0,4);
          var m = theStr.substring(4,6); if(m/1==0||m/1>12) return false;
          var d = theStr.substring(6,8);
          var maxDays = 31;
          if (isInt(m)==false || isInt(d)==false || isInt(y) ==false) {
              return(false);}
          else if (m==4 || m==6 || m==9 || m==11) maxDays = 30;
          else if (m==2) {
                  if (y%4>0) maxDays= 28;
                  else if (y % 100 ==0 && y % 400 >0) maxDays = 28;
                  else  maxDays = 29;
                }
         if (isBetween(d,1,maxDays) == false) { return(false);}
         else {return(true);}

   }
   /*判断是否是时间格式，格式为：HH:MM:DD*/
   function isTime(theStr) {
     var colonDex = theStr.indexOf(':');
     if ((colonDex < 1) || (colonDex > 2)) {return(false);}
     else {
         var hh = theStr.substring(0,colonDex);
         var ss = theStr.substring(colonDex+1,theStr.length);
         if ((hh.length<1) || (hh.length>2) || (!isInt(hh))) {return(false);}
         else if ((ss.length<1) || (ss.length>2) || (!isInt(ss))) {return(false);}
         else if ((!isBetween(hh,0,23)) || (!isBetween(ss,0,59))) {return(false);}
         else {return(true);}
      }
    }

    function isDigit(theNum) {
       var theMask = '0123456789';
       if (isEmpty(theNum)) return(false);
       else if (theMask.indexOf(theNum) == -1) return(false);
       return(true);
    }
     /*判断是否为空*/
    function isEmpty(str) {
      str = trim(str);
       if ((str == null) || (str.length == 0)) {
		   return true;
		} else {
			return false;
		}
    }
    /*判断是否是int型*/
    function isInt(theStr) {
       var flag = true;
       theStr = trim(theStr);
       if(theStr.indexOf(" ")>0){
     	 return false;
       }
       if(isNaN(theStr*1))
         return false; 
       if (isEmpty(theStr))  flag=true;
       else
        {      if (theStr.substring(0,1)=='-')  {
       	 	return false; 
        	}
             // theStr = theStr.substring(1);
          for (var i=0;i<theStr.length;i++){
           if (isDigit(theStr.substring(i,i+1))==false) {
              flag = false;
              break;
              }
           }
         }
         return flag;
     }
  /*对金额数字去掉金额中逗号*/
function trimNum(str){
  var returnstr="";
  str = "" + str;
  for(var i = 0;i<str.length;i++)
  {
    if(str.charAt(i) != ' ' && str.charAt(i) != ',')
    {
        returnstr += str.charAt(i);
    }
  }
  return returnstr;
}
/*屏蔽键盘，只能输入number型的数据，不能屏蔽输入法*/
function inputNumber(){
	if (event.keyCode < 45 || event.keyCode > 57 || event.keyCode == 47) event.returnValue = false;
}
/*判断是否为空*/
function toNumber(ob) {
	var ts = trimNum(ob.value);
	if (ob.readOnly == false ) ob.value = ts;
	ob.select();
}

function toNumber2(ob) {
	var ts = trimNum(ob.value);
	if (ob.readOnly == false ) ob.value = ts;
}

function allToNumber() {
  var allInputs = document.all.H7D4F6Z;
  if(allInputs == null) return;
  if(allInputs.length == null) {
    toNumber2(allInputs);
  } else {
    for (var i = 0; i < allInputs.length; i++) {
      toNumber2(allInputs(i));
    }

  }
}

function isDateValid1(str){
  if(str.length < 8) return false;
  var sy = str.substring(0,4);
  var iy = sy/1;
  var sm =str.substring(4,6);
  var im = sm/1;
  var sd = str.substring(6,8);
  var id = sd/1;
  var month1 = new Array(31,28,31,30,31,30,31,31,30,31,30,31);
  var month2 = new Array(31,29,31,30,31,30,31,31,30,31,30,31);
  if((iy%4 == 0)||(iy%400 ==0)||(iy%100 == 0)){
    if((id <= month2[im-1])&&(id >=1 ))
   	  return true;
    else
      return false;
  }
  else{
    if((id <= month1[im-1])&&(id >= 1))
   	  return true;
   else
      return false;
  }
}
function isNumberCode(str){
 str = trim(str);
  var len;
  len = str.length;
  for(var i=0;i<len;i++)
  {
      if((str.charAt(i) < '0') || (str.charAt(i) > '9'))
      {
        return false;
      }
  }
  return true;
}
function trimDate(str,len) {
       if (len==8 && str.length!=10) return str;
       if (len==6 && str.length!=7) return str;
       if (len==6)
         return str.substring(0,4)+str.substring(5,7);
       else
         return str.substring(0,4)+str.substring(5,7)+str.substring(8,10);
}

function isReportDateValid(str){
  if(isNaN(str)){
    return false;
  }
  if(!isNumberCode(str)){
    return false;
  }
  var sy = str.substring(0,4);
  var iy = sy/1;
  var sm = str.substring(4,6);
  var im = sm/1;
  if(str.length == 6){
    if (iy<1900 ||iy>3000 ||im>12){
       return false;
    }else{
       return true;
    }
  }else return false;
}

function checkAreaLength(v,l){
 var s= v;
 var temlen=0;
 var len = 0;
 for(i=0;i<s.length;i++){
     var c = s.substr(i,1);
     var ts = escape(c);

     if(ts.substring(0,2) == "%u"){
      len+=2;
      len+=temlen;
      temlen=0;
     }
     else if(ts.substring(0,3) == "%D7"){
      len+=2;
      len+=temlen;
      temlen=0;
     } 
     else if(ts.substring(0,3) == "%0D"){
      temlen+=1;
     }
     else if(ts.substring(0,3) == "%0A"){
         temlen+=1;
     }
     else if(ts.substring(0,3) == "%20"){
      temlen+=1;
     }
      else{
      len+=1;
      len+=temlen;
      temlen=0;
     }
   }
  if(len>l){
    return false;
  }
  return true;
}
function checkExpDate(vexp){
        var v_temp;
        var v_YYYYMMDD;

        if(isEmpty(vexp)){return false;}
        v_temp=vexp;
        if(v_temp=="RGF"){return true;}
        if(v_temp.length!=10){return false;}
        if(v_temp.indexOf('.')!=4){return false;}
        if(v_temp.lastIndexOf('.')!=7){return false;}
        v_YYYYMMDD=v_temp.substring(0,4)+v_temp.substring(5,7)+v_temp.substring(8,10);
        if(isDateValid1(v_YYYYMMDD)){return true;}
        return false;
}

function inputNumber() {
	if (event.keyCode < 46 || event.keyCode > 57 || event.keyCode == 47) event.returnValue = false;
}
function isWorkTime(theStr) {
      if(theStr.length != 4)
      	return false;
      var h = theStr.substring(0,2);
	  var m = theStr.substring(2,4);
	  if (!isBetween(h,0,23) || !isBetween(m,0,59))
		return false;
	  else 
	    return true;	
}
function inputInteger() {
	if (event.keyCode < 48 || event.keyCode > 57) event.returnValue = false;	
}
/*邮箱验证*/
function isEmail(str){
	  var reg = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
	  return reg.test(str);
}
/*身份证号验证*/
function checkIdcard(idcard){
idcard = trim(idcard);	
	
var Errors=new Array(
"身份证验证通过!",
"身份证号码位数不对!",
"身份证号码出生日期超出范围或含有非法字符!",
"身份证号码校验错误!",
"身份证地区非法!"
);
var area={11:"北京",12:"天津",13:"河北",14:"山西",15:"内蒙",21:"辽宁",22:"吉林",23:"黑龙",31:"上海",32:"江苏",33:"浙江",34:"安徽",35:"福建",36:"江西",37:"山东",41:"河南",42:"湖北",43:"湖南",44:"广东",45:"广西",46:"海南",50:"重庆",51:"四川",52:"贵州",53:"云南",54:"西藏",61:"陕西",62:"甘肃",63:"青海",64:"宁夏",65:"新疆",71:"台湾",81:"香港",82:"澳门",91:"国外"}; 
var Y,JYM;
var S,M;
var idcard_array = new Array();
idcard_array = idcard.split("");
//地区检验
if(area[parseInt(idcard.substr(0,2))]==null) return Errors[4];
//身份号码位数及格式检验
switch(idcard.length){
case 15:
if ( (parseInt(idcard.substr(6,2))+1900) % 4 == 0 || ((parseInt(idcard.substr(6,2))+1900) % 100 == 0 && (parseInt(idcard.substr(6,2))+1900) % 4 == 0 )){
ereg=/^[1-9][0-9]{5}[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|[1-2][0-9]))[0-9]{3}$/;//测试出生日期的合法性
} else {
ereg=/^[1-9][0-9]{5}[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|1[0-9]|2[0-8]))[0-9]{3}$/;//测试出生日期的合法性
}
if(ereg.test(idcard)) return Errors[0];
else return Errors[2];
break;
case 18:
//18位身份号码检测
//出生日期的合法性检查
//闰年月日:((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|[1-2][0-9]))
//平年月日:((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|1[0-9]|2[0-8]))
if ( parseInt(idcard.substr(6,4)) % 4 == 0 || (parseInt(idcard.substr(6,4)) % 100 == 0 && parseInt(idcard.substr(6,4))%4 == 0 )){
ereg=/^[1-9][0-9]{5}19[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|[1-2][0-9]))[0-9]{3}[0-9Xx]$/;//闰年出生日期的合法性正则表达式
} else {
ereg=/^[1-9][0-9]{5}19[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|1[0-9]|2[0-8]))[0-9]{3}[0-9Xx]$/;//平年出生日期的合法性正则表达式
}
if(ereg.test(idcard)){//测试出生日期的合法性
//计算校验位
S = (parseInt(idcard_array[0]) + parseInt(idcard_array[10])) * 7
+ (parseInt(idcard_array[1]) + parseInt(idcard_array[11])) * 9
+ (parseInt(idcard_array[2]) + parseInt(idcard_array[12])) * 10
+ (parseInt(idcard_array[3]) + parseInt(idcard_array[13])) * 5
+ (parseInt(idcard_array[4]) + parseInt(idcard_array[14])) * 8
+ (parseInt(idcard_array[5]) + parseInt(idcard_array[15])) * 4
+ (parseInt(idcard_array[6]) + parseInt(idcard_array[16])) * 2
+ parseInt(idcard_array[7]) * 1
+ parseInt(idcard_array[8]) * 6
+ parseInt(idcard_array[9]) * 3 ;
Y = S % 11;
M = "F";
JYM = "10X98765432";
M = JYM.substr(Y,1);//判断校验位
if(M == idcard_array[17]) return Errors[0]; //检测ID的校验位
else return Errors[3];
}
else return Errors[2];
break;
default:
return Errors[1];
break;
}
}


/*驾驶证号验证*/
function checkDrivercard(idcard){
idcard = trim(idcard);	
	
var Errors=new Array(
"驾驶证验证通过!",
"驾驶证号码位数不对!",
"驾驶证号码出生日期超出范围或含有非法字符!",
"驾驶证号码校验错误!",
"驾驶证地区非法!"
);
var area={11:"北京",12:"天津",13:"河北",14:"山西",15:"内蒙",21:"辽宁",22:"吉林",23:"黑龙",31:"上海",32:"江苏",33:"浙江",34:"安徽",35:"福建",36:"江西",37:"山东",41:"河南",42:"湖北",43:"湖南",44:"广东",45:"广西",46:"海南",50:"重庆",51:"四川",52:"贵州",53:"云南",54:"西藏",61:"陕西",62:"甘肃",63:"青海",64:"宁夏",65:"新疆",71:"台湾",81:"香港",82:"澳门",91:"国外"}; 
var Y,JYM;
var S,M;
var idcard_array = new Array();
idcard_array = idcard.split("");
//地区检验
if(area[parseInt(idcard.substr(0,2))]==null) return Errors[4];
//身份号码位数及格式检验
switch(idcard.length){
case 15:
if ( (parseInt(idcard.substr(6,2))+1900) % 4 == 0 || ((parseInt(idcard.substr(6,2))+1900) % 100 == 0 && (parseInt(idcard.substr(6,2))+1900) % 4 == 0 )){
ereg=/^[1-9][0-9]{5}[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|[1-2][0-9]))[0-9]{3}$/;//测试出生日期的合法性
} else {
ereg=/^[1-9][0-9]{5}[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|1[0-9]|2[0-8]))[0-9]{3}$/;//测试出生日期的合法性
}
if(ereg.test(idcard)) return Errors[0];
else return Errors[2];
break;
case 18:
//18位身份号码检测
//出生日期的合法性检查
//闰年月日:((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|[1-2][0-9]))
//平年月日:((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|1[0-9]|2[0-8]))
if ( parseInt(idcard.substr(6,4)) % 4 == 0 || (parseInt(idcard.substr(6,4)) % 100 == 0 && parseInt(idcard.substr(6,4))%4 == 0 )){
ereg=/^[1-9][0-9]{5}19[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|[1-2][0-9]))[0-9]{3}[0-9Xx]$/;//闰年出生日期的合法性正则表达式
} else {
ereg=/^[1-9][0-9]{5}19[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|1[0-9]|2[0-8]))[0-9]{3}[0-9Xx]$/;//平年出生日期的合法性正则表达式
}
if(ereg.test(idcard)){//测试出生日期的合法性
//计算校验位
S = (parseInt(idcard_array[0]) + parseInt(idcard_array[10])) * 7
+ (parseInt(idcard_array[1]) + parseInt(idcard_array[11])) * 9
+ (parseInt(idcard_array[2]) + parseInt(idcard_array[12])) * 10
+ (parseInt(idcard_array[3]) + parseInt(idcard_array[13])) * 5
+ (parseInt(idcard_array[4]) + parseInt(idcard_array[14])) * 8
+ (parseInt(idcard_array[5]) + parseInt(idcard_array[15])) * 4
+ (parseInt(idcard_array[6]) + parseInt(idcard_array[16])) * 2
+ parseInt(idcard_array[7]) * 1
+ parseInt(idcard_array[8]) * 6
+ parseInt(idcard_array[9]) * 3 ;
Y = S % 11;
M = "F";
JYM = "10X98765432";
M = JYM.substr(Y,1);//判断校验位
if(M == idcard_array[17]) return Errors[0]; //检测ID的校验位
else return Errors[3];
}
else return Errors[2];
break;
default:
return Errors[1];
break;
}
}
/*身份证号验证*/
function checkCard(idcard) {
	var msg = checkIdcard(idcard);
	if (msg != "身份证验证通过!"){
		alert(msg);
		return false;
	} else {
		return true;
	}
}
/*驾驶证号验证*/
function checkDriverCard(idcard) {
	var msg = checkDrivercard(idcard);
	if (msg != "驾驶证验证通过!"){
		alert(msg);
		return false;
	} else {
		return true;
	}
}
/*邮政编码判断*/
function postCheck(postcode){
	postcode = trim(postcode);
   if (postcode != "") {   //邮政编码判断
     var pattern = /^[0-9]{6}$/;
     flag = pattern.test(postcode);
     if (!flag) {
        return false;
     } else {
     	  return true;	
     }
   }
   return false;
}
/*移动电话号码判断*/
function isMobile(tel) {
	tel = trim(tel);
	var mobile=/^((13[0-9]{1})|189|159|151|150|152|154|155|156|157|158|153|187|188)+\d{8}$/;
  flag = mobile.test(tel);
  if (!flag) {
  	return false;
  } else {
  	return true;
  }
}
/*固定电话号码判断*/
function isPhone(phone){
	phone = trim(phone);
   var partten = /^0(([1,2]\d)|([3-9]\d{2}))\d{7,8}$/;
   flag = partten.test(phone);
	  if (!flag) {
	  	return false;
	  } else {
	  	return true;
	  } 
}
//校验是否存在特殊字符 cj 3月5日
function doZhiFu(r){
	var s = trim(r);
//	var regu= /^[^\|"'<>]*$/;
//		///^([\u4E00-\u9FA5]|\w)*$/; 
	var pattern = new RegExp("[`~!@#$^&*()=|{}':;,\\[\\]<>/?~]");
	if(pattern.test(r)){
		return false;
	}else{
		return true;
	} 
}
/*IP格式判断*/
function isIp(ip) {
   var pcount = 0;
   var ip_length = ip.length;
   var ip_letters = "1234567890." ;
   for (var p=0; p < ip_length; p++) {
	   var ip_char = ip.charAt(p);
	   if (ip_letters.indexOf(ip_char) == -1) { 
		     return false;
		}
	}
   for (var u = 0; u < ip_length; u++) { (ip.substr(u,1) == ".") ? pcount++ : pcount }
		if(pcount != 3) {  
		 return false;
    }
	firstp = ip.indexOf(".");
	lastp = ip.lastIndexOf(".");
	str1 = ip.substring(0,firstp);
	ipstr_tmp = ip.substring(0,lastp);
	secondp = ipstr_tmp.lastIndexOf(".");
	str2 = ipstr_tmp.substring(firstp+1,secondp);
	str3 = ipstr_tmp.substring(secondp+1,lastp);
	str4 = ip.substring(lastp+1,ip_length);
	if (str1 == '' || str2 == '' || str3 == '' || str4 == '')  { 
	     return false;
	 }
	if (str1.length > 3 || str2.length > 3 || str3.length > 3 || str4.length > 3)  { 
	    return false;
	 }
	if (str1 <= 0 || str1 > 255) {
	    return false;
	}
	else if (str2 < 0 || str2 > 255)   { 
	  	return false;
	 }
	else if (str3 < 0 || str3 > 255) {
	    return false;
     } 
	else if (str4 < 0 || str4 > 255)  { 
	    return false; 
	} 
	return true;
}


/*判断oracle字段类型*/
function isFieldsType(columnType,filedName) { 
  if (columnType.toLowerCase().indexOf("varchar2")!= -1) {
		if (columnType.toLowerCase().indexOf("varchar2") != 0) {
			alert("字段名为：["+ filedName +"]数据类型格式错误!");
			return false;
		}
		if(columnType.substring(0,9).toLowerCase()!= "varchar2(") {
			alert("字段名为：["+ filedName +"]数据类型格式错误!"); 
			return false;
		}
		if(columnType.substring(columnType.length-1)!= ")") {
			alert("字段名为：["+ filedName +"]数据类型格式错误!"); 
			return false;
		}
		if (!isInt(columnType.substring(9,columnType.length-1))) {
			alert("字段名为：["+ filedName +"]数据类型长度格式定义错误!"); 
			return false;
		} else {
			if (columnType.substring(9,columnType.length-1)*1 > 4000) {
				alert("字段名为：["+ filedName +"]数据类型长度定义错误!"); 
				return false;
			}
		}
		return true;
	} else if (columnType.toLowerCase().indexOf("char")!= -1) {
		if (columnType.toLowerCase().indexOf("char") != 0) {
			alert("字段名为：["+ filedName +"]数据类型格式错误!"); 
			return false;
		}
		if(columnType.substring(0,5).toLowerCase()!= "char(") {
			alert("字段名为：["+ filedName +"]数据类型格式错误!"); 
			return false;
		}
		if(columnType.substring(columnType.length-1)!= ")") {
			alert("字段名为：["+ filedName +"]数据类型格式错误!"); 
			return false;
		}
		if (!isInt(columnType.substring(5,columnType.length-1))) {
			alert("字段名为：["+ filedName +"]数据类型长度格式定义错误!"); 
			return false;
		} else {
			if (columnType.substring(5,columnType.length-1)*1 > 2000) {
				alert("字段名为：["+ filedName +"]数据类型长度定义错误!"); 
				return false;
			}
		} 
		return true;
	} else if (columnType.toLowerCase().indexOf("nvarchar2")!= -1) {
		if (columnType.toLowerCase().indexOf("nvarchar2") != 0) {
			alert("字段名为：["+ filedName +"]数据类型格式错误!"); 
			return false;
		}
		if(columnType.substring(0,10).toLowerCase()!= "nvarchar2(") {
			alert("字段名为：["+ filedName +"]数据类型格式错误!"); 
			return false;
		}
		if(columnType.substring(columnType.length-1)!= ")") {
			alert("字段名为：["+ filedName +"]数据类型格式错误!"); 
			return false;
		}
		if (!isInt(columnType.substring(10,columnType.length-1))) {
			alert("字段名为：["+ filedName +"]数据类型长度格式定义错误!"); 
			return false;
		} else {
			if (columnType.substring(10,columnType.length-1)*1 > 2000) {
				alert("字段名为：["+ filedName +"]数据类型长度定义错误!"); 
				return false;
			}
		} 
		return true;
	} else if (columnType.toLowerCase().indexOf("number")!= -1) {
		if (columnType.toLowerCase().indexOf("number") != 0) {
			alert("字段名为：["+ filedName +"]数据类型格式错误!"); 
			return false;
		} 
		if (columnType.toLowerCase() != "number") {
			if(columnType.substring(0,7).toLowerCase()!= "number(") {
				alert("字段名为：["+ filedName +"]数据类型格式错误!"); 
				return false;
			}
			if(columnType.substring(columnType.length-1)!= ")") {
				alert("字段名为：["+ filedName +"]数据类型格式错误!"); 
				return false;
			}
			if(columnType.substring(7,columnType.length-1).indexOf(",") == -1) {
				if (!isInt(columnType.substring(7,columnType.length-1))) {
					alert("字段名为：["+ filedName +"]数据类型格式定义错误!"); 
					return false;
				}
				if (columnType.substring(7,columnType.length-1)*1 > 38) {
					alert("字段名为：["+ filedName +"]数据类型长度定义错误!"); 
					return false;
				} 
			} else {
				var str = columnType.substring(7,columnType.length-1);
				if (!isInt(str.substring(0,str.indexOf(",")))) {
					alert("字段名为：["+ filedName +"]数据类型格式定义错误!"); 
					return false;
				}
				if (str.substring(0,str.indexOf(","))*1 > 38) {
					alert("字段名为：["+ filedName +"]数据类型长度定义错误!"); 
					return false;
				}
				if (!isInt(str.substring(str.indexOf(",")+1))) {
					alert("字段名为：["+ filedName +"]数据类型格式定义错误!"); 
					return false;
				}
				if (str.substring(str.indexOf(",")+1)*1 >127) {
					alert("字段名为：["+ filedName +"]数据类型长度定义错误!"); 
					return false;
				}
			} 
		} 
		return true;
	} else if (columnType.toLowerCase().indexOf("raw")!= -1) {
		if (columnType.toLowerCase().indexOf("raw") != 0) {
			alert("字段名为：["+ filedName +"]数据类型格式错误!"); 
			return false;
		}
		if(columnType.substring(0,4).toLowerCase()!= "raw(") {
			alert("字段名为：["+ filedName +"]数据类型格式错误!"); 
			return false;
		}
		if(columnType.substring(columnType.length-1)!= ")") {
			alert("字段名为：["+ filedName +"]数据类型格式错误!"); 
			return false;
		}
		if (!isInt(columnType.substring(4,columnType.length-1))) {
			alert("字段名为：["+ filedName +"]数据类型长度格式定义错误!"); 
			return false;
		} else {
			if (columnType.substring(4,columnType.length-1)*1 > 2000) {
				alert("字段名为：["+ filedName +"]数据类型长度定义错误!");				
				return false;
			}
		}
		return true;
	  } else {
		  var s = "1";
		  var str1 = "long,date,nclob,clob,blob,binary_double,binary_float,interval day to second,interval year to month,long raw,timestamp,timestamp with local time zone,timestamp with time zone";
		  var myArray = str1.split(",");
		  for (var i = 0; i < myArray.length; i++) {
			  if (columnType.toLowerCase() == myArray[i]) {
				 s = "0";
			  }
		  }
		  if (s == "1") {
			  alert("字段名为：["+ filedName +"]数据类型定义错误!");
			  return false;
		  } else {
			  return true;
		  }
	  }
}
  /*验证值只能是汉字和英文*/
  function isHanYing(str) {
	  str = trim(str);
  	var regu=/^[\u4e00-\u9fa5A-Za-z]*$/;
  	 if(!regu.exec(str)) {
  	  	return false;
  	  }
  	 else {
  		 return true;
  	 } 
  } 
  
  /*验证汉字*/
  function isChinese(str) {
	  str = trim(str);
  	var regu=/^[\u4e00-\u9fa5A]+$/;
  	 if(!regu.exec(str)) {
  	  	return false;
  	  }
  	 else {
  		 return true;
  	 } 
  }
  /*检验字母*/
  function isZm(str){
	  str = trim(str);
	  var regu=/^[a-zA-Z]+$/;
  	 if(!regu.exec(str)) {
  	  	return false;
  	  }
  	 else {
  		 return true;
  	 } 
	  
  }
  /*验证数字*/
  function isNumber(str){
	  str = trim(str);
	  var regu=/^[0-9]+$/;
  	 if(!regu.exec(str)) {
  	  	return false;
  	  } else {
  		 return true;
  	 } 
	
  }
  /*验证号牌*/
  function isHp(str) {
	  str = trim(str);
	  var regu=/^[0-9a-zA-Z]+$/;
  	 if(!regu.exec(str)) {
  	  	return false;
  	  }
  	 else {
  		 return true;
  	 } 
  }
  /*验证输入数字，字母和英文的逗号*/
  function isCondition(str) {
	  str = trim(str);
	  var regu=/^[0-9a-zA-Z,]+$/;
  	 if(!regu.exec(str)) {
  	  	return false;
  	  }
  	 else {
  		 return true;
  	 } 
  }
  /*验证输入金额*/
  function checkPrice(price){  
	  return (/^(([1-9]\d*)|\d)(\.\d{1,2})?$/).test(price.toString());
	  }
  /*验证数据库表明和字段格式*/
  function isTableFields(str) {
	  str = trim(str);
	  var regu=/^[0-9a-zA-Z_]+$/;
	  	 if(!regu.exec(str)) {
	  	  	return false;
	  	  } else {
	  		 return true;
	  	 }  
  }
  /*验证数据库表明和字段格式*/
  function isFieldsTypeLength(str) {
	  str = trim(str);
	  var regu=/^[0-9,]+$/;
	  	 if(!regu.exec(str)) {
	  	  	return false;
	  	  } else {
	  		 return true;
	  	 }  
  }
  function isNotHanzi(str){
	  var regu=/^[A-Za-z0-9]+$/;
	 if(!regu.exec(str)) {
	  	return false;
	  } else {
		 return true;
	 } 
	
}
  function checkClsbdm(obj) {
	//  一、数字和字母的数值
//	      阿拉伯数字指定值为实际数字，罗马字母数值如下：
//	     A B C D E F G H J K L M N P R S T U V W X Y Z
//	     1 2 3 4 5 6 7 8 1 2 3 4 5 7 9 2 3 4 5 6 7 8 9
	//
	//  二、位置加权系数
//	     1 2 3 4 5 6 7 8  9 10 11 12 13 14 15 16 17
//	     8 7 6 5 4 3 2 10 0 9  8  7  6  5  4  3  2
	    var regu = /^[-]{0,1}[0-9]{1,}$/;
	    var strClsbdhValue = obj.value;
	    var strClsbdh = strClsbdhValue.toUpperCase();
	    var strClsbdhSzm = strClsbdhValue.substring(0,1);
	    var strClsbdhLength = strClsbdhValue.length;
	    //判断长度
	    if(strClsbdhLength!=17){     
	      alert("该车辆识别代号有误，不符合GB16735《道路车辆车辆识别代号》国家强制标准。\r\n请确认车辆识别代号输入是否有误。");
	      return 0;
	    }
	    //判断首字母
//	    if(regu.test(strClsbdhSzm)){
//	      alert("该车辆识别代号有误，不符合GB16735《道路车辆车辆识别代号》国家强制标准。\r\n请确认车辆识别代号输入是否有误。");
//	      return 0;
//	    }
	    //判断17位数是否都一样
	    var num=0;
	    var sValue;
	    var k=2;
	    for(j=0;j<16;j++){
	       sValue=strClsbdh.substring(j+1,k);
	       if(strClsbdhSzm==sValue){
	          num=num+1;
	       }
	       k++;
	    }
	    if(num==16){
	      alert("该车辆识别代号有误，不符合GB16735《道路车辆车辆识别代号》国家强制标准。\r\n请确认车辆识别代号输入是否有误。");
	      return 0;
	    }
	    var strLetter = "ABCDEFGHJKLMNPRSTUVWXYZ0123456789";
	    var arrayValue = new Array(1, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 7, 9, 2,
	                               3, 4, 5, 6, 7, 8, 9, 0, 1, 2, 3, 4, 5, 6, 7, 8,
	                               9);
	    var arrayIndex = new Array(8, 7, 6, 5, 4, 3, 2, 10, 0, 9, 8, 7, 6, 5, 4, 3,
	                               2);

	    var iSum = 0;
	    var SingleLetter = "";
	    for (var i = 0; i < 17; i++) {
	      iSum += arrayValue[strLetter.indexOf(strClsbdh.substr(i, 1))] *
	          arrayIndex[i];
	    }
	    var checkValue = iSum % 11;
	    var strCheckValue = checkValue + "";
	    if (checkValue == 10) {
	      strCheckValue = "X";
	    }
	    //判断规则
	    if (strClsbdh.substr(8, 1) != strCheckValue ) {
	      alert("该车辆识别代号有误，不符合GB16735《道路车辆车辆识别代号》国家强制标准。\r\n请确认车辆识别代号输入是否有误。");
	      return 0;
	    }
	    return 1;
	  }
  
function isFloat(str) {
	  str = trim(str);
	  var regu=/^\d+(\.\d{2})?$/;
	  	 if(!regu.exec(str)) {
	  	  	return false;
	  	  } else {
	  		 return true;
	  	 } 
  }