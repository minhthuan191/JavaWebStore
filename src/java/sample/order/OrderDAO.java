/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.order;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Random;
import static java.util.stream.DoubleStream.builder;
import sample.product.ProductDTO;
import sample.utils.DBUtil;

/**
 *
 * @author USER
 */
public class OrderDAO {
    public List<OrderDTO> getListOrder() throws SQLException {
        List<OrderDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtil.getConnection();
            if (conn != null) {
                String sql = "SELECT orderID, userID, date, total FROM tblOrders";
                stm = conn.prepareStatement(sql);
                rs = stm.executeQuery();
                while (rs.next()) {
                    String orderID = rs.getString("orderID");
                    String userID = rs.getString("userID");
                    String date = rs.getString("date");
                    int total = Integer.parseInt(rs.getString("total"));
                    OrderDTO order = new OrderDTO(orderID, userID, date, total);      
                    list.add(order);
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
    
    public OrderDTO createOrder(String userID, int total) throws SQLException{
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd/MM/yyy");  
        LocalDateTime now = LocalDateTime.now();  
        OrderDTO order = new OrderDTO();
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBUtil.getConnection();
            if (conn != null) {
                String sql = "INSERT INTO tblOrders (orderID, userID, date, total) VALUES (?,?,?,?);";
                stm = conn.prepareStatement(sql);
                String orderID = generateID();
                stm.setString(1, orderID);
                stm.setString(2, userID);
                stm.setString(3, dtf.format(now));
                stm.setInt(4, total );
                
                check = stm.executeUpdate() > 0 ? true : false   ;
                if (check){
                    order = new OrderDTO(orderID, userID, dtf.format(now), total);
                }
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
        return order;
        
    };
}
