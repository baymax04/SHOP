<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
		<title>电子商城</title>
		<link href="inc/style.css" rel="stylesheet" type="text/css" />
		<link href="styles/style.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="JS/jquery-1.4.2.min.js"></script>
		<script type="text/javascript" src="JS/logscript.js"></script>
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
			<jsp:include page="headpage.jsp"></jsp:include>

			<div id="content">
				<div class="userinfo">
					<div>
						<font class="red">${msg_info } </font>
					</div>

					<form id="memberModify_action" name="memberRegisterForm"
						onsubmit="return true;" action="${basePath}use_update"
						method="post">
						<input type="hidden" name="mb.id" value="${mb.id }"
							id="memberModify_action_member_id" />

						<ul>

							<li>
								<span>用&nbsp;户&nbsp;名：</span>
								<input type="text" name="mb.username" value="${mb.username}"
									readonly id="memberModify_action_member_username" />
							</li>
							<li>
								<span>真实姓名：</span>
								<input type="text" name="mb.truename" value="${mb.truename}"
									id="memberModify_action_member_realname" />
								<font class="red"> *<s:fielderror fieldName="b" />
								</font>
							</li>
							<li style="width: 100%">
								<span>原&nbsp;密&nbsp;码：</span>
								<input type="password" name="mb.password" value='${mb.password}'
									readonly id="memberModify_action_member_password" />
							</li>

							<li>
								<span>新&nbsp;密&nbsp;码：</span>
								<input type="password" name="mb.newpassword"
									id="memberModify_action_newpassword" />
								<font class="red">*<s:fielderror fieldName="c" />
								</font>
							</li>
							<li>
								<span>确认新密码：</span>
								<input type="password" name="mb.renewpassword"
									id="memberModify_action_renewpassword" />
								<font class="red"> <s:fielderror fieldName="d" />
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
									id="memberModify_action_member_cardtype身份证" value="身份证"
									<s:if test="'身份证'in{mb.cardtype}">checked</s:if> />
								<label for="memberModify_action_member_cardtype身份证">
									身份证
								</label>
								<input type="radio" name="mb.cardtype"
									id="memberModify_action_member_cardtype军官证" value="军官证"
									<s:if test="'军官证'in{mb.cardtype}">checked</s:if> />
								<label for="memberModify_action_member_cardtype军官证">
									军官证
								</label>
								<input type="radio" name="mb.cardtype"
									id="memberModify_action_member_cardtype学生证" value="学生证"
									<s:if test="'学生证'in{mb.cardtype}">checked</s:if> />
								<label for="memberModify_action_member_cardtype学生证">
									学生证
								</label>

							</li>
							<li>
								<span>联系电话：</span>
								<input type="text" name="mb.tel" value="${mb.tel}"
									id="memberModify_action_member_tel" />
								<font class="red"> </font>
							</li>
							<li>
								<span>Email:</span>
								<input type="text" name="mb.email" value="${mb.email}"
									id="memberModify_action_member_email" />
								<font class="red"> *<s:fielderror fieldName="g" />
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
