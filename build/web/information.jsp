<%-- 
    Document   : information
    Created on : Jul 12, 2023, 6:05:29 PM
    Author     : ☢ minhuy ☣
--%>

<%@page import="sample.shopping.Cart"%>
<%@page import="sample.shopping.Weapon"%>
<%@page import="java.sql.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Information User</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 20px;
            }
            
            h1 {
                text-align: center;
                margin-bottom: 30px;
            }
            
            form {
                display: flex;
                flex-direction: column;
                align-items: center;
            }
            
            input[type="text"],
            input[type="number"] {
                width: 300px;
                padding: 10px;
                margin-bottom: 10px;
                border-radius: 5px;
                border: 1px solid #ccc;
                outline: none;
            }
            
            table {
                width: 100%;
                border-collapse: collapse;
                margin-bottom: 20px;
            }
            
            th, td {
                padding: 10px;
                border-bottom: 1px solid #ccc;
            }
            
            img {
                width: 50px;
                height: auto;
            }
            
            h2 {
                margin-top: 30px;
                text-align: center;
            }
            
            input[type="submit"] {
                padding: 10px 20px;
                background-color: #4CAF50;
                color: #fff;
                border: none;
                border-radius: 5px;
                cursor: pointer;
            }
            
            @media (max-width: 600px) {
                input[type="text"],
                input[type="number"] {
                    width: 100%;
                }
            }
        </style>
    </head>
    <body>
        <h1>Information User</h1>
        <form action="MainController" method="POST">
            <input type="text" name="Name" placeholder="Name" required><br>
            <input type="text" name="Address" placeholder="Address" required><br>
           
            <%
                long millis = System.currentTimeMillis();
                Date date = new Date(millis);
            %>
            <%= date%>
            <input type="hidden" name="Date" value="<%= date%>">
            <input type="text" name="Phone" placeholder="Phone" required><br>
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
                    <tr>
                        <td><%= count++%></td>
                        <td><%= weapon.getId()%></td>
                        <td><%= weapon.getName()%></td>
                        <td>
                            <img src="<%= weapon.getImage()%>" alt="Product Image">
                        </td>
                        <td><%= weapon.getPrice()%></td>
                        <td>
                            <input type="number" name="quantity" value="<%= weapon.getQuantity()%>" min="1" required="">
                        </td>
                        <td><%= weapon.getQuantity() * weapon.getPrice()%></td>        
                    </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
            <h2>Total: <%= total%> $</h2>
            <input type="hidden" name="Total" value="<%= total%>">
            <%
            } else {
            
}
            %>
            <input type="submit" name="action" value="Save">
        </form>
    </body>
</html>
