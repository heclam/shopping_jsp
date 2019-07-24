<%@page import="com.luo.ProductMgr"%>
<%@page import="com.luo.Product"%>
<%@page import="com.luo.Category"%>
<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
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
	List<Product> products= new ArrayList<Product>();
	int pageCount = ProductMgr.getInstance().getProducts(products,pageNo,PAGE_SIZE);
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
   				<td>name</td>
   				<td>descr</td>
   				<td>normalprice</td>
   				<td>memberprice</td>
   				<td>pdate</td>
   				<td>categoryid</td>
   				<td colspan="2">����</td>
   			</tr>
   			<%
   				for(Iterator<Product> iterator = products.iterator();iterator.hasNext();){
   					Product p= iterator.next();
   					
   					
   			 %>
   			 <tr>
   			 	<td><%=p.getId() %></td>
   			 	<td><%=p.getName() %></td>
   			 	<td><%=p.getDescr() %></td>
   			 	<td><%=p.getNormalprice() %></td>
   			 	<td><%=p.getMemberprice() %></td>
   			 	<td><%=p.getPdate() %></td>
   			 	<td><%=p.getCategoryid() %></td>
   			 	<td><a href="productModify.jsp?">�޸�</a></td>
   			 	<td><a href="productDelete.jsp">ɾ��</a></td>
   			 	<td><a href="imageUpload.jsp">�ϴ�ͼƬ</a></td>
   			 </tr>
   			 <%
   					
   			 	}
   			  %>
   		</table>
   		<center>��<%=pageNo %>ҳ&nbsp;&nbsp;
   		<a href="productList.jsp?pageNo=<%=1%>">��ҳ</a>&nbsp;&nbsp;
   		<a href="productList.jsp?pageNo=<%=pageNo-1%>">��һҳ</a>&nbsp;&nbsp;
   		<a href="productList.jsp?pageNo=<%=pageNo+1%>">��һҳ</a>&nbsp;&nbsp;
   		<a href="productList.jsp?pageNo=<%=pageCount%>">ĩҳ</a>
   		</center>
  </body>
</html>
