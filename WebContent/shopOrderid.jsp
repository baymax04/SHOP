<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<base href="<%=basePath%>">
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
		<title>电子商城</title>
		<link href="inc/style.css" rel="stylesheet" type="text/css" />
		<link href="styles/style.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="JS/jquery-1.4.2.min.js"></script>
		<script type="text/javascript" src="JS/logscript.js"></script>
	</head>
	<body>
		<div id="container">
		<jsp:include page="headpage.jsp"></jsp:include>
			<div id="content">
				<div class="userinfo"
					style="background: url(images/38.gif) no-repeat;">
					<ul>
						<li>
							您的订单号：
							<font style="color: red;">${session.ordercode}</font>
						</li>
					</ul>
					<div class="button_img">
						<center>
							<a href="testz/zhang">继续购物</a>
						</center>

					</div>
				</div>
			</div>
		</div>
	</body>
</html>
