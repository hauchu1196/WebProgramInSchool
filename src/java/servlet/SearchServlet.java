/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import dao.ArticleDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.Normalizer;
import java.util.ArrayList;
import java.util.regex.Pattern;
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
public class SearchServlet extends HttpServlet {

    private ArticleDAO articleDAO = new ArticleDAO();

 public static String removeAccent(String s) {
  
  String temp = Normalizer.normalize(s, Normalizer.Form.NFD);
  Pattern pattern = Pattern.compile("\\p{InCombiningDiacriticalMarks}+");
  return pattern.matcher(temp).replaceAll("");
 }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String key = SearchServlet.removeAccent(request.getParameter("key"));
        ArrayList<Article> list = new ArrayList<>();
        list = articleDAO.selectByName(key);
        request.setAttribute("list_article", list);
        RequestDispatcher dispatcher = request.getRequestDispatcher("search.jsp");
        dispatcher.forward(request, response);
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
