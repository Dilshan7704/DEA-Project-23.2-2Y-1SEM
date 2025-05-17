package com.controller;

import com.dao.EmployeeDAO;
import com.model.Employee;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet("/EmployeeServlet")
@MultipartConfig(maxFileSize = 16177215)
public class EmployeeServlet extends HttpServlet {

    private EmployeeDAO employeeDAO;

    public void init() {
        employeeDAO = new EmployeeDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Employee> employeeList = employeeDAO.listEmployees();
        request.setAttribute("employeeList", employeeList);
        request.getRequestDispatcher("employeeList.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String fullname = request.getParameter("fullname");
        String email = request.getParameter("email");
        int phone = Integer.parseInt(request.getParameter("phone"));
        String department = request.getParameter("department");
        Part filePart = request.getPart("profilePicture");
        byte[] profilePicture = filePart.getInputStream().readAllBytes();

        Employee employee = new Employee();
        employee.setFullname(fullname);
        employee.setEmail(email);
        employee.setPhone(phone);
        employee.setDepartment(department);
        employee.setProfilePicture(profilePicture);

       
        employeeDAO.insertEmployee(employee);
        
        response.sendRedirect("EmployeeServlet");    
    }
    
     
  
}
