/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet.admin;

import dao.CategoryDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Category;

/**
 *
 * @author Hau
 */
public class CategoryServlet extends HttpServlet {

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

    @Override
    public void init() throws ServletException {
        super.init(); //To change body of generated methods, choose Tools | Templates.
        categoryDAO = new CategoryDAO();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        response.sendRedirect("/travel/admin/category.jsp");
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

        processRequest(request, response);
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
        response.setContentType("application/json;charset=UTF-8");
        PrintWriter out = response.getWriter();
        ArrayList<Category> categories = categoryDAO.selectAll();
        System.out.println(request.getParameter("order[0][column]"));
        // order[0][dir]
        categories = sortCategory(categories, request.getParameter("order[0][column]"), request.getParameter("order[0][dir]"));
        StringBuilder json = new StringBuilder();
        json.append("{\"data\":[ ");
        for (Category category : categories) {
            json.append(category.toDatatable());
            json.append(",");
        }
        json.deleteCharAt(json.length() - 1);
        json.append("]}");
        out.println(json.toString());
    }

    ArrayList<Category> sortCategory(ArrayList<Category> list, String column, String type) {
        int iColumn = Integer.valueOf(column);
        switch (iColumn) {
            case 0:
                list.sort(new Comparator<Category>() {
                    @Override
                    public int compare(Category o1, Category o2) {
                        return o1.getId() - o2.getId();
                    }
                });
                break;
            case 1:
                list.sort(new Comparator<Category>() {
                    @Override
                    public int compare(Category o1, Category o2) {
                        return o1.getName().compareTo(o2.getName());
                    }
                });
                break;
            case 2:
                list.sort(new Comparator<Category>() {
                    @Override
                    public int compare(Category o1, Category o2) {
                        return o1.getAlias().compareTo(o2.getAlias());
                    }
                });
                break;
        }
        if (type.equals("desc")) {
            Collections.reverse(list);
        }
        return list;
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
