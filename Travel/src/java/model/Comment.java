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
public class Comment {
    
    private int id, articleID, userID;
    private String username, content;
    private Timestamp createdAt;
    
    public Comment() {
    }

    public Comment(int id, int articleID, int userID, String content) {
        this.id = id;
        this.articleID = articleID;
        this.userID = userID;
        this.content = content;
    }

    public Comment(int id, int articleID, int userID, String username, String content, Timestamp createdAt) {
        this.id = id;
        this.articleID = articleID;
        this.userID = userID;
        this.username = username;
        this.content = content;
        this.createdAt = createdAt;
    }
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getArticleID() {
        return articleID;
    }

    public void setArticleID(int articleID) {
        this.articleID = articleID;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Timestamp getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Timestamp createdAt) {
        this.createdAt = createdAt;
    }
    
}
