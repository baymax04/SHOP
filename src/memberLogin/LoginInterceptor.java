package memberLogin;

import java.util.Map;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.interceptor.Interceptor;

public class LoginInterceptor extends ActionSupport implements Interceptor {

	public String intercept(ActionInvocation invocation) throws Exception {
		ActionContext ctx = invocation.getInvocationContext();
		Map session = ctx.getSession();
		String membername = (String) session.get("membername");
		
		if (membername != null) {
			return invocation.invoke();
		}
		ctx.put("msg_info", this.getText("NOTLOGINM"));
		return Action.LOGIN;
	}

	public void destroy() {
	}

	public void init() {
	}
}
