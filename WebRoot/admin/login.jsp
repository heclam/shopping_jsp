<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%
	String login = request.getParameter("action");
	if(login != null && login.equals("login")){
		String adminName = request.getParameter("adminName");
		String adminPassword = request.getParameter("adminPassword");
		if(adminName == null || !adminName.equals("admin")){
				out.println("用户名错误");
		}else if(adminPassword == null || !adminPassword.equals("admin")){
					out.println("密码错误");
		}else{
		session.setAttribute("login","true");
		response.sendRedirect("index.jsp");
		}
	}
 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>后台管理员登录</title>
    
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
	  <form action="login.jsp" method="post">
	  		<input type="hidden" name="action" value="login" />
	  		<table border="1" align="center">
		   		<tr>
		   			<td colspan="2">后台管理登录</td>
		   		</tr>
		   		<tr>
		   			<td>用户名</td>
		   			<td><input type="text" name = "adminName" /></td>
		   		</tr>
		   		<tr>
		   			<td>密码</td>
		   			<td><input type="password" name = "adminPassword" /></td>
		   		</tr>
		   		<tr>
		   			<td colspan="2" align="center">
		   			    <input type="submit" value="submit"/>
		   				<input type="reset" value="reset" />
		   			</td>
		   		</tr>
		   </table>
	  </form>
  </body>
</html>
