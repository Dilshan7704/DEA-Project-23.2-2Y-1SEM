package com.controller;

import com.dao.EmployeeDAO;
import com.model.Employee;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/imageServlet")
public class ImageServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int id = Integer.parseInt(request.getParameter("id"));
        EmployeeDAO employeeDAO = new EmployeeDAO();
        
        try {
            Employee employee = employeeDAO.getEmployeeById(id);
            if (employee != null && employee.getProfilePicture() != null) {
                response.setContentType("image/jpeg");
                response.setContentLength(employee.getProfilePicture().length);
                response.getOutputStream().write(employee.getProfilePicture());
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
        }
    }
}