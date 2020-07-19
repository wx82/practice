$(document).ready(function() {

    //获取职业信息
    var jobs;
    //获取职业信息
    // var jobs;
    $.ajax({

        url: "/merchant/mAllJob",
        type: "get",
        dataType: "json",
        data: {mid:1},
        success: function(result) {
            console.log(result);
            jobs = result.jobs;
            //遍历jobs列表
            $.grep(jobs, function(job) {
                console.log(job);
                // "jid": 1,
                // "jrtime": "2020-07-11 10:22:33",
                // "jintro": "洗碗工",
                // "jaddress": "a市a县a镇a街",
                // "jtime": "2小时",
                // "jcontent": "洗碗",
                // "jtype": "餐饮杂工",
                // "jedu": "本科",
                // "jrequire": "勤劳",
                // "jsalary": "1小时50元",
                // "jtreatment": "包午饭",
                // "jphone": 123456,
                // "jname": null,
                // "jage": null
                var code = "<div class=\"offer\"><a class=\"offer_name\">" + job.jintro + "</a><span class=\"person_number small-text\">" + job.jsalary + "</span><div class=\"small-text\">发布于:" + job.jrtime + "</div><button class=\"delet_button\" id=\"" + job.jid + "\">删除</button></div>"
                $(".right-part").append(code);
            });
        }
    });

    //删除职业
    $(".right-part").on('click', '.delet_button', function() {
        var jid = this.id;
        //console.log(jid)
        //data = { jid: jid }
        $.ajax({
            url: "/merchant/delJob?jid="+jid,
            type: "post",
            // contentType: "application/json;charset=UTF-8",
            // data: JSON.stringify(data),
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







});