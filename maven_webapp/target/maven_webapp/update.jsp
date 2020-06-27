<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
    <title>updateMsg</title>
</head>
<body>
hello :<s:property value="#session.admin.admin_name"/>
<br/>
update
<s:form action="update" method="GET">
    <s:property value="#session.update.studentID"/>
    <s:textfield  name="updatestu2.username" label="username" required="true"/>
    <s:textfield  name="updatestu2.password" label="password" required="true"/>
    <s:textfield  name="updatestu2.grade" label="grade" required="true"/>
    <s:textfield  name="updatestu2.department" label="department" required="true"/>
    <s:textfield  name="updatestu2.major" label="major" required="true"/>
    <s:submit value="update"/>
</s:form>
</body>
</html>