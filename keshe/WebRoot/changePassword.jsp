<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<style type="text/css">
.form1{
	position: fixed;
	top: 30%;
	left: 40%;

}
.input_control{
  width:360px;
  height: 30px;
  margin:20px auto;

}



.span1{
	font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
	font-size: 20px;
	
}

::-moz-placeholder { /* Mozilla Firefox 4 to 18 */
  color: #6a6f77;
}
::-moz-placeholder { /* Mozilla Firefox 19+ */
  color: #6a6f77;
}
input::-webkit-input-placeholder{
  color: #6a6f77;}


.button {
background:#64b0fe;
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

.input_control input[type="text"],
.input_control input[type="password"]{
  border: solid 1px #E5E5E5;
  background: #FFFFFF;
  margin: 5px 30px 0px 30px;
  padding: 9px;
  display:block;
  font-size:16px;
  width:80%;
  position:absolute;
  left:0px;
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
.input_control input[type="text"]:focus,
.input_control input[type="password"]:focus{
  background:#feffef;
}
.border{
  width: 100%;
  height: 500px;
  position:fixed;
  
  background-image: url(img/bg.jpg);
  top: 180px;
  left: 0px;
 
  
 border-top: 10px solid #64b0fe;
  

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
<div class="border">
<div class="form1">


  <form action="helpChangePassword" method="post">
    <div class="input_control">
        <span class="span1">请输入旧密码</span>
        <input type="password" class="form_input" name="oldPassword" placeholder="请输入旧密码"/>
    </div><br><br>
    <div class="input_control">
     <span class="span1">请输入新密码</span>
        <input type="password" class="form_input" name="newPassword" placeholder="请输入新密码"/>
    </div><br><br>
    <div class="input_control">
     <span class="span1">请确认新密码</span>
        <input type="password" class="form_input" name="confirmPassword" placeholder="请确认新密码"/>
    </div><br><br>
   
    
	<div>
	<span>&nbsp;</span><br><br>
	<input type="submit" name="g" value="确认修改">
	</div>
   </form>
</div>
</div>
<script type="text/javascript" src="js/nav.js"></script>
</body>
</html>