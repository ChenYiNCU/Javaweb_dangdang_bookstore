<%--
  Created by IntelliJ IDEA.
  User: 益
  Date: 2020/5/27
  Time: 20:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>当当网图书</title>
    <script src="jquery-1.9.1.min.js"></script>
    <link rel="stylesheet" href="dangdang.css" type="text/css">
    <style type="text/css">
    	#box23{
    		cursor: pointer;
    	}
    </style>
    <script src="dang.js"></script>
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
        function getC(pro) {
            var xhr=getxhr();
            xhr.open("get","getAr.do?cname="+pro,true);
            xhr.onreadystatechange=function(){
                if (xhr.readyState==4 && xhr.status==200)
                {
                    // alert(xhr.responseText);
                    var info=xhr.responseText;
                    var obs=eval(info);     //将json字符串转换为json数据格式
                    for (var i=0;i<obs.length;i++)
                    {
                        document.getElementById("s2").options[i]=null;
                        var op=new Option(obs[i].zname,obs[i].ename);
                        document.getElementById("s2").options[i]=op;
                    }
                }
            };
            xhr.send();
        }
    </script>
</head>

<body>
<div id="box1">
    <div class="box12">
        <div class="box14" style="font-size: 14px;">送至：
            <select id="s1" onchange="getC(this.value)">
                <option value="jx">江西</option>
                <option value="cq">重庆</option>
            </select>

            <select id="s2"></select>
        </div>
        <div class="box13">
            <%
                if (session.getAttribute("sname")==null){
            %>
            <font style="position: absolute;left: -120px;top: 6px">欢迎光临当当，请<a href="login.jsp" style="color: red">登录</a> </font>
            <%
                }else {
            %>
            <font style="position: absolute;left: -130px;top: 6px">欢迎 <strong style="color: red;font-size: 14px"><%=session.getAttribute("sname")%></strong>, 光临当当书城</font>
            <%}%>

            <ul>
                <a href="reg.jsp"> <li>成为会员 </li></a>
                <li>我的云书房</li>
                <li>我的当当</li>
                <li> 0元领物</li>
                <li>小说投稿</li>
                <li>我要出书</li>
                <li>企业采购</li>
                <li>客户服务</li>
            </ul>


        </div>
    </div>>
</div>
<div id="box2">
    <div class="box12">
        <img src="http://img61.ddimg.cn/upload_img/00837/1/logo-1590155269.gif" alt="">
        <input type="text" id="box21" placeholder="儿童自我保护" style="height: 39px">
        <img src="./imags/2.PNG" alt="" style="position: relative;top:-33px;left: -6px;">
        <div id="box22">
            <font style="position: absolute;left: -32px;top: 5px">热搜:</font>
            <ul>
                <li>水浒寻宋</li>
                <li>数学绘本 </li>
                <li>穿过地平线 </li>
                <li>Q萌手绘</li>
                <li>汪曾祺</li>
            </ul>
        </div>
        <div id="box23" onclick="location.href='<%=request.getContextPath()%>/cart/listItem.do?user=<%=session.getAttribute("sname")%>'">
            <div><img src="./imags/cart_empty.png" alt="" width="32px" height="32px"> </div>
            <div style="position: absolute;top: 6px;left: 40px;">购物车</div>
        </div>

    </div>
</div>
<div id="box3" style="border-bottom: 3px red solid">
    <div class="box12">
        <img src="./imags/1.PNG" alt="" class="box14" style="top: 1px">
        <strong>
            <ul style="padding: 8px">
                <li>图书</li>
                <li>电子书</li>
                <li>网络文学</li>
                <li>服装</li>
                <li>运动户外</li>
                <li>孕婴童</li>
                <li>家居</li>
                <li>当当优品</li>
                <li>食品</li>
                <li>Apple</li>
                <li>电器城</li>

            </ul>
        </strong>
    </div>
</div>
<div id="box4">
    <div class="box12">
        <ul>
            <li>图书排行榜</li>
            <li>童书</li>
            <li>教辅</li>
            <li>小说</li><li>文学</li>
            <li>青春文学</li>
            <li>艺术</li>
            <li>成功励志</li>
            <li>管理</li>
            <li>历史</li>
            <li>哲学宗教</li>
            <li>亲子家教</li>
            <li>保健养生</li>
            <li>考试</li>
            <li>科技</li>
            <li>进口原版</li>
            <li>电子书</li>
            <li>网络文学</li>
        </ul>


    </div>

</div>
<div style="height: 70px;text-align: center;margin: 10px;padding-top: 5px;">
    <img src="http://img62.ddimg.cn/upload_img/00822/cxtc/1200x65_0522-1590142765.jpg" alt="">
</div>

<div id="box5">
    <div class="box12">
        <div id="box51">
            <div style="padding: 5px;text-align: center;font-size: 18px;color: white;background: green">图书分类</div>
            <div><dt>特色书单</dt></div>
            <div><dt>电子书&nbsp;网络文学</dt></div>
            <div>
                <dt>教育</dt>
                <dd>
                    <ul>
                        <li>教材</li>
                        <li>外语</li>
                        <li>考试</li>
                        <li>中小学教辅</li>
                        <li>工具书</li>
                    </ul>

                </dd>

            </div>

            <div><dt>小说</dt></div>
            <div>
                <dt>文艺</dt>
                <dd>
                    <ul>
                        <li>文学</li>
                        <li>传记</li>
                        <li>艺术</li>
                        <li>摄影</li>
                    </ul>
                </dd>
            </div>
            <div><dt>青春文学 /动漫 · 幽默</dt></div>
            <div>
                <dt>童书</dt>
                <dd>
                    <ul>
                        <li>0-2</li>
                        <li>3-6</li>
                        <li>7-10</li>
                        <li>11-14</li>
                        <li>科普/百科</li>
                        <li>绘本</li>
                        <li>文学</li>
                        <li>英语</li>

                    </ul>
                </dd>
            </div>
            <div>
                <dt>人文社科</dt>
                <dd>
                    <ul>
                        <li>历史</li>
                        <li>古籍</li>
                        <li>哲学/宗教</li>
                        <li>文化政治/军事</li>
                        <li>法律</li>
                        <li>社会科学</li>
                        <li>心理学</li>
                    </ul>
                </dd>
            </div>
            <div>
                <dt>经管</dt>
                <dd>
                    <ul>
                        <li>经济</li>
                        <li>管理</li>
                        <li>投资理财</li>
                    </ul>
                </dd>
            </div>
            <div><dt>成功/励志</dt></div>
            <div>
                <dt>生活</dt>
                <dd>
                    <ul>
                        <li>两性</li>
                        <li>孕期</li>
                        <li>育儿</li>
                        <li>亲子/家教</li>
                        <li>保健</li>
                        <li>运动</li>
                        <li>美妆</li>
                        <li>手工</li>
                        <li>美食</li>
                        <li>旅游</li>
                        <li>休闲</li>
                        <li>家居</li>

                    </ul>
                </dd>
            </div>
            <div>
                <dt>科技</dt>
                <dd>
                    <ul>
                        <li>科普</li>
                        <li>建筑</li>
                        <li>医学</li>
                        <li>计算机</li>
                        <li>农林</li>
                        <li>自然科学</li>
                        <li>工业</li>

                    </ul>
                </dd>
            </div>
            <div><dt>英文原版书 &nbsp;港台图书</dt></div>
            <div><dt>当当出版</dt></div>
            <div><dt>期刊 /音像</dt></div>
            <div><dt>创意文具</dt></div>

        </div>

        <div id="box52">
            <div id="sub1">
                <img src="http://img63.ddimg.cn/upload_img/00822/cxtc/750x315_0522-1590142737.jpg" alt="">
                <img src="http://img60.ddimg.cn/upload_img/00785/ts/750x315-1589874530.jpg" alt="">
                <img src="http://img61.ddimg.cn/upload_img/00725/1/jf750-1590308582.jpg" alt="">
                <img src="http://img62.ddimg.cn/upload_img/00316/by/750315pc-1590033443.jpg" alt="">
                <img src="http://img60.ddimg.cn/upload_img/00785/ts/750x315-1590132559.jpg" alt="">
                <img src="http://img55.ddimg.cn/9003260160395255.jpg" alt="">
                <img src="http://img63.ddimg.cn/ddreader/dangebook/dzsnzq750-315.jpg" alt="">
                <img src="http://img61.ddimg.cn/upload_img/00478/0609/750x315FHC_0522-wy-1590317368.jpg" alt="">
                <img src="http://img62.ddimg.cn/upload_img/00316/by/750x315-1589356003.jpg" alt="">
                <img src="http://img61.ddimg.cn/upload_img/00820/a/750-1590303473.jpg" alt="">
                <img src="http://img61.ddimg.cn/upload_img/00830/1206/750x315FHC_05252-1590325004.jpg" alt="">
                <img src="http://img60.ddimg.cn/upload_img/00830/1206/750x315-1590332188.jpg" alt="">
                <ul id="imgc">
                    <li value="0"></li>
                    <li value="1"></li>
                    <li value="2"></li>
                    <li value="3"></li>
                    <li value="4"></li>
                    <li value="5"></li>
                    <li value="6"></li>
                    <li value="7"></li>
                    <li value="8"></li>
                    <li value="9"></li>
                    <li value="10"></li>
                    <li value="11"></li>
                </ul>
            </div>
            <div id="sub2" class="box13">
                <strong>当当年中庆</strong> <br>
                <ul>
                    <li>十万童书，每满100减50</li>
                    <li>四本书看懂赌王何鸿燊</li>
                    <li>考试不用愁，每满100减50</li>
                </ul>

            </div>
            <div id="sub3" class="box13">
                <strong>热门推荐</strong>
                <div id="sub31">
                    <img src="./imags/im0.gif" alt="" style="display: block">
                    <img src="./imags/im1.gif" alt="">
                    <img src="./imags/im2.gif" alt="">
                    <img src="./imags/im3.gif" alt="">
                    <img src="./imags/im4.gif" alt="">
                    <ul id="imgc1">
                        <li value="0" style="background: green"></li>
                        <li value="1"></li>
                        <li value="2"></li>
                        <li value="3"></li>
                        <li value="4"></li>
                    </ul>
                </div>
                <div id="sub32">
                    <img src="./imags/L.PNG" alt="" style="position:relative;top: 30px " id="i1">
                    <img src="./imags/R.PNG" alt=""style="position:relative;top: 31px;float:right" id="i2">
                </div>
            </div>
        </div>

        <div id="box53">
            <div id="le">
                <img src="./imags/3.PNG" alt="">
                <a  style="font-size: 18px;color: green;top: 10px" class="box13" href="list.do"> >>>>>图书列表<<<<<</a>
                <table>
                    
               
                <% for (int i=0;i<2;i++) { %>
                <tr>
                    <% for (int j=0;j<5;j++) {
                      int k=1;
                      k=i*5+j+1;
                    %>
                    <td><img src="./imags/td<%=k%>.jpg" ></td>
                    <%}%>
                </tr>
                <%}%>
                </table>

            </div>

        </div>

    </div>
</div>
<div id="box6">
    <div class="box12">
        <h2>当当年中庆</h2>
            <table class="box14">
                <tr>
                    <td><img src="./imags/t1.jpg" alt=""></td>
                    <td><img src="./imags/t2.jpg" alt=""></td>
                    <!-- <td colspan="2" rowspan="2"><img src="./imags/t9.jpg" alt=""></td>
                 -->

                </tr>
                <tr>
                    <td><img src="./imags/t5.jpg" alt=""></td>
                    <td><img src="./imags/t6.jpg" alt=""></td>
                </tr>
            </table>

            <img src="./imags/t9.jpg" alt=""class="box14">


            <table class="box14">
                <tr>
                    <td><img src="./imags/t3.jpg" alt=""></td>
                    <td><img src="./imags/t4.jpg" alt=""></td>
                </tr>

                <tr>

                    <td><img src="./imags/t7.jpg" alt=""></td>
                    <td><img src="./imags/t8.jpg" alt=""></td>

                </tr>
            </table>

    </div>
</div>
<div id="box7">
    <img src="https://img60.ddimg.cn/assets/pc_image/minaAttract-1111-bottom-dangdangshou.gif" alt="">
    <img src="./imags/close.png" alt="" id="d1">

</div>
<div id="box8">
    <a href="#box1"><img src="./imags/5.PNG" alt=""></a>
</div>


</body>
</html>
