package controller;

import dao.UpdateProjectDAO;
import model.Project;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.time.LocalDate;

public class UpdateProjectServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int projectId = Integer.parseInt(request.getParameter("project_id"));
        String projectName = request.getParameter("projectname");
        String projectDescription = request.getParameter("projectdescription");
        LocalDate startDate = LocalDate.parse(request.getParameter("startdate"));
        LocalDate endDate = LocalDate.parse(request.getParameter("enddate"));
        String status = request.getParameter("status");
        int budget = Integer.parseInt(request.getParameter("budget"));

        Project updatedProject = new Project();
        updatedProject.setProject_id(projectId);
        updatedProject.setProject_name(projectName);
        updatedProject.setProject_description(projectDescription);
        updatedProject.setProject_startdate(startDate);
        updatedProject.setProject_enddate(endDate);
        updatedProject.setStatus(status);
        updatedProject.setProject_budget(budget);

        UpdateProjectDAO projectDAO = new UpdateProjectDAO();
        int rowinserted = projectDAO.updateProject(updatedProject,projectId);

        if(rowinserted>0){
             response.sendRedirect("ShowProjectServlet");
         }

    }
}
