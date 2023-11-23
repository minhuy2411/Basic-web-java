<%@page import="sample.shopping.Weapon"%>
<%@page import="sample.shopping.Cart"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>YOUR CART</title>
        <style>
            body {
                background-color: #fff;
                font-family: Arial, sans-serif;
            }
            h1 {
                color: #333;
                padding: 10px;
                background-color: white;
            }
            
            table {
                border-collapse: collapse;
                width: 100%;
                background-color: white;
                margin-bottom: 20px;
                border: none;
            }
            th, td {
                padding: 8px;
                text-align: left;
            }
            th {
                background-color: #fff;
                font-weight: bold;
            }
            td input[type="text"], td input[type="number"] {
                width: 60px;
            }
            td input[type="submit"] {
                padding: 5px 10px;
                background-color: white;
                border: 1px solid #333;
                color: #333;
                cursor: pointer;
            }
            td input[type="submit"]:hover {
                background-color: #333;
                color: white;
            }
            h2 {
                color: #333;
                margin-bottom: 20px;
            }
            p {
                color: #333;
            }
            a {
                color: #333;
                text-decoration: none;
            }
            a:hover {
                text-decoration: underline;
            }
            img {
                width: 200px;
            }
            tbody tr:nth-child(odd) {
                border-bottom: 1px solid rgba(0, 0, 0, 0.1);
            }
        </style>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" integrity="sha384-lZ2+rzB27/sGusZSIdHIe4BPXeQjH5y7oN/QoZRO0mY4hWTyue4MpB/1uviFmmZ" crossorigin="anonymous">
    </head>
    <body>
        <h1>Your Cart</h1>
        <%
            Cart cart = (Cart) session.getAttribute("CART");
            if (cart != null && cart.getCart().size() > 0) {
        %> 
        <table>
            <thead>
                <tr>
                    <th>No</th>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Image</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    <th>Edit</th>
                    <th>Remove</th>
                    <th>Total</th>
                </tr>
            </thead>
            <tbody>
                <%
                    int count = 1;
                    double total = 0;
                    for (Weapon weapon : cart.getCart().values()) {
                        total += weapon.getQuantity() * weapon.getPrice();
                %>
            <form action="MainController" method="POST">
                <tr>
                <input type="hidden" name="id" value="<%= weapon.getId()%>"/>
                    <td><%= count++%></td>
                    <td>
                        <%= weapon.getId()%>
                    </td>
                    <td><%= weapon.getName()%></td>
                    <td>
                        <img src="<%= weapon.getImage()%>" alt="Product Image">
                    </td>
                    <td><%= weapon.getPrice()%></td>
                    <td>
                        <input type="number" name="quantity" value="<%= weapon.getQuantity()%>" min="1" required=""/>
                    </td>
                    <td>
                        <input type="submit" name="action" value="Edit"/>
                    </td>
                    <td>
                        <input type="submit" name="action" value="Remove"/>
                    </td>
                    <td><%= weapon.getQuantity() * weapon.getPrice()%></td>        
                    
                </tr>
            </form>
            <%
                }
            %>
        </tbody>
    </table>
    <h2>Total: <%= total%> $</h2>
    <%
    } else {
    %>
    <p>Your cart is empty.</p>
    <% }%>
    <a href="shopping.jsp">Add more</a>
    <form action="MainController" method="POST">
        <input type="submit" name="action" value="CheckOut">
    </form>
</body>
</html>
