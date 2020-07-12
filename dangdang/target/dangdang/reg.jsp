<%--
  Created by IntelliJ IDEA.
  User: 益
  Date: 2020/5/29
  Time: 9:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注册</title>
</head>
<style>
    *{background: rgb(250, 250, 250)}
    #box1{width: 100%;border-bottom: 1px gainsboro solid;height: 600px;}
    #box12{width: 990px;height: 600px;margin: 0 auto}
    #box13{border-bottom: 3px solid red;background: white}
    #box14 {background: white;;text-align: center;margin-top:30px;border: 1px solid gainsboro; padding: 30px 0}
    h3,form{background: white;}
    input{height: 30px;width: 300px;margin: 20px;border: 1px gainsboro solid}
    #box2{font-size: 18px;border-radius: 20px;border: none;background: red;color: white;height: 40px;width: 200px}
    #sub{text-align: center;font-size: 12px;color: gray}

</style>
<script src="jquery-1.9.1.min.js"></script>
<script>

    function  getxhr() {
        var xhr=null;
        if (window.XMLHttpRequest){
            xhr=new XMLHttpRequest();
        }
        else {
            xhr=new ActiveXObject('Microsoft.XMLHttp');
        }
        return xhr;
    }

   function getR(username) {

        var xhr=getxhr();
        xhr.open("get","getName.do?Rname="+username,true);
        xhr.onreadystatechange=function() {
            if (xhr.readyState == 4 && xhr.status == 200) {

                $("#msg").text(xhr.responseText);

            }
        };
       xhr.send();
}
    function getP(pass) {

        if (pass==null)
        {
            $("#msg2").text(" ");
        }
        else if (pass.length<6){
            $("#msg2").text("密码强度弱");
        }
        else {
            $("#msg2").text("密码强度较强");
        }

    }
    function getRP(rpass) {
        var pass=$("#p1").val();
        if (rpass==pass){

            $("#msg3").text("密码一致");
        }
        else {
            $("#msg3").css({color:'red' });
            $("#msg3").text("密码不一致!!!");
        }
    }



</script>

<body>
<div id="box1">
    <div id="box12">
        <div id="box13">
            <img src="https://login.dangdang.com/images/ddnewhead_logo.gif" alt="">
        </div>
        <div id="box14">
            <h3>用户注册</h3>
            <form action="reg.do">
                用户&emsp;名： <input type="text" name="name" placeholder="用户名" onfocus="placeholder=''"
                                  onblur="if(!placeholder)placeholder='用户名'" id="user" onchange="getR(this.value)">
                <span id="msg" style="position: absolute;float: right;top: 228px;background: white"></span>
                <br>
                登录密码： <input type="password" name="pass" onchange="getP(this.value)" id="p1">
                <span id="msg2" style="position: absolute;float: right;top: 298px;background: white"></span><br>
                确认密码： <input type="text" name="repass" onchange="getRP(this.value)" id="p2">
                <span id="msg3" style="position: absolute;float: right;top: 365px;background: white"></span><br>
                <input type="submit" value="立即注册" id="box2">

            </form>
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
