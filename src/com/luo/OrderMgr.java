package com.luo;

import java.util.List;

import com.luo.dao.OrderMySQLDAO;

public class OrderMgr {
	private static OrderMgr om = null;
	
	static{
		if(om==null){
			om = new OrderMgr();
			om.setOrderDAO(new OrderMySQLDAO());
		}
	}
	
	private OrderMgr(){}
	
	private OrderMySQLDAO orderDAO = null;
	
	public OrderMySQLDAO getOrderDAO() {
		return orderDAO;
	}
	
	public void setOrderDAO(OrderMySQLDAO orderDAO) {
		this.orderDAO = orderDAO;
	}
	
	public static OrderMgr getInstance(){
		return om;
	}
	
	public void save(SalesOrder so){
		orderDAO.save(so);
	}
	
	public int getOrders(List<SalesOrder> list,int pageNo,int pageSize){
		return orderDAO.getOrders(list,pageNo,pageSize);
	}
	
	public SalesOrder loadById(int id){
		return orderDAO.loadById(id);
	}

	public List<SalesItem> getSalesItems(SalesOrder salesOrder) {
		// TODO Auto-generated method stub
		return orderDAO.getSalesItems(salesOrder);
	}
}
