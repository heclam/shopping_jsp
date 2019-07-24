<%@ page import="com.luo.*" %>
<%
//检查用户有没有登录
	User u = (User)session.getAttribute("user");
	if(u == null){
		out.println("请先登录");
		response.sendRedirect("login.jsp");
		return;
	}
 %>