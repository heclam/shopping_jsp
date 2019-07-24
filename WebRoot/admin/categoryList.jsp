<%@page import="com.luo.Category"%>
<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@ include file="_sessionCheck.jsp" %>

<%
	List<Category> categories = Category.getCategories();
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
   				<td>name</td>
   				<td>pid</td>
   				<td>grade</td>
   			</tr>
   			<%
   				for(Iterator<Category> iterator = categories.iterator();iterator.hasNext();){
   					Category c = iterator.next();
   					String preStr ="";
   					for(int i = 1;i<c.getGrade();i++){
   					preStr+="----";
   					}
   			 %>
   			 <tr>
   			 	<td><%=c.getId() %></td>
   			 	<td><%=preStr+c.getName() %></td>
   			 	<td><%=c.getPid() %></td>
   			 	<td><%=c.getGrade() %></td>
   			 	<td><a href="categoryAdd.jsp?pid=<%=c.getId()%>">添加子类别</a></td>
   			 	<td><a href="#">修改</a></td>
   			 	<td><a href="deleteCategory.jsp?id=<%=c.getId()%>& pid=<%=c.getPid() %>">删除</a></td>
   			 </tr>
   			 <%
   					
   			 	}
   			  %>
   		</table>
  </body>
</html>
