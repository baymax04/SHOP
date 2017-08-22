<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags"  prefix="s"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
		<title>电子商城</title>
		<link href="inc/style.css" rel="stylesheet" type="text/css" />
		<link href="styles/style.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="JS/jquery-1.4.2.min.js"></script>
		<script type="text/javascript">
	function checkLogin(){//判断是否是汉字、字母、数字组成
				var user = document.getElementById("hidden").value;
				if(user == null || user ==""){
					alert("您尚未登录，请先登录！");
				}				
			}
	function check(obj){
	
    var param="mb.username="+obj.value;
    $.ajax({
    type: "post",
    url: "check",
    cache: false,
    data: param,
    dataType: "text",
    success: function(msg1){
    	$("#msg1").html(msg1);}      
    });
}		 	
</script>
		<style type="text/css">
.errorMessage {
	display: inline;
}

.errorMessage li {
	display: inline;
}

.errorMessage li span {
	float: right;
	text-align: left;
	width: 270px;
}
</style>
	</head>
	<body>
		<div id="container">
			<div id="head">
				<input type="hidden" name="loginInfo"
					value="com.shop.web.common.UserInfo@18192b6" id="hidden" />
				<input type="hidden" name="loginInfo" value="" id="loginInfo" />
				<div class="banner">
				</div>
				<div class="nav">
					<a href="index.jsp">首页</a>
					<br />
				</div>
			</div>
			<div id="content">
				<div class="userinfoz">
					<div>
						<font class="red">${msg_info } </font>
					</div>

					<form id="memberModify_action" name="memberRegisterForm"
						onsubmit="return true;" action="${basePath}user_zhuce.action"
						method="post">
						<input type="hidden" name="mb.id" value="${mb.id }"
							id="memberModify_action_member_id" />
						<ul>
							<li>
								<span>用&nbsp;户&nbsp;名：</span>
								<input type="text" name="mb.username" value="${mb.username}"
									onblur="check(this)" id="memberModify_action_member_username" />
								<font id="msg1" class="red"> *<s:fielderror fieldName="a" />
								</font>
							</li>
							<li>
								<span>真实姓名：</span>
								<input type="text" name="mb.truename" value="${mb.truename}"
									id="memberModify_action_member_realname" />
								<font class="red"> *<s:fielderror fieldName="b" />
								</font>
							</li>
							<li style="width: 100%">
								<span>密&nbsp;&nbsp;&nbsp;&nbsp;码：</span>
								<input type="password" name="mb.password" value="${mb.password}"
									id="memberModify_action_member_password" />
								<font class="red"> *<s:fielderror fieldName="c" />
								</font>
							</li>
							<li style="width: 100%">
								<span>确认密码：</span>
								<input type="password" name="mb.newpassword"
									id="memberModify_action_member_password" />
								<font class="red"> *<s:fielderror fieldName="d" />
								</font>
							</li>
							<li>
								<span>所在城市：</span>
								<input type="text" name="mb.city" value="${mb.city }"
									id="memberModify_action_member_city" />
							</li>
							<li>
								<span>联系地址：</span>
								<input type="text" name="mb.address" value="${mb.address}"
									id="memberModify_action_member_address" />
							</li>
							<li>
								<span>邮政编码：</span>
								<input type="text" name="mb.postcode" value="${mb.postcode}"
									id="memberModify_action_member_postcode" />
							</li>
							<li>
								<span>证件号码：</span>
								<input type="text" name="mb.cardno" value="${mb.cardno}"
									id="memberModify_action_member_cardno" />
								<font class="red"> *<s:fielderror fieldName="e" />
								</font>
							</li>
							<li>
								<span>证件类别：</span>
								<input type="radio" name="mb.cardtype"
									id="memberModify_action_member_cardtype身份证" value="身份证" checked />
								<label for="memberModify_action_member_cardtype身份证">
									身份证
								</label>
								<input type="radio" name="mb.cardtype"
									id="memberModify_action_member_cardtype军官证" value="军官证" />
								<label for="memberModify_action_member_cardtype军官证">
									军官证
								</label>
								<input type="radio" name="mb.cardtype"
									id="memberModify_action_member_cardtype学生证" value="学生证" />
								<label for="memberModify_action_member_cardtype学生证">
									学生证
								</label>
							</li>
							<li>
								<span>联系电话：</span>
								<input type="text" name="mb.tel" value="${mb.tel}"
									id="memberModify_action_member_tel" />
							</li>
							<li>
								<span>Email:</span>
								<input type="text" name="mb.email" value="${mb.email}"
									id="memberModify_action_member_email" />
								<font class="red">*<s:fielderror fieldName="g" />
								</font>
							</li>
							<li class="button_img">
								<img src="images/12.gif"
									onclick="document.memberRegisterForm.submit();"
									style="CURSOR: hand" />
								<img src="images/13.gif"
									onclick="document.memberRegisterForm.reset();"
									style="CURSOR: hand" />
							</li>
						</ul>
					</form>
				</div>
			</div>
		</div>
	</body>
</html>
