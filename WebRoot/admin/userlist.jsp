<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@page import="com.luo.*"%>
<%@ include file="_sessionCheck.jsp" %>
<%
	List<User> users = UserManager.getUsers();
 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>My JSP 'userlist.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript" >
		function confirmDel(id) {
			var flag = confirm("是否确认删除用户！！");
			if(flag == false){
				return;
			}else{
				window.location.href="userDelete.jsp?id="+id;
			}
		}
	</script>
  </head>
  
  <body>
    <table border="1" align="center">
    	<tr>
    		<td colspan="7" align="center">用户列表</td>
    	</tr>
    	<tr>
    		<td>id</td>
    		<td>username</td>
    		<td>password</td>
    		<td>phone</td>
    		<td>addr</td>
    		<td>rdate</td>
    		<td>处理</td>
    	</tr>
    	<%
    	for(Iterator<User> iterator = users.iterator();iterator.hasNext();){
    		User u = iterator.next();
    	 %>
    	 <tr>
    	 	<td><%=u.getId() %></td>
    	 	<td><%=u.getUsername() %></td>
    	 	<td><%=u.getPassword() %></td>
    	 	<td><%=u.getPhone() %></td>
    	 	<td><%=u.getAddr() %></td>
    	 	<td><%=u.getrDate() %></td>
			 <td><a  onclick="confirmDel(<%=u.getId()%>)" ><font color="red">删除</font></a></td>
    	 </tr>
    	 <%
    	 }
    	  %>
    </table>
  </body>
</html>
