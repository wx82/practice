$(document).ready(function() {
    //mid在html中定义

    //获得所有评论
    $.ajax({
        url: "merchant/allMerComment?mid="+1,
        type: "post",
        // data: { mid: mid },整合后记得改
        //data: { mid: 4 },
        datatype: "text",
        success: function(result) {
            // console.log(result);
            var comments = result.comments;
            // console.log(comments);
            $.grep(comments, function(remark) {
                console.log(remark);
                // einfor: "好吃"
                // eminfor: "谢谢"
                // mname: "早餐点"
                // uname: "小明"
                //estart：5
                // cid:1
                if (remark.eminfor != null) {
                    //有回复
                    var code = "<div class=\"remark_card\"><div class=\"line\"><a class=\"me\">" + remark.uname + "</a><span>评论</span><a class=\"shop_name\">我</a><span class=\"label label-danger\">" + remark.estar + "星</span></div><p class=\"remark_content\">" + remark.einfor + "</p><hr/><div class=\"line2\"><p class=\"remark_content\">商家回复：" + remark.eminfor + "</p><div><button class=\"delet_button\" id=\"" + remark.cid + "\"> 删除回复</button></div></div></div>";
                } else {
                    //无回复
                    var code = "<div class=\"remark_card\"><div class=\"line\"><a class=\"me\">" + remark.uname + "</a><span>评论</span><a class=\"shop_name\">我</a><span class=\"label label-danger\">" + remark.estar + "星</span></div><p class=\"remark_content\">" + remark.einfor + "</p><hr/><div class=\"line2\"><input type=\"text\" id=\"shop_add_remark" + remark.cid + "\" placeholder=\"请输入回复\"><div><button class=\"add_button\" id=\"" + remark.cid + "\"> 马上回复</button></div></div></div>";
                }
                $(".right-part").append(code);
            });
        }
    });


    //删除商家评论
    $(".right-part").on('click', '.delet_button', function() {
        var cid = this.id;
        console.log(cid)
        // data = { cid: cid }
        $.ajax({
            url: "merchant/delMerComment?cid="+cid,
            type: "post",
            //contentType: "application/json;charset=UTF-8",
            // data: JSON.stringify(data),
           //data:{ cid: cid },
            dataType: "text",
            success: function(msg) {
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

    //添加商家评论
    $(".right-part").on('click', '.add_button', function() {
        var cid = this.id;
        var eminfor = $("#shop_add_remark" + cid).val();
        console.log(eminfor);
        if (eminfor == "") {
            alert("评论不能为空");
            return;
        }
        //console.log(jid)
        var data = {
            cid: cid,
            //cid:2,
            eminfor: eminfor
        };

        $.ajax({
            url: "merchant/updatecomment",
            type: "post",
            contentType: "application/json;charset=UTF-8",
            //data: data,
            data: JSON.stringify(data),
            dataType: "json",
            success: function(msg) {
                console.log(msg)
                if (msg == 1) {
                    alert("评论成功！");
                } else {
                    alert("评论失败！")
                }
                window.location.reload();
            },
            error: function(msg) {
                alert("评论失败！");
            }
        });
    });

});