$(document).ready(function() {

    //session存在直接跳到后台管理界面
    if(sessionStorage.getItem("MANAGER_NAME")!=null){
        window.location.href="admin_shop.jsp";
    }

    function check_name(where) {
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


    //失去焦点时，判断用户名是否为空
    $("#name").blur(function() {
        check_name(this);
    });

    //失去焦点时，判断密码是否为空
    $("#password").blur(function() {
        check_password(this);
    });


    $("#login_button").click(function() {

        if (check_name("#name") && check_password("#password")) {
            console.log("ok")
            var name = $("#name").val();
            var password = $("#password").val();
            data = {
                "maname": name,
                "mapassword": password
            }
            //console.log(data);

            $.ajax({
                type: "GET",
                data: data,
                dataType: 'json',
                url: "/adminLogin",
                success: function(data) {
                    console.log(data);
                    if (data.isSuccess) {
                        alert("登录成功");
                        window.location.href="admin_shop.jsp";
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


});