<%@page import="java.sql.Timestamp"%>
<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@ page import="com.luo.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
	request.setCharacterEncoding("GBK");
	String action = request.getParameter("action");
	if(action != null && action.equals("register")){
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String phone = request.getParameter("phone");
		String addr = request.getParameter("addr");
			User u = new User();
			u.setUsername(username);
			u.setPassword(password);
			u.setPhone(phone);
			u.setAddr(addr);
			u.setrDate(new Timestamp(System.currentTimeMillis()));
			u.save();
			%>
	<!--����ע��ɹ�����ʾ-->
	<script type="text/javascript" language="javascript">
		alert("ע��ɹ�");
		//��ת����½ҳ��
		window.location='login.jsp' ;
	</script>
<%
			return;//��������ݾͲ�ִ����
	}
 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'register.jsp' starting page</title>
    
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
   <center>
   		<form action="register.jsp" method="post">
   			<input type="hidden" name="action" value="register" />
   			<table border="1" width="80%" align="center">
   				<tr>
   					<td colspan="2" align="center">�û�ע��</td>
   				</tr>
   				<tr>
   					<td>�û�������</td>
   					<td><input type="text" name="username" /></td>
   				</tr>
   				<tr>
   					<td>���룺</td>
   					<td><input type="password" name="password" /></td>
   				</tr>
   				<tr>
   					<td>ȷ�����룺</td>
   					<td><input type="password" name="confirmpd" /></td>
   				</tr>
   				<tr>
   					<td>��ϵ�绰��</td>
   					<td><input type="text" name="phone" /> </td>
   				</tr>
   				<tr>
   					<td>��ַ:</td>
   					<td><textarea rows="8" cols="60" name="addr"></textarea></td>
   				</tr>
   				<tr>
   					<td colspan="2" align="center">
   						<input type="submit" value="�ύ" />
   						<input type="reset" value="����" />
   					</td>
   				</tr>
   			</table>
   		
   		</form>
   </center>
  </body>
</html>
