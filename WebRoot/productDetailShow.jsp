<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.luo.ProductMgr"%>
<%@page import="com.luo.Product"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
	String strproductid = request.getParameter("id");
	int id = -1;
	if(strproductid == null || strproductid.trim().equals("")){
		out.println("此商品不存在！！！");
		return;
	}else{
		id = Integer.parseInt(strproductid);
	}
	Product p = ProductMgr.getInstance().loadById(id);
 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>shopping 首页</title>
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
  			<td colspan="4">商品详细信息的展示</td>
  		</tr>
  	 
  		<tr>
  			<td width="30%">
  			<img src="images/beijing.jpg" alt="<%=p.getName() %>" width="30%"/><br/>
  			商品id:<%=p.getId() %><br/>
  			名称：<%=p.getName() %><br/>
  			商品描述：<%=p.getDescr() %><br/>
  			会员价：<%=p.getMemberprice() %>元<br/>
  			成员价格：<%=p.getNormalprice() %>元<br/>
  			上架日期：<%=p.getPdate() %><br/>
  			类别id:<%=p.getCategoryid() %><br/>
  			<a href="buy.jsp?id=<%=p.getId()%>"><Button>购买</Button></a>
  			
  			</td>
  		</tr>
  		
  	</table>
  </body>
</html>
