/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import dao.UserDAO;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.User;

/**
 *
 * @author Phuc Do
 */
public class UserServlet extends HttpServlet {

    private final UserDAO userDAO = new UserDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        if (session.getAttribute("user") != null) {
            response.sendRedirect("/travel/");
        } else {
            response.sendRedirect("/travel/");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String command = request.getParameter("command");
        String url = "";
        User user = new User();
        HttpSession session = request.getSession();
        RequestDispatcher rd;
        switch (command) {
            case "register":
                user.setName(request.getParameter("name"));
                user.setEmail(request.getParameter("email"));
                user.setUsername(request.getParameter("username"));
                user.setPassword(request.getParameter("password"));
                userDAO.insert(user);
                session.setAttribute("user", user);
                url = "/index.jsp";
                rd = request.getRequestDispatcher(url);
                rd.forward(request, response);
                break;
            case "login":
                String userName = request.getParameter("username");
                String password = request.getParameter("password");
                User formUser = new User(userName, password);
                user = userDAO.login(formUser);
                if (user != null) {
                    session.setAttribute("user", user);
                    url = "/index.jsp";
                    rd = request.getRequestDispatcher(url);
                    rd.forward(request, response);
                } else {
//                    request.setAttribute("error", "Error email or password!");
//                    url = "/layout/header.jsp";
                    response.getWriter().write("error");
                }
                break;
        }
//        RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
//        rd.forward(request, response);
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
