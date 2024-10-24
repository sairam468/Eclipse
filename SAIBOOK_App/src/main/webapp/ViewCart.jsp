<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import ="test.*,java.util.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View Books</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>
    <header>
        <h1>SAIBOOKS - View Cart</h1>
    </header>
    <div class="container">
        <nav>
            <a href="UserViewBooks.jsp">Back</a>
            <a href="logout">Logout</a>
        </nav>
        <h2>Book List</h2>
        <%
            String msg = (String) request.getAttribute("msg");
            if (msg != null) {
                out.print(msg);
            }
            ArrayList<AddCartBean> acb = (ArrayList<AddCartBean>) session.getAttribute("acb");
            if (acb == null || acb.isEmpty()) {
                out.println("<p>No books available.</p>");
            } else {
                int totalBooks = 0;
                float totalPrice = 0.0f;
        %>
        <form action="buyAllBooks" method="post">
            <table>
                <tr>
                    <th>Book Code</th>
                    <th>Book Name</th>
                    <th>Author</th>
                    <th>Price</th>
                    <th>Number of Books</th>
                    <th>Add one</th>
                    <th>Remove one</th>
                    <th>Remove From Cart</th>
                </tr>
                <%
                    // Iterate over the ArrayList, display book details, and calculate totals
                    for (AddCartBean acbean : acb) {
                        int bookQty = acbean.getNoOfBooks();
                        float bookPrice = acbean.getPrice() * bookQty;
                        totalBooks += bookQty;
                        totalPrice += bookPrice;
                %>
                <tr>
                    <td><%= acbean.getCode() %></td>
                    <td><%= acbean.getName() %></td>
                    <td><%= acbean.getAuthor() %></td>
                    <td><%= acbean.getPrice() %></td>
                    <td><%= bookQty %></td>
                    <td><a href="updateBook?bcode=<%= acbean.getCode() %>&updation=<%=1%>">+1</a></td>
                    <td><a href="updateBook?bcode=<%= acbean.getCode() %>&updation=<%=-1%>">-1</a></td>
                    <td><a href="removeBook?bcode=<%= acbean.getCode() %>">Remove</a></td>
                </tr>
                <%
                    }
                %>
                <!-- Row showing total number of books and total price -->
                <tr>
                    <td colspan="4" style="text-align: right;"><strong>Total Number of Books:</strong></td>
                    <td><%= totalBooks %></td>
                    <td colspan="2" style="text-align: right;"><strong>Total Price:</strong></td>
                    <td><%= totalPrice %></td>
                </tr>
            </table>
            <input type="submit" value="Buy All" /> 
        </form>
        <%
            }
        %>
    </div>
</body>
</html>
