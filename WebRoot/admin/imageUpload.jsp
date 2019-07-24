<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<title>Insert title here</title>
</head>
<body>
<h1>文件上传</h1>
 
 
<form method="POST" enctype="multipart/form-data" action="../UpLoadExcelServlet" name="uploadForm">
  选择一个文件: <input type="file" name="upfile"><br/>
  <br/>
  <input type="submit" value="上传">
</form>
 
 
</body>
</html>