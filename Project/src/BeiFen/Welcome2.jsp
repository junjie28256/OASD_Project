<%@ page import="java.util.List" %>
<%@ page import="doamin.Picture" %><%--
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
    <script>
        function showLogin() {
            document.getElementById("login").style.visibility = "visible";
        }
        function showRegister() {
            document.getElementById("login").style.visibility = "hidden";
            document.getElementById("register").style.visibility = "visible";
        }
        function shutdown() {
            document.getElementById("login").style.visibility = "hidden";
            document.getElementById("register").style.visibility = "hidden";
        }
    </script>
    <style>
        #topNavigation{
            /*background-color: aliceblue;*/
            height: 8%;
            width: 100%;
            /*border-color: black;*/
            /*border: solid;*/
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
            margin-left: 15%;
            text-align: center;
            float: left;
            /*vertical-align: middle;*/
            /*border-color: black;*/
            /*border: solid;*/

        }
        #NavigationRight{
            /*margin-top: 9px;*/
            margin-top: 0.8%;
            margin-right: 15%;
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
        #slideShow{
            width: 100%;
            height: 37%;
            background-color: deepskyblue;
        }
        #latest{
            float: left;
            width: 70%;
            height: 50%;
            background-color: aquamarine;
        }
        #authors{
            float: right;
            width: 30%;
            height: 50%;
            background-color: bisque;
        }
        #bottomNavigation{
            /*background-color: aliceblue;*/
            clear: both;
            background-color: black;
            height: 5%;
            width: 100%;
        }
        #login{
            width: 30%;
            height: 35%;
            position: fixed;
            left: 35%;
            top: 25%;
            border: solid;
            border-color: aqua;
            border-radius: 5px;
            background-color: #f2f2f2;
            padding: 20px;
            visibility: hidden;
        }
        #register{
            width: 30%;
            height: 50%;
            position: fixed;
            left: 35%;
            top: 25%;
            border: solid;
            border-color: aqua;
            border-radius: 5px;
            background-color: #f2f2f2;
            padding: 20px;
            visibility: hidden;
        }
        /*#registerTable{*/
        /*    font-size: large;*/
        /*}*/
        /*.registerTableTr{*/
        /*    height: 50px;*/
        /*}*/
        input[type=text], select, input[type=password] {
            width: 100%;
            padding: 12px 20px;
            margin: 8px 0;
            display: inline-block;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        input[type=submit] {
            width: 100%;
            background-color: #4CAF50;
            color: white;
            padding: 14px 20px;
            margin: 8px 0;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        input[type=submit]:hover {
            background-color: #45a049;
        }
        #gotoregister{
            text-decoration: none;
        }
        #loginShutdown, #registerShutdown{
            width: 24px;
            position: absolute;
            top: 0;
            right: 0;
            z-index: 99;
        }
        #latestTB{
            margin-left: 21%;
        }
        #latestTBName{
            height: 45px;
            border: 2px solid red;
        }
        .lastestTd{
            width: 358px;
            height: 140px;
            border: solid;
            border-color: black;
            position: relative;
        }
        .lastestTd1{
            width: 238px;
            height: 280px;
            border: solid;
            border-color: black;
            position: relative;
        }
        .lastestDiv1{
            width: 162px;
            height: 230px;
            border: 2px solid red;
            position: absolute;
            left: 4px;
            top: 4px;
        }
        .lastestImg1{
            width: 100%;
            height: 100%;
            object-fit: cover;
            /*position: ;*/
        }
        .lastestDiv{
            width: 98%;
            height: 70%;
            border: 2px solid red;
            position: absolute;
            left: 2px;
            top: 4px;
        }
        .lastestImg{
            width: 100%;
            height: 100%;
            object-fit: cover;
        }
        #authorsTB{
            margin-right: 15%;
        }
        .authorsTdL{
            width: 136px;
            height: 40px;
            border: solid;
            border-color: black;
        }
        .authorsTd{
            width: 50px;
            height: 40px;
            border: solid;
            border-color: black;
        }
        .author{
            margin-left: 20px;
            font-size: 20px;
            color: #CC0000;
        }
        .theme{
            font-size: 20px;
            color: #4CAF50;
        }
        .date{
            font-size: 8px;
            color: black;
        }

    </style>
    <style>
        *{
            margin:0;
            padding:0;
            list-style:none;}

        .wrap{
            height:37%;
            width:70%;
            /*margin:0 auto;*/
            overflow: hidden;
            margin-left: 15%;
            position: absolute;}
            /*margin:100px auto;}*/
        /*.wrap ul{position:absolute;}*/
        /*.wrap ul li{height:37%;}*/
        .wrap ol{position:absolute;
            right:5px;
            bottom:10px;}
        .wrap ol li{
            height:20px;
            width: 20px;
            background:#ccc;
            border:solid 1px #666;
            margin-left:5px;
            color:#000;
            float:left;
            line-height: normal;
            /*line-height:center;*/
            text-align:center;
            cursor:pointer;}
        .wrap ol .on{background:#E97305;
            color:#fff;}
        .SlideImg{
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

    </style>
    <script type="text/javascript">
        window.onload=function(){
            var wrap=document.getElementById('wrap'),
                pic=document.getElementById('pic').getElementsByTagName("li"),
                list=document.getElementById('list').getElementsByTagName('li'),
                index=0,
                timer=null;

            // 定义并调用自动播放函数
            timer = setInterval(autoPlay, 2000);

            // 鼠标划过整个容器时停止自动播放
            wrap.onmouseover = function () {
                clearInterval(timer);
            }

            // 鼠标离开整个容器时继续播放至下一张
            wrap.onmouseout = function () {
                timer = setInterval(autoPlay, 2000);
            }
            // 遍历所有数字导航实现划过切换至对应的图片
            for (var i = 0; i < list.length; i++) {
                list[i].onmouseover = function () {
                    clearInterval(timer);
                    index = this.innerText - 1;
                    changePic(index);
                };
            };

            function autoPlay () {
                if (++index >= pic.length) index = 0;
                changePic(index);
            }

            // 定义图片切换函数
            function changePic (curIndex) {
                for (var i = 0; i < pic.length; ++i) {
                    pic[i].style.display = "none";
                    list[i].className = "";
                }
                pic[curIndex].style.display = "block";
                list[curIndex].className = "on";
            }

        };

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



<div id="slideShow">
    <div class="wrap" id='wrap'>
        <ul id="pic">
            <li><img src="picture/01.jpg" alt="" class="SlideImg" id="slide1" ></li>
            <li><img src="picture/02.jpg" alt="" class="SlideImg" id="slide2" ></li>
            <li><img src="picture/03.jpg" alt="" class="SlideImg" id="slide3" ></li>
            <li><img src="picture/04.jpg" alt="" class="SlideImg" id="slide4" ></li>
            <li><img src="picture/05.jpg" alt="" class="SlideImg" id="slide5" ></li>
        </ul>
        <ol id="list">
            <li class="on">1</li>
            <li>2</li>
            <li>3</li>
            <li>4</li>
            <li>5</li>
        </ol>
    </div>
</div>

<div id="latest">
    <table id="latestTB">
        <tr>
            <td colspan="3" id="latestTBName">最热</td>
        </tr>
        <tr>
            <td rowspan="2" class="lastestTd1">
                <div class="lastestDiv1">
                    <img src="picture/01.jpg" class="lastestImg1" id="latest1">
                    <p><span id="author1" class="author"></span> <span id="theme1" class="theme"></span> <span id="date1" class="date"></span></p>
                </div>
            </td>
            <td class="lastestTd">
                <div class="lastestDiv">
                    <img src="picture/02.jpg" class="lastestImg" id="latest2">
                    <p><span id="author2" class="author"></span> <span id="theme2" class="theme"></span> <span id="date2" class="date"></span></p>
                </div>
            </td>
            <td class="lastestTd">
                <div class="lastestDiv">
                    <img src="picture/03.jpg" class="lastestImg" id="latest3">
                    <p><span id="author3" class="author"></span> <span id="theme3" class="theme"></span> <span id="date3" class="date"></span></p>
                </div>
            </td>

        </tr>
        <tr>
            <td class="lastestTd">
                <div class="lastestDiv">
                    <img src="picture/04.jpg" class="lastestImg" id="latest4">
                    <p><span id="author4" class="author"></span> <span id="theme4" class="theme"></span> <span id="date4" class="date"></span></p>
                </div>
            </td>
            <td class="lastestTd">
                <div class="lastestDiv">
                    <img src="picture/05.jpg" class="lastestImg" id="latest5">
                    <p><span id="author5" class="author"></span> <span id="theme5" class="theme"></span> <span id="date5" class="date"></span></p>
                </div>
            </td>

        </tr>
    </table>

</div>

<div id="authors">
    <table id="authorsTB">
        <tr>
            <td colspan="2" class="authorsTd">1</td>
        </tr>
        <tr>
            <td  class="authorsTdL">1</td>
            <td  class="authorsTd">2</td>
        </tr>
        <tr>
            <td class="authorsTdL">1</td>
            <td class="authorsTd">2</td>
        </tr>
        <tr>
            <td class="authorsTdL">1</td>
            <td class="authorsTd">2</td>
        </tr>
        <tr>
            <td class="authorsTdL">1</td>
            <td class="authorsTd">2</td>
        </tr>
        <tr>
            <td class="authorsTdL">1</td>
            <td class="authorsTd">2</td>
        </tr>
        <tr>
            <td class="authorsTdL">1</td>
            <td class="authorsTd">2</td>
        </tr>
        <tr>
            <td class="authorsTdL">1</td>
            <td class="authorsTd">2</td>
        </tr>
    </table>

</div>

<div id="bottomNavigation">
<%--    zaina--%>
</div>

<div id="login">
    <img src="image/2.png" id="loginShutdown" onclick="shutdown()">
    <p id="LoginAlert"></p>
    <form action="loginServlet" method="post">
        <label for="loginName">username</label>
        <input type="text" id="loginName" name="username" value="">

        <label for="loginPassword">password</label>
        <input type="password" id="loginPassword" name="password" >

        <input type="submit" value="Submit">
        <p>没有账户？点我<a id="gotoregister" href="#" onclick="showRegister()">立即注册</a></p>

    </form>

</div>

<div id="register">
    <img src="image/2.png" id="registerShutdown" onclick="shutdown()">
    <p id="RegisterAlert">where</p>
    <form action="RegisterServlet" method="post">
        <label for="username">username</label>
        <input type="text" id="username" name="username"  value="<%= request.getParameter("username")==null ? "":request.getParameter("username") %>">

        <label for="email">email</label>
        <input type="text" id="email" name="email" value="<%= request.getParameter("email")==null ? "":request.getParameter("email") %>">

        <label for="password">password</label>
        <input type="password" id="password" name="password" value="<%= request.getParameter("password")==null ? "":request.getParameter("password") %>">

        <label for="confirm">confirm</label>
        <input type="password" id="confirm" name="confirm" value="<%= request.getParameter("password")==null ? "":request.getParameter("password") %>">



<%--        <label for="country">Country</label>--%>
<%--        <select id="country" name="country">--%>
<%--            <option value="australia">Australia</option>--%>
<%--            <option value="canada">Canada</option>--%>
<%--            <option value="usa">USA</option>--%>
<%--        </select>--%>

        <input type="submit" value="Submit">
<%--        <p>一</p>--%>

<%--        <table id="registerTable">--%>
<%--            <tr class="registerTableTr">--%>
<%--                <td>username：</td>--%>
<%--                <td colspan="5" style="border-color: coral;border: solid"><input type="text" name="username" width="60px"></td>--%>
<%--            </tr>--%>
<%--            <tr class="registerTableTr">--%>
<%--                <td>email：</td>--%>
<%--                <td colspan="2"><input type="text" name="email"></td>--%>
<%--            </tr>--%>
<%--            <tr class="registerTableTr">--%>
<%--                <td>password：</td>--%>
<%--                <td colspan="2"><input type="password" name="password"></td>--%>
<%--            </tr>--%>
<%--            <tr class="registerTableTr">--%>
<%--                <td>confirm：</td>--%>
<%--                <td colspan="2"><input type="password" name="confirm"></td>--%>
<%--            </tr>--%>
<%--            <tr class="registerTableTr">--%>
<%--                <td>captcha：</td>--%>
<%--                <td><input type="text" name="captcha"></td>--%>
<%--                <td><input type="button" name="send" value="发送验证码"></td>--%>
<%--            </tr>--%>
<%--            <tr class="registerTableTr">--%>
<%--                <td colspan="3"><input type="submit" name="submit" value="注册"></td>--%>
<%--                <td></td>--%>
<%--            </tr>--%>
<%--        </table>--%>


<%--        username：<input type="text" name="username"><br><br>--%>
<%--        email：<input type="text" name="email"><br><br>--%>
<%--        password：<input type="password" name="password"><br><br>--%>
<%--        confirm：<input type="password" name="confirm"><br><br>--%>
<%--        captcha：<input type="text" name="captcha"><input type="button" name="send" value="发送验证码"><br><br>--%>
<%--        <input type="submit" name="submit" value="注册"><br><br>--%>

    </form>

</div>


<%--进行注册的验证，检查用户名是否已存在--%>
<%
    Object message = request.getAttribute("message");
%>
<%
    if(message != null){
%>
<script>
    document.getElementById("register").style.visibility = "visible";
    document.getElementById("RegisterAlert").innerHTML = "用户名已存在";
    document.getElementById("RegisterAlert").style.color = "red";
</script>
<%
}else{
%>
<script>
    document.getElementById("status").innerHTML = "已登录";
</script>
<%
    }
%>



<%--进行登陆验证，检查用户名或密码是否正确--%>
<%
    Object loginError = request.getAttribute("loginError");
%>
<%
    if(loginError != null){
%>
<script>
    document.getElementById("login").style.visibility = "visible";
    document.getElementById("LoginAlert").innerHTML = "用户名或密码错误";
    document.getElementById("LoginAlert").style.color = "red";
</script>
<%
    }else {
%>
<script>
    document.getElementById("status").innerHTML = "已登录";
</script>
<%
    }
%>



<%--在首页展示最新和最热的图片--%>
<%
    List<Picture> hottest = (List<Picture>) request.getAttribute("hottest");
    List<Picture> latest = (List<Picture>) request.getAttribute("latest");
%>
<script>
    document.getElementById("slide1").src ="UploadImg/" + "<%=hottest.get(0).getUrl()%>";
    document.getElementById("slide2").src ="UploadImg/" + "<%=hottest.get(1).getUrl()%>";
    document.getElementById("slide3").src ="UploadImg/" + "<%=hottest.get(2).getUrl()%>";
    document.getElementById("slide4").src ="UploadImg/" + "<%=hottest.get(3).getUrl()%>";
    document.getElementById("slide5").src ="UploadImg/" + "<%=hottest.get(4).getUrl()%>";
    document.getElementById("latest1").src ="UploadImg/" + "<%=latest.get(0).getUrl()%>";
    document.getElementById("latest2").src ="UploadImg/" + "<%=latest.get(1).getUrl()%>";
    document.getElementById("latest3").src ="UploadImg/" + "<%=latest.get(2).getUrl()%>";
    document.getElementById("latest4").src ="UploadImg/" + "<%=latest.get(3).getUrl()%>";
    document.getElementById("latest5").src ="UploadImg/" + "<%=latest.get(4).getUrl()%>";
</script>
<%
    for(int i = 1; i < 6; i++){
%>
<script>
    document.getElementById("author"+"<%=i%>").innerHTML = "<%=latest.get(i-1).getAuthor()%>";
    document.getElementById("theme"+"<%=i%>").innerHTML = "<%=latest.get(i-1).getTheme()%>";
    document.getElementById("date"+"<%=i%>").innerHTML = "<%=latest.get(i-1).getDate()%>";
</script>
<%
    }
%>


<%--进行cookie验证，检查用户是否登录--%>
<%
    Cookie [] cookies = request.getCookies();
    String USERID = null;
    if(cookies != null && cookies.length > 0){
        for(Cookie cookie:cookies){
            String name = cookie.getName();
            if(name.equals("UserID")){
                USERID = cookie.getValue();
%>
<script>
    document.getElementById("status").innerHTML = "<%=USERID%>";
</script>
<%
    }else {
%>
<script>
    document.getElementById("status").innerHTML = "你是谁";
</script>
<%
    }
    }
    }
%>

</body>
</html>
