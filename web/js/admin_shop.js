$(document).ready(function() {

    //将manager_name存入session
    sessionStorage.setItem('MANAGER_NAME',document.getElementById("manager_name").innerHTML);

    //退出登录删除MANAGER_NAME
    $("#exit").click(function () {
        sessionStorage.removeItem("MANAGER_NAME");
        window.location.href="admin_login.jsp";
    });

    //请求商家信息
    $.ajax({
        type: "get",
        datatype: "json",
        url: "/merchant/adminGetMerchants",
        success: function(data) {
            //console.log(data);
            merchants = data.merchants;
            $.grep(merchants, function(shop) {
                var mid = shop.mid;
                var name = shop.mname;
                var mstar = shop.mstar;
                if (shop.mtag) {
                    var mtag = "已认证";
                    var code = "<tr class=\"shop\"><td><a class=\"shop_name col-lg-1\" id=\"shop_name"+mid.toString()+"\">" + name + "</a></td><td> <span class=\"label label-success\">" + mtag + "</span></td><td><span class=\"label label-danger\">" + mstar + "星</span></td><td><span id=\"id\">id:" + mid + "</span></td><td><button class=\"delet_button\" id= " + mid + ">删除商家</button></td></tr>";

                } else {
                    var mtag = "未认证";
                    var code = "<tr class=\"shop\"><td><a class=\"shop_name col-lg-1\" id=\"shop_name"+mid.toString()+"\">" + name + "</a></td><td> <span class=\"label label-default\">" + mtag + "</span></td><td><span class=\"label label-danger\">" + mstar + "星</span></td><td><span id=\"id\">id:" + mid + "</span></td><td><button class=\"delet_button\" id= " + mid + ">删除商家</button></td></tr>";
                }
                $("#shop_list").append(code);

                var shop_name_id ="shop_name"+mid.toString();
                $(document).on('click','#'+shop_name_id,function () {
                    //console.log(mid);
                    var data = {"mid":mid};
                    $.ajax({
                        type: "get",
                        datatype: "json",
                        data:data,
                        url:'/adminOneMerchant',
                        success:function(){
                            //console.log(name);
                            alert("进入"+name+"的详情页面");
                            window.location.href="shop_info.jsp";
                        }
                    })
                });
            });


        },
        error:function(){
            alert("ajaxfailure");
        }
    });


    // 通过名称查找
    $("#search_name_button").click(function() {
        var namevalue = $("#search_name").val();
        console.log({ "mname": namevalue });
        var data = {"mname":namevalue};
        if (namevalue == '') {
            alert("请输入名称后再查找");
        } else {
            $.ajax({
                type: "get",
                contentType: "application/json;charset=UTF-8",
                data:data,
                datatype: "json",
                url: "/merchant/adminQueryMerchantByMname",
                success: function(data) {
                    merchants = data.merchants;
                    //console.log(merchants);
                    if (data.isExist) {
                        console.log(merchants);
                        $("#shop_list").html('');
                        $.grep(merchants, function(shop) {
                            var mid = shop.mid;
                            var name = shop.mname;
                            var mstar = shop.mstar;
                            if (shop.mtag) {
                                var mtag = "已认证";
                                var code = "<tr class=\"shop\"><td><a class=\"shop_name col-lg-1\" id=\"shop_name"+mid.toString()+"\">" + name + "</a></td><td> <span class=\"label label-success\">" + mtag + "</span></td><td><span class=\"label label-danger\">" + mstar + "星</span></td><td><span id=\"id\">id:" + mid + "</span></td><td><button class=\"delet_button\" id= " + mid + ">删除商家</button></td></tr>";

                            } else {
                                var mtag = "未认证";
                                var code = "<tr class=\"shop\"><td><a class=\"shop_name col-lg-1\" id=\"shop_name"+mid.toString()+"\">" + name + "</a></td><td> <span class=\"label label-default\">" + mtag + "</span></td><td><span class=\"label label-danger\">" + mstar + "星</span></td><td><span id=\"id\">id:" + mid + "</span></td><td><button class=\"delet_button\" id= " + mid + ">删除商家</button></td></tr>";
                            }
                            $("#shop_list").append(code);

                        })
                    } else {
                        var code = "<div class=\"text-center\" style=\"padding-top:20px;font-size:1.2em;\">没有搜到相应名称的商家</div>";
                        $("#shop_list").html(code);
                    }
                },
                error:function(){
                    alert("ajaxfailure");
                }
            });
            $("#search_name").val('');
        }
    });

    // 通过id查找
    $("#search_id_button").click(function() {
        var idvalue = parseInt($("#search_id").val());
        var data = {"mid":idvalue}
        console.log(data);
        if (idvalue == '') {
            alert("请输入id后再查找");
        } else {
            $.ajax({
                type: "get",
                data: data,
                datatype: "json",
                url: "/merchant/adminQueryMerchantById",
                success: function(data) {
                    if (data.isExist) {
                        console.log(data.merchant);
                        var mid = data.merchant.mid;
                        var name = data.merchant.mname;
                        var mstar = data.merchant.mstar;
                        if (data.merchant.mtag) {
                            var mtag = "已认证";
                            var code = "<tr class=\"shop\"><td><a class=\"shop_name col-lg-1\" id=\"shop_name"+mid.toString()+"\">" + name + "</a></td><td> <span class=\"label label-success\">" + mtag + "</span></td><td><span class=\"label label-danger\">" + mstar + "星</span></td><td><span id=\"id\">id:" + mid + "</span></td><td><button class=\"delet_button\" id= " + mid + ">删除商家</button></td></tr>";

                        } else {
                            var mtag = "未认证";
                            var code = "<tr class=\"shop\"><td><a class=\"shop_name col-lg-1\" id=\"shop_name"+mid.toString()+"\">" + name + "</a></td><td> <span class=\"label label-default\">" + mtag + "</span></td><td><span class=\"label label-danger\">" + mstar + "星</span></td><td><span id=\"id\">id:" + mid + "</span></td><td><button class=\"delet_button\" id= " + mid + ">删除商家</button></td></tr>";
                        }
                    } else {
                        var code = "<div class=\"text-center\" style=\"padding-top:20px;font-size:1.2em;\">没有搜到相应id的商家</div>";
                    }
                    $("#shop_list").html(code);

                }
            });
            $("#search_id").val('');
        }
        // console.log({ "mid": idvalue });
    });


    //删除商家
    $("#shop_list").on("click", ".delet_button", function() {
        if (confirm("确定删除该商家吗?")) {　　 //点击确定后操作
            var mid = this.id;
            console.log(mid);
            $.ajax({
                type: "get",
                url: "/merchant//adminDeleteMerchantById",
                data: { "mid": mid },
                datatype: 'json',
                success: function(data) {
                    //console.log(data);
                    if (data.isSuccessful) {
                        alert("成功删除该商家！");
                        window.location.reload();
                    } else {
                        alert("删除失败！");
                    }
                },
                error: function() {
                    alert("删除失败！")
                }
            });
        }
    });
});