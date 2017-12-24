/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import dao.CommentDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Comment;

/**
 *
 * @author Phuc Do
 */
public class CommentServlet extends HttpServlet {

    private final CommentDAO commentDAO = new CommentDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        Comment cmt = new Comment();
        cmt.setArticleID(Integer.parseInt(request.getParameter("article_id")));
        cmt.setUserID(Integer.parseInt(request.getParameter("user_id")));
        cmt.setContent(request.getParameter("content"));

        int result = commentDAO.insert(cmt);
        response.getWriter().write(result);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
