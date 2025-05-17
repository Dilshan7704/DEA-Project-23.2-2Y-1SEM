
package controller;

import com.project.dao.AddProjectDAO;
import com.project.dao.AssignEmployeeDAO;
import com.project.model.Project;
import com.project.model.ProjectAssign;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
