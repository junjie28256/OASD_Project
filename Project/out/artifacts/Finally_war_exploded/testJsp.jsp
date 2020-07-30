<%--
  Created by IntelliJ IDEA.
  User: wangj
  Date: 2020/7/28
  Time: 10:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    String url = "picture/1-5.jpg";
%>
<%--//实验正确！！！--%>
<input type="text" name="name" value= <%=url%>>
<p id="e">rest</p>
<input type="text" name="name" id="ee" value="start">
<%--<img src="picture/1-5.jpg">--%>
<img src="" id="1"><br>
<img src="" id="2"><br>
<img src="" id="3"><br>
<%--<p id="1">01</p>--%>
<%--<p id="2">02</p>--%>
<%--<p id="3">03</p>--%>
<%--<p id="4">04</p>--%>


<%
    for(int i = 1; i < 4; i++){
        String c = i+"";
%>
<img src= <%=url%>>
<script>
    document.getElementById("e").innerHTML = "yyyy";
    document.getElementById("e").style.color = "red";
    <%--document.getElementById("ee").value = <%=url%>;--%>
    document.getElementById("ee").value = "<%=url%>";
    document.getElementById("1").src = "<%=url%>";
</script>
<%
    }
%>
</body>
</html>
