<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="com.luo.*"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
	User u = (User) session.getAttribute("user");
 %>
<%
	List<Product> products = ProductMgr.getInstance().getRecentProducts(6);
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
  	<table border="1" width="80%" align="center">
  	<%
  		if(u == null){
  	 %>
  		<tr>
  			<td colspan="4"><a href="login.jsp"><button>登录</button></a>&nbsp;&nbsp;
  			<a href="register.jsp" ><button>注册</button></a></td>
  		</tr>
  	   <%
  	 	  }else{
  	 	  %>
		会员<a href="selfservice.jsp" style="text-decoration: none" ><font color="red"><%=u.getUsername()%></font></a>
  	 	  <%
  	 	  }
  			for(Iterator<Product> iterator = products.iterator();iterator.hasNext();){
  				Product p = iterator.next();	
  		 %>
  		<tr>
  			<td width="30%">
  				<a href="productDetailShow.jsp?id=<%=p.getId()%>"><img src="images/beijing.jpg" alt="<%=p.getName() %>" width="30%"/></a>
  			</td>
  			<td><%=p.getName() %></td>
  			<td>会员价：<%=p.getMemberprice() %>元</td>
  		</tr>
  			<% 
  			}
  		 %>
  	</table>
  </body>
</html>
