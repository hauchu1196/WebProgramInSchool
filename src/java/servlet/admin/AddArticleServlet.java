/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet.admin;

import dao.ArticleDAO;
import dao.CategoryDAO;
import dao.TagDAO;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Article;
import model.Category;

/**
 *
 * @author Hau
 */
public class AddArticleServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private CategoryDAO categoryDAO;
    private ArticleDAO articleDAO;
    private TagDAO tagDAO;

    @Override
    public void init() throws ServletException {
        super.init(); //To change body of generated methods, choose Tools | Templates.
        this.categoryDAO = new CategoryDAO();
        this.articleDAO = new ArticleDAO();
        this.tagDAO = new TagDAO();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        response.sendRedirect("/travel/admin/addArticle.jsp");
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
        ArrayList<Category> categories = categoryDAO.selectAll();
        request.setAttribute("categories", categories);
        request.getRequestDispatcher("/admin/addArticle.jsp").forward(request, response);
//        processRequest(request, response);
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
        String title = request.getParameter("title");
        String link = request.getParameter("link");
        String idCategory = request.getParameter("category");
        String tags = request.getParameter("tags");
        String thumbnail = request.getParameter("thumbnail");
        String content = request.getParameter("content");
        String lat = request.getParameter("lat");
        String lng = request.getParameter("long");
        String location = request.getParameter("location");

        Article article = new Article(title, link, idCategory, thumbnail, content);
        article.setLongitude(lng);
        article.setLatitude(lat);
        article.setLocationDetail(location);
        try {
            articleDAO.insertArticle(article, tags);
//        processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(AddArticleServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
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
