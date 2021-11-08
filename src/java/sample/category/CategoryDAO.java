/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.category;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import sample.utils.DBUtil;

/**
 *
 * @author USER
 */
public class CategoryDAO {
    public List<CategoryDTO> getListCategory() throws SQLException {
        List<CategoryDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtil.getConnection();
            if (conn != null) {
                String sql = "SELECT categoryID, categoryName FROM tblCategorys";
                stm = conn.prepareStatement(sql);
                rs = stm.executeQuery();
                while (rs.next()) {
                    
                    String categoryID = rs.getString("categoryID");
                    String categoryName = rs.getString("categoryName");
                    
                    list.add(new CategoryDTO(categoryID, categoryName));
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
    public CategoryDTO getCategoryByID(String categoryID) throws SQLException{
        CategoryDTO category = new CategoryDTO();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtil.getConnection();
            if (conn != null) {
                String sql = "SELECT categoryName FROM tblCategorys WHERE categoryID = ?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, categoryID);
                rs = stm.executeQuery();
                if (rs.next()) {
                    category.categoryID = rs.getString("categoryID");
                    category.categoryName = rs.getString("categoryName");
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
        return category;
    }
    public boolean updateCategory(CategoryDTO category) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBUtil.getConnection();
            if (conn != null) {
                String sql = "UPDATE tblCategorys SET categoryName = ? WHERE categoryID = ?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, category.getCategoryName());
                stm.setString(2, category.getCategoryID());
                check = stm.executeUpdate()>0 ? true:false;
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
    public boolean createCategory(CategoryDTO category) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBUtil.getConnection();
            if (conn != null) {
                String sql = "INSERT INTO tblCategorys (categoryName, categoryID) VALUES (?,?);";
                stm = conn.prepareStatement(sql);
                stm.setString(1, category.getCategoryName());
                stm.setString(2, category.getCategoryID());
                check = stm.executeUpdate()>0 ? true:false;
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
    public boolean checkDuplicate(String id) throws SQLException{
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtil.getConnection();
            if (conn != null) {
                String sql = "SELECT categoryID FROM tblCategorys WHERE categoryID = ?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, id);
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
