<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>index</title>
	<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="css/index.css">
	<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
	<!-- 城市选择插件 -->
	<script type="text/javascript" src="js/distpicker.data.js"></script>
	<script type="text/javascript" src="js/main.js"></script>
	<!-- 搜狗接口 -->
	<script src="http://pv.sohu.com/cityjson?ie=utf-8"></script>
	<!-- <script src="http://int.dpool.sina.com.cn/iplookup/iplookup.php?format=js" type="text/ecmascript"></script> -->

	<script type="text/javascript">
		$(function(){

			// console.log(remote_ip_info["province"] + "省" + ',' + remote_ip_info["city"] + "市")
			districts_start()

			jcity = returnCitySN.cname//获取到到省市
			$("#city").append(jcity)

			//筛选
			$("#choosen-all").click(function(event) {
				$(".choosen").children().hide()
				/* Act on the event */
			});
			$("#choice-money").click(function(event) {
				$("#choosen-money").show().siblings().hide()
			});
			$("#choice-time").click(function(event) {
				/* Act on the event */
				$("#choosen-time").show().siblings().hide()
			});
			$("#choice-edu").click(function(event) {
				/* Act on the event */
				$("#choosen-edu").show().siblings().hide()
			});


			//更换城市
			$("#change-city").click(function(event) {
				/* Act on the event */
				$("#choose-city").show()
				$("#city-ok").click(function(event) {
					/* Act on the event */
					var mprovince = $("#mprovince").val()
					var mcity = $("#mcity").val()
					// city = mprovince+mcity
					city = mcity
					console.log(city);
					$("#city").text(mprovince+mcity)
					//隐藏
					$("#choose-city").hide()
					//发送更改信息
					$.ajax({
						url: '/job/getjobbycity',
						type: 'POST',
						dataType: 'json',
						contentType: 'application/json;charset=UTF-8',
						data: JSON.stringify({jcity: city}),
					})
							.done(function(result) {
								// console.log(result)
								$("#all-work").empty()
								// $("#urge").empty()//清空子元素
								jobs = result.jobs;
								console.log(jobs);
								$.grep(jobs,function(job){//重新添加子元素
									$("#all-work").append('<div class=" all-box">					<div class="row">							<div class="col-lg-10">								<span class="work">'+job.jintro+'</span></div>													</div>												<div class="row main-info">							<div class="col-lg-8 main-info-font">								<span>'+job.jaddress+'|</span><span>5星</span>							</div>							<div class="col-lg-4"><span class="money-font">'+job.jsalary+'</span></div>						</div>						<div class="row">							<button class="property-box col-lg-4 btn">'+job.jtreatment+'</button>							<button class="property-box col-lg-4 btn">日结</button>						</div>				</div>')
									//$("#urge").append(' <div class="col-lg-3 urge-box">						<div class="row">							<div class="col-lg-10">								<span class="work">'+job.jintro+'</span></div>													</div>						<div class="row main-info">							<div class="col-lg-8 main-info-font">								<span>'+job.jcity+'|</span><span>5星</span>							</div>							<div class="col-lg-4"><span class="money-font">'+job.jsalary+'</span></div>						</div>						<div class="row">							<button class="property-box col-lg-4 btn">营业执照</button>							<button class="property-box col-lg-4 btn">日结</button>						</div>					</div>  ')
								})
								console.log("success");
							})
							.fail(function() {
								console.log("error");
							})
							.always(function() {
								console.log("complete");
							});
					$.ajax({
						// 	url: '/job/getjobs',
						// 	type: 'GET',
						// 	dataType: 'json',
						// 	data: {},
						// })
						url: '/job/getjobbytime',
						type: 'POST',
						dataType: 'json',
						data: JSON.stringify({jcity: city}),
						contentType: 'application/json;charset=UTF-8',
						success:function (res) {
							console.log(res)
						}
					})
							.done(function(result) {
								console.log(result)
								$("#urge").empty()
								jobs = result.jobs;
								console.log("==========time=========")
								console.log(jobs)
								$.grep(jobs,function(job){
									$("#urge").append(' <div class="col-lg-3 urge-box">						<div class="row">							<div class="col-lg-10">								<span class="work">'+job.jintro+'</span></div>													</div>						<div class="row main-info">							<div class="col-lg-8 main-info-font">								<span>'+job.jcity+'|</span><span>5星</span>							</div>							<div class="col-lg-4"><span class="money-font">'+job.jsalary+'</span></div>						</div>						<div class="row">							<button class="property-box col-lg-4 btn">'+job.jtreatment+'</button>							<button class="property-box col-lg-4 btn">日结</button>						</div>					</div>  ')
									// $("#all-work").append('<div class=" all-box">					<div class="row">							<div class="col-lg-10">								<span class="work">'+job.jintro+'</span></div>													</div>												<div class="row main-info">							<div class="col-lg-8 main-info-font">								<span>'+job.jaddress+'|</span><span>5星</span>							</div>							<div class="col-lg-4"><span class="money-font">'+job.jsalary+'</span></div>						</div>						<div class="row">							<button class="property-box col-lg-4 btn">营业执照</button>							<button class="property-box col-lg-4 btn">日结</button>						</div>				</div>')
								})
								console.log("success");
							})
							.fail(function() {
								console.log("error");
							})
							.always(function() {
								console.log("complete");
							});

				});

			});


			// 短期急招请求
			$.ajax({
				url: '/job/getjobbycity',
				type: 'POST',
				dataType: 'json',
				data: JSON.stringify({jcity: jcity}),
				contentType: 'application/json;charset=UTF-8',
				success:function (res) {
					console.log(res)
				}
			})
					.done(function(result) {
						// console.log(result)
						jobs = result.jobs;
						console.log(jobs);
						$.grep(jobs,function(job){
							$("#all-work").append('<div class=" all-box">					<div class="row">							<div class="col-lg-10">								<span class="work">'+job.jintro+'</span></div>													</div>												<div class="row main-info">							<div class="col-lg-8 main-info-font">								<span>'+job.jaddress+'|</span><span>5星</span>							</div>							<div class="col-lg-4"><span class="money-font">'+job.jsalary+'</span></div>						</div>						<div class="row">							<button class="property-box col-lg-4 btn">'+job.jtreatment+'</button>							<button class="property-box col-lg-4 btn">日结</button>						</div>				</div>')
							//$("#urge").append(' <div class="col-lg-3 urge-box">						<div class="row">							<div class="col-lg-10">								<span class="work">'+job.jintro+'</span></div>													</div>						<div class="row main-info">							<div class="col-lg-8 main-info-font">								<span>'+job.jcity+'|</span><span>5星</span>							</div>							<div class="col-lg-4"><span class="money-font">'+job.jsalary+'</span></div>						</div>						<div class="row">							<button class="property-box col-lg-4 btn">营业执照</button>							<button class="property-box col-lg-4 btn">日结</button>						</div>					</div>  ')
						})
						console.log("success");
					})
					.fail(function() {
						console.log("error");
					})
					.always(function() {
						console.log("complete");
					});

			// 全部招工请求
			$.ajax({
				// 	url: '/job/getjobs',
				// 	type: 'GET',
				// 	dataType: 'json',
				// 	data: {},
				// })
				url: '/job/getjobbytime',
				type: 'POST',
				dataType: 'json',
				data: JSON.stringify({jcity: jcity}),
				contentType: 'application/json;charset=UTF-8',
				success:function (res) {
					console.log(res)
				}
			})
					.done(function(result) {
						console.log(result)
						jobs = result.jobs;
						$.grep(jobs,function(job){
							$("#urge").append(' <div class="col-lg-3 urge-box">						<div class="row">							<div class="col-lg-10">								<span class="work">'+job.jintro+'</span></div>													</div>						<div class="row main-info">							<div class="col-lg-8 main-info-font">								<span>'+job.jcity+'|</span><span>5星</span>							</div>							<div class="col-lg-4"><span class="money-font">'+job.jsalary+'</span></div>						</div>						<div class="row">							<button class="property-box col-lg-4 btn">'+job.jtreatment+'</button>							<button class="property-box col-lg-4 btn">日结</button>						</div>					</div>  ')
							// $("#all-work").append('<div class=" all-box">					<div class="row">							<div class="col-lg-10">								<span class="work">'+job.jintro+'</span></div>													</div>												<div class="row main-info">							<div class="col-lg-8 main-info-font">								<span>'+job.jaddress+'|</span><span>5星</span>							</div>							<div class="col-lg-4"><span class="money-font">'+job.jsalary+'</span></div>						</div>						<div class="row">							<button class="property-box col-lg-4 btn">营业执照</button>							<button class="property-box col-lg-4 btn">日结</button>						</div>				</div>')
						})
						console.log("success");
					})
					.fail(function() {
						console.log("error");
					})
					.always(function() {
						console.log("complete");
					});

			//处理筛选
			jsalary = ""
			jedu = ""
			jtime = ""


			$('.money-range').click(function(event) {
				$(this).css('color', 'blue').siblings('.money-range').css('color', '#000');
				console.log("==========salary=========")
				console.log($(this).text())
				jsalary = $(this).text()
				if(jsalary=='不限'){
					jsalary = null;
				}
				/* Act on the event */
			});
			$('.jedu').click(function(event) {
				/* Act on the event */
				$(this).css('color', 'blue').siblings('span').css('color', '#000');
				console.log($(this).text())
				jedu = $(this).text()
				if(jedu=='不限'){
					jedu = null;
				}

			});
			$('.jtime').click(function(event) {
				/* Act on the event */
				$(this).css('color', 'blue').siblings('span').css('color', '#000');
				console.log($(this).text())
				jtime = $(this).text()
				if(jtime=='不限'){
					jtime = null;
				}
			});

			$('.put').click(function(event) {
				/* Act on the event */

				// if("自定义"==jsalary){
				// 	var salary1 = $('#salary1').val()
				// 	var salary2 = $('#salary2').val()
				// 	jsalary = salary1+'——'+salary2
				// }
				console.log("================筛选===============")
				console.log(jsalary)
				console.log(jedu)
				console.log(jtime)
				$.ajax({
					//发送筛选信息
					url: '/job/getjobbyitems',
					type: 'POST',
					dataType: 'JSON',
					contentType: 'application/json;charset=UTF-8',
					data: JSON.stringify({
						jsalary: jsalary,
						jedu : jedu,
						jtime : jtime,
						jcity: city}),
				})
						.done(function(result) {
							jobs = result.jobs;
							$("#urge").empty()
							$.grep(jobs,function(job){
								// $("#all-work").append('<div class=" all-box">					<div class="row">							<div class="col-lg-10">								<span class="work">'+job.jintro+'</span></div>													</div>												<div class="row main-info">							<div class="col-lg-8 main-info-font">								<span>'+job.jaddress+'|</span><span>5星</span>							</div>							<div class="col-lg-4"><span class="money-font">'+job.jsalary+'</span></div>						</div>						<div class="row">							<button class="property-box col-lg-4 btn">营业执照</button>							<button class="property-box col-lg-4 btn">日结</button>						</div>				</div>')
								$("#urge").append(' <div class="col-lg-3 urge-box">						<div class="row">							<div class="col-lg-10">								<span class="work">'+job.jintro+'</span></div>													</div>						<div class="row main-info">							<div class="col-lg-8 main-info-font">								<span>'+job.jcity+'|</span><span>5星</span>							</div>							<div class="col-lg-4"><span class="money-font">'+job.jsalary+'</span></div>						</div>						<div class="row">							<button class="property-box col-lg-4 btn">'+job.jtreatment+'</button>							<button class="property-box col-lg-4 btn">日结</button>						</div>					</div>  ')
							})
							console.log("success");
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
<!-- 上面 -->
<div class="container box">
	<!-- 标题栏 -->
	<div class="row headline top-font">
		<!-- 左侧文字 -->
		<div class="col-lg-2 col-md-2">
			<div class="big-font">
				C&T招聘网
			</div>
			<div class="small-font">
				city and town recruitment
			</div>
		</div>
		<!-- 占位 -->
		<div class="col-lg-7 col-md-7">

		</div>

		<div class="col-lg-2 col-md-2 center-font">
			<span id="city"><!-- 吉首市 --></span>
			<span id="change-city">[更换位置]</span>
			<div id="choose-city">
				<div data-toggle="distpicker" data-style="option"data-placeholder-province="---请选择省---" data-placeholder-city="---请选择市---" data-placeholder-district="---请选择区---">
					<select id="mprovince" name="mprovince" class="distpicker_province" data-province="---- 选择省 ----"></select>
					<select id="mcity" name="mcity" class="distpicker_city" data-city="---- 选择市 ----"></select>
					<!--  <select name="marea" class="distpicker_district" data-district="---- 选择区 ----"></select> -->
					<button id="city-ok" class="btn btn-info">确定</button>
				</div>

			</div>


		</div>
		<div class="col-lg-1 col-md-1 center-font">
			<span>退出登录</span>
		</div>

	</div>
	<!-- 广告图 -->
	<div class="row">
		<div class="col-lg-12 col-md-12 ad" style="background-image: url(img/首页素材/宣传图.jpg);" >
			<!-- <img src="img/首页素材/宣传图.jpg"> -->
		</div>
	</div>
	<!-- 选项栏 -->

	<div class="row choice">
		<ul class="choice-box">
			<li id="choosen-all" class="col-lg-1"><a href="#">全部</a></li>
			<li id="choice-money" class="col-lg-1"><a href="#">薪资</a></li>
			<li id="choice-time" class="col-lg-1"><a href="#">工作时间</a></li>
			<li id="choice-edu" class="col-lg-1"><a href="#">学历</a></li>
		</ul>

	</div>
	<ul class="choosen choice">
		<li id="choosen-money" class="choosen-list">
			<span class="money-range range">不限</span>
			<span class="money-range range">按月支付</span>
			<span class="money-range range">1000-2000</span>
			<span class="money-range range" >2000-3000</span>
			<span class="money-range range">3000-4000</span>
			<span class="money-range range">4000+</span>
			<span class="money-range range">按小时支付</span>
			<span class="money-range range">50-100</span>
			<span class="money-range range">100-200</span>
			<span class="money-range range">200+</span>

			<!-- 					<span class="money-range range">自定义</span> -->
			<!-- 					<span class="range">
                                    <input id="salary1" type="number" name="start-money">
                                    <span>——</span>
                                    <input id="salary2" type="number" name="end-money">
                                    <span>元/每月</span>
                                </span> -->
			<button class="put btn btn-info">确定</button>

		</li>
		<li id="choosen-time" class="choosen-list">
			<span class="jtime range">不限</span>
			<span class="jtime range">1-3小时</span>
			<span class="jtime range">3-6小时</span>
			<span class="jtime range">6-12小时</span>
			<span class="jtime range">1周</span>
			<span class="jtime range">1-3周</span>
			<span class="jtime range">1月</span>
			<span class="jtime range">1月以上</span>
			<button class="put btn btn-info">确定</button>
		</li>
		<li id="choosen-edu" class="choosen-list">
			<span class="jedu range">不限</span>
			<span class="jedu range">初中及以下</span>
			<span class="jedu range">中专/技校</span>
			<span class="jedu range">高中</span>
			<span class="jedu range">大专</span>
			<span class="jedu range">本科</span>
			<span class="jedu range">硕士</span>
			<span class="jedu range">博士</span>
			<button class="put btn btn-info">确定</button>
		</li>
	</ul>
</div>

<!-- 主要内容 -->
<div class="container main-box">
	<!-- 个人相关 -->
	<div class="row center-info">
		<div class="col-lg-8 col-md-8 left-img" style="background-image: url(img/首页素材/宣传图.jpg);">

			<!-- <img src="img/首页素材/宣传图.jpg"> -->
		</div>
		<div class="col-lg-4 col-md-4">
			<!-- 头像 -->
			<div class="row center-block">
				<div class="col-lg-3 col-md-3"></div>
				<div class="photo col-lg-3 col-md-3">头像</div>
				<div class="person-name col-lg-3 col-md-3">未登录</div>
			</div>
			<!-- 消息栏 -->
			<div class="row center-block">
				<div class="col-lg-2 col-md-2"></div>
				<div class="col-lg-4 col-md-4">
					<div class="org-font text-center">
						0
					</div>
					<div class="text-center">
						我的消息
					</div>
				</div>
				<div class="col-lg-4 col-md-4">
					<div class="org-font text-center">
						0
					</div>
					<div class="text-center">
						我感兴趣
					</div>
				</div>
			</div>
			<div class="line">

			</div>
			<!-- 个人中心，我的资料 -->
			<div class="row">
				<div class="goto-self"> 去个人中心>> </div>
			</div>

		</div>

	</div>
	<!-- 短期急招 -->
	<div class="row short-box">
		<div class="col-lg-3 col-md-3">
			<img src="img/首页素材/急招图.png" width="94%" height="94%">
		</div>
		<div id="urge" class="col-lg-9 col-md-9">
			<!-- <div class="row"> -->

			<%--					<div class="col-lg-3 col-md-3 urge-box">--%>
			<%--						<div class="row">--%>
			<%--							<div class="col-lg-10 col-md-10">--%>
			<%--								<span class="work">扫描员</span></div>--%>
			<%--						</div>--%>

			<%--						<div class="row main-info">--%>
			<%--							<div class="col-lg-8 col-md-8 main-info-font">--%>
			<%--								<span>吉首|</span><span>5星</span>--%>
			<%--							</div>--%>
			<%--							<div class="col-lg-4 col-md-4"><span class="money-font">100/天</span></div>--%>
			<%--						</div>--%>
			<%--						<div class="row">--%>
			<%--							<button class="property-box colg-4 col-md-4 btn">营业执照</button>--%>
			<%--							<button class="property-box col-lg-4 col-md-4 btn">日结</button>--%>
			<%--						</div>--%>
			<%--					</div>--%>

			<%--					<div class="col-lg-3 urge-box">--%>
			<%--						<div class="row">--%>
			<%--							<div class="col-lg-10 col-md-10">--%>
			<%--								<span class="work">扫描员</span></div>--%>
			<%--						</div>--%>

			<%--						<div class="row main-info">--%>
			<%--							<div class="col-lg-8 col-md-8 main-info-font">--%>
			<%--								<span>吉首|</span><span>5星</span>--%>
			<%--							</div>--%>
			<%--							<div class="col-lg-3 col-md-3"><span class="money-font">100/天</span></div>--%>
			<%--						</div>--%>
			<%--						<div class="row">--%>
			<%--							<button class="property-box col-lg-4 col-md-4 btn">营业执照</button>--%>
			<%--							<button class="property-box col-lg-4 col-md-4 btn">日结</button>--%>
			<%--						</div>--%>
			<%--					</div>--%>

			<%--					<div class="col-lg-3 col-md-3 urge-box">--%>
			<%--						<div class="row">--%>
			<%--							<div class="col-lg-10 col-md-10">--%>
			<%--								<span class="work">扫描员</span></div>--%>
			<%--						</div>--%>

			<%--						<div class="row main-info">--%>
			<%--							<div class="col-lg-8 col-md-8 main-info-font">--%>
			<%--								<span>吉首|</span><span>5星</span>--%>
			<%--							</div>--%>
			<%--							<div class="col-lg-4 col-md-4"><span class="money-font">100/天</span></div>--%>
			<%--						</div>--%>
			<%--						<div class="row">--%>
			<%--							<button class="property-box col-lg-4 col-md-4 btn">营业执照</button>--%>
			<%--							<button class="property-box col-lg-4 col-md-4 btn">日结</button>--%>
			<%--						</div>--%>
			<%--					</div>--%>




			<!-- </div> -->
			<!-- <div class="row"> -->
			<!-- <div class="col-lg-3 urge-box"></div>
            <div class="col-lg-3 urge-box"></div>
            <div class="col-lg-3 urge-box"></div> -->
			<!-- </div> -->



		</div>
		<div class="row show-all">
			<div class="">展开全部</div>
		</div>

	</div>
	<!-- 全部招工 -->
	<div id="all-work" class="row work-box">
		<div class="all-work">全部招工</div>
		<!-- <div class="row"> -->
		<%--				<div class=" all-box">--%>
		<%--					<div class="row">--%>
		<%--							<div class="col-lg-10 col-md-10">--%>
		<%--								<span class="work">扫描员</span></div>							--%>
		<%--						</div>--%>
		<%--						--%>
		<%--						<div class="row main-info">--%>
		<%--							<div class="col-lg-8 col-md-8 main-info-font">--%>
		<%--								<span>吉首|</span><span>5星</span>--%>
		<%--							</div>--%>
		<%--							<div class="col-lg-4 col-md-4"><span class="money-font">100/天</span></div>--%>
		<%--						</div>--%>
		<%--						<div class="row">--%>
		<%--							<button class="property-box col-lg-4 col-md-4 btn">营业执照</button>--%>
		<%--							<button class="property-box col-lg-4 col-md-4 btn">日结</button>--%>
		<%--						</div>--%>
		<%--				</div>--%>
		<%--				--%>
		<%--				<div class=" all-box"></div>--%>
		<%--				<div class=" all-box"></div>--%>
		<%--				<div class=" all-box"></div>--%>
		<%--				<div class=" all-box"></div>--%>
		<!-- </div> -->


	</div>

</div>
</body>
</html>