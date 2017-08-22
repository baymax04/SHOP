<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
		<link href="styles/style.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="JS/jquery-1.4.2.min.js"></script>
		<script type="text/javascript" src="JS/logscript.js"></script>
<style type="text/css">
.errorMessage{
	display: inline;
}
.errorMessage li{
	display: inline;
}
.errorMessage li span{
	float:right;
	text-align:left;
	width: 270px;
}
</style>
	</head>
	<body>
		<div id="container">
		<jsp:include page="headpage.jsp"></jsp:include>
			<div id="content">
				<div class="userinfo"
					style="background: url(images/38.gif) no-repeat;">
					<s:form id="toCartConfirm" name="checkForm" onsubmit="return true;" namespace="/shop"
						action="shop_order" method="post" theme="simple">
						<input type="hidden" name="shopOrder.bnumber" value="${shopOrder.bnumber}"/>
						<ul>
							<li>
								<span>收 件 人：</span>
								<input type="text" name="shopOrder.username" value="${shopOrder.username}"
									id="toCartConfirm_shopOrder_username" />
								<font class="red"> *<s:fielderror fieldName="username"/></font>
							</li>
							<li>
								<span>邮寄地址：</span>
								<input type="text" name="shopOrder.address" value="${shopOrder.address}"
									id="toCartConfirm_shopOrder_address" />
								<font class="red"> *<s:fielderror fieldName="address"/></font>
							</li>
							<li>
								<span>邮政编码：</span>
								<input type="text" name="shopOrder.postcode" maxlength="6"
									value="${shopOrder.postcode}" id="toCartConfirm_shopOrder_postcode" />
								<font class="red"> *<s:fielderror fieldName="postcode"/></font>
							</li>
							<li>
								<span>联系电话：</span>
								<input type="text" name="shopOrder.tel" maxlength="11" value="${shopOrder.tel}"
									id="toCartConfirm_shopOrder_tel" />
								<font class="red"> *<s:fielderror fieldName="tel"/></font>
							</li>
							<li>
								<span>付款方式：</span>
								<input type="text" name="shopOrder.pay" value="${shopOrder.pay}"
									id="toCartConfirm_shopOrder_pay" />
								<font class="red"> *<s:fielderror fieldName="pay"/></font>
							</li>
							<li>
								<span>运送方式：</span>
								<input type="text" name="shopOrder.carry" value="${shopOrder.carry}"
									id="toCartConfirm_shopOrder_carry" />
								<font class="red"> *<s:fielderror fieldName="carry"/></font>
							</li>
							<li>
								<span>备 注：</span>
								<textarea name="shopOrder.bz" cols="50" rows="5"
									id="toCartConfirm_shopOrder_bz">${shopOrder.bz}</textarea>
								<font class="red"> *</font>
							</li>
							<li></li>
							<li></li>
						</ul>
						<div class="button_img">
							<img src="images/12.gif" onclick="document.checkForm.submit();"
								style="CURSOR: hand" />
							<img src="images/13.gif" onclick="document.checkForm.reset();"
								style="CURSOR: hand" />
							<img src="images/29.gif" onclick="window.location.href='shop/shop_shopCar'"
								style="CURSOR: hand" />
						</div>
					</s:form>
				</div>
			</div>
		</div>
	</body>
</html>
