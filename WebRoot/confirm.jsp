<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="com.luo.*"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
 <%
	User u = (User)session.getAttribute("user");
	if(u == null){
		out.println("你还没有登录如果继续则按市场价结算，如果登录则按会员价结算：");
		out.println("如果没有会员号，可以进行<a href='register.jsp'>注册</a>");
		//out.println("<a href='confirm2.jsp'>继续</a>");
		out.println("<a href='login.jsp'>登录</a>");
	}else{
  %>
 <jsp:useBean id="cart" type="com.luo.Cart" scope="session"></jsp:useBean>

  	<center>
	  	<table border="1" border="1" align="center">
	  		<tr><th colspan="4">购物车</th></tr>
	  		<tr>
	  			<td>商品id</td>
	  			<td>商品名称</td>
	  			<td>商品价格(<%=u==null?"市场价":"会员价" %>)</td>
	  			<td>购买数量</td>
	  		</tr>
	  	   <%
	  			List<CartItem> items = cart.getItems();
	  			for(int i = 0;i<items.size();i++){
	  			CartItem ci = items.get(i);
	  			Product p = ProductMgr.getInstance().loadById(ci.getProductid());
	  		 %>
	  		<tr>
	  			<td ><%=ci.getProductid() %></td>
	  			<td><%=p.getName() %></td>
	  			<td><%=u==null?p.getNormalprice():p.getMemberprice()%></td>
	  			<td><input type="text" name="<%="p"+ci.getProductid() %>" value="<%=ci.getCount() %>" /></td>
	  		</tr>
	  			<% 
	  			}
	  		 %>
	  	</table>
	  	<%System.out.println(cart.getTotalprice()); %>
	  	一共<%=Math.round(cart.getTotalprice()*100)/100.0 %>元<br/>
	
	  <form action="order.jsp" method="post">
	  		送货信息：<br/>
	  		<textarea name="addr"><%=u==null?"":u.getAddr() %></textarea>
	  		<input type="submit" value="下单" />
	  </form>
	 </center>
	<% }
	%>
