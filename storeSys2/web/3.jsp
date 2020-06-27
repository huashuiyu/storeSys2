<%@ page import="action.LoginAction" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.BuyHistory" %>
<%@ page import="model.item" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: asus
  Date: 2019/12/20
  Time: 14:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <meta charset="UTF-8">

    <title>main</title>

    <link rel="stylesheet" href="css/reset.css">

    <link rel="stylesheet" href="css/ustyle.css" media="screen" type="text/css" />

</head>


<script>
    function x() {
        if (parseInt(document.getElementById("number").value)  > parseInt(document.getElementById("num").value) ) {
            document.getElementById("p").innerText = "当前库存不足，已从其他商库调取";
            // document.getElementById("number").value.innerHTML="";
        }

        var val=document.getElementById("number").value;
        var regPos = /^\d+(\.\d+)?$/; //非负浮点数
        var regNeg = /^(-(([0-9]+\.[0-9]*[1-9][0-9]*)|([0-9]*[1-9][0-9]*\.[0-9]+)|([0-9]*[1-9][0-9]*)))$/; //负浮点数
        if(regPos.test(val) || regNeg.test(val)) {
        } else {
            alert("请输入正确数字");
            document.getElementById("number").value="";
        }
    }

    function right()
    {
        var count = document.getElementById("count").value;
        var flag = document.getElementById("flag").value;       //0
        var f=0;
        var n=0;
        for (var i=0;i<=count;i++)
        {
            // f=0;
            for (var j=0;j<0.5;j+=0.1)
            {
                if (i==flag)
                {
                    var div = document.getElementById(i+j);
                    div.style.display="none";
                }
                if (i==flag+1)
                {
                    if (i>0 && j==0)
                        continue;
                    var div = document.getElementById(i+j);
                    div.style.display="";
                    f=1;
                }
                if (f==1 && n==0)
                {
                    var flag= new Number(document.getElementById("flag").value);

                    document.getElementById("flag").value = flag+1;
                    n=1;
                }
            }
        }
    }

    function left()
    {
        var count = document.getElementById("count").value;
        var flag = document.getElementById("flag").value;       //1
        var f=0;
        var n=0;
        var ff = flag;
        for (var i=0;i<=count;i++)
        {
            for (var j=0;j<0.5;j+=0.1)
            {
                if (i==ff)
                {
                    if (i!=0&&j==0)
                        continue;
                    var div = document.getElementById(i+j);
                    div.style.display="none";
                }
                if (i==ff-1)
                {

                    var div = document.getElementById(i+j);
                    div.style.display="";
                    f=1;
                }
                if (f==1 && n==0)
                {
                    var flag= new Number(document.getElementById("flag").value);

                    document.getElementById("flag").value = flag-1;
                    n=1;
                }
            }

        }
    }

    function xx()
    {
        var count = document.getElementById("count").value;
        for (var i=0;i<0.5;i+=0.1)
        {
            var div0 = document.getElementById(i);
            div0.style.display="";
        }
        if (count>0)
        {
            for (var i=1;i<=count;i++)
            {
                for (var j=0.1;j<0.6;j+=0.1)
                {

                    var div = document.getElementById(i+j);
                    div.style.display="none";
                }
            }
        }
    }

</script>
<style type="text/css">

</style>
<body onload="xx()">

<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" xml:space="preserve" xmlns:xml="http://www.w3.org/XML/1998/namespace" class="svg-defs">
  <defs>

      <pattern id='image' width="1" height="1" viewBox="0 0 100 100" preserveAspectRatio="none">
          <image xlink:href="https://s3-us-west-2.amazonaws.com/s.cdpn.io/78881/pattern_141.gif" width="100" height="100" preserveAspectRatio="none"></image>
      </pattern>

      <g id="shape-butterfly-1">
          <path class="path" fill="" clip-rule="evenodd" d="M8.65,2.85c0.934-0.2,2.15-0.333,3.65-0.4c1.534-0.1,2.667-0.083,3.4,0.05
		c1.533,0.267,3.45,0.767,5.75,1.5c2.466,0.8,4.35,1.617,5.65,2.45c2.066,1.2,3.883,2.383,5.45,3.55c2.567,2.1,4.35,3.8,5.35,5.1
		l2.1,2.5c0.933,1.167,1.517,1.983,1.75,2.45c0.333,0.767,1.083,2.117,2.25,4.05c0.233,0.467,0.717,1.683,1.45,3.65
		c0.733,2.067,1.2,3.45,1.4,4.15c0.467,1.733,0.917,3.767,1.35,6.1l0.4,3.85l-0.25-3.4c-0.6-5.967-1.267-10.25-2-12.85
		c-0.733-2.434-2.167-5.467-4.3-9.1c-0.966-1.667-1.566-3-1.8-4c-0.233-0.933-0.1-1.267,0.4-1c1.3,0.733,2.917,3.867,4.85,9.4
		c1.667,4.7,2.85,11.2,3.55,19.5c0.567,6.934,0.667,11.917,0.3,14.95l0.2,0.05c0.231,0,0.348-0.05,0.35-0.15v0.05l0.1,0.05v27.4
		c-0.032-0.018-0.065-0.035-0.1-0.05v-0.05c-0.7,0.267-0.983,0.117-0.85-0.45c0.067-0.333,0.017-0.817-0.15-1.45
		c-0.2-0.6-0.316-0.983-0.35-1.15l-0.5-1.65c-0.533-2.967-0.833-5.034-0.9-6.2c-0.1-1.533-0.133-2.4-0.1-2.6
		c0-0.933,0.167-1.667,0.5-2.2c0.567-0.9,0.684-1.75,0.35-2.55c-0.167-0.367-0.367-0.6-0.6-0.7c-0.333-0.133-0.517,0.283-0.55,1.25
		c-0.033,1.533-0.167,2.9-0.4,4.1c-0.1,2.3-0.267,3.684-0.5,4.15c-0.333,0.667-1.25,2.95-2.75,6.85c-1.167,2.8-2.233,4.817-3.2,6.05
		c-0.9,1.2-1.583,2.1-2.05,2.7c-0.8,1-1.434,1.667-1.9,2c-2.067,1.333-3.633,2.067-4.7,2.2c-3.033,0.267-4.95,0.317-5.75,0.15
		c-0.8-0.167-1.383-0.217-1.75-0.15c-0.533,0.1-1.033,0.45-1.5,1.05c-0.5,0.667-1.217,1.284-2.15,1.85
		c-0.934,0.567-1.85,0.934-2.75,1.1c-2.467,0.433-4.45,0.25-5.95-0.55c-0.7-0.4-1.467-1.15-2.3-2.25c-0.6-0.867-1.033-1.567-1.3-2.1
		c-0.267-0.667-0.483-1.483-0.65-2.45c-0.3-1.467-0.383-2.717-0.25-3.75c0.267-1.9,0.45-3.05,0.55-3.45
		c0.233-1.233,0.566-2.333,1-3.3C9.25,77.45,9.767,76.4,10,76c0.667-1.233,1.55-2.583,2.65-4.05c1.1-1.434,2.184-2.583,3.25-3.45
		c0.367-0.3,1.15-0.867,2.35-1.7c0.767-0.566,1.917-1.25,3.45-2.05c1.733-0.933,3.267-1.633,4.6-2.1
		c2.133-0.733,4.534-1.467,7.2-2.2c0.467-0.1,1.517-0.3,3.15-0.6c0.967-0.233,0.4-0.4-1.7-0.5c-2.434-0.1-4.534-0.3-6.3-0.6
		c-1.566-0.267-3.383-0.7-5.45-1.3c-2.8-0.8-4.467-1.317-5-1.55c-1.567-0.667-3.2-1.75-4.9-3.25c-1.733-1.533-3-3.1-3.8-4.7
		c-0.533-1.067-0.967-2.434-1.3-4.1c-0.233-1.067-0.3-2.133-0.2-3.2c0.133-0.833,0.183-1.3,0.15-1.4v-0.6
		c-2.467-3.233-3.983-5.433-4.55-6.6c-0.533-1.033-0.883-1.833-1.05-2.4c-0.3-0.867-0.466-1.85-0.5-2.95
		c-0.033-2.367,0.034-4.117,0.2-5.25c0.3-1.034,0.483-1.8,0.55-2.3c0.167-0.867,0.034-1.533-0.4-2c-0.6-0.7-1.133-1.517-1.6-2.45
		c-0.566-1.133-0.833-2.117-0.8-2.95c0.033-1.333,0.167-2.367,0.4-3.1c0.367-1.267,1.05-2.267,2.05-3
		C4.417,4.25,6.483,3.317,8.65,2.85z"/>
          <g>

  </defs>
</svg>
<div style="text-align:center;clear:both;position:absolute;top:30px;left:260px;z-index:999">
    <script src="/gg_bd_ad_720x90.js" type="text/javascript"></script>
    <script src="/follow.js" type="text/javascript"></script>
</div>
<section class="background"></section>

<section class="scene3d">
    <br/>
    <table id="table3">
        <tr>
            <td>
                Bewilder Store System
            </td>
        </tr>
    </table>
    <br/>
    登录成功:<s:property value="#session.user.username"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    您的余额：<s:property value="#session.user.money"/>元
    <br/>
    <a href="password_update.jsp?username=<s:property value="#session.user.username"/>">修改密码</a>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <a href="登录.jsp">切换账号</a>
    <div>
        <br>
        <br>
        <form method="post" action="find">
            <input type="text" name="iitem">
            <input type="submit" value="查找">
        </form>
        <table id="table1" border="1" cellspacing="0">
            <tr>
                <td></td>
                <td></td>
                <td>&nbsp;仓库名称&nbsp;</td>
                <td>&nbsp;商品&nbsp;</td>
                <td>&nbsp;商品数量&nbsp;</td>
                <td>&nbsp;商品编号&nbsp;</td>
                <td>&nbsp;商品出售价格&nbsp;</td>
                <td>&nbsp;</td>
            </tr>

            <%
                int count=0;
                ArrayList<item> ii = (ArrayList<item>) LoginAction.session.get("items");
                int num=0;
            for (int i=0;i<ii.size();i++ )
            {
                if(num==0)
                {
                    %>

            <tr id="<%=count%>">

            <%
                }else
                {
                        %>
                        <tr id="<%=count+0.1*num%>">
            <%
                }

            %>
                            <td style="text-align: center; font-size: 13px; width: 100px;" >
                                <div id="div1"><img src="item_jpg/<%=ii.get(i).getUrl()%>.jpg" style="width: 50px; height: 50px;"></div>
                            </td>
                            <td style="text-align: center; font-size: 13px; width: 100px;" >
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            </td>
                            <td style="text-align: center; font-size: 13px; width: 100px;" >
                                <%
                                    out.print(ii.get(i).getStoreName());
                                %>
                            </td>
                            <td style="text-align: center; font-size: 13px; width: 100px;" >
                                <%
                                    out.print(ii.get(i).getItem());
                                %>
                            </td>
                            <td style="text-align: center; font-size: 13px; width: 100px;" >
                                <%
                                    out.print(ii.get(i).getNumber());
                                %>
                            </td>
                            <td style="text-align: center; font-size: 13px; width: 100px;" >
                                <%
                                    out.print(ii.get(i).getItemId());
                                %>
                            </td>
                            <td style="text-align: center; font-size: 13px; width: 100px;" >
                                <%
                                    out.print(ii.get(i).getOutPrice());
                                %>
                            </td>
                            <td style="text-align: center; font-size: 13px; width: 100px;" >
                                <a href="buy.jsp?basePrice=<%=ii.get(i).getBasePrice()%>&outPrice=<%=ii.get(i).getOutPrice()%>&itemId=<%=ii.get(i).getItemId()%>&item=<%=ii.get(i).getItem()%>&number=<%=ii.get(i).getNumber()%>&storeName=<%=ii.get(i).getStoreName()%>"><input type="button" value="购买"></a>
                            </td>


                        </tr>
                        <%
                            if (num==count*5+4 || num==ii.size()-1)
                            {
                        %>
            <%
                    }
                            if ((num)%5==4 && num!=0)
                            {
                                count++;
                                num=0;
                            }
                            num++;
            }
                %>



        </table>
        <br/>
        <input type="button" value="←" onclick="left()">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <tr>
            <td><input type="hidden" value="<%=count%>" id="count" style="width: 10px;"></td>
            第<td><input type="text" value="0" id="flag" readonly="readonly"></td>页
        </tr>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input type="button" value="→" onclick="right()">
        <br/><br/><br/>
        购买记录
        <br/><br/>

        <table id="table2" border="1" cellspacing="0">
            <tr>
                <td height="30px" width="100px">&nbsp;商品&nbsp;</td>
                <td height="30px" width="100px">&nbsp;数量&nbsp;</td>
                <td height="30px" width="100px">&nbsp;仓库&nbsp;</td>
                <td height="30px" width="100px">&nbsp;支出&nbsp;</td>
                <td  height="30px" width="200px">&nbsp;购买时间&nbsp;</td>
                <td height="30px" width="100px"></td>
            </tr>

            <s:iterator value="#session.history">
                <tr>
                    <td height="30px" width="100px">&nbsp;<s:property value="item"/>&nbsp;</td>
                    <td height="30px" width="100px">&nbsp;<s:property value="count"/>&nbsp;</td>
                    <td height="30px" width="100px">&nbsp;<s:property value="store"/>&nbsp;</td>
                    <td height="30px" width="100px">&nbsp;<s:property value="pay"/>元&nbsp;</td>
                    <td height="30px" width="100px">&nbsp;<s:property value="date"/>&nbsp;</td>
                    <td height="30px" width="100px"><a href="tuihuo.action?user.username=<s:property value="#session.user.username"/>&buyhistory.item=<s:property value="item"/>&buyhistory.date=<s:property value="date"/>&buyhistory.count=<s:property value="count"/>&buyhistory.store=<s:property value="store"/>&buyhistory.pay=<s:property value="pay"/>"><input type="submit" value="退货退款"></a></td>
                </tr>
            </s:iterator>

        </table>
    </div>


    <div class="cube skybox">
        <var class="scale">
            <figure class="face front"></figure>
            <figure class="face back"></figure>
            <figure class="face right"></figure>
            <figure class="face left"></figure>
            <figure class="face top"></figure>
            <figure class="face bottom"></figure>
        </var>
    </div>

    <div class="butterfly_container">
        <var class="rotate3d">
            <var class="scale">
                <var class="translate3d">
                    <var class="translate3d-1">
                        <figure class="butterfly">
                            <svg class="wing left" viewBox="0 0 50 100" class="icon shape-codepen">
                                <use class="left" xlink:href="#shape-butterfly-1"></use>
                            </svg>
                            <svg class="wing right" viewBox="0 0 50 100" class="icon shape-codepen">
                                <use class="left" xlink:href="#shape-butterfly-1"></use>
                            </svg>
                        </figure>
                    </var>
                </var>
            </var>
        </var>
    </div>

    <div class="butterfly_container"
         style="margin-top: -150px; margin-left: 140px;
              -webkit-animation-duration: 5s;
              -moz-animation-duration: 5s;
              -ms-animation-duration: 5s;
              -o-animation-duration: 5s;
              animation-duration: 5s;">
        <var class="rotate3d">
            <var class="scale">
                <var class="translate3d">
                    <var class="translate3d-1">
                        <figure class="butterfly">
                            <svg class="wing left" viewBox="0 0 50 100"
                                 style="-webkit-animation-duration: .75s;
                  -moz-animation-duration: .75s;
                  -ms-animation-duration: .75s;
                  -o-animation-duration: .75s;
                  animation-duration: .75s;">
                                <use class="left" xlink:href="#shape-butterfly-1"></use>
                            </svg>
                            <svg class="wing right" viewBox="0 0 50 100"
                                 style="-webkit-animation-duration: .75s;
                  -moz-animation-duration: .75s;
                  -ms-animation-duration: .75s;
                  -o-animation-duration: .75s;
                  animation-duration: .75s;">
                                <use class="left" xlink:href="#shape-butterfly-1"></use>
                            </svg>
                        </figure>
                    </var>
                </var>
            </var>
        </var>
    </div>

    <div class="butterfly_container scale_half"
         style="margin-top: -10px; margin-left: 50px;
              -webkit-animation-duration: 5s;
              -moz-animation-duration: 5s;
              -ms-animation-duration: 5s;
              -o-animation-duration: 5s;
              animation-duration: 5s;">
        <var class="rotate3d">
            <var class="scale">
                <var class="translate3d">
                    <var class="translate3d-1">
                        <figure class="butterfly">
                            <svg class="wing left" viewBox="0 0 50 100"
                                 style="-webkit-animation-duration: .75s;
                  -moz-animation-duration: .75s;
                  -ms-animation-duration: .75s;
                  -o-animation-duration: .75s;
                  animation-duration: .75s;">
                                <use class="left" xlink:href="#shape-butterfly-1"></use>
                            </svg>
                            <svg class="wing right" viewBox="0 0 50 100"
                                 style="-webkit-animation-duration: .75s;
                  -moz-animation-duration: .75s;
                  -ms-animation-duration: .75s;
                  -o-animation-duration: .75s;
                  animation-duration: .75s;">
                                <use class="left" xlink:href="#shape-butterfly-1"></use>
                            </svg>
                        </figure>
                    </var>
                </var>
            </var>
        </var>
    </div>

    <div class="butterfly_container scale_half"
         style="margin-top: 20px;
              -webkit-animation-duration: 20s;
              -moz-animation-duration: 20s;
              -ms-animation-duration: 20s;
              -o-animation-duration: 20s;
              animation-duration: 20s;">
        <var class="rotate3d">
            <var class="scale">
                <var class="translate3d">
                    <var class="translate3d-1">
                        <figure class="butterfly">
                            <svg class="wing left" viewBox="0 0 50 100"
                                 style="-webkit-animation-duration: 1s;
                  -moz-animation-duration: 1s;
                  -ms-animation-duration: 1s;
                  -o-animation-duration: 1s;
                  animation-duration: 1s;">
                                <use class="left" xlink:href="#shape-butterfly-1"></use>
                            </svg>
                            <svg class="wing right" viewBox="0 0 50 100"
                                 style="-webkit-animation-duration: 1s;
                  -moz-animation-duration: 1s;
                  -ms-animation-duration: 1s;
                  -o-animation-duration: 1s;
                  animation-duration: 1s;">
                                <use class="left" xlink:href="#shape-butterfly-1"></use>
                            </svg>
                        </figure>
                    </var>
                </var>
            </var>
        </var>
    </div>

    <div class="butterfly_container scale_half"
         style="margin-top: 100px; margin-left: 50px;
              -webkit-animation-duration: 20s;
              -moz-animation-duration: 20s;
              -ms-animation-duration: 20s;
              -o-animation-duration: 20s;
              animation-duration: 20s;">
        <var class="rotate3d">
            <var class="scale">
                <var class="translate3d">
                    <var class="translate3d-1">
                        <figure class="butterfly">
                            <svg class="wing left" viewBox="0 0 50 100"
                                 style="-webkit-animation-duration: 1.2s;
                  -moz-animation-duration: 1.2s;
                  -ms-animation-duration: 1.2s;
                  -o-animation-duration: 1.2s;
                  animation-duration: 1.2s;">
                                <use class="left" xlink:href="#shape-butterfly-1"></use>
                            </svg>
                            <svg class="wing right" viewBox="0 0 50 100"
                                 style="-webkit-animation-duration: 1.2s;
                  -moz-animation-duration: 1.2s;
                  -ms-animation-duration: 1.2s;
                  -o-animation-duration: 1.2s;
                  animation-duration: 1.2s;">
                                <use class="left" xlink:href="#shape-butterfly-1"></use>
                            </svg>
                        </figure>
                    </var>
                </var>
            </var>
        </var>
    </div>

    <div class="butterfly_container scale_third"
         style="margin-top: 150px;
              -webkit-animation-duration: 20s;
              -moz-animation-duration: 20s;
              -ms-animation-duration: 20s;
              -o-animation-duration: 20s;
              animation-duration: 20s;">
        <var class="rotate3d">
            <var class="scale">
                <var class="translate3d">
                    <var class="translate3d-1">
                        <figure class="butterfly">
                            <svg class="wing left" viewBox="0 0 50 100"
                                 style="-webkit-animation-duration: .35s;
                  -moz-animation-duration: .35s;
                  -ms-animation-duration: .35s;
                  -o-animation-duration: .35s;
                  animation-duration: .35s;">
                                <use class="left" xlink:href="#shape-butterfly-1"></use>
                            </svg>
                            <svg class="wing right" viewBox="0 0 50 100"
                                 style="-webkit-animation-duration: .35s;
                  -moz-animation-duration: .35s;
                  -ms-animation-duration: .53s;
                  -o-animation-duration: .35s;
                  animation-duration: .35s;">
                                <use class="left" xlink:href="#shape-butterfly-1"></use>
                            </svg>
                        </figure>
                    </var>
                </var>
            </var>
        </var>
    </div>

    <div class="butterfly_container scale_third"
         style="margin-top: -250px; margin-left: 300px;
              -webkit-animation-duration: 4s;
              -moz-animation-duration: 4s;
              -ms-animation-duration: 4s;
              -o-animation-duration: 4s;
              animation-duration: 4s;">
        <var class="rotate3d">
            <var class="scale">
                <var class="translate3d">
                    <var class="translate3d-1">
                        <figure class="butterfly">
                            <svg class="wing left" viewBox="0 0 50 100"
                                 style="-webkit-animation-duration: .45s;
                  -moz-animation-duration: .45s;
                  -ms-animation-duration: .45s;
                  -o-animation-duration: .45s;
                  animation-duration: .45s;">
                                <use class="left" xlink:href="#shape-butterfly-1"></use>
                            </svg>
                            <svg class="wing right" viewBox="0 0 50 100"
                                 style="-webkit-animation-duration: .45s;
                  -moz-animation-duration: .45s;
                  -ms-animation-duration: .45s;
                  -o-animation-duration: .45s;
                  animation-duration: .45s;">
                                <use class="left" xlink:href="#shape-butterfly-1"></use>
                            </svg>
                        </figure>
                    </var>
                </var>
            </var>
        </var>
    </div>

</section>


</body>


</html>




