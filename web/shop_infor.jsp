<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2020/7/13
  Time: 22:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/";    %>

<base href="<%=basePath %>">

<html>
<head>
    <title>商铺信息</title>
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="/css/shop_offer_manage.css">
    <link rel="stylesheet" type="text/css" href="./css/shop_info.css">
    <script type="text/javascript" src="./js/jquery-3.1.1.min.js"></script>
    <script type="text/javascript">
        <%--window.onload = function f(){--%>
        <%--    $.ajax({--%>
        <%--        url: "${pageContext.request.contextPath}/merchant/queryAllMerById", //后台url--%>
        <%--        type: "POST",--%>
        <%--        dataType: "json",--%>
        <%--        contentType:"application/json;charset=UTF-8",--%>
        <%--        data: JSON.stringify(merchant),--%>
        <%--        success: function(data) {--%>
        <%--            alert(data);--%>
        <%--        },--%>

        <%--        error: function(er) {          //失败，回调函数--%>
        <%--            //  alert('修改错误');--%>
        <%--            alert(er)--%>
        <%--        }--%>
        <%--    });--%>
        <%--}--%>
        $(function(){
            // $("#edit-info").click(function(event) {
            // 	$("#info-box").hide()
            // 	$("#edit-info-box").show()
            // });
            // $("#edit-info-cancel").click(function(event) {
            // 	$("#info-box").show()
            // 	$("#edit-info-box").hide()
            // });
            // $.ajax({
            //     url: "/merchant/queryAllMerById", //后台url
            //     type: "POST",
            //     dataType: "json",
            //     contentType:"application/json;charset=UTF-8",
            //     data: JSON.stringify(product),
            //     success: function(data) {
            //
            //     },
            //
            //     error: function(er) {          //失败，回调函数
            //         //  alert('修改错误');
            //         alert(er)
            //     }
            // });

            // 编辑或取消的函数
            var editFun = function(edit,cancel,infoBox,editBox){
                edit.click(function(event) {
                    infoBox.hide();
                    editBox.show();
                });
                cancel.click(function(event) {
                    /* Act on the event */
                    infoBox.show();
                    editBox.hide();
                });
            }

            editFun($("#edit1"),$("#cancel1"),$("#info-box1"),$("#edit-info-box1"))
            editFun($("#edit2"),$("#cancel2"),$("#info-box2"),$("#edit-info-box2"))
            editFun($("#edit3"),$("#cancel3"),$("#info-box3"),$("#edit-info-box3"))
            editFun($("#edit4"),$("#cancel4"),$("#info-box4"),$("#edit-info-box4"))
            editFun($("#edit5"),$("#cancel5"),$("#info-box5"),$("#edit-info-box5"))
            $("#saveBasic").on({
                click:function () {
                    alert("点击了");
                    var m={
                        'mid':1,
                        'mname':$("#mname").val().toString(),
                        'mscale': $("#mscale").find("option:selected").text(),
                        'maddcity':$("#maddcity").find("option:selected").text(),
                        'maddcounty':$("#maddcounty").find("option:selected").text(),
                        'maddtown':$("#maddtown").find("option:selected").text(),
                        'maddress':$("#maddress").val().toString(),
                    };
                    // console.log(m.mid);
                    // console.log(m.maddcity);
                    // console.log(m.maddress);

                    $.ajax({
                        url: "/merchant/updateMerBasic", //后台url
                        type: "post",
                        dataType: "text",
                        // contentType:"application/json;charset=UTF-8",  //请求以创建对象形式需要-----json格式需要  以表单不需要
                        //  data: JSON.stringify(m), //创建对象
                         data:$('#basMerInfor').serialize(),//表单数据直接传
                        success: function(data) {
                            console.log(data);
                           if(data == 1){
                               window.location.reload();
                           }else{
                               alert("修改基础信息失败");
                           }
                        },
                        error: function(er) {          //失败，回调函数
                            //  alert('保存失败');
                            alert(er)
                        }
                    });

                }
            })
        });
    </script>
</head>
<body>
<!-- 头部 -->
<%--<div class="head">--%>
<%--    <div class="big-font">C&T招聘网</div>--%>
<%--    <div class="small-font">city and town recruitment</div>--%>
<%--</div>--%>
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
            <li class="choice" id="chosen"><a>商家资料</a></li>
            <li class="choice"><a>认证管理</a></li>
            <li class="choice" ><a>账号管理</a></li>
            <li class="choice"><a>岗位管理</a></li>
            <li class="choice"><a>我的评论</a></li>
            <li class="choice"><a>我的消息</a></li>
        </ul>
    </div>
    <!-- 右侧内容 -->
    <div class="col-lg-9">
        <div class="row show-info">
            <div id="info-box1">
                <div>
                    <span class="cube"></span>
                    <span class="line-title">基本信息</span>
                    <span id="edit1" class="edit">编辑</span>
                </div>
                <ul>
                    <li class="li-line"><span class="li-title">商店名称</span><span> 嗦粉早餐店 <span class="type label label-success"> 已认证 </span><span class="type label label-danger"> 5星 </span></span> </li>
                    <li class="li-line"><span class="li-title">商家类型</span><span>餐饮</span></li>
                    <li class="li-line"><span class="li-title">商家规模</span><span>4人</span></li>
                    <li class="li-line"><span class="li-title">商家地址</span><span>小吃街23号</span></li>
                </ul>
            </div>
            <div id="edit-info-box1" >

                <div>
                    <span class="cube"></span>
                    <span class="line-title">基本信息</span>
                    <span id="cancel1" class="edit">取消</span>
                </div>
                <form id="basMerInfor">
                    <%--   填写mid  ${}--%>
                    <input type="hidden" name="mid" value="1">
                    <ul>
                        <li class="li-line"><span class="li-title">商店名称</span><!-- <span> 嗦粉早餐店 <span class="type label label-success"> 已认证 </span><span class="type label label-danger"> 5星 </span></span>  -->
                            <input class="inline-input form-control" type="text" name="mname" id="mname">
                        </li>

                        <li class="li-line"><span class="li-title">商家规模</span>
                            <!-- <span>4人</span> -->
                            <select class="inline-input form-control" id="mscale" name="mscale">
                                <option value="5">1-5人</option>
                                <option value="10">5-10人</option>
                                <option value="50">10-50人</option>
                                <option value="100">50-100人</option>
                                <option value="101">100人以上</option>
                            </select>
                        </li>
                        <li class="li-line">
                            <span class="li-title">商家地址</span><!-- <span>小吃街23号</span> -->
                            <div>
                                <select class="inline-input form-control" id="maddcity" name="maddcity">
                                    <option>城市1</option>
                                    <option>城市2</option>
                                    <option>城市3</option>
                                </select>
                                <select class="inline-input form-control" id="maddcounty" name="maddcounty">
                                    <option>县1</option>
                                    <option>县2</option>
                                    <option>县3</option>
                                </select>
                                <select class="inline-input form-control" id="maddtown" name="maddtown">
                                    <option>镇1</option>
                                    <option>镇2</option>
                                    <option>镇3</option>
                                </select>
                            </div>
                            <span>详细地址</span>
                            <input class="inline-input form-control" type="text" name="maddress" id="maddress">
                        </li>
                    </ul>
                    <div>
                        <button type="button" class="sub" id="saveBasic">保存</button>
                    </div>

                </form>
            </div>

        </div>
        <div class="row show-info">
            <div id="info-box2">
                <div>
                    <span class="cube"></span> <span class="line-title">商家介绍</span><span id="edit2" class="edit">编辑</span>
                </div>
                <div class="li-line grey-font">您还没有添加介绍</div>
            </div>
            <div id="edit-info-box2">
                <form>
                    <%--   填写mid  ${}--%>
                    <input type="hidden" name="mid" value="1">
                    <div>
                        <span class="cube"></span> <span class="line-title">商家介绍</span><span id="cancel2" class="edit">取消</span>
                    </div>
                    <!-- <div class="li-line grey-font">您还没有添加介绍</div> -->
                    <textarea  class="form-control" class="text-input" name="shop-info" id="minfo"></textarea>
                    <div>
                        <button type="submit" class="sub">保存</button>
                    </div>

                </form>
            </div>

        </div>
        <div class="row show-info">
            <div id="info-box3">
                <div>
                    <span class="cube"></span> <span class="line-title">优势福利</span><span id="edit3" class="edit">编辑</span>
                </div>
                <div>
                    <span class="advan">五险一金</span>
                    <span class="advan">包吃</span>
                    <span class="advan">包住</span>
                    <span class="advan">每周双休</span>
                    <span class="advan">年底双薪</span>
                </div>
            </div>
            <div id="edit-info-box3">
                <div>
                    <span class="cube"></span> <span class="line-title">优势福利</span><span id="cancel3" class="edit">取消</span>
                </div>
                <div>
                    <span class="advan">五险一金</span>
                    <span class="advan">包吃</span>
                    <span class="advan">包住</span>
                    <span class="advan">每周双休</span>
                    <span class="advan">年底双薪</span>
                </div>
                <form>
                    <div class="add-box input-group">
                        <input type="text" class="form-control" placeholder="2-15个字，不能输入特殊字符">
                        <span class="input-group-btn">
					        <button class="btn btn-default" type="button">添加</button>
					      </span>
                    </div>
                    <button type="submit" class="sub">保存</button>
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
                    <span class="grey-font">您还未添加招聘人信息</span>
                </div>
                <div class="li-line">
                    <span class="li-title">联系电话</span>
                    <span class="grey-font">您还未添加招聘联系电话</span>
                </div>
            </div>

            <div id="edit-info-box4">
                <div>
                    <span class="cube"></span> <span class="line-title">联系方式</span><span id="cancel4" class="edit">取消</span>
                </div>
                <form>
                    <div class="li-line">
                        <span class="li-title">联系人</span>
                        <!-- <span class="grey-font">您还未添加招聘人信息</span> -->
                        <input class="inline-input form-control" type="text" name="linkman">
                    </div>
                    <div class="li-line">
                        <span class="li-title">联系电话</span>
                        <!-- <span class="grey-font">您还未添加招聘联系电话</span> -->
                        <input class="inline-input form-control" type="text" name="contact">
                    </div>
                    <button type="submit" class="sub">保存</button>
                </form>
            </div>

        </div>
        <div class="row show-info">
            <div id="info-box5">
                <div>
                    <span class="cube"></span> <span class="line-title">商铺展示</span><span id="edit5" class="edit">编辑</span>
                </div>
                <div>
                    <img src="WEB-INF/img/首页素材/个人中心.png/jsp/img/首页素材/个人中心.png">
                    <img src="WEB-INF/img/首页素材/个人中心.png/jsp/img/首页素材/个人中心.png">
                    <img src="WEB-INF/img/首页素材/个人中心.png/jsp/img/首页素材/个人中心.png">
                </div>
            </div>
            <div id="edit-info-box5">
                <div>
                    <span class="cube"></span> <span class="line-title">商铺展示</span><span id="cancel5" class="edit">取消</span>
                </div>
                <div>
                    <img src="WEB-INF/img/首页素材/个人中心.png/jsp/img/首页素材/个人中心.png">
                    <img src="WEB-INF/img/首页素材/个人中心.png/jsp/img/首页素材/个人中心.png">
                    <img src="WEB-INF/img/首页素材/个人中心.png/jsp/img/首页素材/个人中心.png">
                </div>
                <button type="submit" class="sub">保存</button>
            </div>


        </div>
    </div>
</div>
</body>
</html>
