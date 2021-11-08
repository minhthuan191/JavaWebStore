/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import sample.category.CategoryDAO;
import sample.product.ProductDAO;
import sample.product.ProductDTO;
import sample.product.ProductError;

/**
 *
 * @author USER
 */
@WebServlet(name = "CreateProductController", urlPatterns = {"/CreateProductController"})
public class CreateProductController extends HttpServlet {

    private static final String ERROR = "WEB-INF\\createProduct.jsp";
    private static final String SUCCESS = "ProductController";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String productID = request.getParameter("productID");
            String name = request.getParameter("name");
            String categoryID = request.getParameter("categoryID");
            String descr = request.getParameter("descr");
            String img = request.getParameter("img");
            int quantity = 0;
            if(!request.getParameter("quantity").isEmpty()){
                quantity = Integer.parseInt(request.getParameter("quantity"));
            }
            int price = 0;
            if(!request.getParameter("price").isEmpty()){
                price = Integer.parseInt(request.getParameter("price"));
            }
            String statusID = request.getParameter("statusID");
            String expiration = request.getParameter("expiration");
            ProductDAO productDAO = new ProductDAO();
            CategoryDAO categoryDAO = new CategoryDAO();
            ProductError productError = new ProductError();
            boolean check = true;
            if(productID.length() < 3 || productID.length() > 50){
                productError.setProductID("Product ID must be [3,50]");
                check = false;
            }
            boolean checkProductID = productDAO.checkDuplicate(productID);
            if(checkProductID){
                productError.setCategoryID("Product ID is not exist");
                check = false;
            }
            if(name.length() < 3 || name.length() >20){
                productError.setName("Name must be [3,20]");
                check = false;
            }
            if(categoryID.length() < 3 || categoryID.length() > 50){
                productError.setCategoryID("Category ID must be [3,50]");
                check = false;
            }
            boolean checkCategoryID = categoryDAO.checkDuplicate(categoryID);
            if(!checkCategoryID){
                productError.setCategoryID("Category ID is not exist");
                check = false;
            }
            
            if(descr.length() < 3 || descr.length() > 50){
                productError.setDescr("Description must be [3,50]");
                check = false;
            }
            if(img.isEmpty()){
                productError.setImg("Image must be not empty");
                check = false;
            }
            if(statusID.isEmpty()){
                productError.setStatusID("Status must be choosed");
                check = false;
            }
            if(quantity < 1 || quantity > 9999){
                productError.setQuantity("Quantity must be [1,9999]");
                check = false;
            }
            if(price < 1 || price > 100000000){
                productError.setPrice("Price must be [1,9999]");
                check = false;
            }
            try{
                DateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
                formatter.setLenient(false);
                formatter.parse(expiration);
            }catch(Exception e){
                productError.setExpiration("Invalid date");
                check = false;
            }
            if(check){
                boolean checkInsert = productDAO.createProduct(new ProductDTO(productID, name, categoryID, descr, img, quantity, price, statusID, expiration));
                if (checkInsert) {
                    url = SUCCESS;
                }
            }else{
                request.setAttribute("PRODUCT_ERROR", productError);
            }

        } catch (Exception e) {
            log("Error at LoginController: " + e.toString());
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
