<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@page import="com.luo.*"%>
<%@ include file="_sessionCheck.jsp" %>
<%
	String strid = request.getParameter("id");
	int id = -1;
	if(strid != null && !strid.trim().equals("")){
		id = Integer.parseInt(strid); //�����쳣
	}
	System.out.println(id+"-----");
	 SalesOrder so = OrderMgr.getInstance().loadById(id);
	 
	 
	
 %>
 <script type="text/javascript">
<!--
	function showDescr(descr){
		document.getElementById("message").innerHTML="<font size=3 color=red >"+descr+"</font>";
	}
//-->
</script>
 
 <center>
 �µ��ˣ�<%= so.getUser().getUsername() %>
 ��ϸ��<br/>
 <table border="1" align="center">
 	<tr>
 	<td>��Ʒ����</td>
 	<td>��Ʒ�۸�</td>
 	<td>��������</td>
 	</tr>
 	<%
 		List<SalesItem> items = so.getItems();
 		for(int i=0;i<items.size();i++){
 				SalesItem si = items.get(i);
 	 %>
 	 <tr>
 	 	<td onmouseover="showDescr('<%=si.getProduct().getDescr()%>')"><%=si.getProduct().getName() %></td>
 	 	<td><%=si.getUnitPrice() %></td>
 	 	<td><%=si.getCount() %></td>
 	 </tr>
 	 <%
 	  }
 	  %>
 </table>
 <div style="border:5px double purple; width:400;" id="message">&nbsp;</div>
 </center>
