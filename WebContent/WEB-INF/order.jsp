<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<base href="<%=basePath%>">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>电子商城</title>
<link href="styles/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="JS/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="JS/logscript.js"></script>
<script>
	var listf;
	
	function split(move, e) {
		var p_page = document.getElementById("p_page");
		var totalPage = document.getElementById("totalPage");
		
		if (move == "first") {
			p_page.value = 1;
		}
		else if (move == "prior") {
			p_page.value = parseInt(p_page.value) - 1;
		}
		else if (move == "next") {
			p_page.value = parseInt(p_page.value) + 1;
		}
		else if (move == "last") {
			p_page.value = totalPage.value;
		}
		
		if (p_page.value <= 0) {
			p_page.value = 1;
		}
		else if (p_page.value > totalPage.value) {
			p_page.value = totalPage.value;
		}
		listf(p_page.value);
	}
	
	$(document).ready(
	listf = function(p_page) {
		if (isNaN(p_page)) {
			p_page = 1;
		}
		var param = "split.p_page=" + p_page;
		$.ajax({
			type: "post",
		    url: "orderList",
		    cache: false,
		    data: param,
		    dataType: "json",
		    success: function(data) {
				$("#innertab").html('<tr> <th scope="col" width="15%">订单号</th><th scope="col" width="10%">品种数</th><th scope="col" width="10%">收件人</th><th scope="col" width="10%">付款方式</th><th scope="col" width="20%">运送方式</th><th scope="col" width="20%">订货日期</th></tr>');
				if (data.list.length == 0) {
					$("#innertab").append('<tr><th colspan="6">暂无订单信息</th></tr>');
				} else {
					$.each(data.list, function(i, value) {
					var val = '<tr><td><a href="orderDetail?orderid='+value.id+'">' + value.ordercode + '</a></td>'
						+ '<td>' + value.bnumber + '</td>'
						+ '<td>' + value.username + '</td>'
						+ '<td>' + value.pay + '</td>'
						+ '<td>' + value.carry + '</td>'
						+ '<td>' + value.orderdate + '</td></tr>';
						$("#innertab").append(val);
					});
				}
		        $("#p_page").val(data.split.p_page);
		        $("#totalPage").val(data.split.totalPage);
		        if ($("#p_page").val() == 1) {
		        	$(".up1").css("display", "none");
		        	$(".up2").css("display", "inline");
		        } else {
		        	$(".up1").css("display", "inline");
		        	$(".up2").css("display", "none");
		        }
		        if ($("#p_page").val() == $("#totalPage").val()) {
		        	$(".down1").css("display", "none");
		        	$(".down2").css("display", "inline");
		        } else {
		        	$(".down1").css("display", "inline");
		        	$(".down2").css("display", "none");
		        }
			}
		});
	})
</script>
</head>
<body>
<div id="container">
	<jsp:include page="/headpage.jsp"></jsp:include>
<div id="content">
<p class="ali_center">
<input type="hidden" name="split.p_page" id="p_page">
<input type="hidden" name="split.totalPage" id="totalPage">
<a class="up1" href="javascript:void(0)" onclick="split('first',event)">首页</a>
<a class="up1" href="javascript:void(0)" onclick="split('prior',event)">上一页</a>
<span class="up2" style="display: none;">首页</span>
<span class="up2" style="display: none;">上一页</span>
|
<a class="down1" href="javascript:void(0)" onclick="split('next',event)">下一页</a>
<a class="down1" href="javascript:void(0)" onclick="split('last',event)">尾页</a>
<span class="down2" style="display: none;">下一页</span>
<span class="down2" style="display: none;">尾页</span>
</p>
    <div class="cartDet">
    <div class="order_bg">
	<s:i18n name="memberOrder/package">
    <h4><s:text name="ORDERVIEW"/></h4>
	</s:i18n>
    <table width="100%" border="0" cellspacing="0" cellpadding="0" id="innertab">
  <tr>
    <th scope="col" width="15%">订单号</th>
    <th scope="col" width="10%">品种数</th>
    <th scope="col" width="10%">收件人</th>
    <th scope="col" width="10%">付款方式</th>
    <th scope="col" width="20%">运送方式</th>
    <th scope="col" width="20%">订货日期</th>
  </tr>
</table>
</div>
    </div>
  </div>
  </div>
</body>
</html>
