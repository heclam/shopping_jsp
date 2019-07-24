<%@page import="com.luo.UserManager"%>
<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@ include file="_sessionCheck.jsp" %>
<%
	String getID = request.getParameter("id");
	int id = 0;
	if(getID != null || !getID.trim().equals("")){
		try{
		id = Integer.parseInt(getID);
		}catch(NumberFormatException e){
				e.printStackTrace();
		}
	}
	UserManager.delete(id);
 %>
<script type="text/javascript">
	alert("用户删除成功");
	window.location='userlist.jsp' ;
</script>
