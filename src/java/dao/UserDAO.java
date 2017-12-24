/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import connect.DBconnect;
import java.util.Date;
//import java.sql.Date;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
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
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public ArrayList<User> selectByName(String name) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int insert(User object) {
        conn = DBconnect.getConnection();
        Date date = new Date();
        DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String dateString = df.format(date);
        String sql = "INSERT INTO `user`(`name`, `email`, `username`, `password`, `created_at`) VALUES  (?,?,?,?,?)";
        try {
            this.preStatement = this.conn.prepareStatement(sql);
            this.preStatement.setString(1, object.getName());
            this.preStatement.setString(2, object.getEmail());
            this.preStatement.setString(3, object.getUsername());
            this.preStatement.setString(4, object.getPassword());
            this.preStatement.setString(5, dateString);
            this.preStatement.executeUpdate();
            return 1;
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    @Override
    public int update(User object) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int delete(User object) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void closeConnection() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
