<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2019/12/27
  Time: 9:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
<script language="JavaScript">
    function fun(obj){    var div = document.getElementById("test");    if(obj.value=="隐藏"){        div.style.display = "none";        obj.value = "显示";    } else {        div.style.display = "block";        obj.value = "隐藏";    }}
</script>
</head>
<body>
<table>

<input type="button" value="隐藏" onclick="fun(this)">我是一个DIV
    <tr id="test"><td>123</td><td>123</td>
    </tr>
    </div>

</table>
</body>
</html>
