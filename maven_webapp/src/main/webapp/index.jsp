<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2020/3/31
  Time: 17:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
    <title>login</title>
</head>
<body>
<!--<form method="post" action="login">
    用户名：&nbsp;&nbsp;&nbsp;
    <input type="text" name="admin.admin_name" id="admin_name"><br/>
    密码：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <input type="password" name="admin.admin_password" id="admin_password">
    <br>
    <br>
    <input type="submit" value="登录">
</form>-->
<s:form method="GET" action="login" >
    <s:textfield name="admin.admin_name" label="用户名" required="true"/>
    <s:password name="admin.admin_password" label="密码" required="true"/>
    <s:submit value="登录"/>
</s:form>
</body>
</html>
