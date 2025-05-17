package controller;

import dao.EmployeeDAO;
import model.Employee;
import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

@WebServlet("/EditEmployeeServlet")
@MultipartConfig(maxFileSize = 16177215)
public class EditEmployeeServlet extends HttpServlet {
    
    private EmployeeDAO employeeDAO;

    @Override
    public void init() {
        employeeDAO = new EmployeeDAO();
    }
 
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int id = Integer.parseInt(request.getParameter("id"));
        //Employee existingEmployee;
        try {
            Employee existingEmployee = employeeDAO.getEmployeeById(id);
            request.setAttribute("employee", existingEmployee);
            RequestDispatcher dispatcher = request.getRequestDispatcher("editEmployeeForm.jsp");
        dispatcher.forward(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(EditEmployeeServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
         
       
         
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int id = Integer.parseInt(request.getParameter("id"));
       
        String fullname = request.getParameter("fullname");
        String email = request.getParameter("email");
        int phone = Integer.parseInt(request.getParameter("phone"));
        String department = request.getParameter("department");
        Part filePart = request.getPart("profilePicture");
        

         Employee updatedEmp = new Employee(id,fullname, email, phone, department);
    
    
        if (filePart != null && filePart.getSize() > 0) {
            byte[] profilePicture = filePart.getInputStream().readAllBytes();
            updatedEmp.setProfilePicture(profilePicture);
        } else {
  
            Employee existing = null;
            try {
                existing = employeeDAO.getEmployeeById(id);
            } catch (SQLException ex) {
                Logger.getLogger(EditEmployeeServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
            updatedEmp.setProfilePicture(existing.getProfilePicture());
        }

    employeeDAO.updateEmployee(id, updatedEmp);

    response.sendRedirect("EmployeeServlet");
        
    }
 
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
