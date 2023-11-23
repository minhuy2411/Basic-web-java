<%-- 
    Document   : shopping
    Created on : Jun 16, 2023, 1:46:14 PM
    Author     : DELL
--%>

<%@page import="java.util.List"%>
<%@page import="sample.shopping.ProductDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Shopping Page</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        <link rel="stylesheet" href="MyStyle.css">
        <style>
            body{
                background-color: #fff;
            }

            .center {
                display: flex;
                flex-direction: column;
                align-items: center;
                justify-content: center;
                height: 100vh;
                text-align: center;
            }



            form {
                display: flex;
                flex-direction: column;
                align-items: center;
            }

            select {
                width: 300px;
                height: 40px;
                margin-bottom: 20px;
                padding: 0 10px;
                border: 1px solid #ddd;
                border-radius: 5px;
                background-color: #fff;
                font-size: 16px;
            }

            input[type="submit"] {
                width: 150px;
                height: 40px;
                background-color: #000;
                color: #fff;
                border: none;
                border-radius: 5px;
                font-size: 16px;
                cursor: pointer;
            }
            .center{


                color: #434343;
                display: block;

            }



            .welcome {
                background-color: transparent;
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
            }
            html, body {
                height: 100%;
                margin: 0;
                padding: 0;
            }

            .section {
                height: 100vh; /* 100% of the viewport height */
            }

            /* Style each section as a new page */
            #section1 {

                background-color: #fff; /* Set the background color for section 1 */
            }


            #section2 {

                flex-direction: column;
                align-items: center;
                justify-content: center;
                height: 100vh;
                text-align: center;
                background-color: #fff; /* Set the background color for section 3 */
            }
            .image{
                background-color: transparent;
            }
            h1 {
                font-family: "Your Modern Font", sans-serif;
                text-transform: uppercase;
                /* Additional styling properties */
            }

            h3 {
                font-family: "Your Modern Font", sans-serif;
                text-transform: uppercase;
                /* Additional styling properties */
            }
            .image-section2{
                width: 100%;
                overflow: hidden;
            }
            .image-section2 image{
                width: 100%; /* Fit image width to container */
                height: auto; /* Maintain aspect ratio */
                object-fit: cover;
            }

        </style>
    </head>
    <body>

        <div class="center">

            <h1 style="font-size: xx-large;
                line-height: 48px;
                font-weight: bold;
                letter-spacing: 1.2em;
                color: #434343;
                display: block;
                text-transform: uppercase;">WELCOME TO OUTLINE</h1>

            <div id="section1" class="section">
                <!-- Content of section 1 -->
                <div class="image">
                    <img style="max-width: 100%;
                         vertical-align: middle;" src="http://plazathemes.com/magento22/outline/pub/media/wysiwyg/animal.jpg" alt="Animal Image">
                </div>
                <h3>Thiết Kế Cho</h3>
                <h3>Ngôi Nhà Của Bạn</h3>
                <a href="shopping.jsp">Tìm Hiểu Thêm</a>
            </div>



        </div>

        <div id="section2" class="section">
            <div class="image-section2">
                <img  src="http://plazathemes.com/magento22/outline/pub/media/catalog/category/category-img.jpg" alt="Your Image">
            </div>
            <section>
                <div class="text-center">
                    <div class="row">

                        
                                <%
                                    List<ProductDTO> listProduct = (List<ProductDTO>) request.getAttribute("GET_PRODUCT");
                                    if (listProduct != null) {
                                        if (listProduct.size() > 0) {
                                            for (ProductDTO elem : listProduct) {
                                                    
                                                
                                %>
                        <div class="col-lg-3 col-md-6 mb-4">
                            <div class="card">        
                                <div class="bg-image hover-zoom ripple ripple-surface ripple-surface-light"
                                     data-mdb-ripple-color="light">
                                    <img src= <%= elem.getImage() %>
                                         class="w-100" />
                                    <a href="#!">  
                                        <div class="mask">
                                            <div class="d-flex justify-content-start align-items-end h-100">
                                                <h5><span class="badge bg-primary ms-2">bestseller</span></h5>
                                            </div>
                                        </div>
                                        <div class="hover-overlay">
                                            <div class="mask" style="background-color: rgba(251, 251, 251, 0.15);"></div>
                                        </div>
                                    </a>
                                </div>
                                
                                
                                <div class="card-body">
                                    <a href="" class="text-reset">
                                        <h5 class="card-title mb-2"><%= elem.getName() %></h5>
                                    </a>
                                    <a href="" class="text-reset ">
                                        <p>Sofa</p>
                                    </a>
                                    <h6 class="mb-3 price"><%= elem.getPrice() %></h6>
                                    <form action="MainController" method="POST">
                                        <input type="hidden" name="cmbWeapon" value="<%= elem.getId() %>">
                                        <input type="hidden" name="cmbQuantity" value="1">
                                        <input type="submit" name="action" value="Add" />
                                    </form>
                                </div>
                            </div>
                        </div>
                                <%
                                            }
                                        }
                                    }
                                %>

            </section>

            <form action="MainController" method="POST">
                <div>
                    <input type="submit" name="action" value="View"/>
                    <input type="submit" name="action" value="Logout"/>
                </div>
                <%
                    String message = (String) request.getAttribute("MESSAGE");
                    if (message == null) {
                        message = "";
                    }
                %>
                <%= message%>

            </form>

        </div>         

        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js"></script>


    </body>
</html>
