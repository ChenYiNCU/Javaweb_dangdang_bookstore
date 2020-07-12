<%--
  Created by IntelliJ IDEA.
  User: 益
  Date: 2020/5/28
  Time: 21:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录</title>
    <script src="jquery-1.9.1.min.js"></script>
    <script>
        $(document).ready(
            alert("当当平台及销售商不会以任何理由，要求您点击任何网址链接进行退款或支付操作。当当客服电话400-106-6666，0527-80878888。")
        );
    </script>
    <style>
        #box1{width: 100%;border-bottom: 1px gainsboro solid}
        .box12{margin: 0 auto;width: 1220px;height: 670px;}

        #box2{width: 700px;position:relative;float: left;}
        #box3{padding-top: 20px;padding-bottom:20px ;text-align: center;bottom: -15px;width: 380px;border: 1px gainsboro solid;position: relative;float: right;}
        input{width: 90%;height: 30px;margin: 20px; outline:none;}
        #box31{height: 40px; background: orangered;border-radius: 5px;border: none;color: white;font-size: 18px}
        #box32 {left: 10px;;color: blue;position: relative;float: left;font-size: 12px;text-decoration:none;}
        #box32:hover{text-decoration:underline;}
        #box33{position: relative;float:right;font-size: 16px;right: 20px;text-decoration: none}
        #box33:hover{text-decoration:underline;}
        #sub{text-align: center;font-size: 12px;color: gray}

    </style>
</head>
<body>
<div id="box1">
    <div class="box12">
        <div style="padding-top: 10px;margin-bottom:50px ">
            <img src="https://login.dangdang.com/images/logo.png" alt="">
        </div>
        <div  id="box2">
            <img src="./imags/im1.PNG" alt="">
        </div>
        <div id="box3">
            <strong style="font-size: 20px">密码登录</strong>
            <form action="login.do">
                <input type="text" name="name" placeholder="用户名" style="text-indent: 30px" onfocus="placeholder=''"
                       onblur="if(!placeholder)placeholder='用户名'" ><br>
                <input type="password" name="pass" placeholder="密码" style="text-indent: 30px" onfocus="placeholder=''"
                       onblur="if(!placeholder)placeholder='密码'"><br>
                <input type="submit" value="登&nbsp;录" id="box31">
                <img src="./imags/unlock.png" alt="" style="position: absolute; top: 135px;left: 20px;width: 30px;height: 30px; ">
                <img src="./imags/user.png" alt="" style="width: 30px;height: 30px;position: absolute;left: 20px ;top: 68px">
                <div>
                    <a href="http://help.dangdang.com/details/page258" id="box32">《隐私政策》</a>

                    <a href="reg.jsp" id="box33">立即注册 </a>

                </div>

            </form>
            <div style="margin-top: 30px;position: relative;float: left;left: 10px">
                <img src="./imags/r1.PNG" alt="">
            </div>

        </div>
    </div>
</div>
<div id="sub" >
    <div>
        <p style="margin: 30px">
            公司简介&emsp;|&emsp;诚聘英才&emsp;|&emsp;网站联盟&emsp;|&emsp;当当招商&emsp;|&emsp;机构销售&emsp;|&emsp;手机当当&emsp;|&emsp;官方Blog&emsp;|&emsp; 知识产权 &emsp;|&emsp;热词搜索
        </p>
        <p>
            Copyright (C) 当当网 2004-2020, All Rights Reserved
        </p>

        <span>京ICP证041189号&emsp;|&emsp;出版物经营许可证 新出发京批字第直0673号&emsp;|&emsp;食品经营许可证：JY11101050363440</span>
        <br>
        <span>京ICP备17043473号&emsp;|&emsp;京公网安备 11010502037644号京公网安备11010502037644号&emsp;|&emsp;经营许可证编号：合字B2-20160011&emsp;|&emsp;互联网药品信息服务资格证</span>
        <br>
        <span>互联网违法和不良信息举报电话：4001066666-5 邮箱：service@cs.dangdang.com</span>
        <br>
        <span>网络出版服务许可证（总）网出证（京）字第049号北京当当科文电子商务有限公司，公司地址：北京市朝阳区北三环东路8号静安中心21层</span>
        <br>
        <div style="margin-top: 20px;padding-bottom:50px ">
            <img src="http://img61.ddimg.cn/7d593c48-48f6-4fc9-85e0-7d6e10dfc2a2.hpvgUvc9" alt="">
            <img src="http://img63.ddimg.cn/upload_img/00111/home/brand_128_47.png" alt="">
            <img src="http://img60.ddimg.cn/upload_img/00459/home/hlwjbzx_182.png" alt="">
            <img src="http://img60.ddimg.cn/upload_img/00459/home/cnnic.png" alt="">

        </div>
    </div>
</div>

</body>
</html>
