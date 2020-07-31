<%@ page import="doamin.Picture" %><%--
  Created by IntelliJ IDEA.
  User: wangj
  Date: 2020/7/22
  Time: 0:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no">
    <title>Upload</title>
    <style>
        #topNavigation{
            background-color: aliceblue;
            height: 50px;
            width: 100%;
        }

        #NavigationLeft{
            margin-top: 9px;
            margin-left: 12px;
            float: left;

        }
        #NavigationRight{
            margin-top: 9px;
            margin-right: 12px;
            float: right;
        }
        #logo{
            width: 25px;
            margin-right: 10px;
        }
        .link{
            color: black;
            font-size: 20px;
            text-decoration: none;
        }
        .link:hover{
            color: brown;
        }
        #statement{
            /*border: 0;*/
            border-color: currentColor;
            font-family: inherit;
            font-size: 90%;
            font-style: inherit;
            font-weight: inherit;
            outline-color: invert;
            outline-style: none;
            outline-width: 0;
            vertical-align: baseline;
            color: coral;
            margin: 10px;
        }
        #body{
            margin-left: 100px;
            margin-right: 100px;
            margin-top: 80px;
        }
        #information{

        }
    </style>
    <script>
        function NationvalidateForm(){
            var x=document.forms["myForm"]["nation"].value;
            if (x==null || x==""){
                alert("请选择所在国家");
                return false;
            }
        }
        function CityvalidateForm(){
            var x=document.forms["myForm"]["city"].value;
            if (x==null || x==""){
                alert("请选择所在城市");
                return false;
            }
        }
        // function valid() {
        //     return TitlevalidateForm()&&AuthorvalidateForm()&&ThemevalidateForm()&&DesvalidateForm()&&FilevalidateForm();;
        // }
    </script>
</head>
<body>



<%--<%--%>
<%--    String message = (String) request.getAttribute("uploadMessage");--%>
<%--%>--%>
<%--<%--%>
<%--    if(message == "false"){--%>
<%--%>--%>
<%--<script>--%>
<%--    // document.getElementById("ttest").innerHTML = "ttest";--%>
<%--    &lt;%&ndash;document.getElementById("title").value = "<%=request.getAttribute("title")%>";&ndash;%&gt;--%>
<%--    &lt;%&ndash;document.getElementById("author").value = "<%=request.getAttribute("author")%>";&ndash;%&gt;--%>
<%--    &lt;%&ndash;document.getElementById("theme").value = "<%=request.getAttribute("theme")%>";&ndash;%&gt;--%>
<%--    &lt;%&ndash;document.getElementById("description").value = "<%=request.getAttribute("description")%>";&ndash;%&gt;--%>
<%--    alert("请输入完整信息并重新选择图片后再上传！");--%>
<%--</script>--%>
<%--<%--%>
<%--    }else if(message == "success"){--%>
<%--%>--%>
<%--<script>--%>
<%--    alert("上传成功");--%>
<%--</script>--%>
<%--<%--%>
<%--    }--%>
<%--%>--%>

<%
    String message = (String)request.getAttribute("uploadMessage");
%>
<%
    if(message == "success"){
%>
<script>
    alert("上传成功");
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

<div id="statement">
    <ol>
        <li>检测报告由“中国学术不端网”提供。直连官方，不泄漏用户隐私！</li>
        <li>现在处于毕业高峰期，检测所需时间较长，提交完待测文章后，可关闭此页面，稍后再次访问检测系统，提取检测结果哦!</li>
        <li>本科PMLC大学生论文查重： 是对专/本科毕业论文毕业设计查重检测专用系统，含有“大学生论文联合对比库”，与学校检测结果一致。<input id="textfield" name="textfield" style="visibility: hidden"></li>
    </ol>
</div>

<div id="body">




    <h2 >图片上传</h2>
    <hr>

<%--    TitlevalidateForm()&&FilevalidateForm()&&AuthorvalidateForm()&&ThemevalidateForm()&&DesvalidateForm()&&NationvalidateForm()&&CityvalidateForm()"--%>

    <form name="myForm" id="myForm" action="uploadPhoto" method="post" enctype="multipart/form-data">
        <fieldset>
            <legend>请填写相关信息</legend>
            <table id="information" cellpadding="10" cellspacing="10">
                <tr>
                    <td>标题：</td>
                    <td><input type="text" name="title" id="title"></td>
                    <td style=""></td>
                    <td style="visibility: hidden"><input type="text" name=""></td>
                    <td>选择文件：</td>
                    <td rowspan="4">
<%--                        <input type="file" id="file_input" value="上传图片" multiple/>--%>
                        <input type="file" id="filepath" name="filepath" onchange="document.getElementById('textfield').value=this.files[0].name" />
                    </td>
                </tr>
                <tr>
                    <td>作者：</td>
                    <td><input type="text" name="author" id="author"></td>
                    <td>主题：</td>
                    <td><input type="text" name="theme" id="theme"></td>
                </tr>
                <tr>
                    <td>简介：</td>
                    <td><input type="text" name="description" id="description"></td>
                </tr>
                <tr>
                    <td>国家：</td>
                    <td>
                        <select name="nation">
                            <option value="China">China</option>
                            <option value="US">US</option>
                            <option value="USA" selected>USA</option>
                            <option value="Canada">Canada</option>
                        </select>
                    </td>
                    <td>城市：</td>
                    <td>
                        <select name="city">
                            <option value="Beijing">Beijing</option>
                            <option value="Shanghai">Shanghai</option>
                            <option value="Guangzhou" selected>Guangzhou</option>
                            <option value="Shnezhen">Shenzhen</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td><input style="visibility: hidden" id="pictureId" name="pictureId" value="9090900"></td>
                    <td><input type="submit" name="submit" value="提交"></td>
                </tr>
            </table>
        </fieldset>

    </form>
</div>
<br>
<br>

<script>
    window.onload = function () {
        document.getElementById("myForm").onsubmit = function () {
            return TitlevalidateForm() && FilevalidateForm() && AuthorvalidateForm() && ThemevalidateForm() && DesvalidateForm();
        }

        function TitlevalidateForm(){
            var x=document.forms["myForm"]["title"].value;
            if (x==null || x==""){
                alert("图片的标题必须填写");
                return false;
            }
            return true;
        }
        function FilevalidateForm(){
            var x=document.forms["myForm"]["textfield"].value;
            if (x==null || x==""){
                alert("请选取文件");
                return false;
            }
            return true;
        }
        function AuthorvalidateForm(){
            var x=document.forms["myForm"]["author"].value;
            if (x==null || x==""){
                alert("作者姓名必须填写");
                return false;
            }
            return true;
        }
        function ThemevalidateForm(){
            var x=document.forms["myForm"]["theme"].value;
            if (x==null || x==""){
                alert("作品主题必须填写");
                return false;
            }
            return true;
        }

        function DesvalidateForm(){
            var x=document.forms["myForm"]["description"].value;
            if (x==null || x==""){
                alert("作品简介必须填写");
                return false;
            }
            return true;
        }
    }
</script>



<%
    Picture picture = (Picture) request.getAttribute("picture");
    if(picture != null){
//        request.setAttribute("pictureId",picture.getId());
//        System.out.println("传输的时候ID为" + picture.getId());
%>
<script>
    document.getElementById("pictureId").value = "<%=picture.getId()%>";
    document.getElementById("title").value = "<%=picture.getTitle()%>";
    document.getElementById("author").value = "<%=picture.getAuthor()%>";
    document.getElementById("theme").value = "<%=picture.getTheme()%>";
    document.getElementById("description").value = "<%=picture.getDescription()%>";
    alert("请重新填写相关信息并在选择图片之后重新上传");
</script>
<%
    }
%>



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