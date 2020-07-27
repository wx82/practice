<%@ page import="com.qz.pojo.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>shop</title>
	<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="css/user_show.css">
	<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
	<script type="text/javascript">
		<% System.out.println("================manager===========");
User user = (User) session.getAttribute("user_session");
String uid = Integer.toString(user.getUid());
System.out.println("user_managepage:"+user);
System.out.println(uid);%>
		var uid = <%=uid%>;
		$(function(){
			$.ajax({
				url: '/user/getuser',
				type: 'POST',
				dataType: 'json',
				contentType: 'application/json;charset=UTF-8',
				data: JSON.stringify({uid: uid}),
			})
			.done(function(result) {
				console.log(result)
				$("#uname").append(result.uname)
				$("#usex").append(result.usex)
				$("#uedu").append(result.uedu)
				$("#uskill").append(result.uskill)
				$("#uphone").append(result.uphone)
				$("#uintro").append(result.uintro)
				$("#utime").append(result.utime)
				console.log("success");
			})
			.fail(function() {
				console.log("error");
			})
			.always(function() {
				console.log("complete");
			});
		})
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
		
		
			
	</div>
	<!-- 主要内容 -->
	<div class="container main-box">
		<!-- 左侧选项 -->

		
		<!-- 右侧内容 -->
		<div class="col-lg-12 col-md-12">
			<div class="row show-info">
				<div id="info-box1">
					<div>
						<span class="cube"></span>
						<span class="line-title">基本信息</span>
						<!-- <span id="edit1" class="edit">编辑</span>  -->
					</div>
					<ul>
						<li class="li-line"><span class="li-title">名称</span><span id="uname"> <!-- 龙女士 --> </span></li>
						<li class="li-line"><span class="li-title">学历</span><span id="uedu"><!-- 本科 --></span></li>
						<li class="li-line"><span class="li-title">性别</span><span id="usex"><!-- 女 --></span></li>
						<li class="li-line"><span class="li-title">联系方式</span><span id="uphone"><!-- 131415926535 --></span></li>
						<li class="li-line"><span class="li-title">期望工期</span><span id="utime"><!-- 长期 --></span></li>
					</ul>	
				</div>

				

			</div>
			<div class="row show-info">
				<div id="info-box2">
					<div>
						<span class="cube"></span> <span class="line-title">擅长技能</span>
					</div>
					<div id="uskill" class="li-line ">
						<!-- <div>1.1111111</div>
						<div>2.2222222</div>
						<div>3.3333333</div> -->
					</div>	
				</div>
							
			</div>
			<div class="row show-info">
				<div id="info-box3">
					<div>
						<span class="cube"></span> <span class="line-title">自我介绍</span>
					</div>
					<div id="uintro">
						<span class="grey-font"><!-- 您还未添加介绍 --></span>
					</div>	
				</div>
				
				
			</div>
			
				
				
			</div>
		</div>
	</div>
</body>
</html>