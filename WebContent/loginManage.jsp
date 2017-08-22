<%@ page language="java" import="java.util.*, java.net.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>电子商城</title>
<link href="styles/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="JS/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="JS/script.js"></script>
</head>
<body>
<form namespace="/" id="adminLogin" name="loginForm" action="loginmanage" method="post">
<div class="login_bg">
<div style="padding-top:170px; padding-left:10px; position:absolute;">
<input type='checkbox' name='remflg' value="1" ${check}/>&nbsp记住登陆状态</div>
<input type='hidden' name='flg' value="login"/>
<p>
用户名：<input type="text" name="shopManager.manager" size="12" value="${name}" id="adminLogin_shopManager_manager" onBlur="obname(this)"/>
密码：<input type="password" name="shopManager.password" size="12" value="${pass}" id="adminLogin_shopManager_password" onBlur="obpass(this)"/> 
<img src="images/19.gif" onclick="submitf();" style="border:0; cursor:hand"/>
<img src="images/22.gif" onclick="window.location.href='index.jsp';" style="border:0; cursor:hand"/>
</p>
	<div style="width:446px;height:30px;margin:30px auto;">
		<font id="warnmsg" color=red><c:out value="${warn}"/></font>
	</div>
</div>
</form>
</body>
</html>
