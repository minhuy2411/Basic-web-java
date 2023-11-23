<%-- 
    Document   : user
    Created on : May 29, 2023, 4:43:54 PM
    Author     : DELL
--%>

<%@page import="sample.user.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Page</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f0f0f0;
                margin: 0;
                padding: 0;
            }

            .container {
                max-width: 400px;
                margin: 20px auto;
                padding: 20px;
                background-color: #fff;
                border-radius: 5px;
                box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            }

            h1 {
                text-align: center;
                margin-bottom: 20px;
            }

            .user-info {
                margin-bottom: 10px;
            }

            .user-info label {
                font-weight: bold;
                margin-right: 5px;
            }

            .icon {
                margin-right: 5px;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h1>User's Information</h1>
            <div class="user-info">
                <label for="userID"><i class="fas fa-user icon"></i>User ID:</label>
                <span id="userID">${sessionScope.LOGIN_USER.userID}</span>
            </div>
            <div class="user-info">
                <label for="fullName"><i class="fas fa-user icon"></i>Full Name:</label>
                <span id="fullName">${sessionScope.LOGIN_USER.fullName}</span>
            </div>
            <div class="user-info">
                <label for="roleID"><i class="fas fa-user-tag icon"></i>Role ID:</label>
                <span id="roleID">${sessionScope.LOGIN_USER.roleID}</span>
            </div>
            <div class="user-info">
                <label for="password"><i class="fas fa-lock icon"></i>Password:</label>
                <span id="password">${sessionScope.LOGIN_USER.password}</span>
            </div>
            <a href="login.html">Logout</a>
        </div>
    </body>
</html>
