package Canseelight;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import util.Connect;

public class Service {
	/**
	 * 登录方法
	 * @param 页面上填写的用户名和密码
	 * @return 一个叫res的List集合，里面装有该登录用户的所有信息
	 */
	public List<GoodsCar> login(GoodsCar mb){
		Connect conn = Connect.getInstance();
		StringBuffer sql = new StringBuffer();
		sql.append("SELECT id,username,password FROM tb_member_1026g6");
		sql.append(" WHERE username=? AND password=?");
		List<Object> param = new ArrayList<Object>();
		param.add(mb.getUsername());
		param.add(mb.getPassword());
		List<GoodsCar> res =(List)conn.queryForArrObject(sql.toString(), param, GoodsCar.class);
		return res;
	}
	
	/**
	 * 一览方法
	 * @param 登录用户的Id
	 * @return 该Id下所有的购物车信息
	 */
	public List<GoodsCar> list(String id){
		Connect conn = Connect.getInstance();
		StringBuffer sql = new StringBuffer();
		sql.append("SELECT t1.id as gcid,t1.goodsid as goodsid,t2.goodsname as ");
		sql.append("goodsname,t2.price as price,t1.amount as amount FROM tb_good");
		sql.append("scar_1026g6 t1,tb_goods_1026g6 t2 WHERE t1.goodsid=t2.id AND");
		sql.append(" t1.memberid=?");
		List<Object> param = new ArrayList<Object>();
		param.add(id);
		List<GoodsCar> res =(List)conn.queryForArrObject(sql.toString(), param, GoodsCar.class);
		return res;
	}
	
	/**
	 * 修改方法
	 * @param 修改的数量以及登录用户的Id
	 * @return 影响记录数
	 * @throws SQLException
	 */
	public int update(GoodsCar mb) throws SQLException{
		Connect conn = Connect.getInstance();
		StringBuffer sql = new StringBuffer();
		sql.append("UPDATE tb_goodscar_1026g6 t SET t.amount=? WHERE t.id=?");
		List<Object> param = new ArrayList<Object>();
		param.add(mb.getAmount());
		param.add(mb.getGcid());
		int count = conn.update(sql.toString(), param);
		return count;
	}
	
	/**
	 * 提交订单
	 * @param 页面上所填写的所有信息
	 * @return 影响记录数
	 * @throws SQLException
	 */
	public int insert(ShopOrder so) throws SQLException{
		Connect conn = Connect.getInstance();
		StringBuffer sql = new StringBuffer();
		sql.append("INSERT INTO tb_order_1026g6 values(sjz_1125sqc.nextval,?,");
	    sql.append("(to_char(sysdate,'YYYYMMDDHH24MISS')),");
	    sql.append("?,?,?,?,?,?,?,sysdate,0,?)");
		List<Object> param = new ArrayList<Object>();
		param.add(so.getMemberid());
		param.add(so.getBnumber());
		param.add(so.getUsername());
		param.add(so.getAddress());
		param.add(so.getPostcode());
		param.add(so.getTel());
		param.add(so.getPay());
		param.add(so.getCarry());
		param.add(so.getBz());
		int count = conn.update(sql.toString(), param);
		return count;
	}
	
	/**
	 * 获取订单表Id
	 * @param 当前登录下的用户id
	 * @return
	 */
	public String getId(String id){
		Connect conn = Connect.getInstance();
		StringBuffer sql = new StringBuffer();
		sql.append("SELECT id FROM(SELECT id,rownum AS cnt FROM(SELECT t.* ");
		sql.append("FROM tb_order_1026g6 t WHERE t.memberid=? ORDER BY t.");
		sql.append("orderdate DESC))WHERE cnt=1");
		List<Object> param = new ArrayList<Object>();
		param.add(id);
		String str = conn.queryForArray(sql.toString(), param).get(0)[0];
		return str;
	}
	
	/**
	 * 获取订单号
	 * @param id
	 * @return
	 */
	public String getOrdercode(String id){
		Connect conn = Connect.getInstance();
		StringBuffer sql = new StringBuffer();
		sql.append("SELECT ordercode FROM tb_order_1026g6 WHERE ID=?");
		List<Object> param = new ArrayList<Object>();
		param.add(id);
		String ordercode = conn.queryForArray(sql.toString(), param).get(0)[0];
		return ordercode;
	}
	
	/**
	 * 创建对应的订单详细
	 * @param 所需要插入的数据
	 * @return 影响记录数
	 * @throws SQLException
	 */
	public int orderDetail(List<String> list) throws SQLException{
		Connect conn = Connect.getInstance();
		StringBuffer sql = new StringBuffer();
		sql.append("INSERT INTO tb_order_detail_1026g6 values(sjz_1124seq.nextval,?,?,?*?,?)");
		List<Object> param = new ArrayList<Object>();
		param.add(list.get(0));
		param.add(list.get(1));
		param.add(list.get(2));
		param.add(list.get(3));
		param.add(list.get(3));
		int count = conn.update(sql.toString(), param);
		return count;
	}
	/**
	 * 删除单个购物车信息
	 * @param 购物车的主键Id
	 * @return 影响记录数
	 * @throws SQLException
	 */
	public int delete(GoodsCar mb) throws SQLException{
		Connect conn = Connect.getInstance();
		StringBuffer sql = new StringBuffer();
		sql.append("DELETE tb_goodscar_1026g6 WHERE id=?");
		List<Object> param = new ArrayList<Object>();
		param.add(mb.getGcid());
		int count = conn.update(sql.toString(), param);
		return count;
	}
	
	/**
	 * 删除某个用户所有的购物车信息
	 * @param 用户的Id
	 * @return 影响记录数 
	 * @throws SQLException
	 */
	public int deleteall(String id) throws SQLException{
		Connect conn = Connect.getInstance();
		StringBuffer sql = new StringBuffer();
		sql.append("DELETE tb_goodscar_1026g6 WHERE memberid=?");
		List<Object> param = new ArrayList<Object>();
		param.add(id);
		int count = conn.update(sql.toString(), param);
		return count;
	}
	
	/**
	 * 查看购物车中是否含有同种商品
	 * @param 商品Id
	 * @param 会员Id
	 * @return 影响记录数
	 */
	public int count(String goodsid,String memberid){
		Connect conn = Connect.getInstance();
		StringBuffer sql = new StringBuffer();
		sql.append("SELECT count(1) FROM tb_goodscar_1026g6 ");
		sql.append("WHERE goodsid=? AND memberid=?");
		List<Object> param = new ArrayList<Object>();
		param.add(goodsid);
		param.add(memberid);
		int count = conn.count(sql.toString(), param);
		return count;
	}
	
	/**
	 * 将订购商品添加至购物车
	 * @param 商品Id
	 * @param 会员Id
	 * @return 影响记录数
	 * @throws SQLException
	 */
	public int add(String goodsid,String memberid) throws SQLException{
		Connect conn = Connect.getInstance();
		StringBuffer sql = new StringBuffer();
		sql.append("INSERT INTO tb_goodscar_1026g6 VALUES(sjz_1124seq.nextval,?,?,1)");
		List<Object> param = new ArrayList<Object>();
		param.add(goodsid);
		param.add(memberid);
		int count = conn.update(sql.toString(), param);
		return count;
	}
	
	/**
	 * 若购物车中还有该商品，则将其数量+1
	 * @param 商品Id
	 * @param 会员Id
	 * @return 影响记录数
	 * @throws SQLException
	 */
	public int addupdate(String goodsid,String memberid) throws SQLException{
		Connect conn = Connect.getInstance();
		StringBuffer sql = new StringBuffer();
		sql.append("UPDATE tb_goodscar_1026g6 SET amount=amount+1 WHERE ");
		sql.append("goodsid=? AND memberid=?");
		List<Object> param = new ArrayList<Object>();
		param.add(goodsid);
		param.add(memberid);
		int count = conn.update(sql.toString(), param);
		return count;
	}
}
