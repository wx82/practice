$(document).ready(function() {
    var account;
    //获得信息
    $.ajax({
        // url: "http://39.102.38.113:3000/mock/11/user/getuser",
        url: "user/getuser",
        type: "post",
        data: JSON.stringify({ "uid": uid }), //uid在html头部写了
        headers:  { 'Content-Type':   'application/json' },
        contentType: "application/json;charset=UTF-8",
        datatype: "json",
        success: function(result) {
            console.log(result);
            account = result.uaccount;
            uname = result.uname;
            $("#account_msg").html("账号：" + account);

        }
    });


    function check_password(where) {
        //判断密码否为空
        var value = $(where).val();
        if (value == '') {
            $(where).next().show().html("密码不能为空");
            $(where).val('');
            return false;
        } else {
            $(where).next().show().html("");
        }
        return true;
    }

    function check_password2(where) {
        //判断密码否为空
        var value = $(where).val();
        if (value == '') {
            $(where).next().show().html("密码不能为空");
            $(where).val('');
            return false;
        } else {
            $(where).next().show().html("");
        }
        //密码为6-12位，只能输入字母、数字和下滑线
        var pattern = /^[\w]{6,12}$/;
        if (pattern.test(value) == false) {
            $(where).next().html("密码格式不正确");
            $(where).val('');
            return false;
        } else {
            $(where).next().show().html("");
        }
        return true;

    }


    //第二次输密码
    function check_password3(where, where_prev) {
        //密码否为空
        var value = $(where).val();
        if (value == '') {
            $(where).next().show().html("密码不能为空");
            $(where).val('');
            return false;
        } else {
            $(where).next().show().html("");
        }
        //判断两次密码是否相等
        if (value != $(where_prev).val()) {
            console.log($(where_prev).val());
            $(where).next().show().html("两次密码不同");
            $(where).val('');
            return false;
        } else {
            $(where).next().show().html("");
        }
        return true;
    }

    //密码输入框失去焦点时
    $("#myTabContent").on("blur", "#oldpassword", function() {
        check_password(this);
    });

    $("#myTabContent").on("blur", "#newpassword1", function() {
        check_password2(this);
    });

    $("#myTabContent").on("blur", "#newpassword2", function() {
        check_password3(this, "#newpassword1");
    });


    //点击提交按钮
    $("#myTabContent").on("click", "#change_password_button", function() {
        if (check_password("#oldpassword") && check_password2("#newpassword1") && check_password3("#newpassword2", "#newpassword1")) {
            var upassword = $("#oldpassword").val();
            var newpassword = $("#newpassword1").val();
            var data = { "uid": uid, "upassword": upassword, "newpassword": newpassword };
            console.log(data);
            $.ajax({
                type: "POST",
                // url: 'http://39.102.38.113:3000/mock/11/user/updatepasswd', //求职者改密码的url
                url: 'user/updatepasswd',
                data: data,

                dataType: 'json',
                success: function(data) {
                    console.log(data);
                    if (data.status == 0) {
                        alert("修改成功！");
                        return;
                    }
                    if (data.status == 1) {
                        alert("原密码错误，修改失败");
                        return;
                    }
                    if (data.status == 2) {
                        alert("修改失败，请重新操作");
                        return;
                    }
                },
                error: function() {
                    alert("修改失败，请重新操作");
                }
            });
        } else {
            alert("请输入正确的格式");
        }
    });


});