package controller;

import com.nsbm.dao.ProjectDAO;
import com.nsbm.dao.clientDAO;
import com.nsbm.model.Client;
import com.nsbm.model.Project;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ProjectDetailsServlet", urlPatterns = {"/ProjectDetailsServlet"})
public class ProjectDetailsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int clientId = Integer.parseInt(request.getParameter("id"));
        
        clientDAO clientDao = new clientDAO();
        ProjectDAO projectDao = new ProjectDAO();
        
        Client client = clientDao.getClientById(clientId);
        List<Project> projects = projectDao.getProjectsByClientId(clientId);
        
        request.setAttribute("client", client);
        request.setAttribute("projects", projects);
        
        RequestDispatcher dispatcher = request.getRequestDispatcher("Project_Details.jsp");
        dispatcher.forward(request, response);
    }
}