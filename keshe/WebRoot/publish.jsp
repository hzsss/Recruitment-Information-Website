<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="index.css" />
	<style type="text/css">
.form1{
	position: fixed;
	top: 25%;
	left: 40%;
}
.input_control{
  width:360px;
  height: 30px;
  margin:20px auto;

}

input[type="text"],#btn1,#btn2{
  box-sizing: border-box;
  text-align:center;
  font-size:1.4em;
  height:1.7em;
  border-radius:4px;
  border:1px solid #c7e2fd;
  color:#6a6f77;
  -web-kit-appearance:none;
  -moz-appearance: none;
  display:block;
  outline:0;
  padding:0 1em;
  text-decoration:none;
  width:100%;
}
.select{
width:370px;
margin:20px auto;
height: 40px;
}

.span1{
	font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
	font-size: 20px;
}
input[type="text"]:focus{
  border:1px solid #ff7496;
}
::-moz-placeholder { /* Mozilla Firefox 4 to 18 */
  color: #64b0fe;
}
::-moz-placeholder { /* Mozilla Firefox 19+ */
  color: #64b0fe;
}
input::-webkit-input-placeholder{
  color: #64b0fe;}

#message{
   color:#6a6f77;
height:100px;
padding: 5px 0px 0px 5px;
width: 100%;
font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
 border-radius:4px;
  border:1px solid #c7e2fd;
    font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
  font-size: 20px;
}
.button {
background:#64b0fe;;
border: none;
padding: 10px 25px 10px 25px;
color: #fff;
border-radius: 4px;
-moz-border-radius: 4px;
-webkit-border-radius: 4px;

font-weight: bold;
box-shadow: 1px 1px 1px #3D3D3D;
-webkit-box-shadow:1px 1px 1px #3D3D3D;
-moz-box-shadow:1px 1px 1px #3D3D3D;
}

.button:hover {
color: #333;
background-color: #EBEBEB;
}
.border{
  width: 1000px;
  height: 100%;
  position:fixed;
  
  z-index: 2;
  
  left: 350px;
  top: 200px;
  /*ebf5ff*/
 
 
  border-left: 2px solid #64b0fe;
  border-right: 2px solid #64b0fe;
  background-color: #f5f9fe;
 

}
	</style>
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
<script type="text/javascript" src="js/nav.js"></script>

<span class="target"></span>
<div class="border">

<div class="form1">
<form action="helpPublish" name="form" method="post">
<div class="input_control">
	 <span class="span1">信息类别</span>

<select  class="select" name="newstype">
<option value=1>电子商务</option>
<option value=2>行政/后勤</option>
<option value=3>人力资源</option>
<option value=4>餐饮/酒店</option>
<option value=5>其它</option>
</select>
</div>
<br><br>
    <div class="input_control">
        <span class="span1">信息标题</span>
        <input type="text" class="form_input" name="title" placeholder="请输入信息标题"/>
    </div><br>
    <div class="input_control">
     <span class="span1">您的姓名</span>
        <input type="text" class="form_input" name="contact" placeholder="请输入您的姓名"/>
    </div><br>
    <div class="input_control">
     <span class="span1">联系方式</span>
        <input type="text" class="form_input" name="number" placeholder="请输入您的联系方式"/>
    </div><br>
    <div>
	<span class="span1">请输入要发布的招聘信息</span><br>
	<textarea id="message" name="message" ></textarea>
	</div>
	<div>
	
	<input type="submit" class="button" value="发布">
	</div> 
	<br><br><br><br>
</form>
</div>
</div>
<script type="text/javascript" src="js/nav.js"></script>
</body>
</html>