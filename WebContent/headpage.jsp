<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<div id="head" style="position:relative;">
<s:i18n name="memberLogin/package">
    <div class="banner">
        <p><span><s:text name="USERNAME"/></span>
        <input type="text" id="userName" name="userName"/>
        <span><s:text name="PASSWORD"/></span>
        <input type="password" id="userPassword" name="userPassword"/>
        <img src="images/05.gif" onclick="login();" style= "CURSOR:hand" alt="登录"/>
        <img src="images/06.gif" onclick="window.location.href='zhuce.jsp'" style= "CURSOR:hand" alt="注册"/>
		<br/>
		<font id="msg" color="red">${msg_info}</font>
        </p>
    </div>
	<font color="orange" style="top:95px; left:750px; position:absolute;">${msg}</font>
    <div class="nav"><a href="${basePath}testz/zhang"><s:text name="INDEX"/></a> | <a href="${basePath}updateview" ><s:text name="UPDATE"/></a> | <a href="${basePath}shop/shop_shopCar" ><s:text name="SHOPCART"/></a> | <a href="${basePath}orderView" ><s:text name="ORDER"/></a> | <a href="${basePath}loginManage.jsp"><s:text name="BACKSTAGE"/></a></div>
</s:i18n>
</div>