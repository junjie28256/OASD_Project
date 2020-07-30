<%--
  Created by IntelliJ IDEA.
  User: wangj
  Date: 2020/7/30
  Time: 1:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>菜鸟教程(runoob.com)</title>
</head>
<head>
    <script>
        function validateForm(){
            var x=document.forms["myForm"]["fname"].value;
            if (x==null || x==""){
                alert("姓必须填写");
                return false;
            }
        }
    </script>
</head>
<body>

<form name="myForm" action="" onsubmit="return validateForm()" method="post">
    姓: <input type="text" name="fname">
    <input type="submit" value="提交">
</form>

</body>
</html>
