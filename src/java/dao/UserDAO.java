/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import connect.DBconnect;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.Date;
//import java.sql.Date;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.User;

/**
 *
 * @author Phuc Do
 */
public class UserDAO extends IDAO<User> {

    public UserDAO() {
        conn = DBconnect.getConnection();
        try {
            this.statement = conn.createStatement();
        } catch (SQLException e) {
        }
    }

    public boolean checkUser(String user) {
        String sql = "SELECT * FROM user WHERE `username` = '" + user + "'";
        try {
            rs = statement.executeQuery(sql);
            while (rs.next()) {
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public User login(User user) {
        String sql = "SELECT * FROM user WHERE username = '" + user.getUsername() + "' and password = '" + user.getPassword() + "' ;";
        User us = new User();
        try {
            rs = statement.executeQuery(sql);
            if (rs.next()) {
                us.setId(rs.getInt("id"));
                us.setName(rs.getString("name"));
                us.setEmail(rs.getString("email"));
                us.setUsername(rs.getString("username"));
                us.setCreated_at(rs.getTimestamp("created_at"));
                us.setRole(rs.getInt("role"));
                return us;
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    @Override
    public ArrayList<User> selectAll() {
        ArrayList<User> list = new ArrayList<>();
        String sql = "select * from user";
        try {
            rs = statement.executeQuery(sql);
            while (rs.next()) {
                User user = new User(rs.getInt("id"), rs.getString("name"), rs.getString("email"),
                        rs.getString("username"), rs.getString("password"), rs.getInt("role"), rs.getTimestamp("created_at"), rs.getTimestamp("updated_at"));
                list.add(user);
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    @Override
    public ArrayList<User> selectByName(String name) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

        @Override
    public int insert(User object) {
//        conn = DBconnect.getConnection();        
        Connection conn = DBconnect.getConnection();
        Date date = new Date();
        DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String dateString = df.format(date);
        String sql = "INSERT INTO `user`(`name`, `email`, `username`, `password`, `created_at`, `updated_at`, `role`) VALUES (?,?,?,?,?,?,?)";
        try {
            PreparedStatement ps = conn.prepareCall(sql);
            ps.setString(1, object.getName());
            ps.setString(2, object.getEmail());
            ps.setString(3, object.getUsername());
            ps.setString(4, object.getPassword());
            ps.setString(5, dateString);
            ps.setString(6, dateString);
            ps.setInt(7, 0);
            ps.executeUpdate();
            return 1;
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    @Override
    public int update(User object) {
        System.out.println("update");
        System.out.println(object.toString());
        String sql = "update user set name = ?, email = ?, username = ?, updated_at = ? where id = ?";
        try {
            preStatement = conn.prepareStatement(sql);
            preStatement.setString(1, object.getName());
            preStatement.setString(2, object.getEmail());
            preStatement.setString(3, object.getUsername());
            preStatement.setTimestamp(4, new Timestamp(System.currentTimeMillis()));
            preStatement.setInt(5, object.getId());
            preStatement.executeUpdate();
            return 1;
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    @Override
    public int delete(User object) {
        System.out.println("deleteArticle");
        String sql = "delete from user where id = ?";
        try {
            preStatement = conn.prepareStatement(sql);
            preStatement.setInt(1, object.getId());
            preStatement.executeUpdate();
            return 1;
        } catch (SQLException ex) {
            Logger.getLogger(ArticleDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    @Override
    public void closeConnection() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public User findById(int id) {
        User user = new User();
        String sql = "select * from user where id = ?";
        try {
            preStatement = conn.prepareStatement(sql);
            preStatement.setInt(1, id);
            rs = preStatement.executeQuery();
            while(rs.next()) {
                user.setId(rs.getInt("id"));
                user.setEmail(rs.getString("email"));
                user.setName(rs.getString("name"));
                user.setRole(rs.getInt("role"));
                user.setPassword(rs.getString("password"));
                user.setUsername(rs.getString("username"));
                user.setCreated_at(rs.getTimestamp("created_at"));
                user.setUpdated_at(rs.getTimestamp("updated_at"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return user;
    }

}
