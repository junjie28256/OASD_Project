<%--
  Created by IntelliJ IDEA.
  User: wangj
  Date: 2020/7/21
  Time: 0:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<!DOCTYPE html>--%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Welcome</title>
    <%--    <script type="text/javascript" src="js/mzp-packed.js"></script>--%>
    <%--    <link href="css/zzsc.css" type="text/css" rel="stylesheet">--%>
    <%--    <link href="css/magiczoomplus.css" type="text/css" rel="stylesheet">--%>
    <%--    <script type="text/javascript" src="js/zzsc.js"></script>--%>

    <style>
        body{
            background-color: #cccccc;
        }
        #topNavigation{
            /*background-color: aliceblue;*/
            height: 8%;
            width: 70%;
            /*text-align: center;*/
            margin-left: 15%;
            border-color: black;
            border: solid;
            /*padding-top: 1.5%;*/
            /*font: Microsoft YaHei;*/
            /*font-family: 华文行楷;*/
            font-family: 隶书;
            /*font-family: 华文新魏;*/
            /*font-family: 新宋体;*/
            /*font-family: 仿宋;*/
            /*font-family: 宋体;*/
            /*font-family: 幼圆;*/
            /*visibility: visible;*/
            /*visibility: hidden;*/
        }

        #NavigationLeft{
            /*margin-top: 9px;*/
            margin-top: 0.8%;
            /*margin-left: 15%;*/
            text-align: center;
            float: left;
            /*vertical-align: middle;*/
            /*border-color: black;*/
            /*border: solid;*/

        }
        #NavigationRight{
            /*margin-top: 9px;*/
            margin-top: 0.8%;
            /*margin-right: 15%;*/
            text-align: center;
            float: right;
            /*vertical-align: middle;*/
            /*border-color: black;*/
            /*border: solid;*/
        }
        #logo{
            width: 25px;
            margin-right: 10px;
        }
        .link{
            color: black;
            display: block;
            /*background-color: ;*/
            background-color: white;
            font-size: 20px;
            text-decoration: none;
        }
        .link:hover{
            color: brown;
            background-color: azure;
            /*color: black;*/
        }
        .td{
            text-align: center;
            vertical-align: middle;
            width: 100px;
            /*border: magenta;*/
            /*border: solid;*/
            /*border-color: magenta;*/
            /*white-space:nowrap;*/
        }
        #bottomNavigation{
            /*background-color: aliceblue;*/
            clear: both;
            background-color: black;
            height: 5%;
            width: 70.3%;
            margin-left: 15%;
        }
        #detailBody{
            width: 70%;
            height: 79%;
            margin-left: 15%;
            margin-top: 2%;
            margin-bottom: 2%;
            border: solid;
            border-color: #333333;
            position: relative;
        }

    </style>
    <style type="text/css">

        body{position: relative;}

        *{margin: 0;padding:0;}

        #Box{

            height:300px;

            width:300px;

            position: relative;

            border:1px solid gray;

        }

        #bigBox{

            height:300px;

            width:300px;

            position: absolute;

            top:0;

            left:310px;

            overflow: hidden;

            display:none;

            border: 1px solid gray;

        }

        #Box img{

            height:300px;

            width:300px;

        }

        #lay{

            background:#fff;

            border:1px solid gray;

            position: absolute;

            top:0;

            left: 0;

            opacity:0.5;

            display:none;

            filter:alpha(opacity=50);

        }

    </style>


    <script type="text/javascript">

        $(function () {

            window.onscroll = function () {
                $("#d4").css("top", getScrollTop());
            };

            document.onmousemove = function (e) {
                if (e == null) {
                    e = window.event;
                }
                var html = "screenX:" + e.screenX + "       " ;
                html += "screenY:" + e.screenY +"       ";
                html += "clientX:" + e.clientX + "       ";
                html += "clientY:" + e.clientY + "       ";
                html += "offsetX:" + e.offsetX +"       ";
                html += "offsetY:" + e.offsetY + "       ";
                if (e.pageX == null) {
                    html += "pageX:" + e.x + "       ";
                    html += "pageY:" + e.y + "       ";
                } else {
                    html += "pageX:" + e.pageX + "       ";
                    html += "pageY:" + e.pageY + "       ";
                }

                $("#d4").html(html);
            };
        });

        function getScrollTop() {
            var top = (document.documentElement && document.documentElement.scrollTop) ||
                document.body.scrollTop;
            return top;
        }
    </script>



</head>
<body>


<%-- 顶部导航栏 --%>
<div id="topNavigation">
    <table id="NavigationLeft">
        <tr>
            <td class="td"><img src="image/logo.png" id="logo"></td>
            <td class="td"><img src="image/logo/1-1.png" ><a href="Welcome.html" class="link" style="display: inline;margin-left: 2px">首页</a></td>
            <td class="td"><a href="Welcome.html" class="link">搜索</a></td>
        </tr>
    </table>
    <table id="NavigationRight">
        <tr>
            <td class="td" ><a href="#" class="link" onclick="showLogin()" id="status">未登录</a></td>
        </tr>
    </table>
</div>

<div id="detailBody">
    <%--    <div id="datailImg"><img src="images"></div>--%>
    <div id="Box">

        <%--        <img  src="image/09.jpg"/>--%>
        <img src="image/09.jpg">

        <span id="lay"></span>

    </div>

    <div id="bigBox">

        <%--        <img  src="image/09.jpg" />--%>
        <img src="image/09.jpg">

    </div>
    <%--    <img src="image/1.jpg">--%>
</div>


<div id="bottomNavigation">
    <%--    zaina--%>
    <p STYLE="color: #CC0000">asds</p>
    <%--    <div id="d4" style="color: #CC0000">wewewew</div>--%>
</div>
<div id="d4" style="height: 800px">woaini</div>




</body>
</html>
