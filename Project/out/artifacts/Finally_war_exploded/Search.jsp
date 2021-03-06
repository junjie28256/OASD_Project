<%@ page import="doamin.Picture" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: wangj
  Date: 2020/7/29
  Time: 3:05
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
        #searchBody{
            width: 70%;
            height: 8%;
            margin-left: 15%;
            margin-top: 1%;
            margin-bottom: 1%;
            border: solid;
            border-color: #CC0000;
            position: relative;
        }
        #searchTB{
            margin-top: 1.4%;
            float: right;
            font-size: 15px;
        }
        #searchTB input[type=text]{
            width: 200px;
        }
        #searchTB input{
            height: 25px;
        }
        #searchTB select{
            height: 25px;
        }
        /*#searchTB select{*/
        /*    width: ;*/
        /*}*/
        /*#searchBody{*/
        /*    width: 70%;*/
        /*    height: 79%;*/
        /*    margin-left: 15%;*/
        /*    margin-top: 2%;*/
        /*    margin-bottom: 2%;*/
        /*    border: solid;*/
        /*    border-color: #333333;*/
        /*    position: relative;*/
        /*}*/
        #resultBody{
            width: 70%;
            height: 73%;
            margin-left: 15%;
            margin-bottom: 1%;
            border: solid;
            border-color: #4CAF50;
            position: relative;

        }
        #results{
            width: 100%;
            height: 92%;
            border: solid;
            border-color: #ef9b11;
        }
        .resultsTd{
            width: 300px;
            height: 215px;
            border: solid;
            border-color: black;
        }
        .lastestDiv{
            width: 250px;
            height: 130px;
            margin-left: 10px;
            overflow: hidden;
        }
        /*.lastestDiv{*/
        /*    width: 98%;*/
        /*    height: 70%;*/
        /*    border: 2px solid red;*/
        /*    position: absolute;*/
        /*    left: 2px;*/
        /*    top: 4px;*/
        /*}*/
        /*.lastestImg{*/
        /*    width: 100%;*/
        /*    height: 100%;*/
        /*    object-fit: cover;*/
        /*}*/
        #page{
            width: 100%;
            height: 8%;
            text-align: center;
            border: solid;
            border-color: #4CAF50;
        }
    </style>
    <script>
        // document.getElementById("submit").click();
    </script>
</head>
<body>
<%
    int curPage = (int) request.getAttribute("curPage");
    int maxPage = (int) request.getAttribute("maxPage");
    List<Picture> list = (List<Picture>) request.getAttribute("dataList");
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

<div id="searchBody" >
<%--    <input type="text" name="search" placeholder=""><input type="submit" name="submit" value="search">--%>
    <form action="SearchServlet" method="post">
    <table id="searchTB">
        <tr>
            <td><input type="text" name="search" id="key"></td>
            <td>
                <select name="model" id="model">
                    <option value="title" selected>title</option>
                    <option value="theme">theme</option>
                </select>
            </td>
            <td >
                <select name="sort" id="sort">
                    <option value="heat" selected>heat</option>
                    <option value="id">time</option>
                </select>
            </td>
            <td><input id="submit" type="submit" name="submit" value="search"></td>
            <td></td>
        </tr>
    </table>
    </form>
</div>
<div id="resultBody">

    <div id="results">
        <table>
            <tr>
                <%
                    if(list.size() > 0){
                        int max0 = list.size();
                        if(list.size()>3)
                            max0 = 3;
                        for(int i = 0; i < max0;i++){
                %>
                <td class="resultsTd" style="position: relative">
                    <div class="lastestDiv" style="position: relative">
                        <a href="Details?id=<%=list.get(i).getId()%>"><img src="UploadImg/<%=list.get(i).getUrl()%>"  id="img<%=i+1%>" class="lastestImg"></a>
                    </div>
                    <input style="position: absolute;bottom: 0px;right: 170px" type="submit" value="查看详情" id="details<%=i%>">
                    <script>
                        document.getElementById("details<%=i%>").onclick = function () {
                            window.location.assign("Details?id="+"<%=list.get(i).getId()%>");
                        }
                    </script>
                </td>
                <%
                    }
                %>




                <%--                    <td class="resultsTd"><div class="lastestDiv"><a href="Details?id=<%=list.get(0).getId()%>"><img src=""  id="img1" class="lastestImg"></a></div></td>--%>
                <%--                    <td class="resultsTd"><div class="lastestDiv"><a href="Details?id=<%=list.get(1).getId()%>"><img src=""  id="img2" class="lastestImg"></a></div></td>--%>
                <%--                    <td class="resultsTd"><div class="lastestDiv"><a href="Details?id=<%=list.get(2).getId()%>"><img src=""  id="img3" class="lastestImg"></a></div></td>--%>
            </tr>
            <tr>
                <%
                    }
                    if(list.size() > 3){
                        for(int i = 3; i < list.size();i++){
                %>
                <td class="resultsTd" style="position:relative;">
                    <div class="lastestDiv" style="position: relative">
                        <a href="Details?id=<%=list.get(i).getId()%>"><img src="UploadImg/<%=list.get(i).getUrl()%>"  id="img<%=i+1%>" class="lastestImg"></a>
                    </div>
                    <input style="position: absolute;bottom: 0px;right: 170px" type="submit" value="查看详情" id="details<%=i%>">
                    <script>
                        document.getElementById("details<%=i%>").onclick = function () {
                            window.location.assign("Details?id="+"<%=list.get(i).getId()%>");
                        }
                    </script>
                </td>
                <%
                        }
                    }
                %>
                <%--                    <td class="resultsTd"><div class="lastestDiv"><a href="Details?id=<%=list.get(3).getId()%>"><img src=""  id="img4" class="lastestImg"></a></div></td>--%>
                <%--                    <td class="resultsTd"><div class="lastestDiv"><a href="Details?id=<%=list.get(4).getId()%>"><img src=""  id="img5" class="lastestImg"></a></div></td>--%>
                <%--                    <td class="resultsTd"><div class="lastestDiv"><a href="Details?id=<%=list.get(5).getId()%>"><img src=""  id="img6" class="lastestImg"></a></div></td>--%>
            </tr>
        </table>




<%--        <table>--%>
<%--            <tr>--%>
<%--                <td class="resultsTd"><div class="lastestDiv"><a href="Details?id=<%=list.get(0).getId()%>"><img src=""  id="img1" class="lastestImg"></a></div></td>--%>
<%--                <td class="resultsTd"><div class="lastestDiv"><a href="Details?id=<%=list.get(1).getId()%>"><img src=""  id="img2" class="lastestImg"></a></div></td>--%>
<%--                <td class="resultsTd"><div class="lastestDiv"><a href="Details?id=<%=list.get(2).getId()%>"><img src=""  id="img3" class="lastestImg"></a></div></td>--%>
<%--            </tr>--%>
<%--            <tr>--%>
<%--                <td class="resultsTd"><div class="lastestDiv"><a href="Details?id=<%=list.get(3).getId()%>"><img src=""  id="img4" class="lastestImg"></a></div></td>--%>
<%--                <td class="resultsTd"><div class="lastestDiv"><a href="Details?id=<%=list.get(4).getId()%>"><img src=""  id="img5" class="lastestImg"></a></div></td>--%>
<%--                <td class="resultsTd"><div class="lastestDiv"><a href="Details?id=<%=list.get(5).getId()%>"><img src=""  id="img6" class="lastestImg"></a></div></td>--%>
<%--            </tr>--%>
<%--        </table>--%>
    </div>

    <div id="page">
        <div>
<%--            <%--%>
<%--                String model = (String) request.getAttribute("model");--%>
<%--                String key = (String) request.getAttribute("key");--%>
<%--                String sort = (String) request.getAttribute("sort");--%>
<%--            %>--%>
<%--            <script>--%>
<%--                document.getElementById("key").value = "<%=key%>";--%>
<%--                document.getElementById("model").value = "<%=model%>";--%>
<%--                document.getElementById("sort").value = "<%=sort%>";--%>
<%--            </script>--%>
            第<%= curPage %>页，共<%= maxPage %>页
            <%if (curPage > 1){
            %>
            <a href="SearchServlet?page=1">首页</a>
            <a href="SearchServlet?page=<%=curPage - 1%>">上一页</a>
            <%
            }else {
            %>
            首页 上一页
            <%
                }%>
            <%if (curPage < maxPage){
            %>
            <a onclick="" href="SearchServlet?page=<%=curPage + 1%>">下一页</a>
            <a href="SearchServlet?page=<%=maxPage %>">尾页</a>
            <%
            }else {
            %>
            下一页 尾页
            <%
                }%>
            转至第 <form name="form1" action="SearchServlet" method="get">
            <label>
                <select name="page" onchange="document.form1.submit()">
                    <%for ( int i = 1; i <= maxPage; i++){
                        if (i == curPage){
                    %>
                    <!--当前页页码默认选中-->
                    <option selected value="<%= i%>"><%= i %></option>
                    <%
                    }else {
                    %>
                    <option value="<%= i %>"><%= i %></option>
                    <%
                            }
                        }%>
                </select>
            </label>
        </form> 页
        </div>
    </div>
</div>


<div id="bottomNavigation">
</div>

<%
    String m = null, k = null ,s = null;
    Cookie[] cookies = request.getCookies();
    if(cookies != null && cookies.length > 0){
        String name;
        for (Cookie cookie:cookies){
            name = cookie.getName();
            if(name.equals("SEARCH_MODEL")){
                m = cookie.getValue();
            }else if(name.equals("SEARCH_KEY")){
                k = cookie.getValue();
            }else if(name.equals("SEARCH_SORT")){
                s = cookie.getValue();
            }
        }
    }
    if(k == null)
        k = "";
%>
<script>
    document.getElementById("search").value = k;
    document.getElementById("model").value = m;
    document.getElementById("sort").value = s;
</script>
<%

%>


<%
//    int pageCount,min,max;
    int i = 1;
    if(list == null)
        System.out.println("list == null");
%>
<%
    if(list != null){
        for(Picture picture:list){

%>
<script>
    document.getElementById("img"+"<%=i%>").src = "UploadImg/"+"<%=picture.getUrl()%>";
</script>
<%
            i++;
        }
    }
%>




<%--进行cookie验证，检查用户是否登录--%>
<%
//    Cookie [] cookies = request.getCookies();
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
