package controller;

import dao.TaskDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Task;

@WebServlet(name = "UpdateTaskServlet", urlPatterns = {"/UpdateTaskServlet"})
public class UpdateTaskServlet extends HttpServlet {

    TaskDAO taskDAO = new TaskDAO();
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int taskId = Integer.parseInt(request.getParameter("taskId"));
        Task task = new Task();
        //task = taskDAO.getTaskById(taskId);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
