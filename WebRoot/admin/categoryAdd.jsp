<%@page import="com.luo.Category"%>
<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@ include file="_sessionCheck.jsp" %>
<% request.setCharacterEncoding("GBK");
	response.setCharacterEncoding("GBK");%>
<%
	String strpid = request.getParameter("pid");
	int pid = 0;
	if(strpid != null){
		pid = Integer.parseInt(strpid);
	}
	String action = request.getParameter("action");
	if(action != null && action.equals("add")){
		//�ж������ӽ����Ļ��������ύ������
		String name = request.getParameter("name");
		String descr = request.getParameter("descr");
		if(name != null || !name.trim().equals("")){

			if(pid == 0){
				Category.add(name, descr);
			}else{
				Category.addChildCategory(pid,name,descr);
			}
			%>
			<script type="text/javascript">
				alert("��ϲ�㣬��ӳɹ���");
				window.location.href="categoryList.jsp";
			</script>
		<%
		}
	}
 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>My JSP 'categoryAdd.jsp' starting page</title>
    
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
  			<center>��Ӹ����</center>
   		<form action="categoryAdd.jsp" method="post">
   				<input type="hidden" name="action" value="add" />
   				<input type="hidden" name="pid" value="<%=pid %>" />
   				<table border="1" width="60%" align="center">
   					<tr>
   						<td>������ƣ�</td>
   						<td><input type="text" name="name" /></td>
   					</tr>
   					<tr>
   						<td>���������</td>
   						<td><input type="text" name="descr" /></td>
   					</tr>
   					<tr>
   						<td colspan="2">
   							<input type="submit" value="�ύ" />
   							<input type="reset" value="����" />
   						</td>
   					</tr>
   				</table>
   		</form>
  </body>
</html>
