/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.orderDetail;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import sample.order.OrderDTO;
import sample.utils.DBUtil;

/**
 *
 * @author USER
 */
public class OrderDetailDAO {
    public List<OrderDetailDTO> getListOrderDetail(String ID) throws SQLException {
        List<OrderDetailDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtil.getConnection();
            if (conn != null) {
                String sql = "SELECT orderDetailID ,orderID, productID, quantity, price FROM tblOrderDetails WHERE orderID = ?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, ID);
                rs = stm.executeQuery();
                while (rs.next()) {
                    String orderDetailID = rs.getString("orderDetailID");
                    String orderID = rs.getString("orderID");
                    String productID = rs.getString("productID");
                    int quantity = Integer.parseInt(rs.getString("quantity"));
                    int price = Integer.parseInt(rs.getString("price"));
                    OrderDetailDTO orderDetail = new OrderDetailDTO(orderDetailID, orderID, productID, quantity, price);
                    list.add(orderDetail);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return list;
    }
    
    public String generateID()
    {  
        String chars = "abcdefghijklmnopqrstuvwxyz0123456789";
        String randomID = "";
        StringBuilder builder = new StringBuilder();
        int lenght = 32;
        Random rnd = new Random();
        char[] text = new char[lenght];
        for(int i = 0; i < lenght; i++){
            text[i] = chars.charAt(rnd.nextInt(chars.length()));
        }
        
        for(int i = 0; i< text.length; i++){
            builder.append(text[i]);
            if((i/4 == 2 && i%4 == 0)||(i/4 == 3 && i%4 == 1)||(i/4 == 4 && i%4 == 2)||(i/4 == 5 && i%4 == 3)){
                randomID = builder.insert(i, "-").toString();
            }
        }
        return randomID;
    }
    
    public boolean createOrderDetail(String orderID, String productID, int quantity, int price) throws SQLException{
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBUtil.getConnection();
            if (conn != null) {
                String sql = "INSERT INTO tblOrderDetails (orderDetailID, orderID, productID, quantity, price) VALUES (?, ?, ?, ?, ?);";
                stm = conn.prepareStatement(sql);
                stm.setString(1, generateID());
                stm.setString(2, orderID);
                stm.setString(3, productID);
                stm.setInt(4, quantity);
                stm.setInt(5, price);
               
                
                check = stm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
            
            e.printStackTrace();
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }
}
