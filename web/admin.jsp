<%-- 
    Document   : admin
    Created on : May 29, 2023, 4:48:13 PM
    Author     : DELL
--%>

<%@page import="java.util.List"%>
<%@page import="sample.user.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Page</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f0f0f0;
                margin: 0;
                padding: 0;
            }

            header {
                background-color: #333;
                color: #fff;
                padding: 20px;
                text-align: center;
            }

            h1 {
                margin: 0;
                font-size: 28px;
            }

            .container {
                max-width: 800px;
                margin: 20px auto;
                padding: 20px;
                background-color: #fff;
                border-radius: 5px;
                box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            }

            form {
                margin-bottom: 20px;
            }

            input[type="submit"], input[type="reset"] {
                background-color: #333;
                color: #fff;
                border: none;
                padding: 10px 20px;
                font-size: 16px;
                cursor: pointer;
            }

            table {
                width: 100%;
                border-collapse: collapse;
            }

            th, td {
                padding: 10px;
                text-align: left;
                border-bottom: 1px solid #ddd;
            }

            th {
                background-color: #f5f5f5;
            }

            .error {
                color: red;
                margin-top: 10px;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h1>Admin World!</h1></br>


            <%
                UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
                if (loginUser == null || !"AD".equals(loginUser.getRoleID())) {
                    response.sendRedirect("login.html");
                    return;
                }
                String search = request.getParameter("search");
                if (search == null) {
                    search = "";
                }
            %>

            Welcome:<%= loginUser.getFullName()%></br>


            <form action="MainController" method="POST">
                <input style="background-color:#dd9d4c" type="submit" name="action" value="Logout"/>
            </form>
            </br>

            <form action ="MainController">
                Search<input type="text" name="search" value="<%=search%>"/>
                <input style="background-color:#dd9d4c" type="submit" name="action" value="Search"/>
            </form>
            <%
                List<UserDTO> listUser = (List<UserDTO>) request.getAttribute("LIST_USER");
                if (listUser != null) {
                    if (listUser.size() > 0) {
            %>
            <table border="1">
                <thead>
                    <tr>
                        
                        <th>No</th>
                        <th>User ID</th>
                        <th>Full Name</th>
                        <th>Role ID</th>
                        <th>Password</th>
                        <th>Update </th>
                        <th>Delete</th>
                        
                    </tr>
                </thead>
                <tbody>
                    <%
                        int count = 1;
                        for (UserDTO user : listUser) {

                    %>
                <form action="MainController">


                    <tr>
                        <td><%= count++%>    </td>
                        <td><%= user.getUserID()%>     </td>
                        <td>

                            <input type="text" name="fullName" value="<%= user.getFullName()%>" required=""/>
                        </td>
                        <td>

                            <input type="text" name="roleID" value="<%= user.getRoleID()%> " required=""/>
                        </td>
                        <td>      <%= user.getPassword()%>     </td>
                        <!--update o day ne-->
                        <td>     
                            <input style="background-color:#dd9d4c" type="submit" name="action" value="Update"/>
                            <input type="hidden" name="userID" value="<%= user.getUserID()%>"/>
                            <input type="hidden" name="search" value="<%=search%>"/>
                        </td>
                        <!--delete o day ne-->
                        <td>
                            <a href="MainController?search=<%= search%>&action=Delete&userID=<%= user.getUserID()%>">Delete</a>
                        </td>

                    </tr>

                </form>
                <%
                    }
                %>
                </tbody>
            </table>
            <%
                String error = (String) request.getAttribute("ERROR");
                if (error == null) {
                    error = "";
                }
            %>
            <%= error%>

            <%

                    }
                }
            %>
        </div>
    </body>
</html>
