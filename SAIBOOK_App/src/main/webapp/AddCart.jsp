<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Cart</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>
    <header>
        <h1>SAIBOOKS - Message</h1>
    </header>
    <div class="container">
        <nav>
            <a href="UserViewBooks.jsp">Back</a>
            <a href="logout">Logout</a>
        </nav>
        
        <%
        String msg = (String) request.getAttribute("msg");
        if (msg != null) {
            out.println("<p class='message'>" + msg + "</p>");
        %>
        <%
        } else {
            out.println("<p class='message'>No message available.</p>");
        }
        %>
    </div>
</body>
</html>

