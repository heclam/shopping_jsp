<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@page import="com.luo.*"%>
<%@page import="java.sql.*"%>
<%@ include file="_sessionCheck.jsp" %>
<% request.setCharacterEncoding("GBK"); %>
<%
//��ȡ�����е����
 List<Category> categories = Category.getCategories(); %>
<%

	String action = request.getParameter("action");
	if(action != null && action.equals("complexSearch")){
		//�ж������ӽ����Ļ��������ύ������
		//��ȡ��������ҳ��
			String strpageNo = request.getParameter("pageNo");
			int pageNo = 1;
			if(strpageNo != null && !strpageNo.trim().equals("")){
				pageNo = Integer.parseInt(strpageNo);
				if(pageNo<1){
					pageNo =1;
				}
			}
	
		String keyword = request.getParameter("keyword");
//System.out.println("--"+keyword+"--");
		double lowNormalPrice = Double.parseDouble(request.getParameter("lowNormalPrice"));
		double highNormalPrice = Double.parseDouble(request.getParameter("highNormalPrice"));
		double lowMemberPrice = Double.parseDouble(request.getParameter("lowMemberPrice"));
		double highMemberPrice = Double.parseDouble(request.getParameter("highMemberPrice"));
		int categoryid = Integer.parseInt(request.getParameter("categoryid").trim());
		
		
		Timestamp startDate;
		String strStartDate = request.getParameter("startDate");
//System.out.println(strStartDate+"------");
		if(strStartDate == null || strStartDate.trim().equals("")){
			startDate = null;
System.out.println("���ҳ�������");
		}else{
System.out.println("���ĳ�����");	
			startDate =Timestamp.valueOf(strStartDate);
		}
		
		int idArray[] ;
		if(categoryid == 0){
			idArray = null;
		}else{
			idArray = new int[1];
			idArray[0] = categoryid;
		}
		
		Timestamp endDate;
		String strEndDate = request.getParameter("endDate");
		if(strEndDate == null || strEndDate.trim().equals("")){
			endDate = null;
		}else{
			endDate = Timestamp.valueOf(strEndDate);
		}
		
		List<Product> products = new ArrayList<Product>();
		int pageCount =ProductMgr.getInstance().findProducts(products,
										idArray,
										 keyword, 
										lowNormalPrice,
										 highNormalPrice,
										  lowMemberPrice, 
										 highMemberPrice,
										  startDate,
										  endDate,
								          pageNo,3);
		if(pageNo>pageCount) pageNo = pageCount;
		%>
			<center>�������</center>
	<table border="1" align="center">
   			<tr>
   				<td>id</td>
   				<td>name</td>
   				<td>descr</td>
   				<td>normalprice</td>
   				<td>memberprice</td>
   				<td>pdate</td>
   				<td>categoryid</td>
   				<td colspan="2">����</td>
   			</tr>
   			<%
   				for(Iterator<Product> iterator = products.iterator();iterator.hasNext();){
   					Product p= iterator.next();
   					
   					
   			 %>
   			 <tr>
   			 	<td><%=p.getId() %></td>
   			 	<td><%=p.getName() %></td>
   			 	<td><%=p.getDescr() %></td>
   			 	<td><%=p.getNormalprice() %></td>
   			 	<td><%=p.getMemberprice() %></td>
   			 	<td><%=p.getPdate() %></td>
   			 	<td><%=p.getCategoryid() %></td>
   			 	<td><a href="productModify.jsp?">�޸�</a></td>
   			 	<td><a href="productDelete.jsp">ɾ��</a></td>
   			 </tr>
   			 <%
   					
   			 	}
   			  %>
   		</table>
   		<center>
   			<a href="productSearch.jsp?action=<%=action%>&categoryid=<%=categoryid%>&keyword=<%=keyword%>&lowNormalPrice=<%=lowNormalPrice%>&highNormalPrice=<%=highNormalPrice%>&lowMemberPrice=<%=lowMemberPrice%>&highMemberPrice=<%=highMemberPrice%>&startDate=<%=strStartDate%>&endDate=<%=strEndDate%>&pageNo=<%=1%>">��ҳ</a>&nbsp;&nbsp;
   			<a href="productSearch.jsp?action=<%=action%>&categoryid=<%=categoryid%>&keyword=<%=keyword%>&lowNormalPrice=<%=lowNormalPrice%>&highNormalPrice=<%=highNormalPrice%>&lowMemberPrice=<%=lowMemberPrice%>&highMemberPrice=<%=highMemberPrice%>&startDate=<%=strStartDate%>&endDate=<%=strEndDate%>&pageNo=<%=pageNo-1%>">��һҳ</a>&nbsp;&nbsp;
   			<a href="productSearch.jsp?action=<%=action%>&categoryid=<%=categoryid%>&keyword=<%=keyword%>&lowNormalPrice=<%=lowNormalPrice%>&highNormalPrice=<%=highNormalPrice%>&lowMemberPrice=<%=lowMemberPrice%>&highMemberPrice=<%=highMemberPrice%>&startDate=<%=strStartDate%>&endDate=<%=strEndDate%>&pageNo=<%=pageNo+1%>">��һҳ</a>&nbsp;&nbsp;
   			<a href="productSearch.jsp?action=<%=action%>&categoryid=<%=categoryid%>&keyword=<%=keyword%>&lowNormalPrice=<%=lowNormalPrice%>&highNormalPrice=<%=highNormalPrice%>&lowMemberPrice=<%=lowMemberPrice%>&highMemberPrice=<%=highMemberPrice%>&startDate=<%=strStartDate%>&endDate=<%=strEndDate%>&pageNo=<%=pageCount%>">βҳ</a>&nbsp;&nbsp;
   		</center>
		<%
		
		//return;
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
	<script type="text/javascript">
	<!--
		function checkdate(){
			with(document.forms("complex")){
				if(lowNormalPrice.value == null || lowNormalPrice.value == ""){
					lowNormalPrice.value= -1;
				}
				if(highNormalPrice.value == null || highNormalPrice.value == ""){
					highNormalPrice.value= -1;
				}
				if(lowMemberPrice.value == null || lowMemberPrice.value == ""){
					lowMemberPrice.value= -1;
				}
				if(highMemberPrice.value == null || highMemberPrice.value == ""){
					highMemberPrice.value= -1;
				}
			}
		}
	-->
	</script>
  </head>
  
  <body>
  			<center>������</center>
   		<form action="productSearch.jsp" method="post" >
   				<input type="hidden" name="action" value="simpleSearch" />
   				���<select name="categoryid">
   						<option value="0">�������</option>
   						<%
   							for(Iterator<Category> it = categories.iterator();it.hasNext();){
   								Category c = it.next();
   								String preStr = "";
   								for(int i = 0 ;i<c.getGrade();i++){
   									preStr +="--";
   								}
   						 %>
   							<option value="<%=c.getId()%>"><%=preStr+c.getName() %></option>
   						<%
   							}
   						 %>
   					</select>
   				�ؼ��֣�<input type="text" name="keyword" />
   				<input type="submit" value="����" />
   							
   						
   				
   		</form>
   		<center>��������</center>
   		<form action="productSearch.jsp" method="post" name="complex" onsubmit="checkdate()" >
   				<input type="hidden" name="action" value="complexSearch" />
   				���<select name="categoryid">
   						<option value="0">�������</option>
   						<%
   							for(Iterator<Category> it = categories.iterator();it.hasNext();){
   								Category c = it.next();
   								String preStr = "";
   								for(int i = 0 ;i<c.getGrade();i++){
   									preStr +="--";
   								}
   						 %>
   							<option value="<%=c.getId()%>"><%=preStr+c.getName() %></option>
   						<%
   							}
   						 %>
   					</select><br/><br/>
   				�ؼ��֣�<input type="text" name="keyword" /><br/><br/>
   				normalprice: From:<input type="text" name="lowNormalPrice" />
   							 to:  <input type="text" name="highNormalPrice" /><br/><br/>
   				memberPrice: From:<input type="text" name="lowMemberPrice" />
   							 to:  <input type="text" name="highMemberPrice" /><br/><br/>
   				pdate:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   							From:<input type="text" name="startDate" />
   							 to:  <input type="text" name="endDate" /><br/><br/>
   				<input type="submit" value="����" />
   		</form>
  </body>
</html>
