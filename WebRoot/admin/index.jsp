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
   			<td>�û�����</td><td><a href="userlist.jsp">�û��б�</a></td>
   		</tr>
   		<tr>
   			<td>������</td>
   			<td><a href="categoryAdd.jsp">������</a><br/>
   				<a href="categoryList.jsp">����б�</a>
   			</td>
   		</tr>
   		<tr>
   			<td>��Ʒ����</td>
   			<td><a href="productList.jsp">��Ʒ�б�</a><br/>
   				<a href="productAdd.jsp">��Ʒ���</a><br/>
   				<a href="productSearch.jsp">��Ʒ����</a>
   			</td>
   		</tr>
   		<tr>
   			<td>��������</td>
   			<td><a href="orderList.jsp">�������</a><br/>

   			</td>
   		</tr>
   	</table>
  </body>
</html>
