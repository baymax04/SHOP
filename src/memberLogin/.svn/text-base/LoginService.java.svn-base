package memberLogin;

import huiyuan.MemberManageBean;

import java.util.ArrayList;
import java.util.List;

import util.Connect;

/**
 * 登录相关数据库查询
 * @author j1026_sujl
 *
 */
public class LoginService {
	Connect conn = Connect.getInstance();

	/**
	 * 会员登录判断
	 * @param name 会员登录名
	 * @param pass	会员登录密码
	 * @return list 登录会员信息
	 */
	public List<Object> login(String name, String pass) {
		StringBuffer buffer = new StringBuffer();
		buffer.append("select * from TB_MEMBER_1026G6 ")
			.append("where USERNAME = ? and PASSWORD = ?");
		String sql = buffer.toString();
		List<Object> param = new ArrayList<Object>();
		param.add(name);
		param.add(pass);
		List<Object> list = 
			conn.queryForArrObject(sql, param, MemberManageBean.class);
		return list;
	}
	
	/**
	 * 查询某个ID是否被冻结
	 * @param id 待查询ID
	 * @return list 该ID冻结信息
	 */
	public List<Object> frozencheck(String id) {
		String sql = "select FREEZE from TB_MEMBER_1026G6 where ID = ?";
		List<Object> param = new ArrayList<Object>();
		param.add(id);
		List<Object> list = 
			conn.queryForArrObject(sql, param, MemberManageBean.class);
		return list;
	}
}
