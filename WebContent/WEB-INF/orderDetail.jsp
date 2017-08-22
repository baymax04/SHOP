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
</head>
<body>
<div id="container">
	<jsp:include page="/headpage.jsp"></jsp:include>
<div id="content">
    <div class="cartDet">
    <div class="order_bg">
	<s:i18n name="memberOrder/package">
    <h4><s:text name="ORDERDETAIL"/></h4>
        <div style="width:500px;height:300px;margin:10px auto;">
                	<p><s:text name="USERNAME"/>：${session.membername}</p>
                	<p><s:text name="ORDERNUM"/>：${order.ordercode}</p>
                	<p><s:text name="RECIPIENT"/>：${order.username}</p>
                	<p><s:text name="ADDRESS"/>：${order.address}</p>
                	<p><s:text name="ZIPCODE"/>：${order.postcode}</p>
                	<p><s:text name="PHONENUMBER"/>：${order.tel}</p>
                	<p><s:text name="REMARKS"/>：${order.bz}</p>
            <table width="400" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="50%" ><s:text name="PRODUCT"/></td>
                <td width="25%" ><s:text name="PRICE"/></td>
                <td width="25%" ><s:text name="NUMBER"/></td>
              </tr>
			<s:iterator value="list" id="shops">
				<tr>
                	<td><s:property value="#shops.goodsname"/></td>
                	<td><s:property value="#shops.price"/></td>
                	<td><s:property value="#shops.numbers"/></td>
				</tr>
			</s:iterator>
            </table>
             <p class="ali_center">
               <img src="images/29.gif" onclick="window.location.href='orderView'" style="border:0; cursor:hand"/>
             </p>     
      </div>
	</s:i18n>
    </div>
  </div>
  </div>
</body>
</html>

