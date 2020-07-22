<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2020/7/19
  Time: 14:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>shop</title>
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="css/shop_comment.css">
    <script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
    <script type="text/javascript">
        $(function(){

            // 商家介绍
            $.ajax({
                url: 'merchant/oneMer?mid='+1,
                type: 'post',
                dataType: 'json',
            })
                .done(function(result) {
                   // console.log("success");
                    console.log(result);
                   // console.log(result.mname);
                    // console.log(result.mlogo)
                    // console.log('<img class="logo" src='+result.mlogo+' width="70px" height="70px">')
                    //logo之后测试
                    //$("#mlogo").append('<img class="logo" src='+result.mlogo+' width="70px" height="70px">')
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
                    $("#mrphone").append(result.mrphone)


                })
                .fail(function() {
                    console.log("error");
                })
                .always(function() {
                    console.log("complete");
                });

            // 用户评论
            $.ajax({
                url: 'merchant/allComment?mid='+1,
                type: 'GET',
                dataType: 'json',
                //data: {mid: 1},
            })
                .done(function(result) {
                    console.log(result)
                    comments = result.comments
                    $.grep(comments,function(comment){
                        $('#comment-box').append('<div class="comment-card">				<div><span class="comment-head"><img src='+comment.upic+' width="40px" height="40px"></span><span class="comment-name">'+comment.uname+'</span><span class="label label-danger">'+comment.estar+'星</span><span class="comment-time">3分钟前</span></div>				<div class="comment-content">'+comment.einfor+'</div>				<div class="row comment-good">					<div class="col-lg-7">▲3人觉得有用</div>					<div class="col-lg-5">▼3人踩</div>				</div>				<div class="comment-line"></div>				<div class="comment-contact">					<div>回复</div>					<div class="comment-detail">						<div>▲'+comment.mname+':blabla</div>						</div>									</div>				</div>')
                    })
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
<div class="head">
    <div class="big-font">C&T招聘网</div>
    <div class="small-font">city and town recruitment</div>
</div>
<!-- 主要内容 -->
<div class="main-box container">
    <div class="col-lg-8 col-md-8">
        <div class="row show-info">
            <div>
                <span class="cube"></span>
                <!-- <span class="line-title">基本信息</span>
                 -->
                <div class="row">
                    <div id="mlogo" class="col-lg-1 col-md-1">
                        <!-- <img class="logo" src="img/首页素材/个人资料.png" width="70px" height="70px"> -->
                    </div>
                    <div class="col-lg-4 col-md-4">
                        <div><span id="mname" class="line-title"> </span></div>
                        <div>
                            <span class="type label label-success"> 已认证 </span><span class="type label label-danger"><span id="mstar"></span> 星 </span>
                        </div>
                    </div>
                </div>
                <!-- <span id="mname" class="line-title"> </span> <span class="type label label-success"> 已认证 </span><span class="type label label-danger"><span id="mstar"></span> 星 </span>  -->

            </div>
            <ul>

                <li class="li-line"><span class="li-title">商家规模</span><span id="mscale"><!-- 4人 --></span></li>
                <li class="li-line"><span class="li-title">商家地址</span><span id="maddress"><!-- 小吃街23号 --></span></li>
            </ul>
        </div>
        <div class="row show-info">
            <div>
                <span class="cube"></span> <span class="line-title">商家介绍</span><!-- <span class="edit">编辑</span> -->
            </div>
            <div id="minfor" class="li-line"><!-- 非常好吃 --></div>
        </div>
        <div class="row show-info">
            <div>
                <span class="cube"></span> <span class="line-title">优势福利</span><!-- <span class="edit">编辑</span> -->
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
                <span class="cube"></span> <span class="line-title">联系方式</span><!-- <span class="edit">编辑</span> -->
            </div>
            <div class="li-line">
                <span class="li-title">联系人</span>
                <span id="dname"><!-- 六六 --></span>
            </div>
            <div class="li-line">
                <span class="li-title">联系电话</span>
                <span id="mrphone"><!-- 135431245 --></span>
            </div>

        </div>
        <div class="row show-info">
            <div>
                <span class="cube"></span> <span class="line-title">商铺展示</span><!-- <span class="edit">编辑</span> -->
            </div>
            <div>
                <img src="img/首页素材/个人中心.png">
                <img src="img/首页素材/个人中心.png">
                <img src="img/首页素材/个人中心.png">
            </div>

        </div>
    </div>

    <!-- 右侧评论 -->
    <div id="comment-box" class="comment-box col-lg-3 col-md-3">
        <div class="comment-title">

            <div class="col-lg-6 col-md-6">最新评论</div>
            <button type="button" class="chat" data-toggle="modal" data-target="#myModal">写评论</button>
        </div>

        <div class="comment-card">
            <div><span class="comment-head"><img src="img/商家岗位管理、职位查看编辑素材/查看 (1).png" width="40px" height="40px"></span><span class="comment-name">匿名用户</span><span class="label label-danger">5星</span><span class="comment-time">3分钟前</span></div>
            <div class="comment-content">bbbblablabla</div>
            <div class="row comment-good">
                <div class="col-lg-7">▲3人觉得有用</div>
                <div class="col-lg-5">▼3人踩</div>
            </div>
            <div class="comment-line"></div>
            <div class="comment-contact">
                <div>回复</div>
                <div class="comment-detail">
                    <!-- <div>匿名用户：right</div> -->
                    <div>▲商家:blabla</div>
                </div>

            </div>
        </div>

    </div>
</div>
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
                <p>评级</p>
                <input type="radio" name="mstar" value="1">1星
                <input type="radio" name="mstar" value="2">2星
                <input type="radio" name="mstar" value="3">3星
                <input type="radio" name="mstar" value="4">4星
                <input type="radio" name="mstar" value="5">5星
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
            console.log('hello')
            /* Act on the event */
            einfor = $('#content').val()
            mstar = $("input[name='mstar']:checked").val()
            var data={
                mid:1,//获取页面时填写
                einfor: einfor,
                uid:1,//获取页面时填写
                mstar: mstar,

            }
            console.log(data);
            $.ajax({
                url: 'merchant/addcomment',
                type: 'post',
                dataType: 'text',
                data: JSON.stringify(data),
                contentType:"application/json;charset=UTF-8",
            })
                .done(function() {
                    console.log("success");
                })
                .fail(function() {
                    console.log("error");
                })
                .always(function() {
                    // console.log("hello complete");
                    location.reload()
                });
        });
    })
</script>
</html>
