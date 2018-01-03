/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import dao.ArticleDAO;
import dao.CommentDAO;
import dao.RateDAO;
import dao.TagDAO;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Article;
import model.Comment;
import model.Rate;
import model.Tag;
import model.User;

/**
 *
 * @author Phuc Do
 */
public class ArticleServlet extends HttpServlet {

    private final ArticleDAO articleDAO = new ArticleDAO();
    private final TagDAO tagDAO = new TagDAO();
    private final CommentDAO commentDAO = new CommentDAO();
    private RateDAO rateDAO = new RateDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.valueOf(request.getParameter("id"));
        Article article = articleDAO.getArticleById(id);
        ArrayList<Tag> listTag = new ArrayList<>();
        ArrayList<Comment> listComment = new ArrayList<>();
        listTag = tagDAO.getTagByArticleId(id);
        listComment = commentDAO.getCommentByArticleID(id);
        request.setAttribute("article", article);
        request.setAttribute("list_tag", listTag);
        request.setAttribute("list_comment", listComment);

        User user = (User) request.getSession().getAttribute("user");
        if (user != null) {
            Rate rate = rateDAO.selectByArticleUser(article, user);
            request.setAttribute("rate", rate);
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher("article.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Article article = articleDAO.getArticleById(id);
        User user = (User) request.getSession().getAttribute("user");
        int rating = Integer.parseInt(request.getParameter("rating"));

        Rate rate = new Rate(article, user, rating);
        if (rateDAO.selectByArticleUser(article, user) == null) {
            rateDAO.insert(rate);
        } else {
            rateDAO.update(rate);
        }
        response.sendRedirect("/travel/article?id=" + id + "#rate");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
