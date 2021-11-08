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
import sample.category.CategoryDAO;
import sample.category.CategoryDTO;
import sample.order.OrderDAO;
import sample.order.OrderDTO;
import sample.orderDetail.OrderDetailDAO;
import sample.user.UserDTO;

/**
 *
 * @author USER
 */
@WebServlet(name = "CheckOutController", urlPatterns = {"/CheckOutController"})
public class CheckOutController extends HttpServlet {

    private static final String ERROR="WEB-INF\\error.jsp";
    private static final String SUCCESS="WEB-INF\\cart.jsp";
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        boolean check = false;
        try {
            HttpSession session = request.getSession();
            Cart cart = (Cart) session.getAttribute("CART");
            int total = 0;
                for(CartItem cartItem : cart.getCart().values()){
                    total += cartItem.getProduct().getPrice()*cartItem.getQuantity();
                }
            UserDTO user = (UserDTO) session.getAttribute("LOGIN_USER");
            if(cart != null)
            {
                OrderDAO orderDAO = new OrderDAO();
                OrderDTO order = orderDAO.createOrder(user.getUserID(), total);
                OrderDetailDAO orderDetailDAO = new OrderDetailDAO();
                for(CartItem cartItem : cart.getCart().values()){
                    check = orderDetailDAO.createOrderDetail(order.orderID, cartItem.getProduct().productID, cartItem.getQuantity(), cartItem.getProduct().price);
                }
                if(check){
                    session.removeAttribute("CART");
                    url = SUCCESS;
                }
            }

        } catch (Exception e) {
            log("Error at CartController: " + e.toString());
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
