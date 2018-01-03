/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import connect.DBconnect;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Category;
import model.Tag;

/**
 *
 * @author Hau
 */
public class TagDAO extends IDAO<Tag>{
    
    public TagDAO() {
        this.conn = DBconnect.getConnection();
        try {
            this.statement = conn.createStatement();
        } catch (SQLException e) {
        }
    }

    @Override
    public ArrayList<Tag> selectAll() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    public ArrayList<Tag> getTagByArticleId(int id) {
        ArrayList<Tag> list = new ArrayList<>();
        String sql = "SELECT tag.id , tag.category_id, tag.name, tag.alias FROM tag_article, tag WHERE tag_article.tag_id = tag.id AND tag_article.article_id = '" + id + "'";
        try {
            rs = statement.executeQuery(sql);
            while (rs.next()) {
                Tag tag = new Tag();
                tag.setId(rs.getInt("id"));
                tag.setIdCategory(rs.getInt("category_id"));
                tag.setName(rs.getString("name"));
                tag.setAlias(rs.getString("alias"));
                list.add(tag);
            }
        } catch (SQLException ex) {
            Logger.getLogger(TagDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    
    public ArrayList<Tag> findTagByIdCategory(int idCategory) {
        ArrayList<Tag> tags = new ArrayList<>();
        String sql = "select * from tag where category_id = ?";
        try {
            this.preStatement = conn.prepareStatement(sql);
            this.preStatement.setInt(1, idCategory);
            rs = this.preStatement.executeQuery();
            while(rs.next()) {
                tags.add(new Tag(rs.getInt("id"), rs.getInt("category_id"), rs.getString("name"), rs.getString("alias")));
            }
        } catch (SQLException ex) {
            Logger.getLogger(TagDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return tags;
    }

    @Override
    public ArrayList<Tag> selectByName(String name) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int insert(Tag object) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int update(Tag object) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int delete(Tag object) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void closeConnection() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    public static void main(String[] args) {
        TagDAO tagDAO = new TagDAO();
        System.out.println(tagDAO.findTagByIdCategory(1).toString());
        
    }
    
}
