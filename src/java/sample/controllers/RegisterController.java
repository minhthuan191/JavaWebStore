/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import sample.user.UserDAO;
import sample.user.UserDTO;
import sample.user.UserError;

/**
 *
 * @author USER
 */
@WebServlet(name = "RegisterController", urlPatterns = {"/RegisterController"})
public class RegisterController extends HttpServlet {

    public static final String ERROR = "WEB-INF\\register.jsp";
    public static final String SUCCESS = "WEB-INF\\login.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
            String url = ERROR;
     
            try {
                String userID = request.getParameter("userID");
                String password = request.getParameter("password");
                String confirm = request.getParameter("confirm");
                String name = request.getParameter("name");
                String address = request.getParameter("address");
                String phone = request.getParameter("phone");
                String roleID = "US";
                String statusID = "0";
                UserError userError = new UserError();
                boolean check = true;
                if(userID.length()<2||userID.length()>10){
                    userError.setUserID("UserID must be [2,10]");
                    check = false;
                }
                if(name.length()<5||name.length()>50){
                    userError.setName("Name must be [5,50]");
                    check = false;
                }
                if(address.isEmpty()){
                    userError.setAddress("Address cant be empty");
                    check = false;
                }
                if(phone.isEmpty()){
                    userError.setPhone("Phone cant be empty");
                    check = false;
                }
                if(password.length()<2||password.length()>10){
                    userError.setPassword("Password must be [2,10]");
                    check = false;
                }
                if(!confirm.equals(password)){
                    userError.setConfirm("It's the wrong number");
                    check = false;
                }
                UserDAO dao = new UserDAO();
                boolean checkDuplicate = dao.checkDuplicate(userID);
                if(checkDuplicate){
                    userError.setUserID("Duplicate User ID");
                    check = false;
                }
                if(check){
                    boolean checkRegister = dao.register(new UserDTO(userID, name, password, address, phone, roleID, statusID));
                    if(checkRegister){
                        url = SUCCESS;
                    }
                }
                else{
                    request.setAttribute("USER_ERROR", userError);
                }
            } catch (Exception e) {
                log("Error at RegisterController: " + e.toString());
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

