<%@ page contentType="text/html; charset=UTF-8" %>
 <!--<jsp:include page="/head.html" /> -->
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>招聘信息网</title>
	<link rel="stylesheet" type="text/css" href="index.css" />
	<style type="text/css">

		.bannerbox{width:100%;position:relative;overflow:hidden;/*top: 150px;*/}

		.Homebanner{width:100%;position:relative;height:600px;overflow:hidden;}
		.Homebanner ul{width:100%;position:absolute;height:600px;}
		.Homebanner ul li{width:100%;height:600px;position:absolute;overflow:hidden;}
		.Homebanner ul li img{width:1900px;position:absolute;left:50%;top:0px;display:block;margin-left:-950px;}

		.Homeleft,.Homeright{background:#000;font-family:"宋体";width:50px;height:50px;line-height:50px;text-align:center;font-size:40px;color:#fff;position:absolute;top:45%;cursor:pointer;transition:all .2s ease;opacity:0;z-index:899999}
		.Homeleft{left:-60px;}
		.Homeright{right:-60px;}

		.bannerbox:hover .Homeleft{left:0px;opacity:1}
		.bannerbox:hover .Homeright{right:0px;opacity:1}


		.Homebannertext{position:absolute;left:0px;top:0px;width:100%;height:100%;}


		.Homebannertext dl.bannerone{position:absolute;width:1180px;left:50%;margin-left:-590px;top:251px;text-align:center;z-index:9999;}
		.Homebannertext dl.bannerone dt{float:right;font-size:45px;width:750px;height:80px;margin-left:100px;line-height:75px;color:#fff;background:#eb3900;transform:translateY(100px);-moz-transform:translateY(100px);-ms-transform:translateY(100px);}
		.Homebannertext dl.bannerone dd{float:right;font-size:29px;color:#fff;background:#000;width:360px;height:60px;line-height:60px;margin-right:45px;transform:translateY(100px);-moz-transform:translateY(100px);-ms-transform:translateY(100px);}


		.Homebannertext dl.bannertwo{position:absolute;width:1180px;left:50%;top:0px;color:#fff;margin-left:-590px;z-index:9999;}
		.Homebannertext dl.bannertwo dt{padding-top:110px;position:relative;transform:translateY(100px);-moz-transform:translateY(100px);-ms-transform:translateY(100px);}
		.Homebannertext dl.bannertwo dt h3{font-size:50px;line-height:60px;font-weight:700;position:relative;}
		.Homebannertext dl.bannertwo dt p{font-size:20px;position:relative;padding-top:20px;}


		.Homebannertext dl.bannerthree{position:absolute;width:1220px;left:50%;margin-left:-610px;top:0px;}
		.Homebannertext dl.bannerthree dt{float:left;position:relative;transform:translateX(100px);-moz-transform:translateX(100px);-ms-transform:translateX(100px);}
		.Homebannertext dl.bannerthree img{display:block;position:relative;width:auto;height:auto;left:0px;margin:0px;top:0px;}
		.Homebannertext dl.bannerthree dd{width:500px;float:left;color:#fff;padding-top:170px;position:relative;
			padding-left:25px;transform:translateX(100px);-moz-transform:translateX(100px);-ms-transform:translateX(100px);}
		.Homebannertext dl.bannerthree dd h3{font-size:55px;font-weight:700;line-height:70px;}
		.Homebannertext dl.bannerthree dd p{font-size:20px;line-height:30px;}


		.bannereffect{opacity:0;filter:alpha(opacity=0);}

		.bannertime1{transition:all .8s ease-in-out .2s;
			-moz-transition:all .8s ease-in-out .2s;-ms-transition:all .8s ease-in-out .2s;}
		.bannertime2{transition:all 1s ease-in-out .2s;
			-moz-transition:all 1s ease-in-out .2s;-ms-transition:all 1s ease-in-out .2s;}


		.Homebanner li.cur .Homebannertext dl.bannerone dt{transform:translateY(0px);-moz-transform:translateY(0px);-ms-transform:translateY(0px);}
		.Homebanner li.cur .Homebannertext dl.bannerone dd{transform:translateY(0px);-moz-transform:translateY(0px);-ms-transform:translateY(0px);}
		.Homebanner li.cur .Homebannertext dl.bannertwo dt{transform:translateY(0px);-moz-transform:translateY(0px);-ms-transform:translateY(0px);}
		.Homebanner li.cur .Homebannertext dl.bannerthree dt{transform:translateX(0px);-moz-transform:translateX(0px);-ms-transform:translateX(0px);}
		.Homebanner li.cur .Homebannertext dl.bannerthree dd{transform:translateX(0px);-moz-transform:translateX(0px);-ms-transform:translateX(0px);}
		.Homebanner li.cur .bannereffect{opacity:1;filter:alpha(opacity=100);}


		.Homebanner li.cur1 .bannertime1{transition:all .4s linear .1s;-moz-transition:all .4s linear .1s;-ms-transition:all .4s linear .1s;}
		.Homebanner li.cur1 .bannertime2{transition:all .4s linear;-moz-transition:all .4s linear;-ms-transition:all .4s linear;}


		.Homebanner li.cur1 .Homebannertext dl.bannerone dt{transform:translateY(100px);-moz-transform:translateY(100px);-ms-transform:translateY(100px);}
		.Homebanner li.cur1 .Homebannertext dl.bannerone dd{transform:translateY(100px);-moz-transform:translateY(100px);-ms-transform:translateY(100px);}
		.Homebanner li.cur1 .Homebannertext dl.bannertwo dt{transform:translateY(100px);-moz-transform:translateY(100px);-ms-transform:translateY(100px);}
		.Homebanner li.cur1 .Homebannertext dl.bannerthree dt{transform:translateX(100px);-moz-transform:translateX(100px);-ms-transform:translateX(100px);}
		.Homebanner li.cur1 .Homebannertext dl.bannerthree dd{transform:translateX(100px);-moz-transform:translateX(100px);-ms-transform:translateX(100px);}
		.Homebanner li.cur1 .bannereffect{opacity:0;filter:alpha(opacity=0);}

		.bbutton{
			 display: flex;
			 justify-content: center;
			 margin-bottom: 50px;
		}
		.button{
			float: left;
			height: 50px;
			width: 140px;
			border: 0;
			margin-left: 30px;
			font-size: 15px;
			font-family: 'Open Sans', Arial, sans-serif;
		}
	</style>
	
	<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
	<script type="text/javascript">
	$(function(){
	
	var i,left,right,box,boxli,boxleng,width,first,last,IsAuto;
	
	i = 0; 
    
	left = $(".Homeleft"); 
	
	right = $(".Homeright");
	
	box = $(".Homebanner ul");
	
	boxli = $(".Homebanner li");
	
	width = boxli.width();
	
	boxleng = boxli.length;
	
	box.css({width:width*(boxleng)})
	
	boxli.css({width:width});
	
	boxli.eq(0).addClass("cur");
	
	boxli.each(function(index) {
       zindex = boxleng-(index+1);
	   $(this).css({"z-index":zindex})
    });
	
	IsAuto = true;
	
	left.click(function(){
		if(box.is(":animated")){return}
		i--;
		if(i<0){i=boxleng-1};
		boxanimate();
		
	})
	
	right.click(function(){
		if(box.is(":animated")){return}
		i++;
		boxanimate();
	})
	
	function boxanimate(){
		if(i>boxleng-1){i=0}		
		boxli.addClass("cur1");
		setTimeout(function(){
			boxli.removeClass("cur1");
			boxli.removeClass("cur").eq(i).addClass("cur");
			boxli.stop().animate({opacity:0,"z-index":"1"},500).eq(i).stop().animate({opacity:1,"z-index":boxleng},500);
		},400)	
	}

	box.hover(function(){
		IsAuto = false;
	},function(){
		IsAuto = true;
	})


	left.hover(function(){
		IsAuto = false;
	},function(){
		IsAuto = true;
	})

	
	right.hover(function(){
		IsAuto = false;
	},function(){
		IsAuto = true;
	})
	
	
})
</script>
</head>
<body>
     <%
     Object message = request.getAttribute("message");
     if(message!=null && !"".equals(message)){
 
 	 %>
      <script type="text/javascript">
          alert("<%=message%>");
      </script>
 	 <%} %>
<!-- 导航栏 -->
<nav class="mynav">
	
  	<ul>
  	<li><img src="img/zp.png" alt="招聘信息"></li>
    <li><a href="index.jsp">主页</a></li>
    <li><a href="register.jsp">用户注册</a></li>
    <li><a href="login.jsp">用户登录</a></li>
    <li><a href="publish.jsp">发布招聘信息</a></li>
    <li><a href="changePassword.jsp">修改密码</a></li>
    <li><a href="helpExit">退出登录</a></li>
    <li><a href="managerLogin.jsp">管理员登陆</a></li>
    <li><a href="helpManager">评论信息管理</a></li>
 	 </ul>
</nav>

<span class="target"></span>

<!-- 分类 -->
	<div class="bbutton">
	<form action="helpIndex" name="form" method="post">
		<input type="hidden" name="newstype" value=1>
		<input type="hidden" name="showPage" value="1">
		<input type="submit" value="电子商务" class="button" />
	</form>
	<form action="helpIndex" name="form" method="post">
		<input type="hidden" name="newstype" value=2>
		<input type="hidden" name="showPage" value="1">
		<input type="submit" value="行政/后勤" class="button" />
	</form>
	<form action="helpIndex" name="form" method="post">
		<input type="hidden" name="newstype" value=3>
		<input type="hidden" name="showPage" value="1">
		<input type="submit" value="人力资源" class="button" />
	</form>
	<form action="helpIndex" name="form" method="post">
		<input type="hidden" name="newstype" value=4>
		<input type="hidden" name="showPage" value="1">
		<input type="submit" value="餐饮/酒店" class="button" />
	</form>
	<form action="helpIndex" name="form" method="post">
		<input type="hidden" name="newstype" value=5>
		<input type="hidden" name="showPage" value="1">
		<input type="submit" value="其它" class="button" />
	</form>
	<form action="helpIndex" name="form" method="post">
		<input type="hidden" name="newstype" value=0>
		<input type="hidden" name="showPage" value="1">
		<input type="submit" value="全部信息" class="button" />
	</form>		
	</div>

<!-- 首页轮播 -->
<div class="bannerbox">
	<div class="Homebanner">
		<ul>
			<li class="Load cur" style="z-index:99">
				<img src="img/banner2016.jpg" alt="">
				<div class="Homebannertext">
					<dl class="bannerone clearfix">
					<!-- clearfix 清除浮动 -->
						<dt class="bannereffect bannertime1">
							 长春招聘<b>第一品牌</b>·招聘信息网大全
						</dt>
						<dd class="bannereffect bannertime2">
							 总有一个工作适合你
						</dd>
					</dl>
				</div>
			</li>
			<li class="Load">
				<img src="img/banner02.jpg" alt="">
				<div class="Homebannertext">
					<dl class="bannertwo clearfix">
						<dt class="bannereffect bannertime1">
							 <h3>专业的免费招聘网站</h3>
							 <p>对人才简历质量，服务质量进行控制把握，省时更高效！</p>
						</dt>
					</dl>
				</div>
			</li>
			<li class="Load"><img src="img/03.jpg" alt="">
				<div class="Homebannertext">
					<dl class="bannerthree clearfix">
						<dd class="bannereffect bannertime1">
							 <h3>持续追求更高品质</h3>
							 <p>我们服务了超过1500家企业，其中300家为上市公司，集团企业及政府机构，让我们的专业帮助您的简历更有效率的传播！</p>
						</dd>
					</dl>
				</div>
			</li>
		</ul>
		<div class="Homeleft"><</div>
		<div class="Homeright">></div>
	</div>   
</div>
<script type="text/javascript" src="js/nav.js"></script>
</body>

</html>