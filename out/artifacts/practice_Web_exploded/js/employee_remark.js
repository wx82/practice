$(document).ready(function() {
    //获得所有评论
    $.ajax({
        type: "post",
        // url: "http://39.102.38.113:3000/mock/11/merchant/queryAllComment",
        url: "/user/queryAllComment?uid="+uid,
        datatype: "json",
        // headers:  { 'Content-Type':   'application/json' },
        contentType: "application/json;charset=UTF-8",
        // data: JSON.stringify({ "uid": uid }),
        data:{},
        success: function(result) {
            // console.log(result);
            var comments = result.comments;
            // console.log(comments);
            $.grep(comments, function(remark) {
                //console.log(remark);
                var code = "<div class=\"remark_card\"><div class=\"line\"><a class=\"me\">我</a><span>评论</span><a class=\"shop_name\">" + remark.mname + "</a><span class=\"label label-danger\">" + remark.estar + "星</span></div><p class=\"remark_content\">" + remark.einfor + "</p><hr/><div class=\"line2\"><p class=\"remark_content\">商家回复：" + remark.eminfor + "</p><div><button class=\"delet_button\" id=\"" + remark.cid + "\"> 删除回复</button></div></div></div>";
                $(".right-part").append(code);
            });
        }
    });

    //删除用户评论
    $(".right-part").on('click', '.delet_button', function() {
        var cid = this.id;
        //console.log(jid)
        data = { "cid": cid }
        $.ajax({
            // url: "http://39.102.38.113:3000/mock/11/merchant/delcomment",
            url: "user/delcomment?cid="+cid,
            type: "POST",
            // headers:  { 'Content-Type':   'application/json' },
            contentType: "application/json;charset=UTF-8",
            // data: JSON.stringify(data),
            data:{},
            dataType: "json",
            success: function(result) {
                var msg = result.status;
                console.log(msg)
                if (msg == 1) {
                    alert("删除成功！");
                } else {
                    alert("删除失败！")
                }
                window.location.reload();
            },
            error: function(msg) {
                alert("删除失败");
            }
        });
    });

});