/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import dao.UserDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Phuc Do
 */
public class CheckEmailServlet extends HttpServlet {

    UserDAO usersDAO = new UserDAO();

    public CheckEmailServlet() {
        usersDAO = new UserDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (usersDAO.checkUser(request.getParameter("username"))) {
            response.getWriter().write("<img src=\"public/img/not-available.png\" />");
        } else {
            response.getWriter().write("<img src=\"public/img/available.png\"/>");
        }
    }

}
