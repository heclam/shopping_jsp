<%@page import="java.sql.Timestamp"%>
<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="com.luo.*"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
	User u = (User) session.getAttribute("user");
	if(u == null){
		u = new User();
		u.setId(-1);
	}
 %>
 <jsp:useBean id="cart" type="com.luo.Cart" scope="session"></jsp:useBean>
 <%
 	if(cart == null){
 		out.println("没有任何的购物项");
 		return;
 	}	
  %>
  <%
  	String addr = request.getParameter("addr");
  	SalesOrder so = new SalesOrder();
  	so.setCart(cart);
  	so.setUser(u);
  	so.setAddr(addr);
  	so.setOdate(new Timestamp(System.currentTimeMillis()));
  	so.setStatus(0);
  	so.save();
  	session.removeAttribute("cart");
   %>
<!--弹出注册成功的提示-->
<script type="text/javascript" language="javascript">
	alert("谢谢您在本站购物，欢迎继续...");
	alert("支付功能还没有完善哟~~~");
	window.location='index.jsp' ;
</script>