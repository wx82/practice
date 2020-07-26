$(document).ready(function() {

    // var login_correct = false; //登录表单格式是否正确
    // var register_correct = false; //注册表单格式是否正确

    //改为使用密码登录
    // $("#login_form").on('click', '#password_login', function() {
    //     var code = "<div class=\"row\"><input id=\"phone\" placeholder=\"输入手机号\" type=\"text\"><span class=\"error_tip\"></span></div><div class=\"row\"><input id=\"password\" placeholder=\"输入密码\" type=\"password\"><span class=\"error_tip\"></span></div><div class=\"row\" style=\"margin-top:18px;\"><input id=\"login_button2\" type=\"button\" value=\"求职者登录\"><a id=\"phone_login\">使用手机登录</a></div>"
    //     $("#login_form").html(code);
    //     //console.log("ok1");
    // });


    // $("#login_form").on('click', '#phone_login', function() {
    //     //console.log("ok");
    //     var code = "<div class=\"row\"><input id=\"phone\" placeholder=\"输入手机号\" type=\"text\"></div> <div class=\"row\"><input id=\"identify_code\" placeholder=\"输入验证码\" type=\"text\"><input id=\"identify_code_button\" type=\"button\" value=\"获取验证码\"></div><div class=\"row\" style=\"margin-top:18px;\"><input id=\"login_button\" type=\"button\" value=\"求职者登录\"><a id=\"password_login\">使用密码登录</a></div>"
    //     $("#login_form").html(code);
    // });

    // //手机号码格式验证函数
    // function check_phone(where) {
    //     var value = $(where).val();
    //     //判断手机号是否为空
    //     var pattern = /^1[34578]\d{9}$/;
    //     if (value == '') {
    //         $(where).next().show().html("手机号不能为空");
    //         $(where).val('');
    //         return false;
    //     } else {
    //         $(where).next().show().html("");
    //     }
    //     if (pattern.test(value) == false) {
    //         $(where).next().html("请输入正确的手机号格式");
    //         $(where).val('');
    //         return false;
    //     } else {
    //         $(where).next().show().html("");
    //     }

    //     return true; //表单格式无错误
    // }

    //账号格式验证函数
    function check_account(where) {
        //判断账号是否为空
        var value = $(where).val();
        if (value == '') {
            $(where).next().show().html("账号不能为空");
            $(where).val('');
            return false;
        } else {
            $(where).next().show().html("");
        }

        return true;
    }

    //密码格式验证函数

    //登录输密码
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

    //注册第一次输密码
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

    //注册第二次输密码
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
            //console.log($(where_prev).val());
            $(where).next().show().html("两次密码不同");
            $(where).val('');
            return false;
        } else {
            $(where).next().show().html("");
        }
        return true;
    }



    //登录表单验证
    //手机输入框失去焦点时
    $("#myTabContent").on("blur", "#account", function() {
        check_account(this);
    });

    // //验证码输入框失去焦点时
    // $("#myTabContent").on("blur", "#identify_code", function() {
    //     check_identify_code("#identify_code");
    // });

    //密码输入框失去焦点时
    $("#myTabContent").on("blur", "#password", function() {
        check_password(this);
    });


    //========================手机验证码登录提交======================
    // $("#myTabContent").on("click", "#login_button", function() {
    //     if (check_phone("#phone") && check_identify_code("#identify_code")) {
    //         //表单格式正确提交
    //         alert("提交数据");
    //     } else {
    //         alert("请输入正确的格式");
    //     }
    // });

    //=================用户密码登录提交============================
    $("#myTabContent").on("click", "#login_button2", function() {
        if (check_account("#account") && check_password("#password")) {
            //表单格式正确提交
            // alert("提交数据");
            var type = 'user';
            var account = $.trim($("#account").val());
            var password = $.trim($("#password").val());
            var data = { "type": type, "account": account, "password": password };
            //console.log(data);
            $.ajax({
                type: "GET",
                url: '/normalLogin', //登录的url
                data: data,
                dataType: 'json',
                success: function(data) {
                    //console.log(data);
                    if (data.isSuccess) {
                        alert("登录成功");
                        window.location.href="web_index.jsp";
                        return;
                    }
                    if (!data.isAccountExist) {
                        alert("账号不存在");
                        return;
                    }

                    if (!data.isPasswordCorrect) {
                        alert("密码错误");
                        return;
                    }

                },
                error: function() {
                    alert("登录请求失败，请重试");
                }

            });
        } else {
            alert("输入不符合要求!");
        }
    });

    //注册表单验证
    //注册密码格式验证
    $("#myTabContent").on("blur", "#account2", function() {
        check_account(this);
    });

    // //验证码输入框失去焦点时
    // $("#myTabContent").on("blur", "#identify_code2", function() {
    //     check_identify_code(this);
    // });

    //确认密码输入框失去焦点时
    $("#myTabContent").on("blur", "#password2", function() {
        check_password2(this);
    });
    $("#myTabContent").on("blur", "#password3", function() {
        check_password3(this, "#password2");
    });



    //==========================注册提交====================
    $("#myTabContent").on("click", "#register_button", function() {
        if (check_account("#account2") && check_password("#password2") && check_password2("#password3", "#password2")) {

            //表单格式正确提交
            var type = 'user';
            var account = $("#account2").val();
            var password = $.trim($("#password2").val());
            var data = { "type": type, "account": account, "password": password };
            //console.log(data);
            $.ajax({
                type: "GET",
                url: '/register',
                data: data,
                dataType: 'json',
                success: function(data) {
                    console.log(data);
                    if (data.isSuccess) {
                        alert("注册成功");
                        return;
                    }
                    if (data.isAccountExist) {
                        alert("该账号已存在，请重新输入");
                        $("#account2").val('');
                        return;
                    }
                },
                error: function() {
                    alert("注册请求失败，请重试");
                }

            });
        } else {
            alert("请输入正确的格式");
        }
    });



});