<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>Message</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>
    <header>
        <h1>SAIBOOKS - Message</h1>
    </header>
<%
String msg=(String)request.getAttribute("msg");
if(msg!=null){
	out.println(msg);
}
%>
<%@ include file="userLogin.html" %>
</body>
</html>