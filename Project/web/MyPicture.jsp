<%--
  Created by IntelliJ IDEA.
  User: wangj
  Date: 2020/7/29
  Time: 3:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
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

        #collection{
            height: 87%;
            width: 70%;
            border: solid;
            border-color: #4CAF50;
            margin-left: 15%;
        }
        #Title{
            height: 10%;
            width: 100%;
            border: solid;
            border-color: #4CAF50;
        }
        #collectionPicture{
            width: 100%;
            height: 86%;
            /*margin-left: 15%;*/
            /*margin-bottom: 1%;*/
            border: solid;
            border-color: #4CAF50;
            position: relative;

        }
        #page{
            width: 100%;
            height: 8%;
            text-align: center;
            border: solid;
            border-color: maroon;
        }
        #results{
            width: 100%;
            height: 90%;
            border: solid;
            border-color: #ef9b11;
        }
        .resultsTd{
            width: 300px;
            height: 215px;
            border: solid;
            border-color: black;
        }
    </style>
</head>
<body>


<%-- 顶部导航栏 --%>
<div id="topNavigation">
    <table id="NavigationLeft">
        <tr>
            <td class="td"><img src="image/logo.png" id="logo"></td>
            <td class="td"><img src="image/logo/1-1.png" ><a href="Welcome" class="link" style="display: inline;margin-left: 2px">首页</a></td>
            <td class="td"><a href="SearchServlet" class="link">搜索</a></td>
        </tr>
    </table>
    <table id="NavigationRight">
        <tr>
            <td class="td" ><a href="#" class="link" onclick="showLogin()" id="status">未登录</a></td>
        </tr>
    </table>
</div>
<div id="collection">
    <div id="Title">
        <h2>我的收藏：</h2>
    </div>
    <hr>
    <div id="collectionPicture">
        <div id="results">
            <table>
                <tr>
                    <td class="resultsTd">
                        <
                    </td>
                    <td class="resultsTd">fe</td>
                    <td class="resultsTd">gr</td>
                </tr>
                <tr>
                    <td class="resultsTd">rerer</td>
                    <td class="resultsTd">gr</td>
                    <td class="resultsTd">grg</td>
                </tr>
            </table>
        </div>
        <div id="page">
            page
        </div>
    </div>

</div>

<div id="bottomNavigation">
</div>
</body>
</html>
