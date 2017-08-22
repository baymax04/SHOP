package memberOrder;

import java.util.List;

import util.PageSplit;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

/**
 * 会员订单查看
 * @author j1026_sujl
 *
 */
public class OrderAction extends ActionSupport {
	OrderManageDetailsBean order;
	List<Object> list;
	PageSplit split;
	String orderid;

	public OrderManageDetailsBean getOrder() {
		return order;
	}
	public void setOrder(OrderManageDetailsBean order) {
		this.order = order;
	}
	
	public String getOrderid() {
		return orderid;
	}
	public void setOrderid(String orderid) {
		this.orderid = orderid;
	}
	
	public PageSplit getSplit() {
		return split;
	}
	public void setSplit(PageSplit split) {
		this.split = split;
	}
	
	public List<Object> getList() {
		return list;
	}
	public void setList(List<Object> list) {
		this.list = list;
	}
	
	/**
	 * 获取用户订单列表
	 */
	@Override
	public String execute() {
		
		// 取得请求相关的ActionContext实例
		ActionContext ctx = ActionContext.getContext();
		String membername = (String) ctx.getSession().get("membername");
		String memberid = (String) ctx.getSession().get("memberid");
		
		// 根据登录用户ID查询相关订单
		if (split == null) {
			split = new PageSplit();
		}
		split.setP_size("5");
		split.setTotalCnt(new OrderService().ordercount(memberid));
		split.build();
		list = new OrderService().memorder(memberid, split);
		return SUCCESS;
	}
	
	/**
	 * 根据订单ID获取详细订单
	 */
	public String details() {
		order = (OrderManageDetailsBean) new OrderService().orderdetails(orderid).get(0);
		list = new OrderService().goodsdetails(orderid);
		return SUCCESS;
	}
}
