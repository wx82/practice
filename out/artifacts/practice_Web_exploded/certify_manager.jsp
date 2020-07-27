<%@ page import="com.qz.pojo.Merchant" %><%--
  Created by IntelliJ IDEA.
  User: hanmengru
  Date: 2020/7/22
  Time: 15:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>certify</title>
    <meta http-equiv="Content-Type" content="multipart/form-data; charset=utf-8" />
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="css/certify_manager.css">
    <script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
    <script src="https://cdn.bootcss.com/jquery.serializeJSON/2.9.0/jquery.serializejson.min.js"></script>
    <script type="text/javascript">
        <% Merchant merchant = (Merchant) session.getAttribute("merchant_session");
        int mid = merchant.getMid();
        String mname = merchant.getMnname();
        %>
        var mid =<%=mid%>;
        console.log(mid);
        $(function(){
            //上传图片显示
            $("#box3").hide();
            $("#box2").hide();
            $("#box1").hide();
            //获取到认证信息（包括是否上传证件和认证是否通过）
            $.ajax({
                url: '/merchant/oneMer',
                type: 'GET',
                dataType: 'json',
                data: {"mid": mid},//mid需要修改
            })
                .done(function(result) {
                    console.log(result)
                    var mtag = result.mtag;//判断是否认证
                    var minputpic = result.minputpic;//判断是否提交营业执照
                    var isverifyfail = result.isverifyfail;//判断是否认证失败
                    var failreason = result.failreason;//认证失败原因
                   // console.log(mtag);
                    //console.log(typeof mtag);
                    //console.log(minputpic);
                    //console.log(isverifyfail);

                    //console.log(typeof minputpic);

                    if(mtag == true){//通过了
                        $("#box3").show();
                        $("#box2").hide();
                        $("#box1").hide();
                    }else if(mtag == false && minputpic==false && isverifyfail == true){//认证失败
                        //console.log("success");
                        var code = "<h3  style=\"left: 20px;top: 5px;\">&nbsp&nbsp&nbsp&nbsp认证失败："+failreason+",请重新提交营业执照图片和信息"</h3>";
                        $("#verifyInfo").html(code);
                        $("#box1").show();
                        $("#box2").hide();
                        $("#box3").hide();
                        console.log(failreason);
                    }else if(mtag == false && minputpic == false ){//没提交
                        $("#box1").show();
                        $("#box2").hide();
                        $("#box3").hide();
                    } else if(mtag == false && minputpic == true ) {//提交审核中
                        $("#box2").show();
                        $("#box1").hide();
                        $("#box3").hide();
                    }
                })
                .fail(function() {
                    console.log("error");
                })
                .always(function() {
                    console.log("complete");
                });


            license = ""
            $(".license").change(function(){
                var file = $(".license")[0].files[0]; //如果后台用 MultipartFile处理，直接传给后台file
                license = file
                if (window.FileReader) {
                    var reader = new FileReader();
                    reader.readAsDataURL(file);
                    //监听文件读取结束后事件
                    // console.log(file)
                    reader.onloadend = function (e) {
                        $(".box").find('img').attr({
                            "src": e.target.result,
                            "height": '200px',
                            "width":'200px'
                        });    //e.target.result就是最后的路径地址(base 64)
                    };
                }
            });

            //表单提交后返回的数据
            //  $(".license").ajaxForm(function (data) {
            //          console.log(data);
            //          // if(data == 1){
            //          //     alert("营业执照上传成功")
            //          // }else{
            //          //     alert("营业执照上传失败")
            //          // }
            //      }
            //  );



            $("#submit").click(function(event) {
                /* Act on the event */
                //console.log(mlicense);
                // console.log($.param({"mlicense":mlicense}));
                var data = $('#certy-form').serializeJSON();
                console.log(data);
                $.ajax({
                    url: '/setLicenseInfo',
                    type: 'POST',
                    dataType: 'json',
                    data: data,
                    success: function(data) {
                        console.log(data);
                        if (data.isSuccess) {
                            alert("保存成功");
                            $("#box2").show();
                            $("#box1").hide();
                            $("#box3").hide();
                        }
                    },
                    error: function() {
                        alert("保存失败，");
                    }
                })

            });
        })
    </script>
    <style>
        .inline-input form-control{
            width: 100px;
        }
    </style>
</head>
<body>
<!-- 头部 -->
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

<!--内容-->
<div class="container content">
    <!-- 左侧选项 -->
    <div class="col-lg-3 choice-box">
        <div class="img-head"><img class="head_image img-circle" src="img/bsPic.png"></div>
        <div class="shop-name" id="shop_name"> 嗦粉早餐店</div>
        <ul>
            <li class="choice"><a href="shop_info.jsp">商家资料</a></li>
            <li class="click choice" id="chosen"><a href="certify_manager.jsp">认证管理</a> </li>
            <li class="choice"><a href="shop_account_manage.jsp">账号管理</a> </li>
            <li class="choice"><a href="shop_offer_manage.jsp>">岗位管理</a></li>
            <li class="choice"><a href="shop_remark.jsp">我的评论</a></li>
        </ul>
    </div>

    <!-- 右侧认证 -->
    <div id="verifyInfo"></div>
    <div class="col-lg-9 col-md-9 ">
        <div id="box1" class="show-info show-box" style="height: 700px;">
            <div class="certify-title">商家认证</div>
            <div class="certify-info">
                <span>上传凭证</span>
                <form enctype="multipart/form-data" method="post" action="${pageContext.request.contextPath}/merchant/addMblicense" id="license">
                    <input type="hidden" name="mid" value=<%=mid%>>
                    <div class="box"><!-- 选择上传 -->
                        <img src="" >
                        <input class="license" type="file" name="license" accept="image/gif, image/jpeg, image/png, image/jpg">
                    </div>
                    <div>请提供清晰、完整、无水印的营业执照</div>
                    <input type="submit" value="上传图片" class="sub">
                </form>
                <form id="certy-form" >
                    <input type="hidden" name="mid" value=<%=mid%>>
                    <ul>
                        <li class="li-line"><span>注册号</span><input class="inline-input form-control" type="text" name="rnum" style="width: 500px;"></li>
                        <li class="li-line"><span>社会信用代码</span><input class="inline-input form-control" type="text" name="cnum" style="width: 500px;"></li>
                        <li class="li-line"><span>单位名称</span><input class="inline-input form-control" type="text" name="mname" style="width: 500px;"></li>
                        <li class="li-line"><span>单位地址</span><input class="inline-input form-control" type="text" name="maddress" style="width: 500px;"></li>
                        <li class="li-line"><span>法定代表人</span><input class="inline-input form-control" type="text" name="lperson" style="width: 500px;"></li>
                        <li class="li-line"><span>有效日期</span><input class="inline-input form-control" type="text" name="vdate" style="width: 500px;"></li>
                        <li class="li-line"><span>成立日期</span><input class="inline-input form-control" type="text" name="edate" style="width: 500px;"></li>
                    </ul>

                </form>
                <button id="submit" class="sub" >提交并保存信息</button>
                <%--                <input type="submit" class="sub" value="提交并保存信息"/> --%>


            </div>

        </div>


        <div id="box2" class="show-info status-box" style="height: 400px;width: 1020px">
            <div class="certify-title">商家认证</div>
            <div class="certify-state certify-info">
                <img src="img/商家认证素材/等待 (1).png" width="50px" height="50px">
                <span>已提交，等待审核通过</span>
            </div>

        </div>

        <div id="box3" class="show-info status-box" style="height: 400px;width: 1020px">
            <div class="certify-title">商家认证</div>
            <div class="certify-state certify-info">
                <img src="img/商家认证素材/对号.png" width="50px" height="50px">
                <span>审核通过</span>
            </div>
        </div>

    </div>
</div>
</body>
</html>