<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2019/12/21
  Time: 8:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
--%>
<html>
<head>
    �0�2�0�2 <title>�ҵĵ�¼����</title>
    <link rel="stylesheet" href="css/bootstrap.min.css"> �0�2
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="css/ystyle.css">

    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>CSS3��������ʱ��</title>
    <link href="css/cstyle.css" rel="stylesheet" />

    <style>
        #table3{mso-cellspacing: 0; margin:auto; }
        #table3 tr{text-align: center; height: 50px;}
        #table3 tr td{text-align: center; font-size: 26px; height: 50px; font-family: "Blackadder ITC"}
    </style>
</head>
<body>

    <!--Ч��html��ʼ-->
    <div id="clock" class="light">
        <div class="display">
            <div class="weekdays"> </div>
            <div class="ampm"> </div>
            <div class="alarm"> </div>
            <div class="digits"> </div>
        </div>


    <script src="js/jquery.min.js"></script>
    <script src="js/moment.min.js"></script>
    <script src="js/script.js"></script>
    <!--Ч��html����-->
    <div class="clear"></div>
</div>
<form action="login" method="post">
    <table id="table3" style="color: black">
        <tr>
            <td>
                Bewilder Store System
            </td>
        </tr>
    </table>
    �0�2�0�2 �0�2<div class="container">
    �0�2�0�2�0�2�0�2�0�2�0�2�0�2 <div class="form row">
    �0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2 <div class="form-horizontal col-md-offset-3" id="login_form">
    �0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2 <h2 class="form-title">Login</h2>
    �0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2 <div class="col-md-9">
    �0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2 <div class="form-group">
    �0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2 <i class="fa fa-user fa-lg"></i>
    �0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2 <input class="form-control required" type="text" placeholder="�û���" id="username" name="user.username" autofocus="autofocus" maxlength="20"/>
    �0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2 </div>
    �0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2 <div class="form-group">
    �0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2 <i class="fa fa-lock fa-lg"></i>
    �0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2<input class="form-control required" type="password" placeholder="����" id="password" name="user.password" maxlength="8"/>
    �0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2 </div>
    �0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2 <div class="form-group col-md-offset-9">
    �0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2 <button type="submit" class="btn btn-success pull-right" name="submit">��¼</button>
    �0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2 </div>
    �0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2 </div>
    �0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2 </div>
    �0�2�0�2�0�2�0�2�0�2�0�2�0�2 </div>
    �0�2�0�2�0�2 </div>
</form>
</body>
</html>

