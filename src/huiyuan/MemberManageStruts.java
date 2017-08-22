package huiyuan;

import java.io.PrintWriter;
import java.math.BigDecimal;
import java.sql.SQLException;
import java.util.Map;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class MemberManageStruts extends ActionSupport {
	MemberManageService mms = new MemberManageService();
	MemberManageBean mb;
	String msg;
	

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public MemberManageBean getMb() {
		return mb;
	}

	public void setMb(MemberManageBean mb) {
		this.mb = mb;
	}

	public void validateUpdate(){
		if(mb.newpassword==null||"".equals(mb.newpassword.trim())){
			this.addFieldError("c", "瀵嗙爜涓嶈兘涓虹┖!");		
		}
		if(!mb.newpassword.equals(mb.renewpassword)){
			this.addFieldError("d", "瀵嗙爜涓嶇粺涓�!璇烽噸鏂拌緭鍏�!");
		
		}
		if(mb.password.equals(mb.newpassword)){
			this.addFieldError("c", "鏂板瘑鐮佸拰鏃у瘑鐮侀噸澶�!");
		}	
		this.jiaoyan();
		}
	public void validateZhuce(){
		if(mb.password==null||"".equals(mb.password.trim())){
			this.addFieldError("c", "瀵嗙爜涓嶈兘涓虹┖!");		
		}
		if(!mb.password.equals(mb.newpassword)){
			this.addFieldError("d", "瀵嗙爜涓嶇粺涓�!璇烽噸鏂拌緭鍏�!");
			
		}
		
		this.jiaoyan();
		}
	
	public void  jiaoyan(){
		
		if(mb.username==null||"".equals(mb.username.trim())){
			this.addFieldError("a", "鐢ㄦ埛鍚嶄笉鑳戒负绌�!");
		}
		if(mb.truename==null||"".equals(mb.truename.trim())){
			this.addFieldError("b",  "鐪熷疄濮撳悕涓嶈兘涓虹┖!");
		}
	
		if("韬唤璇�".equals(mb.cardtype)){
			if(!Pattern.compile("^41\\d{16}$").matcher(mb.cardno.trim()).matches()){
				this.addFieldError("e", "韬唤璇佹牸寮忎笉姝ｇ‘!!");
			}
		}
		if("鍐涘畼璇�".equals(mb.cardtype)){
			if(mb.cardno.length()<6){
				this.addFieldError("e", "璇疯緭鍏ヤ笉灏戜簬6浣嶆暟鐨勫啗瀹樿瘉鍙风爜!");
			}
		}
		
		
		if(!Pattern.compile("^[0-9a-z]+@(([0-9a-z]+)[.]){1,2}[a-z]{2,3}$").matcher(mb.email.trim()).matches()){
				this.addFieldError("g", "Email鏍煎紡涓嶆纭�!");
			}
	}
	public String zhuce() throws SQLException{
		int count = mms.zhuce(mb);
				
				if (count != 0) {
					msg = "娉ㄥ唽鎴愬姛";
					return "success";
				} else {
					
					msg = "娉ㄥ唽澶辫触";
					return "no success";
				}
			
	}
	 public String updateview(){
		 ActionContext ctx = ActionContext.getContext();
		 Map session = ctx.getSession();
		 String memberid = (String) session.get("memberid");
		 mb = new MemberManageBean();
		 mb.setId(memberid);
		 
		  mb=mms.updateview(mb).get(0); 

			BigDecimal bd=new BigDecimal(mb.getPostcode());
			mb.setPostcode(bd.setScale(0).toString());
		  return"success";  
	  }
	 
	 public String update(){
		 int count;
		 
		 try {
			count=mms.update(mb);
			
			if(count!=0){
				
				msg="淇敼鎴愬姛";
				return "success";
				
			}else{
				
				msg="淇敼澶辫触";
				return "no success";
			}
		} catch (SQLException e) {
			
			return "no success";
		}
		 
		 
		 
	 }
	 
	 public void check() throws Exception {
		
		HttpServletResponse resp = ServletActionContext.getResponse();
		resp.setCharacterEncoding("utf-8");
		PrintWriter pw = resp.getWriter();
		int count = mms.check(mb);
		if (count != 0) {
			
			pw.println("*鐢ㄦ埛宸插瓨鍦�");
		} else {
			
			pw.println("*鐢ㄦ埛鍙互娉ㄥ唽");
		}

	}
	 
	 
	 
	 
}