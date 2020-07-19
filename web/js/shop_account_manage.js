$(document).ready(function() {
    var account;
    //获得信息
    $.ajax({
        url: "merchant/oneMer",
        type: "get",
        data: { "mid": mid }, //mid在html头部写了
        datatype: "json",
        success: function(result) {
            account = result.maccount;
            mname = result.mname;
            mpassword = result.mpassword;
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
        if(value != mpassword){
            $(where).next().show().html("密码错误");
            return false;
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
            var mpassword = $("#oldpassword1").val();
            // var newpassword = $("#newpassword1").val();
            // var data = { "mid": mid, "mpassword": mpassword, "mpassword2": newpassword };
            var data = { "mid": mid, "mpassword": mpassword};
            console.log(data);
            $.ajax({
                type: "post",
                url: 'merchant/updateMerPsw', //商家改密码的url
                contentType:"application/json;charset=UTF-8",
                data: JSON.stringify(data),
                dataType: 'text',
                success: function(data) {
                    console.log(data);
                    if (data == 1) {
                        alert("修改成功！");
                        return;
                    }
                    else {
                        alert("修改失败，请重新操作");
                        return;
                    }
                    // if (data.status == 2) {
                    //     alert("原密码错误，修改失败");
                    //     return;
                    // }
                    // if (data.status == 0) {
                    //     alert("修改失败，请重新操作");
                    //     return;
                    // }
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