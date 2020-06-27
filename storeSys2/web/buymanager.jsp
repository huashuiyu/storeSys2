<%--
  Created by IntelliJ IDEA.
  User: fly
  Date: 2019/12/24
  Time: 11:36
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
    <script type="javascript">
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
                    <center>
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
                    </center>
                <a  href="index.jsp">返回主页面</a>
            </span>
                <br>
                <table class="altrowstable" id="alternatecolor">
                    <tr>
                        <th>购买用户</th>
                        <th>所购仓库</th>
                        <th>所购物品</th>
                        <th>所购数量</th>
                        <th>购买日期</th>
                        <th>消费金额</th>
                    </tr>
                    <s:iterator value="#session.buyhistory">
                        <tr>
                            <td> <s:property value="username"/></td>
                            <td> <s:property value="store"/></td>
                            <td> <s:property value="item"/></td>
                            <td> <s:property value="count"/></td>
                            <td> <s:property value="date"/></td>
                            <td> <s:property value="pay"/></td>
                        </tr>
                    </s:iterator>


                </table>
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

</table>

</body>
</html>
