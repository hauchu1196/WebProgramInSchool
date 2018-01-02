/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package connect;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author Phuc Do
 */
public class DBconnect {

    public static Connection getConnection() {
        Connection conn = null;
        try {
//            Class.forName("com.mysql.jdbc.Driver");
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            String host = "localhost";
            int port = 3306;
            String dbName = "travel";
            String user = "root";
            String password = "";
            String dbPath = String.format("jdbc:mysql://%s:%d/%s?user=%s&password=%s&characterEncoding=utf-8&" + "useUnicode=true", host, port, dbName, user, password);
            conn = java.sql.DriverManager.getConnection(dbPath);
//            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/travel", "root", "");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return conn;
    }

    public static void main(String[] args) {
        System.out.println(getConnection());
    }
}
