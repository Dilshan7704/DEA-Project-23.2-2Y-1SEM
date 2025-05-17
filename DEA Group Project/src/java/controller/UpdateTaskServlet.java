package controller;

import dao.TaskDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Task;
import java.time.LocalDate;

@WebServlet(name = "UpdateTaskServlet", urlPatterns = {"/UpdateTaskServlet"})
public class UpdateTaskServlet extends HttpServlet {

    TaskDAO taskDAO = new TaskDAO();
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int taskId = Integer.parseInt(request.getParameter("taskId"));
            
            TaskDAO taskDAO = new TaskDAO(); 
            Task task = taskDAO.getTaskById(taskId);

            if (task != null) {
                request.setAttribute("task", task);
                request.getRequestDispatcher("Admin/editTask.jsp").forward(request, response); 
            } else {
                response.sendRedirect("taskList.jsp?error=TaskNotFound");
            }
        }
        catch (Exception ex) {
            request.setAttribute("errorMessage", ex.getMessage());
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int taskId = Integer.parseInt(request.getParameter("taskId"));
            String taskName = request.getParameter("taskName");
            String taskDescription = request.getParameter("taskDescription");
            String taskStatus = request.getParameter("taskStatus");
            LocalDate taskDeadline = LocalDate.parse(request.getParameter("taskDeadline"));

            Task task = new Task();
            task.setTaskId(taskId);
            task.setTaskName(taskName);
            task.setTaskDescription(taskDescription);
            task.setTaskStatus(taskStatus);
            task.setTaskDeadline(taskDeadline);

            TaskDAO taskDAO = new TaskDAO();
            taskDAO.updateTask(task);

            response.sendRedirect("Admin/TaskList.jsp");
        }
        catch (Exception ex) {
            request.setAttribute("errorMessage", ex.getMessage());
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
