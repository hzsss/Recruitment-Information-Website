<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<style type="text/css">
/*body{
		font-family:"微软雅黑";
		font-size:12px;
		padding:0px;color:#333;
		line-height:24px;
		height:auto;
		clear:both;
		min-width:1200px;
	}*/


.form_wrapper h2{
	padding: 20px 30px 20px 30px;
	background-color: #64b0fe;
	color: #fff;
	font-size: 25px;
	border-bottom: 1px solid #ddd;
}
.form_wrapper label{
	display: block;
	padding: 10px 30px 0px 30px;
	margin: 10px 0px 0px 0px;
}
.clear{
	clear:both;
}
.form_wrapper .bottom{
	background-color: #64b0fe;
	border-top: 1px solid #ddd;
	margin-top:15px;
	clear: both;
	color: #fff;
	text-shadow:1px 1px 1px #000;
}
body{
	font-family:"Trebuchet MS", "Myriad Pro", Arial, sans-serif;
	font-size:14px;
	margin:0px;
	padding:0px;
	color:#333;
	text-shadow:1px 1px 1px #fff;
	/*overflow-y:scroll;*/
}
.div1{
	position:absolute;
	height:70%;
	width: 100%;
	top: 140px;
	background-image:url(img/backg.jpg);
	
	background-size: contain;


}
a{
	color:#777;
}
a:hover{
	color:#222;
}
p{
	padding:5px 0px;
}
.wrapper{
	/*调试改一下这里就好了*/
	margin: 20px auto;
	min-height: 550px;
	position:fixed;
	top:35%;
	left:45%;
}
.form_wrapper{
    
	background:#fff;
	border:1px solid #ddd;
	margin:0 auto;
	width:350px;

	font-size:16px;
	-moz-box-shadow:1px 1px 7px #ccc;
	-webkit-box-shadow:1px 1px 7px #ccc;
	box-shadow:1px 1px 7px #ccc;
}
.form_wrapper form{

	display: none;
	background:#fff;
}


.form_wrapper .column{
	width:77%;
	float:left;
}
form.active{
	display:block;
}
form.login{
	width:350px;
}
.form_wrapper input[type="text"],
.form_wrapper input[type="password"]{
	border: solid 1px #E5E5E5;
	background: #FFFFFF;
	margin: 5px 30px 0px 30px;
	padding: 9px;
	display:block;
	font-size:16px;
	width:76%;
	background: 
		-webkit-gradient(
			linear,
			left top,
			left 25,
			from(#FFFFFF),
			color-stop(4%, #EEEEEE),
			to(#FFFFFF)
		);
	background: 
		-moz-linear-gradient(
			top,
			#FFFFFF,
			#EEEEEE 1px,
			#FFFFFF 25px
			);
	-moz-box-shadow: 0px 0px 8px #f0f0f0;
	-webkit-box-shadow: 0px 0px 8px #f0f0f0;
	box-shadow: 0px 0px 8px #f0f0f0;
}
.form_wrapper input[type="text"]:focus,
.form_wrapper input[type="password"]:focus{
	background:#feffef;
}
.box{
	width:49%;
}
.left{
	float:left;
}
.right{
	float:right;
}
.form_wrapper .bottom a{
	display:block;
	clear:both;
	padding:10px 30px;
	text-align:right;
	color:#ffa800;
	text-shadow:1px 1px 1px #000;
}
.form_wrapper span.error{
	visibility:hidden;
	color:red;
	font-size:11px;
	font-style:italic;
	display:block;
	margin:4px 30px;
}
.form_wrapper input[type="submit"] {
	background: #e3e3e3;
	border: 1px solid #ccc;
	color: #333;
	font-family: "Trebuchet MS", "Myriad Pro", sans-serif;
	font-size: 14px;
	font-weight: bold;
	padding: 8px 0 9px;
	text-align: center;
	width: 150px;
	cursor:pointer;
	float:right;
	margin:15px 20px 10px 10px;
	text-shadow: 0px 1px 0px #fff;
	-moz-border-radius: 4px;
	-webkit-border-radius: 4px;
	border-radius: 4px;
	-moz-box-shadow: 0px 0px 2px #fff inset;
	-webkit-box-shadow: 0px 0px 2px #fff inset;
	box-shadow: 0px 0px 2px #fff inset;
}
.form_wrapper input[type="submit"]:hover {
	background: #b2bdbf;
	-moz-box-shadow: 0px 0px 2px #eaeaea inset;
	-webkit-box-shadow: 0px 0px 2px #eaeaea inset;
	box-shadow: 0px 0px 2px #eaeaea inset;
	color: #222;
}
a.back{
	color:#777;
	position:fixed;
	top:5px;
	right:10px;
	text-decoration:none;
}
.form_wrapper input[type="text"],
.form_wrapper input[type="password"]{
	border: solid 1px #E5E5E5;
	background: #FFFFFF;
	margin: 5px 30px 0px 30px;
	padding: 9px;
	display:block;
	font-size:16px;
	width:76%;
	background: 
		-webkit-gradient(
			linear,
			left top,
			left 25,
			from(#FFFFFF),
			color-stop(4%, #EEEEEE),
			to(#FFFFFF)
		);
	background: 
		-moz-linear-gradient(
			top,
			#FFFFFF,
			#EEEEEE 1px,
			#FFFFFF 25px
			);
	-moz-box-shadow: 0px 0px 8px #f0f0f0;
	-webkit-box-shadow: 0px 0px 8px #f0f0f0;
	box-shadow: 0px 0px 8px #f0f0f0;
}
.form_wrapper input[type="text"]:focus,
.form_wrapper input[type="password"]:focus{
	background:#feffef;
}
.div2{
	position: fixed;
	top:11px;
	left: 30px;
}
.pp{
	font-size:30px;
}
</style>
<link rel="stylesheet" type="text/css" href="index.css" />
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
<script type="text/javascript" src="js/nav.js"></script>

<div class="div1">

	<div class="content">
		<div id="form_wrapper" class="form_wrapper">
			<form action="helpRegister" class="login active">
				<h2>Register</h2>
				<div>
					<label>用户名</label>
					<input type="text" name="logname" placeholder="仅限英文和数字">
				</div>
				<div>
					<label>密码</label>
					<input type="password" name="password" placeholder="包含英文大小写，数字和特殊字符">
				</div>

				<div>
					<label>确认密码</label>
					<input type="password" name="confirmPassword">
				</div>

				<div class="bottom">
					<input type="submit" value="注册" name="submit"></input>
					
					<div class="clear"></div>
				</div>
			</form>

		</div>
		<div class="clear"></div>

</div>
</div>
</body>
</html>
