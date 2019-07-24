<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@page import="com.luo.*"%>
<%@ include file="_sessionCheck.jsp" %>
<%!private static final int PAGE_SIZE = 3; %>
<%
	String getPageNo = request.getParameter("pageNo");
	int pageNo = 1;
	if(getPageNo != null){
		try{
			pageNo = Integer.parseInt(getPageNo);
		}catch(NumberFormatException e){
			e.printStackTrace();
		}
	}
	if(pageNo <1 ) pageNo = 1;
 %>
<%
	List<SalesOrder> orders= new ArrayList<SalesOrder>();
	int pageCount = OrderMgr.getInstance().getOrders(orders,pageNo,PAGE_SIZE);
 	if(pageNo>pageCount) pageNo = pageCount;
 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>My JSP 'categoryList.jsp' starting page</title>
    
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
   		<table border="1" align="center">
   			<tr>
   				<td>id</td>
   				<td>username</td>
   				<td>addr</td>
   				<td>odate</td>
   				<td>status</td>
   				<td>操作</td>
   			</tr>
   			<%
   				for(Iterator<SalesOrder> iterator = orders.iterator();iterator.hasNext();){
   					SalesOrder so= iterator.next();
   					
   					
   			 %>
   			 <tr>
   			 	<td><%=so.getId() %></td>
   			 	<td><%=so.getUser().getUsername()%></td>
   			 	<td><%=so.getAddr() %></td>
   			 	<td><%=so.getOdate() %></td>
   			 	<td><%=so.getStatus() %></td>
   			 	<td><a href="orderDetail.jsp?id=<%=so.getId() %>">订单明细</a></td>
   			 </tr>
   			 <%
   					
   			 	}
   			  %>
   		</table>
   		<center>第<%=pageNo %>页&nbsp;&nbsp;
   		<a href="orderList.jsp?pageNo=<%=1%>">首页</a>&nbsp;&nbsp;
   		<a href="orderList.jsp?pageNo=<%=pageNo-1%>">上一页</a>&nbsp;&nbsp;
   		<a href="orderList.jsp?pageNo=<%=pageNo+1%>">下一页</a>&nbsp;&nbsp;
   		<a href="orderList.jsp?pageNo=<%=pageCount%>">末页</a>
   		</center>
  </body>
</html>
