<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="com.luo.*"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
 <%
	User u = (User)session.getAttribute("user");
	if(u == null){
		out.println("�㻹û�е�¼����������г��۽��㣬�����¼�򰴻�Ա�۽��㣺");
		out.println("���û�л�Ա�ţ����Խ���<a href='register.jsp'>ע��</a>");
		//out.println("<a href='confirm2.jsp'>����</a>");
		out.println("<a href='login.jsp'>��¼</a>");
	}else{
  %>
 <jsp:useBean id="cart" type="com.luo.Cart" scope="session"></jsp:useBean>

  	<center>
	  	<table border="1" border="1" align="center">
	  		<tr><th colspan="4">���ﳵ</th></tr>
	  		<tr>
	  			<td>��Ʒid</td>
	  			<td>��Ʒ����</td>
	  			<td>��Ʒ�۸�(<%=u==null?"�г���":"��Ա��" %>)</td>
	  			<td>��������</td>
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
	  	һ��<%=Math.round(cart.getTotalprice()*100)/100.0 %>Ԫ<br/>
	
	  <form action="order.jsp" method="post">
	  		�ͻ���Ϣ��<br/>
	  		<textarea name="addr"><%=u==null?"":u.getAddr() %></textarea>
	  		<input type="submit" value="�µ�" />
	  </form>
	 </center>
	<% }
	%>
