<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="model.Project"%>
<!DOCTYPE html>
<html>
    <%
        List<Project> projectList = (List<Project>) request.getAttribute("projectList");
        if (projectList == null) {
            response.sendRedirect("error.jsp");
            return;
        }
    %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Project List</title>
        <style>
            table {
                border-collapse: collapse;
                width: 100%;
                font-family: Arial, sans-serif;
            }
            th, td {
                border: 1px solid #ddd;
                padding: 8px;
            }
            th {
                background-color: #f2f2f2;
                text-align: left;
            }
            .btn {
                background-color: #4CAF50;
                color: white;
                padding: 5px 10px;
                text-decoration: none;
                border-radius: 4px;
                border: none;
                cursor: pointer;
            }
        </style>
    </head>
    <body>
        <h1>Project List</h1>
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Description</th>
                    <th>Start Date</th>
                    <th>End Date</th>
                    <th>Status</th>
                    <th>Budget</th>
                    <th>Client ID</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <%
                    for (Project project : projectList) {
                %>
                    <tr>
                        <td><%= project.getProject_id() %></td>
                        <td><%= project.getProject_name() %></td>
                        <td><%= project.getProject_description() %></td>
                        <td><%= project.getProject_startdate() %></td>
                        <td><%= project.getProject_enddate() %></td>
                        <td><%= project.getStatus() %></td>
                        <td><%= project.getProject_budget() %></td>
                        <td><%= project.getClient_id() %></td>
                        <td>
                            <form action="TaskServlet" method="get">
                                <input type="hidden" name="projectId" value="<%= project.getProject_id() %>" />
                                <button type="submit" class="btn">View Tasks</button>
                            </form>
                        </td>
                    </tr>
                <%
                    }
                %>
            </tbody>
        </table>
    </body>
</html>