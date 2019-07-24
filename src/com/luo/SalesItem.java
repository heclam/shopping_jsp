package com.luo;

public class SalesItem {
		private int id;
		private Product product;
		private double unitPrice;
		private int count;
		SalesOrder order;
		public int getId() {
			return id;
		}
		public void setId(int id) {
			this.id = id;
		}
		public Product getProduct() {
			return product;
		}
		public void setProduct(Product product) {
			this.product = product;
		}
		public double getUnitPrice() {
			return unitPrice;
		}
		public void setUnitPrice(double unitPrice) {
			this.unitPrice = unitPrice;
		}
		public int getCount() {
			return count;
		}
		public void setCount(int count) {
			this.count = count;
		}
		public SalesOrder getOrder() {
			return order;
		}
		public void setOrder(SalesOrder order) {
			this.order = order;
		}
		
}
