
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.luo.*"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
	User u = (User)session.getAttribute("user");
 %>
<%
	Cart cart = (Cart)session.getAttribute("cart");
	if(cart == null){
		cart = new Cart();
		session.setAttribute("cart", cart);
	}
 %>
<%
	String strproductid = request.getParameter("id");
	int id = -1;
	if(strproductid == null || strproductid.trim().equals("")){
		out.println("此商品不存在！！！");
		return;
	}else{
		id = Integer.parseInt(strproductid);
	}
	Product p = ProductMgr.getInstance().loadById(id);
	CartItem ci = new CartItem();
	ci.setProductid(id);
	ci.setPrice(u==null ?p.getNormalprice():p.getMemberprice());
	ci.setCount(1);
	cart.add(ci);
	response.sendRedirect("cart.jsp");
 %>
