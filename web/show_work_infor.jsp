<%@ page import="com.qz.pojo.Merchant" %><%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2020/7/17
  Time: 9:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>shop</title>
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="css/show_work_info.css">
    <script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
    <script type="text/javascript">
        <% Merchant merchant = (Merchant) session.getAttribute("merchant_session");
int mid = merchant.getMid();
%>
        var mid = mid;
        $(function(){
            window.mid=mid;//岗位对呀商家id
            //职业详情
            $.ajax({
                url: 'merchant/queryJobByJid?jid='+1,//jid
                type: 'POST',
                // dataType: 'json',
                // data: {jid: 1},
            })
                .done(function(result) {
                    console.log(result)
                    mid = $("mid")
                    $('#jage').append(result.jage)
                    $('#jcontent').append(result.jcontent)
                    $('#jedu').append(result.jedu)
                    $('#jname').append(result.jname)
                    $('#jsalary').append(result.jsalary)
                    $('#jrequire').append(result.jrequire)
                    $('#jtime').append(result.jtime)
                    $('#jrtime').append(result.jrtime)
                    console.log("success");
                })
                .fail(function() {
                    console.log("error");
                })
                .always(function() {
                    console.log(mid);
                    console.log("complete");
                });

            //评论获取
            $.ajax({
                url: 'merchant/allComment?mid='+window.mid,//mid
                type: 'GET',
                // dataType: 'json',
                // data: {mid: 1},
            })
                .done(function(result) {
                    console.log(result)
                    comments = result.comments
                    $.grep(comments,function(comment){
                        $('#comment-box').append('<div class="comment-card">				<div><span class="comment-head"><img src='+comment.upic+' width="40px" height="40px"></span><span class="comment-name">'+comment.uname+'</span><span class="label label-danger">'+comment.estar+'星</span><span class="comment-time">3分钟前</span></div>				<div class="comment-content">'+comment.einfor+'</div>				<div class="row comment-good">					<div class="col-lg-7">▲3人觉得有用</div>					<div class="col-lg-5">▼3人踩</div>				</div>				<div class="comment-line"></div>				<div class="comment-contact">					<div>回复</div>					<div class="comment-detail">						<div>匿名用户：right</div>						<div>▲'+comment.mname+':blabla</div>						</div>									</div>				</div>')
                    })
                    console.log("success");
                })
                .fail(function() {
                    console.log("error");
                })
                .always(function() {
                    console.log("complete");
                });

            //获取商铺相关信息
            $.ajax({
                url: 'merchant/oneMer?mid='+window.mid,//mid
                type: 'GET',
                // dataType: 'json',
                // data: {mid: '1'},
            })
                .done(function(result) {
                    console.log(result)
                    $("#mlogo").append('<img class="logo" src='+result.mlogo+' width="70px" height="70px">')
                    $("#mname").append(result.mname)
                    $("#maddress").append(result.maddress)
                    $("#mstar").append(result.mstar)
                    $("#mscale").append(result.mscale)
                    $('#minfor').append(result.minfor)
                    // console.log(result.mwelfare)
                    var welfare = result.mwelfare.split('，')
                    $.grep(welfare,function(wel){
                        $("#mwelfare").append('<span class="advan">'+wel+'</span>')
                    })
                    $("#dname").append(result.dname)
                    $("#dphone").append(result.dphone)
                    console.log("success");
                })
                .fail(function() {
                    console.log("error");
                })
                .always(function() {
                    console.log("complete");
                });
        })
    </script>
</head>
<body>
<!-- 头部 -->
<%--<div class="head row">--%>
<%--    <div class="col-lg-10">--%>
<%--        <div class="big-font">C&T招聘网</div>--%>
<%--        <div class="small-font">city and town recruitment</div>--%>
<%--    </div>--%>


<%--    <div class="col-lg-1 center-font">--%>
<%--        <span>退出登录</span>--%>
<%--    </div>--%>
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
<div class="main-box container">
    <div class="col-lg-8">
        <div class="row show-info">
            <div>
                <span id="jname" class="work-title work-font"><!-- 扫描员 --></span>
                <span id="jsalary" class="money-font work-font"><!-- 200/天 --></span>
                <img src="img/商家岗位管理、职位查看编辑素材/感兴趣 (1).png" height="15" width="15">
                <span class="status work-font">3人感兴趣</span>
                <img src="img/商家岗位管理、职位查看编辑素材/查看 (1).png" height="15" width="15">
                <span class="status work-font">30人浏览</span>
                <span  class="status work-font">发布于:<span id="jrtime"><!-- 2020-07-02 --></span> </span>
                <button class="sub">在线聊聊</button>
            </div>

            <div>
                <span class="work-font">学历要求</span><span id="jedu" class="work-font"><!-- 本科 --></span>
                <span class="work-font">工作经验</span><span id="jtime" class="work-font"><!-- 一年以内 --></span>
                <span class="work-font">年龄要求</span><span id="jage" class="work-font"><!-- 20-30 --></span>
            </div>
            <div id="jcontent" class="respon-box">
                <span class="respon">岗位职责</span>
                <!-- <div>1.11111111111111111111111</div>
                <div>2.2222222222222222222222</div>
                <div>3.3333333333333333333</div>
                <div>4.444444444</div>
                <div>5.55555555555</div>
                <div>6.6666666666</div> -->
            </div>
            <div class="row">
                <div class="col-lg-9"></div>
                <div class="col-lg-3">
                    <img src="img/商家岗位管理、职位查看编辑素材/感兴趣 (1).png" height="15" width="15">
                    <span class="status work-font">我感兴趣</span>
                    <img src="img/商家岗位管理、职位查看编辑素材/举报.png" height="15" width="15">
                    <span class="status work-font">举报</span>
                </div>
            </div>

        </div>

        <div class="row show-info">
            <div>
                <span class="line-title">任职资格</span>
            </div>
            <div id="jrequire" class="respon-box">
                <!-- <div>1.111111111111</div>
                <div>2.222222222222</div> -->
            </div>
        </div>


        <div class="row show-info">
            <div>
                <div><span class="line-title">商家介绍</span></div>
                <div class="row">
                    <div id="mlogo" class="col-lg-1 "><!-- img --></div>
                    <div class="col-lg-4">
                        <div><span id="mname" class=""> <!-- 嗦粉早餐店 --></span></div>
                        <div>
                            <span class="type label label-success"> 已认证 </span><span class="type label label-danger"> <span id="mstar"><!-- 5 --></span>星 </span>
                        </div>
                    </div>
                </div>


            </div>
            <ul>
                <li class="li-line"><span class="li-title">商家地址</span><span id="maddress"><!-- 小吃街23号 --></span></li>
            </ul>
            <div id="minfor" class="grey-font">
                <!-- 商家介绍 -->
            </div>
        </div>
        <div class="row show-info">
            <div>
                <span class="line-title">优势福利</span>
            </div>
            <div id="mwelfare">
                <!-- <span class="advan">五险一金</span>
                <span class="advan">包吃</span>
                <span class="advan">包住</span>
                <span class="advan">每周双休</span>
                <span class="advan">年底双薪</span> -->
            </div>
        </div>
        <div class="row show-info">
            <div>
                <span class="line-title">联系方式</span>
            </div>
            <div class="li-line">
                <span class="li-title">联系人</span>
                <span id="dname"><!-- 六六 --></span>
            </div>
            <div class="li-line">
                <span class="li-title">联系电话</span>
                <span id="dphone"><!-- 135431245 --></span>
            </div>

        </div>

    </div>

    <!-- 右侧评论 -->
    <div id="comment-box" class="comment-box col-lg-3 ">
        <div class="comment-title">
            <div class="col-lg-6">最新评论</div>
            <button type="button" class="chat" data-toggle="modal" data-target="#myModal">写评论</button>
        </div>
        <div class="comment-card">
            <div><span class="comment-head"></span><span class="comment-name">匿名用户</span><span class="label label-danger">5星</span><span class="comment-time">3分钟前</span></div>
            <div class="comment-content">bbbblablabla</div>
            <div class="row comment-good">
                <div class="col-lg-7">▲3人觉得有用</div>
                <div class="col-lg-5">▼3人踩</div>
            </div>
            <div class="comment-line"></div>
            <div class="comment-contact">
                <div>回复</div>
                <div class="comment-detail">
                    <div>匿名用户：right</div>
                    <div>▲商家:blabla</div>
                </div>

            </div>
        </div>


    </div>
</div>
<!-- <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
提问（点击弹出模态窗口）
</button> -->
<!-- 模态框 -->

<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button data-dismiss="modal" class="close" type="button"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
                <h4 class="modal-title">提问</h4>
            </div>
            <div class="modal-body">
                <p>写评论</p>
                <textarea id="content" class="form-control"></textarea>
            </div>
            <div class="modal-footer">
                <button data-dismiss="modal" class="btn btn-default" type="button">关闭</button>
                <button id="write" class="btn btn-primary" type="button">提交</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div>
</body>
<script type="text/javascript">
    $(function(){
        $('#write').click(function(event) {
            // console.log('hello')
            /* Act on the event */
            einfor = $('#content').val()
            console.log(einfor)
            var data = {
                mid:window.mid,
                einfor: einfor,
                //需要添加 uid:
            }
            $.ajax({
                url: 'merchant/addcomment',
                type: 'post',
                dataType: 'json',
                contentType:"application/json;charset=UTF-8",
                data:JSON.stringify(data),
            })
                .done(function() {
                    console.log("success");
                })
                .fail(function() {
                    console.log("error");
                })
                .always(function() {
                    console.log("hello complete");
                    location.reload()
                });
        });
    })
</script>
</body>
</html>
