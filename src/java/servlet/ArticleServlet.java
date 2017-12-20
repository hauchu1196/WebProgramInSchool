/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import dao.ArticleDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Article;
import model.Category;

/**
 *
 * @author Phuc Do
 */
public class ArticleServlet extends HttpServlet {

    private ArticleDAO articleDAO = new ArticleDAO();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ArticleServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ArticleServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setCharacterEncoding("UTF8"); // this line solves the problem
        response.setContentType("application/json");
        String tag = request.getParameter("tag");
        System.out.println(tag);
        ArrayList<Article> list = new ArrayList<>();
        switch (tag) {
            case "du-lich":
                list = articleDAO.getArticleByCategory(1);
                break;
            case "an-uong":
                list = articleDAO.getArticleByCategory(2);
                break;
            default:
                list = articleDAO.getArticleByTag(tag);
                break;
        }
        if (list != null) {
            PrintWriter outPrintWriter = response.getWriter();
            Gson g = new GsonBuilder().disableHtmlEscaping().create();
            g.toJson(list, outPrintWriter);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
