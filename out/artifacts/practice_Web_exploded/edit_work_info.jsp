<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2020/7/22
  Time: 12:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>shop-edit</title>
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="css/edit_work_info.css">
    <script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
    <script type="text/javascript" >
        $(function(){

            allWelfare = ""//全局福利变量

            // 获取原本的数据并显示
            $.ajax({
                url: 'merchant/queryJobByJid?jid='+1,//jid
                type: 'POST',
            })
                .done(function(result) {
                    console.log("success");
                    console.log(result);
                    $("input[name='jname']").val(result.jname)
                    $("input[name='jtime']").val(result.jtime)
                    $("select[name='jedu']").val(result.jedu)
                    // $("select[name='jexperience']").val(result.jexperience)
                    $("select[name='jsalary']").val(result.jsalary)
                    $("textarea[name='jintro']").val(result.jintro)
                    $("textarea[name='jrequire']").val(result.jrequire)
                    // console.log(result.mwelfare)
                    //result.mwelfare = "态度好，朝九晚五，有年假"//从后端获取到.mwelfare把这里注释
                    allWelfare = result.jtreatment;
                    if(result.jtreatment != null){
                        var welfare = result.jtreatment.split('，')
                        $.grep(welfare,function(wel){
                            $("#mwelfare").append('<span class="advan">'+wel+'</span>')
                            $("#mwelfare2").append('<span class="advan">'+wel+'</span>')
                        })
                    }
                    //填充年龄
                    // result.age = "18-30"//从后端获取
                     console.log(result.jage)
                    if(result.jage != null){
                        var age = result.jage.split('-')
                        console.log(age[0])
                        $("input[name='jage1']").val(age[0])
                        $("input[name='jage2']").val(age[1])
                    }
                    // var welfare = result.mwelfare.split('，')//中文逗号
                    // $.grep(welfare,function(wel){
                    //     $("#mwelfare").append('<span class="advan">'+wel+'</span>')
                    //     // $("#mwelfare2").append('<span class="advan">'+wel+'</span>')
                    // })
                    // console.log($(".advan").val())
                })
                .fail(function() {
                    console.log("error");
                })
                .always(function() {
                    console.log("complete");
                });


// <input type="text" class="form-control" placeholder="2-15个字，不能输入特殊字符" name="jtreatment">
            //添加福利
            $("#add-welfare").click(function(event) {
                /* Act on the event */
                var wel = $("input[name='mwelfare']").val()
                if(allWelfare != null){
                    allWelfare = allWelfare+"，"+wel
                }else {
                    allWelfare = wel
                }
                $("#mwelfare").append('<span class="advan">'+wel+'</span>')
                $("input[name='mwelfare']").val("")
                console.log(allWelfare)
            });


            $("#put").click(function(event) {
                /* Act on the event */
                //单独提交福利的数据
                alert(allWelfare);
                var jage1 =  $("input[name='jage1']").val().toString();
                alert(jage1);
                var jage2 = $("input[name='jage2']").val().toString()
                console.log(jage2);
                var jage = jage1+"-"+jage2;
                var data={
                    jid:1,
                    jtreatment: allWelfare,
                    jage:jage,
                };
                $.ajax({
                    url: 'merchant/updateAaw',
                    type: "post",
                    dataType: "text",
                    contentType:"application/json;charset=UTF-8",
                    data: JSON.stringify(data),

                })
                    .done(function() {

                        console.log("success");
                    })
                    .fail(function() {
                        console.log("error");
                    })
                    .always(function() {
                        console.log("complete");
                    });


                //提交表单中的数据
                $.ajax({
                    url: 'merchant/updateJob',
                    type: 'POST',
                    dataType: 'json',
                    data: $('#job-form').serialize(),
                })
                    .done(function() {
                        alert('提交成功')
                        console.log("success");
                    })
                    .fail(function() {
                        console.log("error");
                    })
                    .always(function() {
                        console.log("complete");
                    });



            });


        })
    </script>
</head>
<body>
<!-- 头部 -->
<div class="head row">
    <div class="col-lg-10 col-md-10">
        <div class="big-font">C&T招聘网</div>
        <div class="small-font">city and town recruitment</div>
    </div>


    <div class="col-lg-1 col-md-1 center-font">
        <span>嗦粉早餐店,退出</span>
    </div>
</div>
<!-- 主要内容 -->
<div class="container main-box">

    <!-- 右侧内容 -->
    <div class="col-lg-12 col-md-12">
        <form id="job-form"  name="job">
            <%--   填写jid  ${}--%>
            <input type="hidden" name="jid" value="1">

            <div class="row show-info">

                <div class="edit-info">

                    <div>
                        <span class="cube"></span>
                        <span class="line-title">基本信息</span>

                    </div>

                    <ul>
                        <li class="li-line"><span class="li-title">职位名称</span>
                            <input class="inline-input form-control" type="text" name="jname">
                        </li>
                        <li class="li-line"><span class="li-title">学历要求</span>

                            <select class="inline-input form-control" name="jedu">
                                <option value="初中及以下">初中及以下</option>
                                <option value="高中">高中</option>
                                <option value="专科">专科</option>
                                <option value="本科">本科</option>
                                <option value="硕士">硕士</option>
                                <option value="博士">博士</option>
                            </select>
                        </li>
                        <li class="li-line"><span class="li-title">工作时间</span>
                            <input class="inline-input form-control" type="text" name="jtime">
                        </li>
<%--                        <li class="li-line"><span class="li-title">工作经验</span>--%>

<%--                            <select class="inline-input form-control" name="jexperience">--%>
<%--                                <option value="1">1年及以下</option>--%>
<%--                                <option value="1-2年">1-2年</option>--%>
<%--                                <option value="2-5年">2-5年</option>--%>
<%--                                <option value="5年以上">5年及以上</option>--%>

<%--                            </select>--%>
<%--                        </li>--%>
                        <li class="li-line">
                            <span class="li-title">工资待遇</span>
                            <!-- <input class="inline-input form-control" type="text" name="jsalary" > -->
                            <!-- <input class="small-input form-control" type="text" name="jsalary1">
                            <span>——</span>
                            <input class="small-input form-control" type="text" name="jsalary2">
                            <input type="radio" name="unit">元/天
                            <input type="radio" name="unit">元/月 -->
                            <!-- 1000-2000元/月 2000-3000元/月 3000-4000元/月 4000+元/月 50-100元/天 100-200元/天 200+元/天 -->
                            <select class="inline-input form-control" name="jsalary">
                                <option value="1000-2000元/月">1000-2000元/月</option>
                                <option value="2000-3000元/月">2000-3000元/月</option>
                                <option value="3000-4000元/月">3000-4000元/月</option>
                                <option value="4000+元/月">4000+元/月</option>
                                <option value="50-100元/天">50-100元/天</option>
                                <option value="100-200元/天">100-200元/天</option>
                                <option value="200+元/天">200+元/天</option>
                            </select>

                        </li>
                        <li class="li-line">
                            <span class="li-title">年龄要求</span>
                            <!-- <input class="inline-input form-control" type="text" name="jage"> -->
                            <input class="small-input form-control" type="text" name="jage1">
                            <span>——</span>
                            <input class="small-input form-control" type="text" name="jage2">

                        </li>


                        <li class="li-line">
                            <span class="li-title">岗位职责</span>
                            <textarea  class="form-control" class="text-input" name="jintro"></textarea>

                        </li>

                    </ul>


                </div>

            </div>
            <div class="row show-info">

                <div>
                    <span class="cube"></span> <span class="line-title">任职资格</span>
                </div>

                <textarea  class="form-control" class="text-input" name="jrequire"></textarea>





            </div>
            <div class="row show-info">
                <div>
                    <span class="cube"></span> <span class="line-title">优势福利</span>
                </div>
                <div id="mwelfare">
                    <!-- <span class="advan">五险一金</span>
                    <span class="advan">包吃</span>
                    <span class="advan">包住</span>
                    <span class="advan">每周双休</span>
                    <span class="advan">年底双薪</span> -->
                </div>

                <div class="add-box input-group">
                    <input type="text" class="form-control" placeholder="2-15个字，不能输入特殊字符" name="mwelfare">
                    <span class="input-group-btn">
				        <button id="add-welfare" class="btn btn-default" type="button">添加</button>
				      </span>
                </div>

            </div>
            <div>
                <button id="put" class="sub">保存</button>
                <span>注：商家信息介绍、联系方式请在商家资料中修改</span>
            </div>
        </form>


    </div>
</div>
</body>
</html>
