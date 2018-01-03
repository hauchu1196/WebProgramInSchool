/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Timestamp;

/**
 *
 * @author Phuc Do
 */
public class User {

    private int id;
    private String name, email, username, password;
    private int role;
    private Timestamp created_at, updated_at;

    public User() {
    }
    
    public User(String username, String password) {
        this.username = username;
        this.password = password;
    }
    
    public User(int id, String name, String email, String username, String password, Timestamp created_at, int role) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.username = username;
        this.password = password;
        this.created_at = created_at;
        this.role = role;
    }

    public User(int id, String name, String email, String username, String password, int role, Timestamp created_at, Timestamp updated_at) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.username = username;
        this.password = password;
        this.role = role;
        this.created_at = created_at;
        this.updated_at = updated_at;
    }

    public Timestamp getUpdated_at() {
        return updated_at;
    }

    public void setUpdated_at(Timestamp updated_at) {
        this.updated_at = updated_at;
    }

    
    

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Timestamp getCreated_at() {
        return created_at;
    }

    public void setCreated_at(Timestamp created_at) {
        this.created_at = created_at;
    }

    public int getRole() {
        return role;
    }

    public void setRole(int role) {
        this.role = role;
    }

    public String toString() {
        return "User{" + "id=" + id + ", name=" + name + ", email=" + email + ", username=" + username + ", password=" + password + ", role=" + role + ", created_at=" + created_at + '}';
    }
    
    

}
