package memberOrder;

import java.math.BigDecimal;

public class OrderManageDetailsBean {
	String id;
	String username;
	String ordercode;
	String truename;
	String address;
	String postcode;
	String tel;
	String bz;
	String goodsname;
	String price;
	String numbers;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getOrdercode() {
		return ordercode;
	}
	public void setOrdercode(String ordercode) {
		this.ordercode = ordercode;
	}
	public String getTruename() {
		return truename;
	}
	public void setTruename(String truename) {
		this.truename = truename;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPostcode() {
		BigDecimal bd = new BigDecimal(postcode);
		postcode = bd.setScale(0).toString();
		return postcode;
	}
	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getBz() {
		return bz;
	}
	public void setBz(String bz) {
		this.bz = bz;
	}
	public String getGoodsname() {
		return goodsname;
	}
	public void setGoodsname(String goodsname) {
		this.goodsname = goodsname;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getNumbers() {
		BigDecimal bd = new BigDecimal(numbers);
		numbers = bd.setScale(0).toString();
		return numbers;
	}
	public void setNumbers(String numbers) {
		this.numbers = numbers;
	}
}
