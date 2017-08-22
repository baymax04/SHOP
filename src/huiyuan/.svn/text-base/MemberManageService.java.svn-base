package huiyuan;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;



import util.Connect;

public class MemberManageService {
	Connect conn = Connect.getInstance();
	public int zhuce(MemberManageBean mb)throws SQLException{
		StringBuffer buffer = new StringBuffer();
		buffer.append("insert into tb_member_1026g6(id,username,truename, ")
		.append("password,city,address,postcode,cardno,cardtype,tel,email ) ")
		.append(" values (zhangshuai_id.nextval,?,?,?,?,?,?,?,?,?,?)");
		
		List<Object> param = new ArrayList<Object>();
		param.add(mb.getUsername());
		param.add(mb.getTruename());
		param.add(mb.getPassword());
		param.add(mb.getCity());
		param.add(mb.getAddress());
		param.add(mb.getPostcode());
		param.add(mb.getCardno());
		param.add(mb.getCardtype());
		param.add(mb.getTel());
		param.add(mb.getEmail());	
		 int count=conn.update(buffer.toString(), param);
		
		 return count;

}
	
	
	public List<MemberManageBean> updateview (MemberManageBean mb){
		
		String sql="select * from tb_member_1026g6  where id=?";
		List<Object> param = new ArrayList<Object>();
		param.add(mb.getId());
		
		List<MemberManageBean> res=(List)conn.queryForArrObject(sql, param, 
				MemberManageBean.class);
		
		return res;
	}
	
	public int update(MemberManageBean mb)throws SQLException{
		StringBuffer buffer = new StringBuffer();
		buffer.append("update tb_member_1026g6 set truename=?,password=?,")
		.append("city=?,address=?,postcode=?,cardno=?,cardtype=?,tel=?,")
		.append("email=? where id=?");
		
		List<Object> param = new ArrayList<Object>();
		
		param.add(mb.getTruename());
		String newpassword=mb.getPassword();
		param.add(mb.getNewpassword());
		param.add(mb.getCity());
		param.add(mb.getAddress());
		param.add(mb.getPostcode());
		param.add(mb.getCardno());
		param.add(mb.getCardtype());
		param.add(mb.getTel());
		param.add(mb.getEmail());
		param.add(mb.getId());
		
		int count = conn.update(buffer.toString(), param);
		
		return count;
		
	}
	
	
     public int check(MemberManageBean mb){
		
		String sql="select count(1) from tb_member_1026g6 where username=?";
		 List<Object> param= new ArrayList<Object>();

		 param.add(mb.getUsername());
		 int count = conn.count(sql, param);
		 return count;
		 
	}
	
	
	
	
	
	
	
}