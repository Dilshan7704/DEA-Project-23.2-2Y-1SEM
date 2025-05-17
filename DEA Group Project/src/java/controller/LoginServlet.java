package controller;

import dao.AdminDAO;
import dao.EmployeeDAO;
import dao.clientDAO;
import model.Admin;
import model.Client;
import model.Employee;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String userType = request.getParameter("userType");
        
        String redirectPage = "login.jsp";
        String errorMessage = null;
        
        if ("admin".equals(userType)) {
            AdminDAO adminDao = new AdminDAO();
            Admin admin = adminDao.validateAdmin(email, password);
            
            if (admin != null) {
                HttpSession session = request.getSession();
                session.setAttribute("admin", admin);
                redirectPage = "index.jsp";
            } else {
                errorMessage = "Invalid admin credentials!";
            }
        } 
       else if ("client".equals(userType)) {
        clientDAO clientDao = new clientDAO();
        Client client = clientDao.validateClient(email, password);
    
         if (client != null) {
            HttpSession session = request.getSession();
            session.setAttribute("client", client);
            redirectPage = "client_dashboard.jsp";
    }    
         else {
            errorMessage = "Invalid client credentials!";
    }
}
        else if ("employee".equals(userType)) {
    EmployeeDAO employeeDao = new EmployeeDAO();
    Employee employee = employeeDao.validateEmployee(email, password);
    
    if (employee != null) {
        HttpSession session = request.getSession();
        session.setAttribute("employee", employee);
        redirectPage = "employee_dashboard.jsp";
    } else {
        errorMessage = "Invalid employee credentials!";
    }
}
        
        if (errorMessage != null) {
            request.setAttribute("errorMessage", errorMessage);
        }
        
        RequestDispatcher dispatcher = request.getRequestDispatcher(redirectPage);
        dispatcher.forward(request, response);
    }
}


/*package com.nsbm.controller;

import com.nsbm.dao.AdminDAO;
import com.nsbm.dao.EmployeeDAO;
import com.nsbm.dao.clientDAO;
import com.nsbm.model.Admin;
import com.nsbm.model.Client;
import com.nsbm.model.Employee;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String userType = request.getParameter("userType");
        
        String redirectPage = "login.jsp";
        String errorMessage = null;
        
        try {
            switch (userType) {
                case "admin":
                    AdminDAO adminDao = new AdminDAO();
                    Admin admin = adminDao.validateAdmin(email, password);
                    
                    if (admin != null) {
                        HttpSession session = request.getSession();
                        session.setAttribute("admin", admin);
                        redirectPage = "admin_dashboard.jsp";
                    } else {
                        errorMessage = "Invalid admin credentials!";
                    }
                    break;
                    
                case "client":
                    clientDAO clientDao = new clientDAO();
                    Client client = clientDao.validateClient(email, password);
                    
                    if (client != null) {
                        HttpSession session = request.getSession();
                        session.setAttribute("client", client);
                        redirectPage = "client_dashboard.jsp";
                    } else {
                        errorMessage = "Invalid client credentials!";
                    }
                    break;
                    
                case "employee":
                    EmployeeDAO employeeDao = new EmployeeDAO();
                    Employee employee = employeeDao.validateEmployee(email, password);
                    
                    if (employee != null) {
                        HttpSession session = request.getSession();
                        session.setAttribute("employee", employee);
                        redirectPage = "employee_dashboard.jsp";
                    } else {
                        errorMessage = "Invalid employee credentials!";
                    }
                    break;
                    
                default:
                    errorMessage = "Invalid user type selected!";
                    break;
            }
        } catch (Exception e) {
            errorMessage = "An error occurred during login: " + e.getMessage();
            e.printStackTrace();
        }
        
        if (errorMessage != null) {
            request.setAttribute("errorMessage", errorMessage);
        }
        
        RequestDispatcher dispatcher = request.getRequestDispatcher(redirectPage);
        dispatcher.forward(request, response);
    }
} */