<%
	String login = (String)session.getAttribute("login");
	if(login == null || !login.equals("true")){
		response.sendRedirect("login.jsp");
		return;
	}
 %>
