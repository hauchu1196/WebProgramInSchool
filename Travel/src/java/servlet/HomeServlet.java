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
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Article;

/**
 *
 * @author Phuc Do
 */
public class HomeServlet extends HttpServlet {

    private ArticleDAO articleDAO = new ArticleDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setCharacterEncoding("UTF8"); // this line solves the problem
        response.setContentType("application/json");
        String tag = request.getParameter("tag");
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
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
