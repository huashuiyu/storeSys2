<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
    <title>addMsg</title>
</head>
<body>
hello :<s:property value="#session.admin.admin_name"/>
<br/>
<s:form action="add">
    <s:textfield label="学生姓名" name="student.username" required="true"/>
    <s:textfield label="密码" name="student.password"  required="true"/>
    <s:submit value="添加"/>
</s:form>

</body>
</html>