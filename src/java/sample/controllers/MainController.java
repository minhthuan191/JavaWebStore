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

/**
 *
 * @author USER
 */
@WebServlet(name = "MainController", urlPatterns = {"/MainController"})
public class MainController extends HttpServlet {
    
    private static final String ERROR="WEB-INF\\error.jsp";
    private static final String LOGIN="LoginController";
    private static final String SEARCH="SearchController";
    private static final String LOGOUT="LogoutController";
    private static final String DELETE="DeleteController";
    private static final String UPDATE="UpdateController";
    private static final String REGISTER="RegisterController";
    private static final String SHOW_REGISTER="WEB-INF\\register.jsp";
    private static final String PRODUCT="ProductController";
    private static final String UPDATE_PRODUCT="UpdateProductController";
    private static final String CREATE_PRODUCT="CreateProductController";
    private static final String NEW_PRODUCT="WEB-INF\\createProduct.jsp";
    private static final String CATEGORY="CategoryController";
    private static final String UPDATE_CATEGORY="UpdateCategoryController";
    private static final String CREATE_CATEGORY="CreateCategoryController";
    private static final String NEW_CATEGORY="WEB-INF\\createCategory.jsp";
    private static final String ADD_TO_CART = "AddToCartController";
    private static final String HOME="WEB-INF\\home.jsp";
    private static final String REMOVE = "RemoveCartItemController";
    private static final String EDIT = "EditQuantityController";
    private static final String ORDER = "OrderController";
    private static final String ORDER_DETAIL = "OrderDetailController";
    private static final String CHECK_OUT = "CheckOutController";
    
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url=ERROR;
        try{
           String action = request.getParameter("action");
           if("Login".equals(action)){
               url= LOGIN;
           }
           else if("Search".equals(action)){
               url = SEARCH;
            }
           else if("Logout".equals(action)){
               url = LOGOUT;
           }
           else if("Delete".equals(action)){
               url = DELETE;
           }
           else if("Update".equals(action)){
               url = UPDATE;
           }
           else if("Register".equals(action)){
               url = REGISTER;
           }
           else if("Product".equals(action)){
               url = PRODUCT;
           }
           else if("UpdateProduct".equals(action)){
               url = UPDATE_PRODUCT;
           }
           else if("CreateProduct".equals(action)){
               url = CREATE_PRODUCT;
           }
           else if("NewProduct".equals(action)){
               url = NEW_PRODUCT;
           }
           else if("Category".equals(action)){
               url = CATEGORY;
           }
           else if("UpdateCategory".equals(action)){
               url = UPDATE_CATEGORY;
           }
           else if("CreateCategory".equals(action)){
               url = CREATE_CATEGORY;
           }
           else if("NewCategory".equals(action)){
               url = NEW_CATEGORY;
           }
           else if("AddToCart".equals(action)){
               url = ADD_TO_CART;
           }
           else if("Home".equals(action)){
               url = HOME;
           }
           else if("Remove".equals(action)){
               url = REMOVE;
           }
           else if("Edit".equals(action)){
               url = EDIT;
           }
           else if("Order".equals(action)){
               url = ORDER;
           }
           else if("ViewDetail".equals(action)){
               url = ORDER_DETAIL;
           }
           else if("CheckOut".equals(action)){
               url = CHECK_OUT;
           }
           else if("ShowRegister".equals(action)){
               url = SHOW_REGISTER;
           }
           else{
               HttpSession session = request.getSession();
               session.setAttribute("ERROR_MESSAGE", "Fuction is not support");
           }
       }catch(Exception e){
           log("Error at MainController: "+e.toString());
       }finally{
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
