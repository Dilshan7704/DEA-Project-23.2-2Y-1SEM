package controller;

import dao.EmployeeDAO;
import model.Employee;
import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

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
        String password = request.getParameter("password");
        int phone = Integer.parseInt(request.getParameter("phone"));
        String department = request.getParameter("department");
        Part filePart = request.getPart("profilePicture");
        byte[] profilePicture = filePart.getInputStream().readAllBytes();

        Employee employee = new Employee();
        employee.setEmployee_name(fullname);
        employee.setEmployee_email(email);
        employee.setEmployee_password(password);
        employee.setPhone(phone);
        employee.setDepartment(department);
        employee.setProfilePicture(profilePicture);

       
        employeeDAO.insertEmployee(employee);
        
        response.sendRedirect("EmployeeServlet");    
    }
    
     
  
}
