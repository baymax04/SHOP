package memberOrder;

import java.util.ArrayList;
import java.util.List;

import util.Connect;
import util.PageSplit;

/**
 * 会员订单数据库查询
 * @author j1026_sujl
 *
 */
public class OrderService {
	Connect conn = Connect.getInstance();
	
	/**
	 * 以创建时间倒序查询会员订单内容
	 * @param memberid 会员ID
	 * @return list 分页显示会员订单
	 */
	public List<Object> memorder(String memberid, PageSplit split) {
		StringBuffer buffer = new StringBuffer();
		buffer.append("select * from (select t1.*, ROWNUM CNT from ")
			.append("(select t2.* from TB_ORDER_1026G6 t2 where MEMBERID = ? ")
			.append("order by ORDERDATE desc) t1) where CNT > ? and CNT <= ? ");
		String sql = buffer.toString();
		List<Object> param = new ArrayList<Object>();
		param.add(memberid);
		param.add(split.getStart());
		param.add(split.getEnd());
		List<Object> list = conn.queryForArrObject(sql, param, OrderManageBean.class);
		return list;
	}
	
	/**
	 * 查询会员订单数
	 * @param memberid 会员ID
	 * @return count 会员订单数
	 */
	public int ordercount(String memberid) {
		String sql = "select count(1) from TB_ORDER_1026G6 where MEMBERID = ?";
		List<Object> param = new ArrayList<Object>();
		param.add(memberid);
		int count = conn.count(sql, param);
		return count;
	}
	
	/**
	 * 根据订单ID查找订单详细信息
	 * @param orderid 订单ID
	 * @return list 订单详细信息
	 */
	public List<Object> orderdetails(String orderid) {
		String sql = "select * from TB_ORDER_1026G6 where ID = ?";
		List<Object> param = new ArrayList<Object>();
		param.add(orderid);
		List<Object> list = 
			conn.queryForArrObject(sql, param, OrderManageDetailsBean.class);
		return list;
	}
	
	/**
	 * 根据订单ID查找订单商品详细信息
	 * @param orderid 订单ID
	 * @return list 订单商品详细信息
	 */
	public List<Object> goodsdetails(String orderid) {
		StringBuffer buffer = new StringBuffer();
		buffer.append("select t1.*, GOODSNAME from TB_ORDER_DETAIL_1026G6 t1 ")
			.append("left join TB_GOODS_1026G6 t2 on t1.GOODSID = t2.ID ")
			.append("where ORDERID = ?");
		String sql = buffer.toString();
		List<Object> param = new ArrayList<Object>();
		param.add(orderid);
		List<Object> list = 
			conn.queryForArrObject(sql, param, OrderManageDetailsBean.class);
		return list;
	}
}
