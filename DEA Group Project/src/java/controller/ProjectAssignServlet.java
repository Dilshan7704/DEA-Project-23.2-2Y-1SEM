
package controller;

import dao.AddProjectDAO;
import dao.AssignEmployeeDAO;
import model.Project;
import model.ProjectAssign;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author gihan
 */
public class ProjectAssignServlet extends HttpServlet {

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        response.setContentType("text/html");  
        PrintWriter out = response.getWriter();
        
        String project = request.getParameter("project_id");
        String employee = request.getParameter("assign");
        
        out.println(project);
        out.println(employee);
        
        int project_id = Integer.parseInt(project);
        int employee_id = Integer.parseInt(employee);
        
        
         ProjectAssign projectassign = new ProjectAssign();
         projectassign.setProject_id(project_id);
         projectassign.setEmployee_id(employee_id);
        
        AssignEmployeeDAO assignemployee = new AssignEmployeeDAO();
        int rowinserted = assignemployee.addProject(projectassign);
        
        if(rowinserted > 0){
             response.sendRedirect("assignEmployee.jsp");
         }
    }

    

}
