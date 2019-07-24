package com.luo;

public class CartItem {//购物车里面的每一项
	int productid;//商品id
	int count;//购买的数量
	double price;//价格
	public int getProductid() {
		return productid;
	}
	public void setProductid(int productid) {
		this.productid = productid;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public double getTotalPrice(){
		return price*count;
	}
}
