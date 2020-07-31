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
            position: absolute;
            top: 10px;
            left: 20px;
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
        #information{
            float: right;
            border: solid;
            border-color: #4CAF50;
            margin-right: 10px;
        }
        .informationTd{
            border: solid;
            border-color: #E97305;
            /*margin-right: 100px;*/
        }
        #do{
            position: absolute;
            left: 130px;
            bottom: 150px;
        }
    </style>

    <script type="text/javascript">
        window.onload = function(){
            var Box = document.getElementById("Box");
            var bigBox = document.getElementById("bigBox");
            var bigbox = getChildNodes(bigBox)[0];
            var lay = document.getElementById("lay");
            //鼠标移入时，将放大镜和bigBox显示出来
            Box.onmouseover = function(){
                lay.style.display = "block";
                bigBox.style.display = "block";
            }
            //鼠标移出时，将放大镜和bigBox隐藏起来
            Box.onmouseout = function(){
                lay.style.display = "none";
                bigBox.style.display = "none";
            }
            Box.onmousemove = function(e){
                e = e || event;//事件源的兼容问题
                var scale = 4;//图片的放缩比例
                //将鼠标放到放大镜的中间
                var x = e.clientX - lay.offsetWidth/2 - 193 -20;
                var y = e.clientY - lay.offsetHeight/2 - 80 - 10;

                //将放大镜的宽高与盒子的宽高结合起来按比例放缩
                lay.style.width = parseInt(Box.offsetWidth / scale )+ "px";
                lay.style.height = parseInt(Box.offsetHeight / scale)+ "px";

                //设置大盒子的宽高
                bigbox.style.width = Box.offsetWidth * scale + "px";
                bigbox.style.height = Box.offsetHeight * scale + "px";
                if(x < 0){
                    x = 0;//左边界的判断，当超出时将x置为0;
                }

                //右边界的判断，当超出时将x置为Box的宽度减去放大镜的宽度;
                if( x >= Box.offsetWidth - lay.offsetWidth){
                    x = Box.offsetWidth - lay.offsetWidth;
                }

                //下边界的判断，当超出时将y置为Box的高度减去放大镜的高度;
                if( y >= Box.offsetHeight - lay.offsetHeight){
                    y = Box.offsetHeight - lay.offsetHeight;
                }
                if(y < 0){
                    y = 0;//上边界的判断，当超出时将y置为0;
                }

                lay.style.left = x + "px";
                lay.style.top = y + "px";
                //同比例放缩，大的盒子图片的放缩比例，当小盒子向右移动的时候，大盒子向左移动同等的比例的宽高，方向是相反的
                var left = lay.offsetLeft * scale;
                var top  = lay.offsetTop * scale ;

                bigbox.style.marginLeft =(left * (-1)) + "px";
                bigbox.style.marginTop =(top * (-1))+ "px";
            }
        }

        //获取孩子的节点
        function getChildNodes(element){
            var arr = [];
            var eList = element.childNodes;
            for(var i = 0;i < eList.length;i++){
                if(eList[i].nodeType == 1){//过滤空白节点
                    arr.push(eList[i]);
                }
            }
            return arr;
        }

    </script>

</head>
<body>

<%
    Picture picture = (Picture) request.getAttribute("picture");
%>


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
            <td>
                <a href="Mycollection" class="link" id="bar1" style="visibility: hidden">收藏夹</a>
            </td>
            <td>
                <a href="Upload" class="link" id="bar2" style="margin-left: 20px;visibility: hidden">上传</a>
            </td>
            <td>
                <a href="Mycollection" class="link" id="bar3" style="margin-left: 20px;visibility: hidden">我的上传</a>
            </td>
            <td class="td" ><a href="#" class="link" onclick="showLogin()" id="status">未登录</a></td>
        </tr>
    </table>
</div>

<div id="detailBody">
    <div id="Box">
        <img src="image/09.jpg" id="mainImg">
        <span id="lay"></span>
    </div>
    <div id="bigBox">
        <img src="image/09.jpg" id="sideImg">
    </div>

    <div id="information">
        <table>
            <tr>
                <td height="80px" colspan="2" class="informationTd" id="title"></td>
            </tr>
            <tr>
                <td width="250px" height="50px" class="informationTd" id="author">
                    作者
                </td>
                <td width="250px" height="80px" class="informationTd" id="city">
                    国家and城市
                </td>
            </tr>
            <tr>
                <td colspan="2" height="80px" class="informationTd" id="theme">
                    主题
                </td>
            </tr>
            <tr>
                <td colspan="2" height="80px" class="informationTd" id="description">
                    简介
                </td>
            </tr>
            <tr>
                <td width="250px" height="50px" class="informationTd"></td>
                <td width="250px" height="50px" class="informationTd" id="date">时间</td>
            </tr>
            <tr>
                <td width="250px" height="50px" class="informationTd" id="heat">热度</td>
                <td width="250px" height="50px" class="informationTd"></td>
            </tr>
        </table>

    </div>
    <div id="do">
        <table cellspacing="10" border="solid" border-color="red">
            <tr>
                <td style="border-color: #4CAF50;border: solid"><input id="Colflag" type="submit" value="收藏"></td>
                <td style="border-color: #4CAF50;border: solid"><input type="submit" value="评价"></td>
            </tr>
        </table>
    </div>
</div>
<script>
    document.getElementById("Colflag").onclick = function () {
        window.location.assign("Collection?pictureId="+"<%=picture.getId()%>");
    }
</script>


<div id="bottomNavigation">
</div>


<%
    int flag = (int) request.getAttribute("flag");
    if(flag == 1){
%>
<script>
    document.getElementById("Colflag").value = "已收藏";
</script>
<%
    }
%>

<script>
    document.getElementById("mainImg").src ="UploadImg/"+ "<%=picture.getUrl()%>";
    document.getElementById("sideImg").src ="UploadImg/"+ "<%=picture.getUrl()%>";
    document.getElementById("title").innerHTML = "<%=picture.getTitle()%>";
    document.getElementById("author").innerHTML = "<%=picture.getAuthor()%>";
    document.getElementById("theme").innerHTML = "<%=picture.getTheme()%>";
    document.getElementById("city").innerHTML = "<%=picture.getNation()%>" + "  "+"<%=picture.getCity()%>";
    document.getElementById("description").innerHTML = "<%=picture.getDescription()%>";
    document.getElementById("date").innerHTML = "<%=picture.getDate()%>";
    document.getElementById("heat").innerHTML = "<%=picture.getHeat()%>";
</script>



<%--进行cookie验证，检查用户是否登录--%>
<%
    Cookie [] cookies = request.getCookies();
    String USERID = null;
    if(cookies != null && cookies.length > 0) {
        for (Cookie cookie : cookies) {
            String name = cookie.getName();
            System.out.println(name);
            System.out.println(cookie.getValue());
            if (name.equals("USERID")) {
                USERID = cookie.getValue();
            }
        }
        if(USERID != null){
%>
<script>
    document.getElementById("status").innerHTML = "<%=USERID%>";
    document.getElementById("bar1").style.visibility = "visible";
    document.getElementById("bar2").style.visibility = "visible";
    document.getElementById("bar3").style.visibility = "visible";
</script>
<%
}else{
%>
<script>
    document.getElementById("status").innerHTML = "未登录";
</script>
<%
        }
    }
%>

</body>
</html>
