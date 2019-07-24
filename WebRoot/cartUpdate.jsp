<%@page import="com.luo.CartItem"%>
<%@page import="com.luo.ProductMgr"%>
<%@page import="com.luo.Product"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

 <jsp:useBean id="cart" type="com.luo.Cart" scope="session"></jsp:useBean>
 <%
 	if(cart == null){
 		out.println("没有任何的购物项");
 		return;
 	}
 	
 	List<CartItem> items = cart.getItems();
 	for(int i = 0;i<items.size();i++){
 		CartItem ci = items.get(i);
 		String strCount = request.getParameter("p"+ci.getProductid());
 		if(strCount != null && !strCount.trim().equals("")){
 			ci.setCount(Integer.parseInt(strCount));
 		}
 	}	
 	
  %>
  <center>修改成功</center>
  <font color="red"><span id="num" >3</span></font>秒后自动跳转，如何没有任何反应，<a href="cart.jsp">请点击这里--></a>
<script language="javascript">
	var leftTime = 2;
	var intervalid;
	intervalid = setInterval(go,1000);
	function go(){
		if(leftTime==0){
				document.location.href="cart.jsp";
				clearInterval(intervalid);
		}
		
		document.getElementById("num").innerHTML=leftTime;
		leftTime --;
	}
	
</script>
  
	  	
