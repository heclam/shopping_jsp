<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ include file="_sessionUserCheck.jsp" %>
<%
	request.setCharacterEncoding("GBK");
	String action = request.getParameter("action");
	if(action != null && action.equals("modify")){
		String username = request.getParameter("username");
		//String password = request.getParameter("password");
		String phone = request.getParameter("phone");
		String addr = request.getParameter("addr");
		if(username != null && !username.trim().equals("")){
			u.userUpdate(username, phone, addr);
		}
		%>
		<!--������и�����ӦΪ����û������session�л��Ǳ���ԭ����user��Ϣ�����Կ���ǰ��user����Ϣ�ǲ����-->
		<!--�����ɹ�����ʾ-->
	<script type="text/javascript" language="javascript">
				alert("�޸ĳɹ�");
		//��ת����½ҳ��

	</script>window.location='userModify.jsp' ;
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
   		<form action="userModify.jsp" method="post">
   			<input type="hidden" name="action" value="modify" />
   			<table border="1" width="80%" align="center">
   				<tr>
   					<td colspan="2" align="center">�û���Ϣ�޸�</td>
   				</tr>
   				<tr>
   					<td>�û�������</td>
   					<td><input type="text" name="username" value="<%=u.getUsername() %>" /></td>
   				</tr>
   				<!-- 
   				<tr>
   					<td>���룺</td>
   					<td><input type="password" name="password" <%=u.getPassword() %> /></td>
   				</tr>
   				 -->
   				<tr>
   					<td>��ϵ�绰��</td>
   					<td><input type="text" name="phone" value="<%=u.getPhone() %>" /> </td>
   				</tr>
   				<tr>
   					<td>��ַ:</td>
   					<td><textarea rows="8" cols="60" name="addr"  ><%=u.getAddr()%></textarea></td>
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
