<%@ page language="java" contentType="text/html; charset=UTF-8"pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0"/>
    <title>查看路线</title>
    <link href="${basePath}/static/jgdh/style/default.css"  type="text/css" rel="stylesheet" />
    <link href="${basePath}/static/jgdh/style/contents.css" type="text/css" rel="stylesheet" />
    <style>
        html { height: 100%; width: 100%; font-family: 'Heiti SC', 'Microsoft YaHei'; font-size: 100px; outline: 0; -webkit-text-size-adjust:none;}
        body { height: 100%; margin: 0; -webkit-user-select: none; position: relative;}
    </style>
    <script type="text/javascript" src="${basePath}/static/jgdh/js/jquery.1.8.2.min.js" ></script>
    <script type="text/javascript">
        //设置初使用页面样式 rem
        (function (doc, win) {
            var docEl = doc.documentElement,
                    resizeEvt = 'orientationchange' in window ? 'orientationchange' : 'resize',
                    recalc = function () {
                        var clientWidth = docEl.clientWidth;
                        if (!clientWidth) return;
                        docEl.style.fontSize = 100 * (clientWidth / 640) + 'px';
                    };
            if (!doc.addEventListener) return;
            win.addEventListener(resizeEvt, recalc, false);
            doc.addEventListener('DOMContentLoaded', recalc, false);
        })(document, window);
        //选择出行路线，点击效果
        $(document).ready(function(){
            $(".ck_header_nav li").click(function(){
                $(".ck_header_nav li").removeClass('bg_open');
                $(".ck_header_nav li").find('a').css('color','#767e89');
                $(this).addClass('bg_open');
                $(this).find('a').css('color','#4186fe');
            })
        })
    </script>
</head>
<body>
    <div style="max-width: 640px;">
        <div class="ck_header_top">
            <a href="javascript:void(0);" class="ck_header_return">

            </a>
            <ul class="ck_header_nav">
                <li class="bg_open">
                    <a href="#this"><img src="${basePath}/static/jgdh/image/bus_icon_open.png" /> <span>公交路线</span></a>
                    <p class="li_time"><span>20分钟</span> <span>7公里</span></p>
                </li>
                <li>
                    <a href="#this"><img src="${basePath}/static/jgdh/image/driving_icon_open.png" /> <span>驾车路线</span></a>
                    <p class="li_time"><span>20分钟</span> <span>7公里</span></p>
                </li>
            </ul>
        </div>
        <div class="map">
            <img src="${basePath}/static/jgdh/image/map.png" alt="" class="map_image" />
        </div>
    </div>
</body>
</html>