<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2020/7/21
  Time: 10:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>shop</title>
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="css/shop_info.css">
    <script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
    <script type="text/javascript" src="js/distpicker.data.js"></script>
    <script type="text/javascript" src="js/main.js"></script>

    <script type="text/javascript">
        $(function() {

            // $("#city").ProvinceCity();
            // $('#demo').citys({code:350206});

            districts_start()


            //输入框中填充数据
            // $.ajax({
            // 	url: '/path/to/file',
            // 	type: 'default GET (Other values: POST)',
            // 	dataType: 'default: Intelligent Guess (Other values: xml, json, script, or html)',
            // 	data: {param1: 'value1'},
            // })
            // .done(function() {
            // 	console.log("success");
            // })
            // .fail(function() {
            // 	console.log("error");
            // })
            // .always(function() {
            // 	console.log("complete");
            // });


            $.ajax({
                url: '/merchant/oneMer?mid=' + 1,//mid
                type: 'GET',
                dataType: 'json',
            })
                .done(function (result) {
                    console.log("success");
                    console.log(result);
                    $("#mname").append(result.mname)//商铺名字渲染
                    $("input[name='mname']").val(result.mname)//商铺名字对应的input
                    // console.log($("input[name='mname']"))
                    $("#maddress").append(result.maddprovince + result.maddcity + result.maddcounty + result.maddress)
                    // $("#maddress").append(result.maddress)
                    $("input[name='maddress']").val(result.maddress)
                    $("#mstar").append(result.mstar)
                    $("#mscale").append(result.mscale)
                    // result.mscale = "1-5人"
                    $("select[name='mscale']").val(result.mscale)
                    $('#minfor').append(result.minfo)
                    $("textarea[name='minfo']").val(result.minfo)
                    // console.log(result.mwelfare)
                    allWelfare = result.mwelfare
                    if (result.mwelfare != null) {
                        var welfare = result.mwelfare.split('，')
                        $.grep(welfare, function (wel) {
                            $("#mwelfare").append('<span class="advan">' + wel + '</span>')
                            $("#mwelfare2").append('<span class="advan">' + wel + '</span>')
                        })
                    }

                    $("#dname").append(result.dname)
                    $("input[name='dname']").val(result.dname)
                    $("#dphone").append(result.dphone)
                    $("input[name='dphone']").val(result.dphone)
                    //设置logo
                    $("#logo-img").attr("src", result.mlogo)
                    $("#logo-img2").attr("src", result.mlogo)

                    //
                    // 设置商铺图片
                    // <div id="mpics-box">
                    $.grep(result.pics, function (pic) {
                        $("#mpics-box").append('<img src=' + pic.mpaddr + ' width="128" height="128">')
                        $("#box2").append('<img src=' + pic.mpaddr + ' width="128" height="128">')
                        //省市区设置不了
                        // result.mprovince = "河南省"
                        // result.mcity = "新乡市"
                        // result.marea = "红旗区"
                        // $("select[name='mprovince']").val(result.mprovince)//省市区
                        // $("select[name='mcity']").val(result.mcity)
                        // $("select[name='marea']").val(result.marea)
                        })
                    })
                        .fail(function () {
                            console.log("error");
                        })
                        .always(function () {
                            console.log("complete");
                        });


                    // 编辑或取消的函数
                    var editFun = function (edit, cancel, infoBox, editBox) {
                        edit.click(function (event) {
                            infoBox.hide();
                            editBox.show();
                        });
                        cancel.click(function (event) {
                            /* Act on the event */
                            infoBox.show();
                            editBox.hide();
                        });
                    }

                    editFun($("#edit1"), $("#cancel1"), $("#info-box1"), $("#edit-info-box1"))
                    editFun($("#edit2"), $("#cancel2"), $("#info-box2"), $("#edit-info-box2"))
                    editFun($("#edit3"), $("#cancel3"), $("#info-box3"), $("#edit-info-box3"))
                    editFun($("#edit4"), $("#cancel4"), $("#info-box4"), $("#edit-info-box4"))
                    editFun($("#edit5"), $("#cancel5"), $("#info-box5"), $("#edit-info-box5"))
                    editFun($("#edit6"), $("#cancel6"), $("#info-box6"), $("#edit-info-box6"))


                    //基础资料
                    $("#updateMerBasic").click(function () {
                        alert("点击了");
                        /* Act on the event */
                        $.ajax({
                            url: "/merchant/updateMerBasic",
                            type: "post",
                            dataType: 'text',
                            data: $("#updateMerBasic-form").serialize(),
                        })
                            .done(function () {
                                console.log("success");
                                alert('修改成功')
                                window.location.reload();//刷新页面
                            })
                            .fail(function () {
                                console.log("error");
                            })
                            .always(function () {
                                console.log("complete");
                            });

                    });

                    //基本信息
                    $("#updateMerInfor").click(function (event) {
                        /* Act on the event */
                        $.ajax({
                            url: '/merchant/updateMerInfor',
                            type: 'POST',
                            dataType: 'text',
                            data: $("#updateMerInfor-form").serialize(),
                        })
                            .done(function () {
                                console.log("success");
                            })
                            .fail(function () {
                                console.log("error");
                            })
                            .always(function () {
                                console.log("complete");
                            });

                    });
                    //福利添加
                    $("#add-welfare").click(function (event) {
                        /* Act on the event */
                        var wel = $("input[name='mwelfare']").val()
                        if (allWelfare != null) {
                            allWelfare = allWelfare + "，" + wel
                        } else {
                            allWelfare = wel
                        }

                        $("#mwelfare2").append('<span class="advan">' + wel + '</span>')
                        $("input[name='mwelfare']").val("")
                        console.log(allWelfare)
                    });
                    //福利提交
                    $("#updateMerWel").click(function (event) {
                        /* Act on the event */
                        console.log(allWelfare)
                        // alert('hello')
                        var data = {
                            "mid": 1,
                            "mwelfare": allWelfare,
                        };
                        $.ajax({
                            url: 'merchant/updateMerWel',
                            type: 'POST',
                            dataType: 'text',
                            contentType: "application/json;charset=UTF-8",
                            data: JSON.stringify(data),
                        })
                            .done(function () {
                                console.log("success");
                            })
                            .fail(function () {
                                console.log("error");
                            })
                            .always(function () {
                                console.log("complete");
                            });

                    });

                    //联系人及电话
                    $("#updateMerD").click(function (event) {
                        /* Act on the event */
                        $.ajax({
                            url: 'merchant/updateMerD',
                            type: 'POST',
                            dataType: 'text',
                            data: $("#updateMerD-form").serialize(),
                        })
                            .done(function () {
                                console.log("success");
                            })
                            .fail(function () {
                                console.log("error");
                            })
                            .always(function () {
                                console.log("complete");
                            });

                    });


                })

    </script>
</head>
<body>
<!-- 头部 -->
<div class="row headline top-font">
    <!-- 左侧文字 -->
    <div class="col-lg-2">
        <div class="big-font">
            C&T招聘网
        </div>
        <div class="small-font">
            city and town recruitment
        </div>
    </div>
    <!-- 占位 -->
    <div class="col-lg-9">
    </div>

    <div class="col-lg-1 center-font">
        <span>退出登录</span>
    </div>
</div>
<!-- 主要内容 -->
<div class="container main-box">
    <!-- 左侧选项 -->
    <div class="col-lg-3 choice-box">
        <div class="img-head"><img class="head_image img-circle" src="img/bsPic.png"></div>
        <div class="shop-name" id="shop_name"> 嗦粉早餐店</div>
        <ul>
            <li class="choice" id="chosen" ><a href="shop_info.jsp">商家资料</a></li>
            <li class="choice"><a href="">认证管理</a></li>
            <li class="choice" ><a href="shop_account_manage.jsp"> 账号管理</a></li>
            <li class="choice"><a href="shop_offer_manage.jsp">岗位管理</a></li>
            <li class="choice"><a href="shop_remark.jsp">我的评论</a></li>
            <%--            <li class="choice "><a>我的消息</a></li>--%>
        </ul>
    </div>
    <!-- 右侧内容 -->
    <div class="col-lg-9 col-md-9">
        <div class="row show-info">
            <div id="info-box1">
                <div>
                    <span class="cube"></span>
                    <span class="line-title">基本信息</span>
                    <span id="edit1" class="edit">编辑</span>
                </div>
                <ul>
                    <li class="li-line"><span class="li-title">商店名称</span><span > <span id="mname"><!-- 早餐店 --></span> <span class="type label label-success"> 已认证 </span><span class="type label label-danger"> <span id="mstar"><!-- 5 --></span>星 </span></span> </li>
                    <li class="li-line"></li>
                    <li class="li-line"><span class="li-title">商家规模</span><span id="mscale"><!-- 4人 --></span></li>
                    <li class="li-line"><span class="li-title">商家地址</span><span id="maddress"><!-- 小吃街23号 --></span></li>
                </ul>
            </div>
            <div id="edit-info-box1" >

                <div>
                    <span class="cube"></span>
                    <span class="line-title">基本信息</span>
                    <span id="cancel1" class="edit">取消</span>
                </div>
                <form id="updateMerBasic-form">

                    <ul>
                        <li class="li-line"> <%--   填写mid  ${}--%>
                            <input type="hidden" name="mid" value="1">
                        </li>
                        <li class="li-line"><span class="li-title">商店名称</span>
                            <input class="inline-input form-control" type="text" name="mname">
                        </li>

                        <li class="li-line"><span class="li-title">商家规模</span>
                            <!-- <span>4人</span> -->
                            <select class="inline-input form-control" name="mscale">
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

                                <div data-toggle="distpicker" data-style="option"data-placeholder-province="---请选择省---" data-placeholder-city="---请选择市---" data-placeholder-district="---请选择区---">
                                    <select name="maddprovince" class="distpicker_province" data-province="---- 选择省 ----"></select>
                                    <select name="maddcity" class="distpicker_city" data-city="---- 选择市 ----"></select>
                                    <select name="maddcounty" class="distpicker_district" data-district="---- 选择区 ----"></select>
                                </div>

                            </div>
                        </li>
                        <li class="li-line">
                            <span class="li-title">详细地址</span>
                            <input class="inline-input form-control" type="text" name="maddress">
                        </li>
                    </ul>
                    <div>
                        <button id="updateMerBasic" class="sub">保存</button>
                    </div>

                </form>
            </div>

        </div>


        <!-- logo -->
        <div class="row show-info">
            <div id="info-box6">
                <div>
                    <span class="cube"></span> <span class="line-title">商家商标</span><span id="edit6" class="edit">编辑</span>
                </div>
                <!-- <div id="minfor" class="li-line "> --><!-- 您还没有添加介绍 --><!-- </div> -->
            </div>
            <div id="edit-info-box6">
                <!-- <form id="updateMerInfor-form"> -->
                <div>
                    <span class="cube"></span> <span class="line-title">商家商标</span><span id="cancel6" class="edit">取消</span>
                </div>
                <div>
                    <img id="logo-img" src="img/首页素材/个人中心.png" width="128" height="128">
                </div>
                <!-- <div class="li-line grey-font">您还没有添加介绍</div> -->
                <!-- <textarea  class="form-control" class="text-input" name="minfor"></textarea> -->
                <form action="/merchant/updateLogo" method="post" enctype="multipart/form-data">
                    <%--   填写mid  ${}--%>
                    <input type="hidden" name="mid" value="1">
                <div class="box">
                    <img id="mlogo-img2" src="" width="128" height="128">
                        <input id="mlogo" type="file" name="logo" accept="image/gif, image/jpeg, image/png, image/jpg">

                </div>
                <div>
                    <button id="upmlogo" type="submit" class="sub">上传</button>
                </div>
                </form>

            </div>

        </div>



        <div class="row show-info">
            <div id="info-box2">
                <div>
                    <span class="cube"></span> <span class="line-title">商家介绍</span><span id="edit2" class="edit">编辑</span>
                </div>
                <div id="minfor" class="li-line "><!-- 您还没有添加介绍 --></div>
            </div>
            <div id="edit-info-box2">
                <form id="updateMerInfor-form">
                    <%--   填写mid  ${}--%>
                    <input type="hidden" name="mid" value="1">
                    <div>
                        <span class="cube"></span> <span class="line-title">商家介绍</span><span id="cancel2" class="edit">取消</span>
                    </div>
                    <!-- <div class="li-line grey-font">您还没有添加介绍</div> -->
                    <textarea  class="form-control" class="text-input" name="minfo"></textarea>
                    <div>
                        <button id="updateMerInfor" class="sub">保存</button>
                    </div>

                </form>
            </div>

        </div>

        <div class="row show-info">
            <div id="info-box3">
                <div>
                    <span class="cube"></span> <span class="line-title">优势福利</span><span id="edit3" class="edit">编辑</span>
                </div>
                <div id="mwelfare">

                </div>
            </div>
            <div id="edit-info-box3">
                <div>
                    <span class="cube"></span> <span class="line-title">优势福利</span><span id="cancel3" class="edit">取消</span>
                </div>
                <!-- 设置id进行填充 -->
                <div id = "mwelfare2">
                    <!-- <span class="advan">五险一金</span>
                    <span class="advan">包吃</span>
                    <span class="advan">包住</span>
                    <span class="advan">每周双休</span>
                    <span class="advan">年底双薪</span> -->
                </div>
                <form id="updateMerWel-form">
<%--                   < %--   填写mid  ${}&ndash;%&gt;--%>
                    <input type="hidden" name="mid" value="1">
                    <div class="add-box input-group">
                        <input type="text" class="form-control" placeholder="2-15个字，不能输入特殊字符" name="mwelfare">
                        <span class="input-group-btn">
					        <button id="add-welfare" class="btn btn-default" type="button">添加</button>
					      </span>
                    </div>
                    <button id="updateMerWel" class="sub">保存</button>
                </form>
            </div>
        </div>
        <div class="row show-info">
            <div id="info-box4">
                <div>
                    <span class="cube"></span> <span class="line-title">联系方式</span><span id="edit4" class="edit">编辑</span>
                </div>
                <div class="li-line">
                    <span class="li-title">联系人</span>
                    <span id="dname" class="" ><!-- 您还未添加招聘人信息 --></span>
                </div>
                <div class="li-line">
                    <span class="li-title">联系电话</span>
                    <span id="dphone" class=""><!-- 您还未添加招聘联系电话 --></span>
                </div>
            </div>

            <div id="edit-info-box4">
                <div>
                    <span class="cube"></span> <span class="line-title">联系方式</span><span id="cancel4" class="edit">取消</span>
                </div>
                <form id="updateMerD-form">
                    <%--   填写mid  ${}--%>
                    <input type="hidden" name="mid" value="1">
                    <div class="li-line">
                        <span class="li-title">联系人</span>

                        <input class="inline-input form-control" type="text" name="dname">
                    </div>
                    <div class="li-line">
                        <span class="li-title">联系电话</span>

                        <input class="inline-input form-control" type="text" name="dphone">
                    </div>
                    <button id="updateMerD" class="sub">保存</button>
                </form>
            </div>

        </div>
        <div class="row show-info">
            <div id="info-box5">
                <div>
                    <span class="cube"></span> <span class="line-title">商铺展示</span><span id="edit5" class="edit">编辑</span>
                </div>
                <div id="mpics-box">
                    <img src="img/首页素材/个人中心.png">
                    <img src="img/首页素材/个人中心.png">
                    <img src="img/首页素材/个人中心.png">
                    <!-- 图片应该是获取到到，这里没有改 -->
                    <!-- <img src="" >
                    <img src="" >
                    <img src=""> -->
                </div>
            </div>
            <div id="edit-info-box5">
                <div>
                    <span class="cube"></span> <span class="line-title">商铺展示</span><span id="cancel5" class="edit">取消</span>
                </div>
                <!-- <div>
                    <img src="img/首页素材/个人中心.png">
                    <img src="img/首页素材/个人中心.png">
                    <img src="img/首页素材/个人中心.png">
                </div> -->
                <form action="/merchant/addMpic" method="post" enctype="multipart/form-data">
                    <%--   填写mid  ${}--%>
                    <input type="hidden" name="mid" value="1">
                <div class="box2">
                    <input type="hidden" name="mid" value="1">
                    <img id="pre-img" src="">
                    <input id="mpics" type="file" name="pics" accept="image/gif, image/jpeg, image/png, image/jpg">
                </div>
                <button id="upmpics" type="submit" class="sub">上传</button>
                </form>
            </div>


        </div>
    </div>
</div>
</body>
</html>
