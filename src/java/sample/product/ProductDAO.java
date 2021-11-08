/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import sample.user.UserDTO;
import sample.utils.DBUtil;

/**
 *
 * @author USER
 */
public class ProductDAO {

    public List<ProductDTO> getListProduct() throws SQLException {
        List<ProductDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtil.getConnection();
            if (conn != null) {
                String sql = "SELECT productID, name, categoryID, descr, img, quantity, price, statusID, expiration FROM tblProducts";
                stm = conn.prepareStatement(sql);
                rs = stm.executeQuery();
                while (rs.next()) {
                    String productID = rs.getString("productID");
                    String name = rs.getString("name");
                    String categoryID = rs.getString("categoryID");
                    String descr = rs.getString("descr");
                    String img = rs.getString("img");
                    int quantity = Integer.parseInt(rs.getString("quantity"));
                    int price = Integer.parseInt(rs.getString("price"));
                    String statusID = rs.getString("statusID");
                    String expiration = rs.getString("expiration");
                    ProductDTO product = new ProductDTO(productID, name, categoryID, descr, img, quantity, price, statusID, expiration);
                    
                    SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
                    String timeNow = sdf.format(Calendar.getInstance().getTime());
                    String exp = product.expiration;
                    System.out.println(exp);
                    boolean a = sdf.parse(product.expiration).before(sdf.parse(timeNow));
                    if(sdf.parse(product.expiration).before(sdf.parse(timeNow))){
                        product.setStatusID("1");
                        String sqlStat = "UPDATE tblProducts (statusID) VALUES (?) WHERE productID = ?";
                        stm = conn.prepareStatement(sqlStat);
                        stm.setString(1, product.getStatusID());
                        stm.setString(2, product.getProductID());
                    }
                    
                    list.add(product);
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
    
    public ProductDTO getProductByID(String productID) throws SQLException{
        ProductDTO product = new ProductDTO();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtil.getConnection();
            if (conn != null) {
                String sql = "SELECT  name, categoryID, descr, img, quantity, price, statusID, expiration FROM tblProducts WHERE productID = ?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, productID);
                rs = stm.executeQuery();
                if (rs.next()) {
                    product.productID = productID;
                    product.name = rs.getString("name");
                    product.categoryID = rs.getString("categoryID");
                    product.descr = rs.getString("descr");
                    product.img = rs.getString("img");
                    product.quantity = Integer.parseInt(rs.getString("quantity"));
                    product.price = Integer.parseInt(rs.getString("price"));
                    product.statusID = rs.getString("statusID");
                    product.expiration = rs.getString("expiration");
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
        return product;
    }

    public boolean updateProduct(ProductDTO product) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBUtil.getConnection();
            if (conn != null) {
                String sql = "UPDATE tblProducts SET name=?, descr =?, img =?, quantity=?, price=?, statusID=?, expiration = ? WHERE productID = ?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, product.getName());
                stm.setString(2, product.getDescr());
                stm.setString(3, product.getImg());
                stm.setInt(4, product.getQuantity());
                stm.setInt(5, product.getPrice());
                stm.setString(6, product.getStatusID());
                stm.setString(7, product.getExpiration());
                stm.setString(8, product.getProductID());
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
    
    public boolean createProduct(ProductDTO product) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBUtil.getConnection();
            if (conn != null) {
                String sql = "INSERT INTO tblProducts (productID, name, categoryID, descr, img, quantity, price, statusID, expiration) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);";
                stm = conn.prepareStatement(sql);
                stm.setString(1, product.getProductID());
                stm.setString(2, product.getName());
                stm.setString(3, product.getCategoryID());
                stm.setString(4, product.getDescr());
                stm.setString(5, product.getImg());
                stm.setInt(6, product.getQuantity());
                stm.setInt(7, product.getPrice());
                stm.setString(8, product.getStatusID());
                stm.setString(9, product.getExpiration());
                
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
    
    public boolean checkDuplicate(String productID) throws SQLException{
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtil.getConnection();
            if (conn != null) {
                String sql = "SELECT productID FROM tblProducts WHERE productID = ?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, productID);
                rs= stm.executeQuery();
                if(rs.next()){
                    check = true;
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
        return check;
        
    }
}
