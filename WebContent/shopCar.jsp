<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
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
		<script type="text/javascript">
		function validate(input){
			var number=input.value;
			if(number.length==0){input.value="0";return;}
			else if(number.length>1&&number.indexOf("0")==0)
			{
				input.value=number.substring(1,number.length);
				return;
			}
			var patrn=/^\d+$/;
			if(!patrn.exec(input.value)){
			alert("请输入正整数");
				input.value=number.substring(0,number.length-1);return;
			}
		}
	function setSummary(index,price){
		try{
		var number = 0;
			number = document.getElementById('count'+index).value;	
			var fPrice = parseFloat(price)*parseInt(number);
			document.getElementById('summary'+index).innerHTML=fPrice;
			setAllMoney();
		}catch(err){}
	}
	
	function setAllMoney(){
		try{
			var num = document.getElementsByName('num').length;
			var sum = 0.0;
			for(var i=1;i<num+1;i++){
				var fPrice = document.getElementById('summary'+i).innerHTML;	
				sum = (sum*100+fPrice*100)/100;
			}
			document.getElementById('label_money').innerHTML=sum;
		}catch(err){}
	}
	
	window.onload = function(){		
		try{
			setAllMoney();
		}catch(err){}
	}

</script>

	</head>
	<body>
		<div id="container">
		<jsp:include page="headpage.jsp"></jsp:include>
			<div id="content">
				<div class="cartDet">
					<div class="bg">
						<h4>
							购物车
						</h4>
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<th scope="col" width="15%">
									编号
								</th>
								<th scope="col" width="30%">
									商品名称
								</th>
								<th scope="col" width="15%">
									单价
								</th>
								<th scope="col" width="15%">
									数量
								</th>
								<th scope="col" width="15%">
									金额
								</th>
								<th scope="col" width="10%">
									删除
								</th>
							</tr>
							<c:set var="num" value="1" />
							<c:forEach items="${res}" var="mb">
								<form id="changeAllCount_action" name="changeAllCountForm<c:out value='${num}'></c:out>"
									onsubmit="return true;" action="shop/shop_update" method="post">
								<input type="hidden" name=mb.gcid value="${mb.gcid}" />
								<tr name="num">
									<td>
										<c:out value="${num}"></c:out>
									</td>
									<td>
										${mb.goodsname}
									</td>
									<td>
										${mb.price}
									</td>
									<td>
										<input id="count<c:out value="${num}"></c:out>"
											name="mb.amount" size="8" value="${mb.amount}"
											onblur="setSummary(<c:out value="${num}"></c:out>,'${mb.price}')"
											class="input"
											onchange="document.changeAllCountForm<c:out value="${num}"></c:out>.submit();"
											onpropertychange="validate(this);" />
									</td>
									<td>
										￥
										<span id="summary<c:out value="${num}"></c:out>">${mb.price*mb.amount}</span>
									</td>
									<td align="center">
										<img src="images/35.gif" onclick="window.location.href='shop/shop_delete?mb.gcid=${mb.gcid}'"
											style="border: 0; float: inherit; cursor: hand" />
									</td>
									<c:set var="num" value="${num+1}" />
								</tr>	
								</form>
							</c:forEach>
						</table>
						<p class="ali_right">
							合计总金额：￥
							<span id="label_money"></span>
						</p>

						<p class="ali_center">
							<a href="testz/zhang">继续购物</a> |
							<c:if test="${num==1}">
								收银结账 |
							</c:if>
							<c:if test="${num!=1}">
								<a href="shop/shop_orderView?shopOrder.bnumber=<c:out value="${num-1}"></c:out>">收银结账</a> |
							</c:if>
							<a href="shop/shop_deleteall">清空购物车</a> 
						</p>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>
