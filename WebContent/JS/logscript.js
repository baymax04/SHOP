	var load;
	var title;
	
	function login() {
		var name = $("#userName").val();
		var pass = $("#userPassword").val();
		var param = "member.username="+name+"&member.password="+pass;
		$("#msg").html(load);
		$.ajax({
			type: "post",
		    url: "logAct",
		    cache: false,
		    data: param,
		    dataType: "json",
		    success: function(data) {
				if (data.member.freeze != null && data.member.freeze != "1") {
					$(".banner").html('<a href="logOut" title=' + title 
					+ '><marquee><p style="font-size:14px;color:orange;text-align:center;">'
					+ data.msg_info + '</p></marquee></a>');
				} else {
					$("#msg").html(data.msg_info);
				}
			}
		});
	}
	
	$(document).ready(
	function() {
		var language = navigator.language ? navigator.language : navigator.browserLanguage;
		if (language.indexOf("zh") > -1) {
			load = "登录中。";
			title = "退出登录。";} 
		else {
			load = "Please wait.";
			title = "Log&nbsp;out.";};
		$.ajax({
			type: "post",
		    url: "logCheck",
		    cache: false,
		    dataType: "json",
		    success: function(data) {
				if (data.member.username != null) {
					$(".banner").html('<a href="logOut" title=' + title 
					+ '><marquee><p style="font-size:14px;color:orange;text-align:center;">'
					+ data.msg_info + '</p></marquee></a>');
				} else {
					if ($("#msg").html() == "") {
						$("#msg").html(data.msg_info);
					}
				}
			}
		});
		$(document).keydown(
			function(event) {
			if (event.keyCode == 13) {
				login();
			}
		});
	})
	