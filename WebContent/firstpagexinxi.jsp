<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>




<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
		<base href="<%=basePath%>">

		<title>电子商城</title>

		<link href="styles/style.css" rel="stylesheet" type="text/css" />
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<script type="text/javascript" src="JS/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="JS/logscript.js"></script>
</head>

<body>
<div id="container">
  <jsp:include page="headpage.jsp"></jsp:include> 
  <div id="content">
    <h3>&nbsp;</h3>     
    <ul class="ul_list"> 
        <li>
         <span><img src="images/goods/${res[0].picture } " /></span>
         <span>$</span>
         <span>单价：${res[0].price } </span>
         <span>商品简介:${res[0].introduce} </span>
         <span><br/><img src="images/33.gif" alt="订购" onclick="window.location.href='dinggou.html'" style="border:0; cursor:hand;"/>&nbsp; 
         	<img src="images/29.gif" alt="返回" onclick="history.go(-1)"  style="border:0; cursor:hand;"/>
         </span>
         </li>
    </ul>   
    <div class="clear"></div>
  </div>  
</div>
</body>
</html>
