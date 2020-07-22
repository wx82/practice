$(document).ready(function() {
    //请求求职者信息
    $.ajax({
        type: "get",
        datatype: "json",
        url: "/user/adminGetUsers",
        success: function(data) {
            //console.log(data);
            users = data.users;
            $.grep(users, function(user) {
                var id = user.uid;
                var name = user.uname;
                var code = "<tr class=\"employee\"><td><a class=\"employee_name\">" + name + "</a></td><td><span id=\"id\">id:" + id + "</span></td><td><button class=\"delet_button\" id=\"" + id + "\" >删除求职者</button></td></tr>";
                $("#employee_list").append(code);
            })

        }
    });

    // 通过id查找
    $("#search_id_button").click(function() {
        var idvalue = parseInt($("#search_id").val());
        var data = {"uid":idvalue}
        //console.log({ "uid": idvalue });
        //console.log(typeof idvalue);
        if (idvalue == '') {
            alert("请输入id后再查找");
        } else {
            $.ajax({
                type: "get",
                data: data,
                datatype: "json",
                contentType: "application/json;charset=UTF-8",
                url: "/user/adminQueryUserById",
                success: function(data) {
                    if (data.isExist) {
                        var id = data.user.uid;
                        var name = data.user.uname;
                        var code = "<tr class=\"employee\"><td><a class=\"employee_name\">" + name + "</a></td><td><span id=\"id\">id:" + id + "</span></td><td><button class=\"delet_button\" id=\"" + id + "\" >删除求职者</button></td></tr>";
                    } else {
                        var code = "<div class=\"text-center\" style=\"padding-top:20px;font-size:1.2em;\">没有搜到相应id的求职者</div>";
                    }
                    $("#employee_list").html(code);
                    $("#search_id").val('');
                },
                error: function() {
                    alert("AjaxFailure");
                }

            });
        }
        // console.log({ "uid": idvalue });
    });

    // 通过姓名查找
    $("#search_name_button").click(function() {
        var namevalue = $("#search_name").val();
        var data = {"uname":namevalue}
        //console.log({ "uname": namevalue });
        if (namevalue == '') {
            alert("请输入名称后再查找");
        } else {
            $.ajax({
                type: "get",
                contentType: "application/json;charset=UTF-8",
                data: data,
                datatype: "json",
                url: "/user/adminQueryUserByUname",
                success: function(data) {
                    if (data.isExist) {
                        var users = data.users;
                        console.log(users);
                        $("#employee_list").html('');
                        $.grep(users, function(user) {
                            var id = user.uid;
                            var name = user.uname;
                            var code = "<tr class=\"employee\"><td><a class=\"employee_name\">" + name + "</a></td><td><span id=\"id\">id:" + id + "</span></td><td><button class=\"delet_button\" id=\"" + id + "\" >删除求职者</button></td></tr>";
                            $("#employee_list").append(code);
                        })
                    }else{
                        var code = "<div class=\"text-center\" style=\"padding-top:20px;font-size:1.2em;\">没有搜到相应名称的求职者</div>";
                        $("#employee_list").html(code);
                    }
                    $("#search_name").val('');
                },
                error: function() {
                    alert("AjaxFailure");
                }
            });
        }
    });

    //删除求职者
    $("#employee_list").on("click", ".delet_button", function() {
        if (confirm("确定删除该求职者吗?")) {　　 //点击确定后操作
            var id = parseInt(this.id);
            //console.log(id);
            $.ajax({
                type: "get",
                url: "/user/adminDeleteUserById",
                data: { "uid": id },
                datatype: 'json',
                success: function(data) {
                    //console.log(data);
                    if (data.isSuccessful) {
                        alert("成功删除该求职者！");
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