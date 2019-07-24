<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="com.luo.*"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
	User u = (User) session.getAttribute("user");
 %>
 <jsp:useBean id="cart" type="com.luo.Cart" scope="session"></jsp:useBean>
 <%
 	if(cart == null){
 		out.println("没有任何的购物项");
 		return;
 	}	
  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>shopping 首页</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
  
  <body>
  <center>
  	<form action="cartUpdate.jsp" method="post">
	  	<table border="1" width="80%" align="center">
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
	  	<input type="submit" value="修改数量" />
	  	<input type="Button" value="确认订单" onclick="document.location.href='confirm.jsp'"/>
 	</form>
 	</center>
  </body>
</html>
