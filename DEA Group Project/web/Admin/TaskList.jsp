<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Task, java.util.List" %>
<!DOCTYPE html>
<html lang="en">
    <%
        if (request.getAttribute("taskList") == null) {
            response.sendRedirect("error.jsp");
            return;
        }
        
        int projectId = Integer.parseInt(request.getParameter("projectId"));
    %>
    <head>
        <meta charset="UTF-8">
        <title>List Page</title>
    </head>
    <body>
        <a href="addTasks.jsp">Add Tasks</a>

        <%
            List<Task> taskList = (List<Task>) request.getAttribute("taskList");
            if (taskList != null && !taskList.isEmpty()) {
                boolean hasTodo = false;
                boolean hasCompleted = false;

                for (Task task : taskList) {
                    if (!"Completed".equals(task.getTaskStatus())) {
                        hasTodo = true;
                    } else {
                        hasCompleted = true;
                    }
                }
        %>

        <% if (hasTodo) { %>
            <h1>To Do</h1>
            <table border="1">
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Description</th>
                    <th>Project</th>
                    <th>Employee</th>
                    <th>Status</th>
                    <th>Deadline</th>
                    <th></th>
                    <th></th>
                </tr>
                <% for (Task task : taskList) {
                    if (!"Completed".equals(task.getTaskStatus())) { %>
                        <tr>
                            <td><%= task.getTaskId() %></td>
                            <td><%= task.getTaskName() %></td>
                            <td><%= task.getTaskDescription() %></td>
                            <td><%= task.getProjectId() %></td>
                            <td><%= task.getEmployeeId() %></td>
                            <td><%= task.getTaskStatus() %></td>
                            <td><%= task.getTaskDeadline() %></td>
                            <td>
                                <form action="UpdateTaskServlet" method="get">
                                    <input type="hidden" name="taskId" value="<%= task.getTaskId() %>" />
                                    <button type="submit" class="btn">Edit</button>
                                </form>
                            </td>
                            <td>
                                <form action="DeleteTaskServlet" method="get">
                                    <input type="hidden" name="taskId" value="<%= task.getTaskId() %>" />
                                    <button type="submit" 
                                            onclick="return confirm('Are you sure you want to delete this task?');" class="btn btn-danger">
                                        Delete
                                    </button>
                                </form>
                            </td>
                        </tr>
                <%  } } %>
            </table>
        <% } %>

        <% if (hasCompleted) { %>
            <h1>Completed</h1>
            <table border="1">
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Description</th>
                    <th>Project</th>
                    <th>Employee</th>
                    <th>Status</th>
                    <th>Deadline</th>
                </tr>
                <% for (Task task : taskList) {
                    if ("Completed".equals(task.getTaskStatus())) { %>
                        <tr>
                            <td><%= task.getTaskId() %></td>
                            <td><%= task.getTaskName() %></td>
                            <td><%= task.getTaskDescription() %></td>
                            <td><%= task.getProjectId() %></td>
                            <td><%= task.getEmployeeId() %></td>
                            <td><%= task.getTaskStatus() %></td>
                            <td><%= task.getTaskDeadline() %></td>
                        </tr>
                <%  } } %>
            </table>
        <% } %>

        <% } else { %>
            <p>No tasks found.</p>
        <% } %>
    </body>
</html>