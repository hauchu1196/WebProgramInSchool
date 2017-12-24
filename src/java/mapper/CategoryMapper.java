/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mapper;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Category;

/**
 *
 * @author Hau
 */
public class CategoryMapper {

    public static Category toCategory(ResultSet rs) {
        try {
            return new Category(rs.getInt("id"), rs.getString("name"), rs.getString("alias"));
        } catch (SQLException ex) {
            Logger.getLogger(CategoryMapper.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
}
