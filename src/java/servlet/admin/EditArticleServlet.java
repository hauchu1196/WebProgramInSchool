/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet.admin;

import dao.ArticleDAO;
import dao.CategoryDAO;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Article;
import model.Category;
import org.apache.commons.lang3.StringEscapeUtils;

/**
 *
 * @author Hau
 */
public class EditArticleServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private ArticleDAO articleDAO;
    private CategoryDAO categoryDAO;
    private String id;

    @Override
    public void init() throws ServletException {
        super.init(); //To change body of generated methods, choose Tools | Templates.
        articleDAO = new ArticleDAO();
        this.categoryDAO = new CategoryDAO();

    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        response.sendRedirect("/travel/admin/editArticle.jsp");
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        id = request.getPathInfo().substring(1);
        Article article = articleDAO.getById(Integer.valueOf(id));
        request.setAttribute("article", article);
        ArrayList<Category> categories = categoryDAO.selectAll();
        request.setAttribute("categories", categories);
        request.getRequestDispatcher("/admin/editArticle.jsp").forward(request, response);
    }
    
    public static void main(String[] args) {
        ArticleDAO articleDAO = new ArticleDAO();
        System.out.println(articleDAO.getById(17).toString());
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Article article = articleDAO.getById(Integer.valueOf(id));
        String title = request.getParameter("title");
        String link = request.getParameter("link");
        String idCategory = request.getParameter("category");
        String tags = request.getParameter("tags");
        String thumbnail = request.getParameter("thumbnail");
        String content = request.getParameter("content");
        
        content = StringEscapeUtils.unescapeHtml4(content);
        article.setTitle(title);
        article.setLink(link);
        article.getCategory().setId(Integer.valueOf(idCategory));
        article.setThumbnail(thumbnail);
        article.setContent(content);

        articleDAO.updateArticle(article, tags);
        response.sendRedirect("/travel/admin/article");
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
