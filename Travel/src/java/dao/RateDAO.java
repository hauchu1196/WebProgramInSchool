/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import connect.DBconnect;
import java.sql.ResultSet;
//import java.sql.Date;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Article;
import model.Rate;
import model.User;

/**
 *
 * @author Phuc Do
 */
public class RateDAO extends IDAO<Rate> {

    public RateDAO() {
        conn = DBconnect.getConnection();
        try {
            this.statement = conn.createStatement();
        } catch (SQLException e) {
        }
    }

    @Override
    public ArrayList<Rate> selectAll() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public ArrayList<Rate> selectByName(String name) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    public Rate selectByArticleUser(Article article, User user) {
        conn = DBconnect.getConnection();
        String sql = "SELECT * FROM `rate` WHERE article_id=? AND user_id=?";
        try {
            this.preStatement = this.conn.prepareStatement(sql);
            this.preStatement.setInt(1, article.getId());
            this.preStatement.setInt(2, user.getId());
            ResultSet rs = this.preStatement.executeQuery();
            if (rs.next()) {
                int rate = rs.getInt("rate");
                return new Rate(article, user, rate);
            }
        } catch (SQLException ex) {
            Logger.getLogger(RateDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    @Override
    public int insert(Rate rate) {
        conn = DBconnect.getConnection();
        String sql = "INSERT INTO `rate`(`article_id`, `user_id`, `rate`) VALUES  (?,?,?)";
        try {
            this.preStatement = this.conn.prepareStatement(sql);
            this.preStatement.setInt(1, rate.getArticle().getId());
            this.preStatement.setInt(2, rate.getUser().getId());
            this.preStatement.setInt(3, rate.getRate());
            this.preStatement.executeUpdate();
            return 1;
        } catch (SQLException ex) {
            Logger.getLogger(RateDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    @Override
    public int update(Rate rate) {
        conn = DBconnect.getConnection();
        String sql = "UPDATE `rate` SET `rate`=? WHERE article_id=? AND user_id=?";
        try {
            this.preStatement = this.conn.prepareStatement(sql);
            this.preStatement.setInt(1, rate.getRate());
            this.preStatement.setInt(2, rate.getArticle().getId());
            this.preStatement.setInt(3, rate.getUser().getId());
            this.preStatement.executeUpdate();
            return 1;
        } catch (SQLException ex) {
            Logger.getLogger(RateDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    @Override
    public int delete(Rate object) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void closeConnection() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }


}
