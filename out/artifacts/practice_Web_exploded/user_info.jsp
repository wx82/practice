<%--
Created by IntelliJ IDEA.
User: kiwi
Date: 2020/7/20
Time: 21:43
To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>shop</title>
	<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="css/user_info.css">
	<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
	<script src="http://pv.sohu.com/cityjson?ie=utf-8"></script>
	<script type="text/javascript">
		$(function(){
			// $.$.ajax({
			// 	url: '/path/to/file',
			// 	type: 'default GET (Other values: POST)',
			// 	dataType: 'default: Intelligent Guess (Other values: xml, json, script, or html)',
			// 	data: {param1: 'value1'},
			// })
			// .done(function() {
			// 	console.log("success");
			// })
			// .fail(function() {
			// 	console.log("error");
			// })
			// .always(function() {
			// 	console.log("complete");
			// });
			jcity = returnCitySN.cname//获取到到省市
			$("#city").append(jcity)

			$.ajax({
				url: '/user/getuser',
				type: 'POST',
				dataType: 'json',
				contentType: 'application/json;charset=UTF-8',
				data: JSON.stringify({uid: 7}),
			})
			.done(function(result) {
				console.log(result)
				$("#uname").append(result.uname)
				$("input[name='uname']").val(result.uname)
				$("#usex").append(result.usex)
				// result.usex = "女"
				//性别设置（单选框）
				if(result.usex == "男"){
					$("input[type='radio'][value='男']").attr("checked",'checked')
				}else{
					$("input[type='radio'][value='女']").attr("checked",'checked')
				}
				// $("input[name='uname']").val(result.uname)
				$("#uedu").append(result.uedu)
				$("select[name='uname']").val(result.uedu)
				$("#uskill").append(result.uskill)
				$("input[name='uskill']").val(result.uskill)
				$("#uphone").append(result.uphone)
				$("input[name='uphone']").val(result.uphone)
				$("#uintro").append(result.uintro)
				$("input[name='uintro']").val(result.uintro)
				$("#utime").append(result.utime)
				// result.utime = "长期"
				if (result.utime == "长期") {
					$("input[type='radio'][value='长期']").attr("checked",'checked')
				}else{
					$("input[type='radio'][value='短期']").attr("checked",'checked')
				}
				// $("input[name='utime']").val(result.utime)
				console.log("success");
			})
			.fail(function() {
				console.log("error");
			})
			.always(function() {
				console.log("complete");
			});
			

			// 编辑或取消的函数
			var editFun = function(edit,cancel,infoBox,editBox){
				edit.click(function(event) {
					infoBox.hide();
					editBox.show();
				});
				cancel.click(function(event) {
					/* Act on the event */
					infoBox.show();
					editBox.hide();
				});
			}
			editFun($("#edit1"),$("#cancel1"),$("#info-box1"),$("#edit-info-box1"))
			editFun($("#edit2"),$("#cancel2"),$("#info-box2"),$("#edit-info-box2"))
			editFun($("#edit3"),$("#cancel3"),$("#info-box3"),$("#edit-info-box3"))

			//基础信息

			$("#user-info").click(function(event) {
				/* Act on the event */
				$.ajax({
					url: '/user/updateuser',
					type: 'POST',
					dataType: 'json',
					async: false,
					// data: $("#user-info-form").serialize() ,
					data:{
						uid:7,
						uname:$("input[name=uname]").val(),
						usex:$("input[name=usex]:checked").val(),
						uphone:$("input[name=uphone]").val(),
						utime:$("input[name=utime]:checked").val(),
						// uedu:$("select[name=uedu]:checked").val(),
						uedu:$("#ueduid").val(),
					},
					success:function (res) {
						console.log(res)
						// console.log($("#user-info-form").serialize())
					}
				})
				.done(function() {
					console.log("success");
					alert('修改成功')
					window.location.reload();
				})
				.fail(function() {
					console.log("error");
				})
				.always(function() {
					console.log("complete");
				});
				
			});

			//技能
			$("#uskill-btn").click(function(event) {
				/* Act on the event */
				$.ajax({
					url: '/user/updateuserskill',
					type: 'POST',
					dataType: 'json',
					async: false,
					// contentType: 'application/json;charset=UTF-8',
					data: {
						uid:$("input[name=uid]").val(),
						uskill:$("#uskill1").val(),
					},
					success:function (res) {
						console.log(res)
					}
				})
				.done(function() {
					console.log("success");
					alert("修改成功")
					window.location.reload();
				})
				.fail(function() {
					console.log("error");
				})
				.always(function() {
					console.log("complete");
				});
				
			});

			//信息
			$("#uintro-btn").click(function(event) {
				/* Act on the event */
				$.ajax({
					url: '/user/updateuserintro',
					type: 'POST',
					dataType: 'json',
					data: {
						uid:$("input[name=uid]").val(),
						uintro:$("#uintroid").val(),
					},
					success:function (res) {
						console.log(res)
					}
				})
				.done(function() {
					console.log("success");
					alert("修改成功")
					window.location.reload();
				})
				.fail(function() {
					console.log("error");
				})
				.always(function() {
					console.log("complete");
				});
				
			});



		});


	</script>
</head>
<body>
	<!-- 头部 -->
	<div class="row headline top-font">
		<!-- 左侧文字 -->
		<div class="col-lg-2">
			<div class="big-font">
				C&T招聘网
			</div>
			<div class="small-font">
				city and town recruitment
			</div>
		</div>
		<!-- 占位 -->
		<div class="col-lg-9">
		</div>

		<div class="col-lg-1 center-font">
			<span>退出登录</span>
		</div>
	</div>
	<!-- 主要内容 -->
	<div class="container main-box">
		<!-- 左侧选项 -->
		<div class="col-lg-3 choice-box">
			<div class="img-head"><img class="head_image img-circle" src="./img/默认头像.png"></div>
			<div class="user-name" id="user_name"> allo</div>
			<ul>
				<li class="choice"  id="chosen"><a href="user_info.jsp">个人资料</a></li>
				<li class="choice" ><a href="employee_account_manage.jsp">账号管理</a></li>
				<li class="choice" ><a href="employee_interested.jsp">我感兴趣</a></li>
				<li class="choice" ><a href="employee_remark.jsp">我的评论</a></li>
				<li class="choice"><a>我的消息</a></li>
			</ul>
		</div>
		<!-- 右侧内容 -->
		<div class="col-lg-9 col-md-9">
			<div class="row show-info">
				<div id="info-box1">
					<div>
						<span class="cube"></span>
						<span class="line-title">基本信息</span>
						<span id="edit1" class="edit">编辑</span> 
					</div>
					<ul>
						<li class="li-line"><span class="li-title">名称</span><span id="uname"> <!-- 龙女士 --></span> </li>
						<li class="li-line"><span class="li-title">学历</span><span id="uedu"><!-- 本科 --></span></li>
						<li class="li-line"><span class="li-title">性别</span><span id="usex"><!-- 女 --></span></li>
						<li class="li-line"><span class="li-title">联系方式</span><span id="uphone"><!-- 131415926535 --></span></li>
						<li class="li-line"><span class="li-title">期望工期</span><span id="utime"><!-- 长期 --></span></li>
					</ul>	
				</div>

				<div id="edit-info-box1" >					
					<div>
						<span class="cube"></span>
						<span class="line-title">基本信息</span>
						<span id="cancel1" class="edit">取消</span> 
					</div>
					<form name="user-info-form">
							<input type="hidden" name="uid" value="7">
							<ul>
							<li class="li-line"><span class="li-title">名称</span>
							<input class="inline-input form-control" type="text" name="uname">
							</li>
							<li class="li-line"><span class="li-title">学历</span>
								<!-- <span>餐饮</span> -->
								<select class="inline-input form-control" name="uedu" id="ueduid">
									<option value="初中及以下">初中及以下</option>
									<option value="中专">中专</option>
									<option value="大专">大专</option>
									<option value="本科">本科</option>
									<option value="硕士">硕士</option>
									<option value="博士">博士</option>
								</select>
							</li>
							<li class="li-line"><span class="li-title">性别</span>
							<input type="radio" name="usex" value="男">男
							<input type="radio" name="usex" value="女">女
							
							</li>
							<li class="li-line">								
								<div class="row">
									<div class="number-title">
											<span>手机号</span>
									</div>
									<div class="col-lg-6 col-md-6">
										<div class="input-group">			
									      <input name="uphone" class="form-control" type="text" placeholder="请输入手机号">
									      <!-- <span class="input-group-btn">
									        <button class="btn btn-default" type="button">获取动态码</button>
									      </span> -->
									    </div>
									</div>
								</div>					
							</li>
							<!-- <li class="li-line ">
								<span>动态码</span>
								<input class="inline-input form-control" type="text" name="" placeholder="请输入动态码">
							</li> -->
							<li class="li-line"> 
								<span class="li-title">期待长短期</span>
								<input type="radio" name="utime" value="短期">短期
								<input type="radio" name="utime" value="长期">长期
							</li>
						</ul>
						<div>
							<button id="user-info" class="sub">保存</button>
						</div>
						
					</form>
				</div>

			</div>
			<div class="row show-info">
				<div id="info-box2">
					<div>
						<span class="cube"></span> <span class="line-title">擅长技能</span><span id="edit2" class="edit">编辑</span>
					</div>
					<div class="li-line ">
						
						<div>
							<span id="uskill"></span>
						</div>
					</div>	
				</div>
				<div id="edit-info-box2">
					<form id="uskill-form">
						<input type="hidden" name="uid" value="7">
						<div>
							<span class="cube"></span> <span class="line-title">擅长技能</span><span id="cancel2" class="edit">取消</span>
						</div>
						
						<textarea  class="form-control" class="text-input" name="uskill" id="uskill1"></textarea>
						<div>
							<button id="uskill-btn" class="sub">保存</button>
						</div>
						
					</form>
				</div>				
			</div>
			<div class="row show-info">
				<div id="info-box3">
					<div>
						<span class="cube"></span> <span class="line-title">自我介绍</span><span id="edit3" class="edit">编辑</span>
					</div>
<%--					<div>--%>
<%--						<span id="uintro" class="grey-font">您还未添加介绍</span>--%>
<%--					</div>	--%>
					<div class="li-line ">

						<div>
							<span id="uintro"></span>
						</div>
					</div>
				</div>
				<div id="edit-info-box3">
					<form id="uintro-form">
						<input type="hidden" name="uid" value="7">
						<div>
							<span class="cube"></span> <span class="line-title">自我介绍</span><span id="cancel3" class="edit">取消</span>
						</div>
						
						<textarea  class="form-control" class="text-input" name="uintro" id="uintroid"></textarea>
						<div>
							<button id="uintro-btn" class="sub">保存</button>
						</div>
						
					</form>
				</div>
				
			</div>
			
				
				
			</div>
		</div>
	</div>
</body>
</html>