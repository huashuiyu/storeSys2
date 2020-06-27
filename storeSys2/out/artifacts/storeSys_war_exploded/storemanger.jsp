<%--
  Created by IntelliJ IDEA.
  User: fly
  Date: 2019/12/24
  Time: 10:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="dest/css/normalize.css" />
    <link rel="stylesheet" href="dest/css/style.css">
    <title>Title</title>
    <link rel="script" href="js/table.js">
    <script type="text/javascript">
        function altRows(id){
            if(document.getElementsByTagName){

                var table = document.getElementById(id);
                var rows = table.getElementsByTagName("tr");

                for(i = 0; i < rows.length; i++){
                    if(i % 2 == 0){
                        rows[i].className = "evenrowcolor";
                    }else{
                        rows[i].className = "oddrowcolor";
                    }
                }
            }
        }

        window.onload=function(){
            altRows('alternatecolor');
        }
    </script>
    <style type="text/css">
        table.altrowstable {
            font-family: verdana,arial,sans-serif;
            font-size:11px;
            color:#333333;
            border-width: 1px;
            border-color: #a9c6c9;
            background: #d9d9d9;
            opacity: 0.6;
            border-collapse: collapse;
        }
        table.altrowstable th {
            border-width: 1px;
            padding: 8px;
            border-style: solid;
            border-color: #a9c6c9;
        }
        table.altrowstable td {
            border-width: 1px;
            padding: 8px;
            border-style: solid;
            border-color: #a9c6c9;
            text-align: center;
            width: 95px;
        }
        .oddrowcolor{
            background-color:#d4e3e5;
        }
        .evenrowcolor{
            background-color:#c3dde0;
        }
    </style>
</head>
<body>
<div class="wrapper">
    <header class="header">
        <div class="full-center">
            <span>
                <style>
        #table3{mso-cellspacing: 0; margin:auto; }
        #table3 tr{text-align: center; height: 50px;}
        #table3 tr td{text-align: center; font-size: 26px; height: 50px; font-family: "Blackadder ITC"}
    </style>
                            <table id="table3" style="color: black">
        <tr>
            <td>
                Bewilder Store System
            </td>
        </tr>
    </table>
                <a  href="index.jsp">返回主页面</a>
            </span>
            <br>
            <table border="1" cellspacing="0" class="altrowstable" id="alternatecolor">
                <thead style="text-align: center">商品库信息</thead>
                <tr>
                    <td>商品库</td>
                    <td>管理员</td>
                    <td>修改</td>
                    <td>删除</td>
                </tr>
                <s:iterator value="#session.storeList">
                    <tr>
                        <td><a href="select_Reg.action?name=<s:property value="storeName"/>"><s:property value="storeName"/></a></td>
                        <td> <s:property value="storeManager"/></td>
                        <td><a href="updatestore.jsp?storeName=<s:property value="storeName"/>&storeManager=<s:property value="storeManager"/>">修改</a></td>
                        <td><a href="delete_Reg.action?name=<s:property value="storeName"/>">删除</a></td>
                    </tr>
                </s:iterator>
            </table>
            <br>
            <br>
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;<a href="insertstore.jsp">商品库添加</a>
        </div>

    </header>
</div>
<script src="js/jquery-1.11.0.min.js" type="text/javascript"></script>
<script src="dest/main.js"></script>
<script src="dest/circleMagic.min.js"></script>
<script>
    $('.header').circleMagic({
        elem: '.header',
        radius: 35,
        densety: .3,
        color: 'rgba(255,255,255, .4)',
        //color: 'random',
        clearOffset: .3
    });
</script>


</body>
</html>
