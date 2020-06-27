<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2019/11/28
  Time: 14:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.util.*" extends="com" info="" session="" s %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
    <style type="text/css">
        body{background-color: #CCCCCC;}
        div{margin-left: 25%;}
    </style>
    <title>register</title>
</head>
<body>
    <div>
        <h2>注册新用户（*为必填项）</h2>
        <s:form action="validate">
            <s:textfield name="username" label="用户名" required="true"/>
            <s:textfield name="pass1" label="输入密码" required="true"/>
            <s:textfield name="pass2" label="确认密码" required="true"/>
            <s:textfield name="age" label="年龄" required="true"/>
            <s:submit value="提交"/>
        </s:form>

    </div>
</body>
</html>
