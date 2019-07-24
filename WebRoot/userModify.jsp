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
		<!--这里会有个问题应为缓存没有清理，session中还是保留原来的user信息，所以看到前面user的信息是不变的-->
		<!--弹出成功的提示-->
	<script type="text/javascript" language="javascript">
				alert("修改成功");
		//跳转到登陆页面

	</script>window.location='userModify.jsp' ;
<%
		return;//下面的内容就不执行了
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
   					<td colspan="2" align="center">用户信息修改</td>
   				</tr>
   				<tr>
   					<td>用户姓名：</td>
   					<td><input type="text" name="username" value="<%=u.getUsername() %>" /></td>
   				</tr>
   				<!-- 
   				<tr>
   					<td>密码：</td>
   					<td><input type="password" name="password" <%=u.getPassword() %> /></td>
   				</tr>
   				 -->
   				<tr>
   					<td>联系电话：</td>
   					<td><input type="text" name="phone" value="<%=u.getPhone() %>" /> </td>
   				</tr>
   				<tr>
   					<td>地址:</td>
   					<td><textarea rows="8" cols="60" name="addr"  ><%=u.getAddr()%></textarea></td>
   				</tr>
   				<tr>
   					<td colspan="2" align="center">
   						<input type="submit" value="提交" />
   						<input type="reset" value="重置" />
   					</td>
   				</tr>
   			</table>
   		
   		</form>
   </center>
  </body>
</html>
