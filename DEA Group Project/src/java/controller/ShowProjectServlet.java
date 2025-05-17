
package controller;

import dao.AddProjectDAO;
import model.Project;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


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

