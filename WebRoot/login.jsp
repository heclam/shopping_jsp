<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>

<%@page import="com.luo.*"%>
<%
	String login = request.getParameter("action");
	if(login != null && login.equals("login")){
		String username = request.getParameter("userName");
		String password = request.getParameter("userPassword");
		User u = null;
		try{
		 u = UserManager.userExits(username, password);
		}catch(UserNotFoundException e){
			out.println("用户不存在！！");
			return;
		}catch(PasswordNotCorrectException e){
			out.println("密码不正确！！");
			return;
		}
		session.setAttribute("user",u);
		//重定向到首页
		response.sendRedirect("index.jsp");
		return;
	}
 %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>登录页面</title>
    
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
	  		<table border="1" align="center" width="60%">
		   		<tr>
		   			<td colspan="2" align="center">用户登录</td>
		   		</tr>
		   		<tr>
		   			<td>用户名：</td>
		   			<td><input type="text" name = "userName" /></td>
		   		</tr>
		   		<tr>
		   			<td>密码：</td>
		   			<td><input type="password" name = "userPassword" /></td>
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
