package controller;


import dao.AddProjectDAO;
import model.Project;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.util.List;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class AddProjectServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        response.setContentType("text/html");  
        PrintWriter out = response.getWriter();  
        String projectname = request.getParameter("projectname");
        String projectdescription = request.getParameter("projectdescription");
        LocalDate startdate = LocalDate.parse(request.getParameter("startdate"));
        LocalDate enddate = LocalDate.parse(request.getParameter("enddate"));
        String status = request.getParameter("status");
        String budget = request.getParameter("budget");
        String client = request.getParameter("client");
        
        int budget_para = Integer.parseInt(budget);
        int client_id = Integer.parseInt(client);
        
//        out.println(budget_para);
//        out.println(client_id);
        
        Project project = new Project();
        project.setProject_name(projectname);
        project.setProject_description(projectdescription);
        project.setProject_startdate(startdate);
        project.setProject_enddate(enddate);
        project.setStatus(status);
        project.setProject_budget(budget_para);
        project.setClient_id(client_id);
        
        AddProjectDAO addProject = new AddProjectDAO();
        int rowinserted = addProject.addProject(project);
        
        if(rowinserted>0){
             response.sendRedirect("ShowProjectServlet");
         }
        
        

}
}
