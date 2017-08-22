<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>电子商城</title>
<link href="styles/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="JS/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="JS/logscript.js"></script>
</head>

	<body>

<form name="myform" >
		<h1 align='center' color=‘red’>
			${man.title}
		</h1>&nbsp;&nbsp;&nbsp;&nbsp;

<div align='center' >
		

			创建时间：${man.createdate}
			<br/><br/>
			结束时间：${man.enddate}
			<br/><br/>
                               主要内容：${man.content}
<br/><br/>
<input type="button" value="返回" onclick="history.back()">
		
</div>
</form>
   </div>
    </div>
  </div>
	</body>
</html>
