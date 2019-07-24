package com.luo;

import java.util.ArrayList;
import java.util.List;


public class Cart {//¹ºÎïÀº
	private List<CartItem> items = new ArrayList<CartItem>();

	public List<CartItem> getItems() {
		return items;
	}

	public void setItems(List<CartItem> items) {
		this.items = items;
	}
	
	public void add(CartItem item){
		for(int i = 0;i<items.size();i++){
			CartItem ci = items.get(i);
			if(ci.getProductid()==item.getProductid()){
				ci.setCount(ci.getCount()+1);
				return;
			}
		}
		items.add(item);
	}
	
	public double getTotalprice(){
		double totalprice = 0;
		for(int i = 0;i<items.size();i++){
			CartItem ci = items.get(i);
			totalprice += ci.getTotalPrice();
		}
		return totalprice;
	}
	
}
