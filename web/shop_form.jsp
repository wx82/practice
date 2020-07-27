<%@ page import="com.qz.pojo.Merchant" %><%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2020/7/26
  Time: 14:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>填写商家基础资料</title>
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="css/shop_form.css">
    <script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
    <script type="text/javascript" src="js/distpicker.data.js"></script>
    <script type="text/javascript" src="js/main.js"></script>


    <script type="text/javascript">
        <% Merchant merchant = (Merchant) session.getAttribute("merchant_session");
       int mid = merchant.getMid();
       %>
        var mid = <%=mid%>;
        $(function () {
            //城市选择插件调用
            districts_start();
            allWelfare = null


            $('.sub').click(function () {
                alert("点击了");
                /* Act on the event */
                $.ajax({
                    url: "/merchant/addInfor",
                    type: "post",
                    dataType: 'text',
                    data: $("#form-box").serialize(),
                })
                    .done(function () {
                        console.log("success");
                        alert('修改成功');
                        window.location.href="shop_login.jsp";
                        // window.location.reload();//刷新页面
                    })
                    .fail(function () {
                        console.log("error");
                    })
                    .always(function () {
                        console.log("complete");
                    });

            });
            // $('.sub').click(function(event) {
            //     $.ajax({
            //         url: '/path/to/file',
            //         type: 'default GET (Other values: POST)',
            //         dataType: 'default: Intelligent Guess (Other values: xml, json, script, or html)',
            //         data: $("#form-box").serialize() ,
            //     })
            //         .done(function() {
            //             console.log("success");
            //             console.log($("#form-box").serialize())
            //         })
            //         .fail(function() {
            //             console.log("error");
            //         })
            //         .always(function() {
            //             console.log("complete");
            //         });
            //
            //     /* Act on the event */
            // });
        })
    </script>



</head>
<body>
<!-- 头部 -->
<div class="head row">

    <div class="big-font">C&T招聘网</div>
    <div class="small-font">city and town recruitment</div>


</div>
<!-- 主要内容 -->
<div class="container main-box">
    <form id="form-box">
        <input type="hidden" name="mid" value=mid>
        <div class="col-lg-12">
            <div class="row show-info">
                <div class="edit-info">

                    <div>
                        <span class="cube"></span>
                        <span class="line-title">基本信息</span>

                    </div>

                    <ul>
                        <li class="li-line"><span class="li-title">商店名称</span>
                            <input class="inline-input form-control" type="text" name="mname">
                        </li>
                        <li class="li-line"><span class="li-title">商家规模</span>
                            <!-- <span>4人</span> -->
                            <select class="inline-input form-control" name="macale">
                                <option value="1-5人">1-5人</option>
                                <option value="5-10人">5-10人</option>
                                <option value="10-50人">10-50人</option>
                                <option value="50-100人">50-100人</option>
                                <option value="100人以上">100人以上</option>
                            </select>
                        </li>
                        <li class="li-line">
                            <div  id="demo" >
                                <span class="li-title">商家地址</span>
                                <!-- <div class="citys"> -->

                                <!-- <select name="province"></select>
                                <select name="city"></select>
                                <select name="area"></select> -->

                                <!-- </div> -->
                                <div data-toggle="distpicker" data-style="option"data-placeholder-province="---请选择省---" data-placeholder-city="---请选择市---" data-placeholder-district="---请选择区---">
                                    <select name="maddprovince" class="distpicker_province" data-province="---- 选择省 ----"></select>
                                    <select name="maddcity" class="distpicker_city" data-city="---- 选择市 ----"></select>
                                    <select name="maddcounty" class="distpicker_district" data-district="---- 选择区 ----"></select>
                                </div>


                            </div>
                            <span>详细地址</span>
                            <input class="inline-input form-control" type="text" name="maddress">
                        </li>
                    </ul>



                </div>
            </div>

<%--            <div class="row show-info">--%>

<%--                <div>--%>
<%--                    <span class="cube"></span> <span class="line-title">商家商标</span>--%>
<%--                </div>--%>
<%--                <!-- <div class="li-line grey-font">您还没有添加介绍</div> -->--%>
<%--                <!-- <div class="grey-cube">未上传logo</div> -->--%>
<%--                <input id="test" type="file" name="mlogo" accept="image/gif, image/jpeg, image/png, image/jpg">--%>
<%--                <div>--%>
<%--                    <!-- <button type="submit" class="sub">上传商标</button> -->--%>
<%--                </div>--%>


<%--            </div>--%>


            <div class="row show-info">

                <div>
                    <span class="cube"></span> <span class="line-title">商家介绍</span>
                </div>
                <!-- <div class="li-line grey-font">您还没有添加介绍</div> -->
                <textarea  class="info-input text-input form-control" name="minfor"></textarea>
                <!-- <div>
                    <button type="submit" class="sub">保存</button>
                </div> -->




            </div>


            <div class="row show-info">
                <div>
                    <span class="cube"></span> <span class="line-title">联系方式</span>
                </div>

                <div class="li-line">
                    <span class="li-title">联系人 </span>
                    <!-- <span class="grey-font">您还未添加招聘人信息</span> -->
                    <input class="inline-input form-control" type="text" name="dname">
                </div>
                <div class="li-line">
                    <span class="li-title">联系电话</span>
                    <!-- <span class="grey-font">您还未添加招聘联系电话</span> -->
                    <input class="inline-input form-control" type="text" name="dphone">
                </div>
                <!-- <button type="submit" class="sub">保存</button>	 -->



            </div>
<%--            <div class="row show-info">--%>
<%--                <div>--%>
<%--                    <span class="cube"></span> <span class="line-title">商铺展示</span>--%>
<%--                </div>--%>
<%--                <div>--%>
<%--                    <img src="img/首页素材/个人中心.png">--%>
<%--                    <img src="img/首页素材/个人中心.png">--%>
<%--                    <img src="img/首页素材/个人中心.png">--%>
<%--                    <!-- <input type="file" name="mlogo" accept="image/gif, image/jpeg, image/png, image/jpg"> -->--%>
<%--                </div>--%>
                <button id="sub" class="sub">保存</button>

<%--            </div>--%>
        </div>
    </form>
</div>
</body>
</html>
