/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import connect.DBconnect;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Article;

/**
 *
 * @author Phuc Do
 */
public class ArticleDAO extends IDAO<Article> {

    public ArticleDAO() {
        Connection conn = DBconnect.getConnection();
        try {
            this.statement = conn.createStatement();
        } catch (SQLException e) {
        }
    }

    public Article getArticleByLink(String link) {
        Article article = new Article();
        String sql = "SELECT * FROM article WHERE link = '" + link + "'";
        try {
            rs = statement.executeQuery(sql);
            while (rs.next()) {
                article.setId(rs.getInt("id"));
                article.setCategory(rs.getInt("category_id"));
                article.setTitle(rs.getString("title"));
                article.setLink(rs.getString("link"));
                article.setContent(rs.getString("content"));
                article.setThumbnail(rs.getString("url_thumbnail"));
                article.setCreated_at(rs.getTimestamp("created_at"));
                article.setView(rs.getInt("view"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(ArticleDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return article;
    }

    public ArrayList<Article> getArticleByCategory(int idCategory) {
        ArrayList<Article> list = new ArrayList<>();
        String sql = "SELECT * FROM article WHERE category_id = '" + idCategory + "'";
        try {
            rs = statement.executeQuery(sql);
            while (rs.next()) {
                Article article;
                article = new Article(
                        rs.getInt("id"),
                        rs.getInt("category_id"),
                        rs.getString("title"),
                        rs.getString("link"),
                        rs.getString("content"),
                        rs.getString("url_thumbnail"),
                        rs.getTimestamp("created_at"),
                        rs.getInt("view")
                );
                list.add(article);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ArticleDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;

    }

    public ArrayList<Article> getArticleByTag(String tag) {
        ArrayList<Article> list = new ArrayList<>();
        String sql = "SELECT article.* FROM article, tag, tag_article WHERE tag.alias LIKE '" + tag + "' AND tag.id = tag_article.tag_id AND tag_article.article_id = article.id";
        try {
            rs = statement.executeQuery(sql);
            while (rs.next()) {
                Article article;
                article = new Article(
                        rs.getInt("id"),
                        rs.getInt("category_id"),
                        rs.getString("title"),
                        rs.getString("link"),
                        rs.getString("content"),
                        rs.getString("url_thumbnail"),
                        rs.getTimestamp("created_at"),
                        rs.getInt("view")
                );
                list.add(article);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ArticleDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public static void main(String[] args) throws SQLException {
        ArticleDAO dao = new ArticleDAO();
        for (Article ds : dao.getArticleByTag("#phai-di")) {
            System.out.println(ds.getId() + "-" + ds.getTitle());
        }
    }

    @Override
    public ArrayList<Article> selectAll() {

        ArrayList<Article> list = new ArrayList<>();
        String sql = "SELECT * FROM article ORDER BY created_at DESC LIMIT 6";

        try {
            rs = statement.executeQuery(sql);
            while (rs.next()) {
                Article article = new Article(
                        rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getTimestamp(7),
                        rs.getInt(8)
                );
                list.add(article);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ArticleDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    @Override
    public ArrayList<Article> selectByName(String name) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int insert(Article object) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int update(Article object) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int delete(Article object) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void closeConnection() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}
