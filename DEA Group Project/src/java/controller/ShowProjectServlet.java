
package controller;

import dao.AddProjectDAO;
import model.Project;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebServlet("/projectList")
public class ShowProjectServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        AddProjectDAO projectDAO = new AddProjectDAO();
        List<Project> projectList = projectDAO.ProjectList();

        request.setAttribute("projectList", projectList); // pass to JSP
        request.getRequestDispatcher("projectList.jsp").forward(request, response);
    }
}

