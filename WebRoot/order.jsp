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
 		out.println("û���κεĹ�����");
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
<!--����ע��ɹ�����ʾ-->
<script type="text/javascript" language="javascript">
	alert("лл���ڱ�վ�����ӭ����...");
	alert("֧�����ܻ�û������Ӵ~~~");
	window.location='index.jsp' ;
</script>