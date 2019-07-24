<%@page import="com.luo.Category"%>
<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@ include file="_sessionCheck.jsp" %>
<%
	String strid = request.getParameter("id");
	String strpid = request.getParameter("pid");
	int id = 0;
	int pid = 0;
	if(strid != null ){
		try{
		id = Integer.parseInt(strid);
		}catch(NumberFormatException e){
			e.printStackTrace();
		}
	}
	
	if(strpid != null ){
		try{
		pid = Integer.parseInt(strpid);
		}catch(NumberFormatException e){
			e.printStackTrace();
		}
	}
	
	Category.deleteCategory(id,pid);
 %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>My JSP 'deleteCategory.jsp' starting page</title>
    
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
    		É¾³ý³É¹¦£¡£¡
  </body>
</html>
