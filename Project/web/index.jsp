<%@ page import="doamin.Picture" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: wangj
  Date: 2020/7/27
  Time: 16:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>$Title$</title>
  </head>
  <body>
<%--  <p id="alert">参照物</p>--%>
<%--  <p id="test">测试</p>--%>
<%--  <%--%>
<%--    Object message = request.getAttribute("message");--%>
<%--  %>--%>

<%--    <%--%>
<%--      if(message != null){--%>
<%--    %>--%>

<%--    <script>--%>
<%--      document.write("我也在");--%>
<%--      document.getElementById("test").innerHTML = "message 不等于 null";--%>
<%--      document.getElementById("alert").style.color = "blue";--%>
<%--      &lt;%&ndash;document.getElementById("alert").innerText = <%= message %>;&ndash;%&gt;--%>
<%--      // document.getElementById("test").innerText = "test";--%>
<%--    </script>--%>

<%--    <%--%>
<%--      }else{--%>
<%--    %>--%>

<%--    <script>--%>
<%--      document.write("我们都在");--%>
<%--      document.getElementById("alert").style.color = "red";--%>
<%--    </script>--%>

<%--    <%--%>
<%--      }--%>
<%--    %>--%>

<p id="register" style="">TheHottest</p>
<p id="RegisterAlert">TheLatest</p>
<a href="#" id="status"></a>
<p>图片来啦</p>
<br>
<p id="01">01</p>
<p id="02">02</p>
<p id="03">03</p>
<p id="04">04</p>
<p id="05">05</p>
<img src="" id="1"><p>1</p>
<img src="" id="2"><p>2</p>
<img src="" id="3"><p>3</p>
<img src="" id="4"><p>4</p>
<img src="" id="5"><p>5</p>
<img src="picture/1-7.jpg" id="6"><p>6</p>
<br>
<p>图片结束</p>

<%
  List<Picture> Hottest = (List<Picture>) request.getAttribute("hottest");
  List<Picture> Latest = (List<Picture>) request.getAttribute("latest");
  int i = 1;
%>

<%
  for (Picture picture : Hottest){
    int heat = picture.getHeat();
    String url = picture.getUrl();
%>
<script>
  document.getElementById(<%=i%>).src = "<%=url%>";
</script>

<%
    i++;
  }
%>

<%--<%--%>
<%--  for (Picture picture : Latest){--%>
<%--%>--%>
<%--<%=picture.getData()%>--%>
<%--<br>--%>
<%--<%--%>
<%--%>--%>
<%--<%--%>
<%--  }--%>
<%--%>--%>

<script>
  document.write("I am here");
</script>


  </body>
</html>
