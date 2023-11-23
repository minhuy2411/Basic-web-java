/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import sample.shopping.Cart;
import sample.shopping.ProductDTO;
import sample.shopping.Weapon;
import sample.user.ProductDAO;
import sample.user.UserDAO;
import sample.user.UserDTO;

/**
 *
 * @author DELL
 */
@WebServlet(name = "AddController", urlPatterns = {"/AddController"})
public class AddController extends HttpServlet {

    private static final String ERROR = "shopping.jsp";
    private static final String SUCCESS = "shopping.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {

            String cmbWeapon = request.getParameter("cmbWeapon");
            ProductDTO product = ProductDAO.getProduct(cmbWeapon);
            
            String id = product.getId();
            String name = product.getName();
            double price = product.getPrice();
            int quantity = Integer.parseInt(request.getParameter("cmbQuantity"));
            HttpSession session = request.getSession();
            if (session != null) {
                Cart cart = (Cart) session.getAttribute("CART");
                if (cart == null) {
                    cart = new Cart();
                }
                Weapon weapon = new Weapon();
                weapon.setId(id);
                weapon.setName(name);
                weapon.setPrice(price);
                weapon.setQuantity(quantity);
                weapon.setImage(product.getImage());

                boolean check = cart.add(id, weapon);
                if (check) {
                    session.setAttribute("CART", cart);
                    request.setAttribute("MESSAGE", quantity + " - " + name + ": successfully !");
                    url = SUCCESS;
                }

            }
        } catch (Exception e) {
            log("Error at AddController: " + e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private String getImageUrlById(String id) {
        String imageUrl = "";
    if (id.equals("T01")) {
        imageUrl = "https://product.hstatic.net/200000295856/product/o1cn01cnoftk1yewahrsnri___3502083084-0-cib_1a3f6b7899f94a41a9280baf2f9a9fff_1024x1024.jpg";
    } else if (id.equals("T02")) {
        imageUrl = "https://product.hstatic.net/200000295856/product/o1cn01hdl9gq2gwathwt0j4___2214348869023-0-cib_a729a352a72e405098d1449900d56c1e_1024x1024.jpg";
    } else if (id.equals("T03")) {
        imageUrl = "https://product.hstatic.net/200000295856/product/11_9a4d43c40c804ff99452b965713bb8bd_1024x1024.jpg";
    }else if (id.equals("T04")) {
        imageUrl = "https://product.hstatic.net/200000295856/product/sofa-_da-_goc-_vulcan-2_fae782aa401c425e95c4464ad164403f_1024x1024.jpg";
    }else if (id.equals("T05")) {
        imageUrl = "https://cdn.shopify.com/s/files/1/1503/1122/products/SO-851_3-2-1_660f3bbc-0d1f-48e3-b7bc-a82fad391a37.jpg?v=1655782134&width=533";
    }else if (id.equals("T06")) {
        imageUrl = "https://cdn.shopify.com/s/files/1/1503/1122/products/aa1.jpg?v=1671073271&width=533";
    }else if (id.equals("T07")) {
        imageUrl = "https://cdn.shopify.com/s/files/1/1503/1122/products/COMBO3-1_1_09cb2be4-971e-41ea-96ed-11502760f3d5.jpg?v=1680685313&width=533";
    }else if (id.equals("T08")) {
        imageUrl = "https://cdn.shopify.com/s/files/1/1503/1122/products/CH-8001_c12eeb7c-7ab9-4fea-a396-d33066f78402.jpg?v=1681701222";
    }
    
    
    return imageUrl;
}
    }


