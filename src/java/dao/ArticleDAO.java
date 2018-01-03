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
import model.Category;
import model.Tag;

/**
 *
 * @author Phuc Do
 */
public class ArticleDAO extends IDAO<Article> {

    public ArticleDAO() {
        this.conn = DBconnect.getConnection();
        try {
            this.statement = conn.createStatement();
        } catch (SQLException e) {
        }
    }

    public Article getArticleByLink(String link) {
        Article article = new Article();
        String sql = "SELECT * FROM article a join category c on c.id = a.category_id WHERE link = '" + link + "'";
        try {
            rs = statement.executeQuery(sql);
            while (rs.next()) {
                article.setId(rs.getInt("id"));
                article.setCategory(new Category(rs.getInt("category_id"), rs.getString("name"), rs.getString("alias")));
                article.setTitle(rs.getString("title"));
                article.setLink(rs.getString("link"));
                article.setContent(rs.getString("content"));
                article.setThumbnail(rs.getString("url_thumbnail"));
                article.setCreated_at(rs.getTimestamp("created_at"));
                article.setView(rs.getInt("view"));
                article.setLatitude(rs.getString("latitude"));
                article.setLongitude(rs.getString("longitude"));
                article.setLocationDetail(rs.getString("locationDetail"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(ArticleDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return article;
    }

    public ArrayList<Article> getArticleByCategory(int idCategory) {
        ArrayList<Article> list = new ArrayList<>();
        String sql = "SELECT * FROM article a join category c on c.id = a.category_id WHERE category_id = '" + idCategory + "'";
        try {
            rs = statement.executeQuery(sql);
            while (rs.next()) {
                Article article;
                article = new Article(
                        rs.getInt("id"),
                        new Category(rs.getInt("category_id"), rs.getString("name"), rs.getString("alias")),
                        rs.getString("title"),
                        rs.getString("content"),
                        rs.getString("link"),
                        rs.getString("url_thumbnail"),
                        rs.getTimestamp("created_at"),
                        rs.getInt("view")
                );
                article.setLatitude(rs.getString("latitude"));
                article.setLongitude(rs.getString("longitude"));
                article.setLocationDetail(rs.getString("locationDetail"));
                list.add(article);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ArticleDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;

    }

    public ArrayList<Article> getArticleByTag(String tag) {
        ArrayList<Article> list = new ArrayList<>();
        String sql = "SELECT a.*, c.* FROM article a join tag_article ta on ta.article_id = a.id join tag t on ta.tag_id = t.id\n"
                + "join category c on c.id = a.category_id WHERE t.alias LIKE '" + tag + "'";
        try {
            rs = statement.executeQuery(sql);
            while (rs.next()) {
                Article article;
                article = new Article(
                        rs.getInt("id"),
                        new Category(rs.getInt("category_id"), rs.getString("name"), rs.getString("alias")),
                        rs.getString("title"),
                        rs.getString("content"),
                        rs.getString("link"),
                        rs.getString("url_thumbnail"),
                        rs.getTimestamp("created_at"),
                        rs.getInt("view")
                );
                article.setLatitude(rs.getString("latitude"));
                article.setLongitude(rs.getString("longitude"));
                article.setLocationDetail(rs.getString("locationDetail"));
                list.add(article);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ArticleDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public static void main(String[] args) throws SQLException {
        ArticleDAO dao = new ArticleDAO();
        System.out.println(dao.getById(7).toString());
    }

    @Override
    public ArrayList<Article> selectAll() {

        ArrayList<Article> list = new ArrayList<>();
        String sql = "SELECT * FROM article a join category c on c.id = a.category_id ORDER BY created_at DESC LIMIT 6";

        try {
            rs = statement.executeQuery(sql);
            while (rs.next()) {
                Article article = new Article(
                        rs.getInt("id"),
                        new Category(rs.getInt("category_id"), rs.getString("name"), rs.getString("alias")),
                        rs.getString("title"),
                        rs.getString("link"),
                        rs.getString("content"),
                        rs.getString("url_thumbnail"),
                        rs.getTimestamp("created_at"),
                        rs.getInt("view")
                );
                article.setLatitude(rs.getString("latitude"));
                article.setLongitude(rs.getString("longitude"));
                article.setLocationDetail(rs.getString("locationDetail"));
                list.add(article);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ArticleDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public ArrayList<Article> getAll() {
        ArrayList<Article> list = new ArrayList<>();
        String sql = "SELECT * FROM article a join category c on c.id = a.category_id ORDER BY created_at DESC";

        try {
            rs = statement.executeQuery(sql);
            while (rs.next()) {
                Article article = new Article(
                        rs.getInt("id"),
                        new Category(rs.getInt("category_id"), rs.getString("name"), rs.getString("alias")),
                        rs.getString("title"),
                        rs.getString("content"),
                        rs.getString("link"),
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

    public Article getById(int id) {
        Article article = new Article();
        String sql = "select * from article a join category c on a.category_id = c.id where a.id = ?";
        try {
            preStatement = conn.prepareStatement(sql);
            preStatement.setInt(1, id);
            rs = preStatement.executeQuery();
            while (rs.next()) {
                article = new Article(id, new Category(rs.getInt("category_id"), rs.getString("name"), rs.getString("alias")),
                        rs.getString("title"), rs.getString("content"), rs.getString("link"), rs.getString("url_thumbnail"),
                        rs.getTimestamp("created_at"), rs.getInt("view"));
                article.setLatitude(rs.getString("latitude"));
                article.setLongitude(rs.getString("longitude"));
                article.setLocationDetail(rs.getString("locationDetail"));
            }
            sql = "select * from tag t join tag_article ta on t.id = ta.tag_id where ta.article_id = ?";
            preStatement = conn.prepareStatement(sql);
            preStatement.setInt(1, id);
            rs = preStatement.executeQuery();
            while (rs.next()) {
                Tag tag = new Tag(rs.getInt("t.id"), rs.getInt("t.category_id"), rs.getString("t.name"), rs.getString("t.alias"));
                article.getTags().add(tag);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ArticleDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return article;
    }

    public Article getArticleById(int id) {
        Article article = new Article();
        String sql = "SELECT * FROM article a join category c on a.category_id = c.id WHERE a.id = '" + id + "'";
        try {
            rs = statement.executeQuery(sql);
            while (rs.next()) {
                article.setId(rs.getInt("id"));
                article.setCategory(new Category(rs.getInt("category_id"), rs.getString("name"), rs.getString("alias")));
                article.setTitle(rs.getString("title"));
                article.setLink(rs.getString("link"));
                article.setContent(rs.getString("content"));
                article.setThumbnail(rs.getString("url_thumbnail"));
                article.setCreated_at(rs.getTimestamp("created_at"));
                article.setView(rs.getInt("view"));
                article.setLatitude(rs.getString("latitude"));
                article.setLongitude(rs.getString("longitude"));
                article.setLocationDetail(rs.getString("locationDetail"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(ArticleDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return article;
    }

    @Override
    public ArrayList<Article> selectByName(String name) {
        ArrayList<Article> list = new ArrayList<>();
        String sql = "SELECT * FROM article a join category c on a.category_id = c.id WHERE `title` LIKE '%" + name + "%'";
        try {
            rs = statement.executeQuery(sql);
            while (rs.next()) {
                Article article;
                article = new Article(
                        rs.getInt("id"),
                        new Category(rs.getInt("category_id"), rs.getString("name"), rs.getString("alias")),
                        rs.getString("title"),
                        rs.getString("content"),
                        rs.getString("link"),
                        rs.getString("url_thumbnail"),
                        rs.getTimestamp("created_at"),
                        rs.getInt("view")
                );
                article.setLatitude(rs.getString("latitude"));
                article.setLongitude(rs.getString("longitude"));
                article.setLocationDetail(rs.getString("locationDetail"));
                list.add(article);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ArticleDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    @Override
    public int insert(Article object) {
        String sql = "insert into article (category_id, title, link, content, url_thumbnail, view, latitude, longitude, locationDetail) values (?, ?, ?, ? ,? ,?, ?, ?, ?)";
        try {
            preStatement = conn.prepareStatement(sql);
            preStatement.setInt(1, object.getCategory().getId());
            preStatement.setString(2, object.getTitle());
            preStatement.setString(3, object.getLink());
            preStatement.setString(4, object.getContent());
            preStatement.setString(5, object.getThumbnail());
            preStatement.setInt(6, object.getView());
            preStatement.setString(7, object.getLatitude());
            preStatement.setString(8, object.getLongitude());
            preStatement.setString(9, object.getLocationDetail());
            preStatement.executeUpdate();
            return 1;
        } catch (SQLException ex) {
            Logger.getLogger(ArticleDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public int insertArticle(Article article, String tag) throws SQLException {
        System.out.println("insertArticle");
        insert(article);
        String sql = "insert into tag_article (tag_id, article_id) values (?, ?)";
        preStatement = conn.prepareStatement(sql);
        for (int i = 0; i < tag.length(); i++) {
            preStatement.setInt(1, Integer.valueOf(tag.charAt(i)));
            preStatement.setInt(2, article.getId());
            preStatement.executeUpdate();
            System.out.println(tag.charAt(i));
            try {
                Thread.sleep(300);
            } catch (InterruptedException ex) {
                Logger.getLogger(ArticleDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return 1;

    }

    @Override
    public int update(Article object) {
        System.out.println("update " + object.toString());
        String sql = "update article set category_id = ?, title = ?, link = ?, content = ?, url_thumbnail = ?, latitude = ?, longitude = ?, locationDetail = ? where id = ?";
        try {
            preStatement = conn.prepareStatement(sql);
            preStatement.setInt(1, object.getCategory().getId());
            preStatement.setString(2, object.getTitle());
            preStatement.setString(3, object.getLink());
            preStatement.setString(4, object.getContent());
            preStatement.setString(5, object.getThumbnail());
            preStatement.setInt(6, object.getId());
            preStatement.setString(7, object.getLatitude());
            preStatement.setString(8, object.getLongitude());
            preStatement.setString(9, object.getLocationDetail());
            preStatement.executeUpdate();
            return 1;
        } catch (SQLException ex) {
            Logger.getLogger(ArticleDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public int updateArticle(Article article, String tags) {
        System.out.println("updateArticle");
        update(article);
        String sql = "delete from tag_article where article_id = ?";
        try {
            preStatement = conn.prepareStatement(sql);
            preStatement.setInt(1, article.getId());
            preStatement.executeUpdate();
            for (int i = 0; i < tags.length(); i++) {
                sql = "insert into tag_article (tag_id, article_id) values (" + tags.charAt(i) + ", " + article.getId() + " )";
                statement.executeUpdate(sql);
                try {
                    Thread.sleep(300);
                } catch (InterruptedException ex) {
                    Logger.getLogger(ArticleDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            return 1;
        } catch (SQLException ex) {
            Logger.getLogger(ArticleDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    @Override
    public int delete(Article object) {
        System.out.println("deleteArticle");
        String sql = "delete from article where id = ?";
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
}
