<%@ page import="doamin.Picture" %>
<%@ page import="java.util.List" %><%--
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
        .lastestDiv{
            width: 250px;
            height: 130px;
            margin-left: 10px;
            overflow: hidden;
        }
    </style>
</head>
<body>

<%! int curPage,maxPage; %>
<% curPage =Integer.parseInt(request.getAttribute("curPage").toString()); %> <!--取得当前页-->
<% maxPage =Integer.parseInt((String)request.getAttribute("maxPage").toString()); %> <!--取得总页数-->
<%
if (request.getAttribute("dataList") == null){
%>
<script>
    alert("您未上传过图片！");
</script>
<%
    }
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
            <td class="td" ><a href="#" class="link" onclick="showLogin()" id="status">未登录</a></td>
        </tr>
    </table>
</div>
<div id="collection">
    <div id="Title">
        <h2>我的上传：</h2>
    </div>
    <hr>
    <div id="collectionPicture">
        <div id="results">
            <table>
                <tr>
                    <td class="resultsTd"><div class="lastestDiv"><a href="#"><img src=""  id="img1" class="lastestImg"></a></div></td>
                    <td class="resultsTd"><div class="lastestDiv"><a href="#"><img src=""  id="img2" class="lastestImg"></a></div></td>
                    <td class="resultsTd"><div class="lastestDiv"><a href="#"><img src=""  id="img3" class="lastestImg"></a></div></td>
                </tr>
                <tr>
                    <td class="resultsTd"><div class="lastestDiv"><a href="#"><img src=""  id="img4" class="lastestImg"></a></div></td>
                    <td class="resultsTd"><div class="lastestDiv"><a href="#"><img src=""  id="img5" class="lastestImg"></a></div></td>
                    <td class="resultsTd"><div class="lastestDiv"><a href="#"><img src=""  id="img6" class="lastestImg"></a></div></td>
                </tr>
            </table>
        </div>
        <div id="page">
            <div>
                <%
                    String model = (String) request.getAttribute("model");
                    String key = (String) request.getAttribute("key");
                    String sort = (String) request.getAttribute("sort");
                %>
                <script>
                    document.getElementById("key").value = "<%=key%>";
                    document.getElementById("model").value = "<%=model%>";
                    document.getElementById("sort").value = "<%=sort%>";
                </script>
                第<%= curPage %>页，共<%= maxPage %>页
                <%if (curPage > 1){
                %>
                <a href="myUpload?page=1">首页</a>
                <a href="myUpload?page=<%=curPage - 1%>">上一页</a>
                <%
                }else {
                %>
                首页 上一页
                <%
                    }%>
                <%if (curPage < maxPage){
                %>
                <a onclick="" href="myUpload?page=<%=curPage + 1%>">下一页</a>
                <a href="myUpload?page=<%=maxPage %>">尾页</a>
                <%
                }else {
                %>
                下一页 尾页
                <%
                    }%>
                转至第 <form name="form1" action="myUpload" method="get">
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

</div>

<div id="bottomNavigation">
</div>

<%
    List<Picture> list = (List<Picture>) request.getAttribute("dataList");
    if(list != null){
        int i = 1;
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

</body>
</html>
