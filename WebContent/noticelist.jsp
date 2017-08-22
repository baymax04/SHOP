<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>电子商城</title>
<link href="styles/style.css" rel="stylesheet" type="text/css" />
 <script language="javascript">
 function split(dir,e){
   
            var listform = document.getElementById("listform");
		    var p_page = document.getElementById("currentpage");
		    
		    var totalpage=document.getElementById("totalpage");
		    var jumppage = document.getElementById("jumpid");
		     
		    if(dir=="first"){
		    	p_page.value=1;
		    	listform.submit();
		    }
		    if(dir=="next"){
		    	var temp = parseInt(p_page.value)+1;
		    	if(temp>parseInt(totalpage.innerHTML)){
		    		temp = parseInt(totalpage.innerHTML);
		    		
		    	}
		    	p_page.value = temp;
		    	listform.submit();
		    }
		    
		    if(dir=="pre"){
		       
		    	var temp = parseInt(p_page.value)-1;
		    	
		    	if(temp<1){
		    	   
		    		temp=1;
		    	}
		    	p_page.value = temp;
		    	listform.submit();
		    }
		    
		    if(dir=="last"){
		    	p_page.value = parseInt(totalpage.innerHTML);
		    	listform.submit();
		    }
		   
		   if(dir=="jump"){
		     if(e.keyCode==13){
		      var jumpv=parseInt(jumppage.value);
			     if(isNaN(jumpv)==true){
			        alert("输入错误，请输入数字！！");
			        return;
			     }else{
				     if(jumpv>parseInt(totalpage.innerHTML)){
				       alert("输入页数不存在，请重新输入！！");
				       return;
				     }
				     if(jumpv==0){
				     jumpv=1;
				     }
			      }
			       p_page.value = jumpv;
		      listform.submit();
		      }
		   }
   
}
</script>
</head>

<body>

<h1 align="center">公告内容</h1><br/><br/><br/><br/>;
<div align="center">
<c:forEach items="${res}" var="man" >
·<a href="view?man.id=${man.id}">${man.title}</a><br/><br/>
</c:forEach>
</div>
<form name="listform" id="listform" action="noticelist" method="post">
<input type="hidden" name="ps.p_page" id="currentpage" value="${ps.p_page}">
</form><br/><br/>
<div align="center">
总页数：<span id="totalpage">${ps.totalPage}</span>
总条数：<span id="totalcnt">${ps.totalCnt}</span>
当前页：<span id="p_page">${ps.p_page}</span><br>
<a href="javascript:void(0)" onclick="split('first',event)">首页</a>
<a href="javascript:void(0)" onclick="split('pre',event)">上一页</a>
<a href="javascript:void(0)" onclick="split('next',event)">下一页</a>
<a href="javascript:void(0)" onclick="split('last',event)">尾页</a>
转至到:<input type="text" id="jumpid" onkeyup="split('jump',event)" size="3">页
</div>
        </div>
    </div>
  </div>

</body>
</html>

