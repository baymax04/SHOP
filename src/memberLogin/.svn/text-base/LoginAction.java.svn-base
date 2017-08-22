package memberLogin;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

import huiyuan.MemberManageBean;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

/**
 * 登录判断相关
 * @author j1026_sujl
 *
 */
public class LoginAction extends ActionSupport {
	MemberManageBean member;
	String msg_info;
	
	public MemberManageBean getMember() {
		return member;
	}
	public void setMember(MemberManageBean member) {
		this.member = member;
	}
	
	public String getMsg_info() {
		return msg_info;
	}
	public void setMsg_info(String msg_info) {
		this.msg_info = msg_info;
	}

	/**
	 * 登录时判断是否成功登录
	 */
	@Override
	public String execute() {
		List<Object> list = new LoginService()
			.login(member.username, member.password);
		if (list != null && list.size() >= 1) {
			member = (MemberManageBean) list.get(0);
			
			// 判断"1"为被冻结
			if ("1".equals(member.getFreeze())) {
				msg_info = this.getText("FREEZEM", new String[]{member.username});
				return SUCCESS;
			}
			
			// 往session里放入登录信息
			ActionContext ctx = ActionContext.getContext();
			BigDecimal bd = new BigDecimal(member.id);
			member.id = bd.setScale(0).toString();
			ctx.getSession().put("membername", member.username);
			ctx.getSession().put("memberid", member.id);
			msg_info = this.getText("LOGSUSSM", new String[]{member.username});
		} else {
			msg_info = this.getText("LOGFALSEM");
		}
		if (member == null) {
			member = new MemberManageBean();
		}
		return SUCCESS;
	}

	/**
	 * 每次进入页面时审查用户登录信息
	 */
	public String logcheck() {

		// 取得请求相关的ActionContext实例
		ActionContext ctx = ActionContext.getContext();
		Map session = ctx.getSession();
		String membername = (String) session.get("membername");
		String memberid = (String) session.get("memberid");
		
		// 如果已经登录则提示欢迎信息
		if (membername != null) {
			List<Object> list = new LoginService().frozencheck(memberid);
			if (list != null && list.size() >= 1) {
				member = (MemberManageBean) list.get(0);
				
				// 用户存在且未被冻结
				if (!"1".equals(member.getFreeze())) {
					member.username = membername;
					member.id = memberid;
					msg_info = this.getText("LOGSUSSM", new String[]{membername});
				}
				
				// 用户被冻结
				else {
					session.remove("membername");
					session.remove("memberid");
					msg_info = this.getText("FREEZEM", new String[]{membername});
				}
			}
			
			// 用户不存在
			else {
				session.remove("membername");
				session.remove("memberid");
				msg_info = this.getText("USERNOTFM", new String[]{membername});
			}
		}
		if (member == null) {
			member = new MemberManageBean();
		}
		return SUCCESS;
	}
	
	/**
	 * 退出登录方法
	 */
	public String logout() {
		
		// 在session里移除登录信息
		ActionContext ctx = ActionContext.getContext();
		ctx.getSession().remove("membername");
		ctx.getSession().remove("memberid");
		msg_info = this.getText("LOUTSUSSM");
		return SUCCESS;
	}
}
