/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import connect.DBconnect;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import mapper.CategoryMapper;
import model.Category;

/**
 *
 * @author Hau
 */
public class CategoryDAO extends IDAO<Category>{

    public CategoryDAO() {
        this.conn = DBconnect.getConnection();
        try {
            this.statement = conn.createStatement();
        } catch (SQLException ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    @Override
    public ArrayList<Category> selectAll() {
        ArrayList<Category> categories = new ArrayList<>();
        String sql = "Select * from category";
        try {
            preStatement = conn.prepareStatement(sql);
            rs = preStatement.executeQuery();
            while(rs.next()) {
                categories.add(CategoryMapper.toCategory(rs));
            }
        } catch (SQLException ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return categories;
        
    }

    @Override
    public ArrayList<Category> selectByName(String name) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int insert(Category object) {
        String sql = "insert into category (name, alias) values (?, ?)";
        try {
            preStatement = conn.prepareStatement(sql);
            preStatement.setString(1, object.getName());
            preStatement.setString(2, object.getAlias());
            preStatement.executeQuery();
            return 1;
        } catch (SQLException ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    @Override
    public int update(Category object) {
        String sql = "update category set name = ?, alias = ? where id = ?";
        try {
            preStatement = conn.prepareStatement(sql);
            preStatement.setString(1, object.getName());
            preStatement.setString(2, object.getAlias());
            preStatement.setInt(3, object.getId());
            return 1;
        } catch (SQLException ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    @Override
    public int delete(Category object) {
        String sql = "delete from category where id = ?";
        try {
            preStatement = conn.prepareStatement(sql);
            preStatement.setInt(1, object.getId());
            return 1;
        } catch (SQLException ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    @Override
    public void closeConnection() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
