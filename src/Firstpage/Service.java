package Firstpage;

import java.util.ArrayList;
import java.util.List;


import util.Connect;


public class Service {
	
	
	public List<Bean> list(int start,int end){
		Connect conn = Connect.getInstance();
		StringBuffer buffer = new StringBuffer();
//		buffer.append("select t.id,t.goodsname,t.price,t.picture,t.credate,t.introduce,t.classname from ");
//		buffer.append("(select t1.*,rownum cnt from tb_goods_1026g6 t1) t where t.cnt>? and t.cnt<=?");
		buffer.append("select t.id,t.goodsname,t.price,t.picture,t.credate,t.introduce,t.classname "
				+ "from  tb_goods_1026g6 t where t.id limit ?,?");
		String sql1 = buffer.toString();
		ArrayList<Object>  param1 = new ArrayList<Object>();
		param1.add(start);
		param1.add(end);
		List<Bean> res = (List)conn.queryForArrObject(sql1, param1,Bean.class);
		return res;
	
	}
	
	
	public List<Bean> goodsinfo(Bean bean){
		Connect conn = Connect.getInstance();
		String sql="SELECT id,goodsname,price,picture,introduce,classname FROM tb_goods_1026g6 where id=?";
		List<Object> param = new ArrayList<Object>();
		param.add(bean.getId());
		List<Bean> res = (List)conn.queryForArrObject(sql, param, Bean.class);
		return res;
	}

	
	
	
	
	public int count(){
		Connect conn = Connect.getInstance();
		String sql = "select count(1) from tb_goods_1026g6";
		List<Object>  param = new ArrayList<Object>();
		int cnt = conn.count(sql, param);
		return cnt;
	}
}
