<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Task</title>
    </head>
    <body>
        <form action="UpdateTaskServlet" method="post">
            <input type="hidden" name="taskId" value="${task.taskId}">
            
            <label>Task Name:</label>
            <input type="text" name="taskName" value="${task.taskName}" required><br>

            <label>Description:</label>
            <textarea name="taskDescription">${task.taskDescription}</textarea><br>

            <label>Status:</label>
            <select name="taskStatus">
                <option value="pending" ${task.taskStatus == 'Pending' ? 'selected' : ''}>Pending</option>
                <option value="in progress" ${task.taskStatus == 'In Progress' ? 'selected' : ''}>In Progress</option>
                <option value="completed" ${task.taskStatus == 'Completed' ? 'selected' : ''}>Completed</option>
            </select><br>

            <label>Deadline:</label>
            <input type="date" name="taskDeadline" value="${task.taskDeadline}"><br>

            <button type="submit">Update Task</button>
        </form>
    </body>
</html>
