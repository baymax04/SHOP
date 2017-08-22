<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
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
		<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script type="text/javascript" src="JS/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="JS/logscript.js"></script>
		<script language="javascript">
	function paging(dir) {
		var listform = document.getElementById("listform");
		var page = document.getElementById("page");
		var totalPage = document.getElementById("totalPage");
		if (dir == "first") {
			page.value = 1;
			listform.submit();
		}
		if (dir == "previous") {
			var p = parseInt(page.value) - 1;
			if (p < 1) {
				p = 1;
			}
			page.value = p;
			listform.submit();
		}
		if (dir == "next") {
			var p = parseInt(page.value) + 1;
			if (p > parseInt(totalPage.value)) {
				p = parseInt(totalPage.value);
			}
			page.value = p;
			listform.submit();
		}
		if (dir == "last") {
			page.value = parseInt(totalPage.value);
			listform.submit();
		}
	}
	
</script>

	</head>

	<body>

<form id="listform" name="homePagelist" action="${basePath} testz/zhang" method='post'>
	<input type="hidden" name="pages.page" id ="page" value="${pages.page}">  
	<input type="hidden" name="pages.totalPage" id ="totalPage" value="${pages.totalPage}">

	</form>

		<!--<form name="list" id = "listform" action="${basePath}test/list" method='post'>
			--><div id="container">
	<jsp:include page="headpage.jsp"></jsp:include> 
				<div id="content">
					<p class="ali_center">

						<a href="javascript:void(0)" onclick="paging('first')">首页</a>
						<a href="javascript:void(0)" onclick="paging('previous')">上一页</a>


						|

						<a href="javascript:void(0)" onclick="paging('next')">下一页</a>
						<a href="javascript:void(0)" onclick="paging('last')">尾页</a>


					</p>
				</div>
				<div id="content">
					<h3>
						&nbsp;
					</h3>
					<ul class="ul_list">

						<c:forEach items="${res}" var="goods">
							<li>
								<img src="${basePath}images/goods/${goods.picture}" width="100px"
									height="100px" />

								<span><c:out value="${goods.goodsname}"></c:out></span>
								<span>单价：<c:out value="${goods.price}"></c:out></span>                                                                            
								<span><br /> <img src="images/08.gif" alt="详细信息" onclick="window.location.href='${basePath}testz/zhang2?bean.id=${goods.id}'"
										
										style="border: 0; cursor: hand;" />&nbsp; <img

										src="images/33.gif" alt="订购"
										onclick="window.location.href='${basePath}shop/shop_add?mb.goodsid=${goods.id}'"
										style="border: 0; cursor: hand;" /> </span>

							</li>
						</c:forEach>



					</ul>
				</div>
			</div>
	
	</body>
</html>
