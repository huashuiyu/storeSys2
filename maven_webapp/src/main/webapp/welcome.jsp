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
    <title>welcome</title>
</head>
<body>
welcom :<s:property value="#session.admin.admin_name"/>
<br/>
<br/>
<s:form action="toadd">
    <s:submit value="添加"/>
</s:form>
<br/>
<s:form action="selectLike">
    <s:textfield name="likename" label="用户名" required="true"/>
    <s:submit value="查询"/>
</s:form>
<s:form>
    <s:iterator value="#session.like">
        <table border="1" cellpadding="0" cellspacing="0">
            <tr>
                <th><s:property value="StudentID"/></th>
                <td><s:property value="username"/></td>
                <td><s:property value="password"/></td>
            </tr>
        </table>
    </s:iterator>
</s:form>
<br/><br/>
<form>
    <s:iterator value="#session.studentList">
        <table border="1" cellpadding="0" cellspacing="0">
            <tr>
                <th><s:property value="StudentID"/></th>
                <td><s:property value="username"/></td>
                <td><s:property value="password"/></td>
                <td><a href="delete.action?ID=<s:property value="studentID"/>">删除</a></td>
                <td><a href="toupdate.action?ID=<s:property value="studentID"/>">修改</a></td>
            </tr>
        </table>
    </s:iterator>
    <a><s:debug></s:debug></a>
</form>
</body>
</html>
