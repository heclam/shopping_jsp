<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@page import="com.luo.*"%>
<%@page import="java.sql.*"%>
<%@ include file="_sessionCheck.jsp" %>
<% request.setCharacterEncoding("GBK"); %>
<%

	String action = request.getParameter("action");
	if(action != null && action.equals("add")){
		//�ж������ӽ����Ļ��������ύ������
		String name = request.getParameter("name");
		String descr = request.getParameter("descr");
		double normalprice = Double.parseDouble(request.getParameter("normalprice"));
		double memberprice = Double.parseDouble(request.getParameter("memberprice"));
		int categoryid = Integer.parseInt(request.getParameter("categoryid"));
		
		Product p = new Product();
		p.setId(-1);
		p.setName(name);
		p.setDescr(descr);
		p.setNormalprice(normalprice);
		p.setMemberprice(memberprice);
		p.setPdate(new Timestamp(System.currentTimeMillis()));
		p.setCategoryid(categoryid);
		
		//�����Ʒ
		ProductMgr.getInstance().addProduct(p);
		
		out.println("��ϲ�㣬��ӳɹ�");
		return;
	}
 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>My JSP 'categoryAdd.jsp' starting page</title>
    
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
  			<center>�����Ʒ</center>
   		<form action="productAdd.jsp" method="post">
   				<input type="hidden" name="action" value="add" />
   				
   				<table border="1" width="60%" align="center">
   					<tr>
   						<td>name:</td>
   						<td><input type="text" name="name" /></td>
   					</tr>
   					<tr>
   						<td>descr</td>
   						<td><input type="text" name="descr" /></td>
   					</tr>
   					<tr>
   						<td>normalprice:</td>
   						<td><input type="text" name="normalprice" /></td>
   					</tr>
   					<tr>
   						<td>memberprice:</td>
   						<td><input type="text" name="memberprice" /></td>
   					</tr>
   						<tr>
   						<td>categoryid</td>
   						<td><input type="text" name="categoryid" /></td>
   					</tr>
   					
   					<tr>
   						<td colspan="2">
   							<input type="submit" value="�ύ" />
   							<input type="reset" value="����" />
   						</td>
   					</tr>
   				</table>
   		</form>
  </body>
</html>
