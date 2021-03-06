/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import sample.cart.Cart;
import sample.cart.CartItem;
import sample.product.ProductDAO;

/**
 *
 * @author USER
 */
@WebServlet(name = "EditQuantityController", urlPatterns = {"/EditQuantityController"})
public class EditQuantityController extends HttpServlet {

    private static final String ERROR = "WEB-INF\\error.jsp";
    private static final String SUCCESS = "WEB-INF\\cart.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            int cerentQuantity = Integer.parseInt(request.getParameter("quantity"));
            String productID = request.getParameter("productID");
            HttpSession session = request.getSession();
            Cart cart = (Cart) session.getAttribute("CART");
            ProductDAO dao = new ProductDAO();

            if (cart != null) {
                if (dao.getProductByID(productID).quantity > cerentQuantity) {
                    cart.update(productID, new CartItem(dao.getProductByID(productID), cerentQuantity));
                    url = SUCCESS;
                } else {
                    cart.update(productID, new CartItem(dao.getProductByID(productID), 1));
                    url = SUCCESS;
                    request.setAttribute("ERROR", "Sorry we don't have enough");
                }
            }
        } catch (Exception e) {
            log("Error at EditQuantityController: " + e.toString());
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

}
