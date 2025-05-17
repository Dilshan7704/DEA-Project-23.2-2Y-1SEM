package com.controller;

import com.dao.EmployeeDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/emy/deleteEmployee")
public class DeleteEmployee extends HttpServlet {
    private EmployeeDAO employeeDAO;

    @Override
    public void init() throws ServletException {
        employeeDAO = new EmployeeDAO(); 
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

         int id = Integer.parseInt(request.getParameter("id"));
         employeeDAO.deleteEmployeeById(id);


        response.sendRedirect(request.getContextPath() + "/employeeList.jsp");
    }
}
