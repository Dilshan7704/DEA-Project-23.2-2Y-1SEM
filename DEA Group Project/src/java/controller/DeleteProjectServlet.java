
package controller;

import dao.AddProjectDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class DeleteProjectServlet extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
         response.setContentType("text/html");  
         PrintWriter out = response.getWriter();  
         String p_id = request.getParameter("project_id");
         int project_id = Integer.parseInt(p_id);
         
         AddProjectDAO deleteproject = new AddProjectDAO();
         int rowdeleted = deleteproject.deleteProject(project_id);
         if(rowdeleted>0){
             response.sendRedirect("ShowProjectServlet");
         }
    }

    
}
