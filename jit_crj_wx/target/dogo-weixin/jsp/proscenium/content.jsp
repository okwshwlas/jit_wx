<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="/WEB-INF/tld/c.tld" prefix="c"%>
<%@page import="java.util.List" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%response.setHeader("Pragma","No-cache"); 
response.setHeader("Cache-Control","no-cache"); 
response.setDateHeader("Expires", 0); 
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0" />
<meta name="apple-mobile-web-app-capable" content="yes" />
<meta name="format-detection" content="telephone=no" />
<style>
        body{ -webkit-touch-callout: none; -webkit-text-size-adjust: none; }
        body {font: normal 100% Helvetica, Arial, sans-serif;}
        img { max-width: 100%;}
    </style>


<title>${title}</title>
<script type="text/javascript">
    // 对浏览器的UserAgent进行正则匹配，不含有微信独有标识的则为其他浏览器
    var useragent = navigator.userAgent;
    if (useragent.match(/MicroMessenger/i) != 'MicroMessenger') {
        // 这里警告框会阻塞当前页面继续加载
        alert('已禁止本次访问：您必须使用微信内置浏览器访问本页面！');
        // 以下代码是用javascript强行关闭当前页面
        var opened = window.open('about:blank', '_self');
        opened.opener = null;
        opened.close();
    }
</script>
</head>
<body>
${content}
</body>
</html>