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
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Comment;

/**
 *
 * @author Phuc Do
 */
public class CommentDAO extends IDAO<Comment> {

    public CommentDAO() {
        Connection conn = DBconnect.getConnection();
        try {
            this.statement = conn.createStatement();
        } catch (SQLException e) {
        }
    }

    public ArrayList<Comment> getCommentByArticleID(int articleID) {
        ArrayList<Comment> list = new ArrayList<>();
        String sql = "SELECT comment.*, user.username FROM comment, user WHERE comment.user_id = user.id AND comment.article_id ='" + articleID + "' ORDER BY comment.created_at DESC";
        try {
            rs = statement.executeQuery(sql);
            while (rs.next()) {
                Comment comment;
                comment = new Comment(
                        rs.getInt("id"),
                        rs.getInt("article_id"),
                        rs.getInt("user_id"),
                        rs.getString("username"),
                        rs.getString("content"),
                        rs.getTimestamp("created_at")
                );
                list.add(comment);
            }
        } catch (SQLException ex) {
            Logger.getLogger(CommentDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    @Override
    public ArrayList<Comment> selectAll() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public ArrayList<Comment> selectByName(String name) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int insert(Comment object) {
        Connection conn = DBconnect.getConnection();
        Date date = new Date();
        DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String dateString = df.format(date);
        String sql = "INSERT INTO `comment`(`article_id`, `user_id`, `content`, `created_at`) VALUES (?,?,?,?)";
        try {
            PreparedStatement ps = conn.prepareCall(sql);
//            this.preStatement = conn.prepareStatement(sql);
            ps.setInt(1, object.getArticleID());
            ps.setInt(2, object.getUserID());
            ps.setString(3, object.getContent());
            ps.setString(4, dateString);
            ps.executeUpdate();
            return 1;
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }
    
    @Override
    public int update(Comment object) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int delete(Comment object) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void closeConnection() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}
