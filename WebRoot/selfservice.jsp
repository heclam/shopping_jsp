<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@ page import="com.luo.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ include file="_sessionUserCheck.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>�û��Է���ҳ��</title>
    
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
    <table border="1" width="80%" align="center">
        <tr>
            <td colspan="2" align="center">�����ϸ��Ϣ</td>
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
                <a href="userModify.jsp">�޸ĸ�����Ϣ</a>
            </td>
        </tr>
    </table>
  </body>
</html>
