<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@ include file="_sessionCheck.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    
    <title>My JSP 'index.jsp' starting page</title>
    
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
   	<table border="1" align="center" width="50%">
   		<tr>
   			<td>用户管理：</td><td><a href="userlist.jsp">用户列表</a></td>
   		</tr>
   		<tr>
   			<td>类别管理：</td>
   			<td><a href="categoryAdd.jsp">添加类别</a><br/>
   				<a href="categoryList.jsp">类别列表</a>
   			</td>
   		</tr>
   		<tr>
   			<td>产品管理：</td>
   			<td><a href="productList.jsp">产品列表</a><br/>
   				<a href="productAdd.jsp">产品添加</a><br/>
   				<a href="productSearch.jsp">产品搜索</a>
   			</td>
   		</tr>
   		<tr>
   			<td>订单管理：</td>
   			<td><a href="orderList.jsp">订单浏览</a><br/>

   			</td>
   		</tr>
   	</table>
  </body>
</html>
