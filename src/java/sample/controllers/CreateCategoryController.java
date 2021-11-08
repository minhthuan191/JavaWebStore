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
import sample.category.CategoryDAO;
import sample.category.CategoryDTO;
import sample.category.CategoryError;
import sample.product.ProductDAO;

/**
 *
 * @author USER
 */
@WebServlet(name = "CreateCategoryController", urlPatterns = {"/CreateCategoryController"})
public class CreateCategoryController extends HttpServlet {

    private static final String ERROR = "WEB-INF\\createCategory.jsp";
    private static final String SUCCESS = "CategoryController";
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String categoryID = request.getParameter("categoryID");
            String categoryName = request.getParameter("categoryName");
            CategoryError categoryError = new CategoryError();
            CategoryDAO dao = new CategoryDAO();
            boolean check = true;
            if(categoryID.length() < 1 || categoryID.length() > 50){
                categoryError.setCategoryID("Category ID must be [1,50]");
                check = false;
            }
            if(categoryName.length() < 2 || categoryID.length()> 20){
                categoryError.setCategoryName("Name must be [2,20]");
                check = false;
            }
            boolean checkDuplicate = dao.checkDuplicate(categoryID);
            if(checkDuplicate){
                categoryError.setCategoryID("ID already exist");
                check = false;
            }
            if(check){
                boolean checkInsert = dao.createCategory(new CategoryDTO(categoryID, categoryName));
                if (checkInsert) {
                    url = SUCCESS;
                }
            }else{
                request.setAttribute("CATEGORY_ERROR", categoryError);
            }
            

        } catch (Exception e) {
            log("Error at CreateCategoryController: " + e.toString());
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
