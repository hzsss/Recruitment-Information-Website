<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="index.css" />
<style type="text/css">
	html{   
    width: 100%;   
    height: 100%;   
    overflow: hidden;   
    font-style: sans-serif;   
}   
/*body{   
    width: 100%;   
    height: 100%;   
    font-family: 'Open Sans',sans-serif;   
    margin: 0;   
    background-color: #64b0fe;   
}   */
#login{   
    position: absolute;   
    top: 50%;   
    left:50%;   
    margin: -150px 0 0 -150px;   
    width: 300px;   
    height: 300px;   
}   
#login h1{   
    color: #fff;   
    text-shadow:0 0 10px;   
    letter-spacing: 1px;   
    text-align: center;   
}   
h1{   
    font-size: 2em;   
    margin: 0.67em 0;   
}   
input{   
    width: 278px;   
    height: 18px;   
    margin-bottom: 10px;   
    outline: none;   
    padding: 10px;   
    font-size: 13px;   
    color: #fff;   
    text-shadow:1px 1px 1px;   
    border-top: 1px solid #312E3D;   
    border-left: 1px solid #312E3D;   
    border-right: 1px solid #312E3D;   
    border-bottom: 1px solid #56536A;   
    border-radius: 4px;   
    background-color: #2D2D3F;   
}   
.but{   
    width: 300px;   
    min-height: 20px;   
    display: block;   
    background-color: #4a77d4;   
    border: 1px solid #3762bc;   
    color: #fff;   
    padding: 9px 14px;   
    font-size: 15px;   
    line-height: normal;   
    border-radius: 5px;   
    margin: 0;   
} 
.bg{
	position: absolute;
	top: 20%;
	left: 0px;
	background-color: #64b0fe;
	width: 100%;
	height: 50%;
} 
</style>
</head>
<body>
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
  <div id="login">
  <div class="bg">	
        <h1>Login</h1>  
        <form action="helpManagerLogin" method="post"> 
            <input type="text" required="required" placeholder="管理员帐号" name="managerName"></input>  
            <input type="password" required="required" placeholder="密码" name="managerPassword"></input>  
            <button class="but" type="submit">登录</button>  
        </form>  
    </div>  
    </div>
</body>
</html>