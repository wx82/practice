$(document).ready(function() {

    //请求营业执照信息
    var license_list = new Array();
    var merchant_list = new Array();
    //license_list的长度
    var count=0;
    $.ajax({
        type: "get",
        datatype: "json",
        url: "/getLicenseInfo",
        async:false,
        success: function(data) {
            //console.log(data);
            licenses = data.licenses;
            merchants = data.merchants;
            //console.log(licenses);
            //console.log(merchants);
            $.grep(licenses, function(license) {
                $.grep(merchants,function(merchant){
                    if(license.mid == merchant.mid){
                        license_list.push(license);
                        merchant_list.push(merchant);
                        count=count+1;
                        var murl = merchant.mlicense;
                        var mid = license.mid;
                        var cnum = license.cnum;
                        var rnum = license.rnum;
                        var lmname = license.mname;
                        var mmname = merchant.mname;
                        var maddress = license.maddress;
                        var lperson = license.lperson;
                        var edate = license.edate;
                        var vdate = license.vdate;
                        var mtag = merchant.mtag;
                        var failreason = merchant.failreason;
                        //console.log(murl);
                        var code = "<tr>\n" +
                            "           <td rowspan=\"9\" id='mname'>"+mid+":"+mmname+"</td>\n" +
                            "           <td rowspan=\"9\"><img src=\""+murl+"\" id='licenseImg'></td>\n" +
                            "           <td>注册号:"+rnum+"</td>\n" +
                            "           <td rowspan=\"9\"><input type='button' value='提交' class=\"submit_button"+mid.toString()+"\"></td>\n" +
                            "       </tr>\n" +
                            "       <tr>\n" +
                            "       <td>社会信用代码:"+cnum+"</td>\n" +
                            "       </tr>\n" +
                            "       <tr>\n" +
                            "           <td>单位名称:"+lmname+"</td>\n" +
                            "       </tr>\n" +
                            "       <tr>\n" +
                            "           <td>单位地址:"+maddress+"</td>\n" +
                            "       </tr>\n" +
                            "       <tr>\n" +
                            "           <td>法定代表人:"+lperson+"</td>\n" +
                            "       </tr>\n" +
                            "       <tr>\n" +
                            "           <td>有效日期:"+vdate+"</td>\n" +
                            "       </tr>\n" +
                            "       <tr>\n" +
                            "           <td>成立日期:"+edate+"</td>\n" +
                            "       </tr>\n" +
                            "       <tr>\n" +
                            "           <td>认证通过&nbsp<input type=\"radio\" value=\"success\" name=\"verify"+mid.toString()+"\" /> 认证失败&nbsp<input type=\"radio\"\n" +
                            "          value=\"fail\" name=\"verify"+mid.toString()+"\" /></td>\n" +
                            "       </tr>\n" +
                            "       <tr id=\"failreason\">\n" +
                            "           <td>认证失败原因&nbsp<input type=\"text\" value='"+failreason+"' id=\"fail_reason"+mid.toString()+"\"></td>\n" +
                            "       </tr>\n"

                        $("#license_list").append(code);
                        var radio_name = "verify"+mid.toString();
                        if(mtag==true){
                            document.getElementsByName(radio_name)[0].checked='checked';
                        }else if(mtag==false){
                            document.getElementsByName(radio_name)[1].checked='checked';
                        }
                    }
                })

            })
        },


    });

    //提交信息
    for(var i = 0;i < count; i++){
        // 获取到每个按钮
        let j = i;
        var merchant = merchant_list[j];
        var mid = merchant.mid;
        var btn_class = "submit_button" + mid.toString();
        $(document).on('click', '.'+ btn_class, function () {
            // 获取到每个按钮对应的mid
            var merchant = merchant_list[j];
            var mid = merchant.mid;

            var radio_name = "verify"+mid.toString();
            var fail_reason_id = "fail_reason" + mid.toString();
            var fail_reason_value = $.trim($("#"+fail_reason_id).val());
            var radio_content = "input[name=" + radio_name +"]:checked";
            var radio_value = $(radio_content).val(); // success or fail
            // console.log("mid:"+mid);
            console.log("failreason:"+fail_reason_value);
            // console.log("radioname:"+radio_name);
            console.log("radiovalue:"+radio_value);

            if(radio_value == "fail" && fail_reason_value == ""){
                alert("请输入认证失败的原因")
            }else if(radio_value == "success" || (radio_value == "fail" && fail_reason_value != "")){
                if(radio_value == 'fail'){
                    var isvarifyfail = true;
                }else{
                    var isvarifyfail = false;
                    $("#"+fail_reason_id).val("");
                    fail_reason_value = "";
                }
                var data = {"mid":mid,"isvarifyfail":isvarifyfail,"failreason":fail_reason_value};
                console.log(data);
                $.ajax({
                    type: "get",
                    data: data,
                    datatype: "json",
                    contentType: "application/json;charset=UTF-8",
                    url: "/setLicenseResult",
                    success: function(data) {
                        if(data.isSuccess){
                            alert("提交成功");
                        }
                    },
                    error: function() {
                        alert("AjaxFailure");
                    }
                });
            }
        });
    }

});