package Canseelight;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Pattern;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class ShopCar extends ActionSupport {
	Service sv = new Service();
	ActionContext act = ActionContext.getContext();

	String id = (String) act.getSession().get("memberid");

	GoodsCar mb;
	ShopOrder shopOrder;
	
	List<GoodsCar> res;

	public ShopOrder getShopOrder() {
		return shopOrder;
	}

	public void setShopOrder(ShopOrder shopOrder) {
		this.shopOrder = shopOrder;
	}

	public List<GoodsCar> getRes() {
		return res;
	}

	public void setRes(List<GoodsCar> res) {
		this.res = res;
	}

	public GoodsCar getMb() {
		return mb;
	}

	public void setMb(GoodsCar mb) {
		this.mb = mb;
	}

	/**
	 * 登录处理
	 * 
	 * @return
	 */
	public String login() {
		if (mb == null) {
			return "success";
		} else {
			this.res = sv.login(mb);
			if (res.size() != 0) {
				act.getSession().put("memberid", res.get(0).getId());
				act.getSession().put("membername", res.get(0).getUsername());
				return "success";
			} else {
				return "success";
			}
		}
	}

	// TODO
	public String add() {
		int count = sv.count(mb.getGoodsid(), id);
		try {
			if (count == 0) {
				sv.add(mb.getGoodsid(), id);
			} else {
				sv.addupdate(mb.getGoodsid(), id);
			}
		} catch (SQLException e) {
			return "error";
		}
		this.res = sv.list(id);
		return "list";
	}

	/**
	 * 获得当前登录用户的购物车内信息
	 * 
	 * @return
	 */
	public String shopCar() {
		this.res = sv.list(id);
		return "list";
	}

	/**
	 * 对页面上修改数量进行实时提交
	 * 
	 * @return
	 */
	public String update() {
		try {
			int count = sv.update(mb);
			if (count != 0) {
				return this.shopCar();
			} else {
				return this.shopCar();
			}
		} catch (SQLException e) {
			return "error";
		}
	}

	/**
	 * 进入结账页面
	 * 
	 * @return
	 */
	public String orderView() {

		return "orderView";
	}

	public void validateOrder() {
		if (shopOrder.getUsername() == null
				|| "".equals(shopOrder.getUsername())) {
			this.addFieldError("username", "用户名不能为空!");
		}
		if (shopOrder.getAddress() == null || "".equals(shopOrder.getAddress())) {
			this.addFieldError("address", "地址不能为空!");
		}
		if (shopOrder.getPostcode() == null
				|| "".equals(shopOrder.getPostcode())) {
			this.addFieldError("postcode", "邮政编码不能为空!");
		}
		if (shopOrder.getTel() == null || "".equals(shopOrder.getTel())) {
			this.addFieldError("tel", "电话号码不能为空!");
		} else if (!Pattern.compile("^1[358]\\d{9}$").matcher(
				shopOrder.getTel().trim()).matches()) {
			this.addFieldError("tel", "电话格式不正确!");
		}
		if(shopOrder.getPay() == null || "".equals(shopOrder.getPay())){
			this.addFieldError("pay", "支付方式不能为空!");
		}
		if(shopOrder.getCarry() == null || "".equals(shopOrder.getCarry())){
			this.addFieldError("carry", "运送方式不能为空!");
		}
		if(shopOrder.getBz() == null || "".equals(shopOrder.getBz())){
			shopOrder.setBz("无");
		}
	}

	/**
	 * 提交结账页面，并将填写信息添加入订单表中
	 * 
	 * @return
	 */
	public String order() {
		try {
			shopOrder.setMemberid(id);
			// 1.创建订单表
			sv.insert(shopOrder);
			// 2.根据订单Id,获得订单号以及订单其他信息
			this.orderdetail();
			this.deleteall();
			return "createOrder";
		} catch (SQLException e) {
			return "error";
		}
	}

	/**
	 * 生成对应订单号的订单详细表
	 * 
	 * @throws SQLException
	 */
	public void orderdetail() throws SQLException {
		String orderid = sv.getId(id);
		String ordercode = sv.getOrdercode(orderid);
		act.getSession().put("ordercode", ordercode);
		this.res = sv.list(id);
		for (int i = 0; i < res.size(); i++) {
			this.mb = res.get(i);
			List<String> list = new ArrayList<String>();
			list.add(orderid);
			list.add(mb.getGoodsid());
			list.add(mb.getPrice());
			list.add(mb.getAmount());
			sv.orderDetail(list);
		}
	}

	/**
	 * 删除单条购物车信息
	 * 
	 * @return
	 */
	public String delete() {
		try {
			sv.delete(mb);
			return this.shopCar();
		} catch (SQLException e) {
			return "error";
		}
	}

	/**
	 * 删除该Id下所有购物车信息
	 * 
	 * @return
	 */
	public String deleteall() {
		try {
			int count = sv.deleteall(id);
			return this.shopCar();
		} catch (SQLException e) {
			return "error";
		}
	}
}
