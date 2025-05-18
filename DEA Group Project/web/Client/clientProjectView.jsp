<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Project Details</title>

</head>
<body>
 <!-- Layout Start -->
<div class="layout-wrapper layout-content-navbar">
    <div class="layout-container">
        <%@include file="components/menubar_1.jsp" %>
        <div class="layout-page">
            <%@include file="components/navbar_1.jsp" %>
            <div class="content-wrapper">
                <div class="container-xxl flex-grow-1 container-p-y">
                    <!--        2 step-->
                  <div class="card" style="width: 75rem;">
	<div class="card-body ">
<%
    try {
        String c_id = request.getParameter("client_id");
        int client_id = Integer.parseInt(c_id);

        String p_id = request.getParameter("project_id");
        int project_id = Integer.parseInt(p_id);

        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/projectmanagementdb", "root", "");

        // Get project details
        String query1 = "SELECT * FROM project WHERE project_id = ?";
        PreparedStatement ps1 = conn.prepareStatement(query1);
        ps1.setInt(1, project_id);
        ResultSet rs1 = ps1.executeQuery();

        // Get progress
        String progressQuery = "SELECT COUNT(*) AS total_tasks, " +
                               "SUM(CASE WHEN task_status = 'Completed' THEN 1 ELSE 0 END) AS completed_tasks " +
                               "FROM tasks WHERE project_id = ?";
        PreparedStatement psProgress = conn.prepareStatement(progressQuery);
        psProgress.setInt(1, project_id);
        ResultSet rsProgress = psProgress.executeQuery();

        int totalTasks = 0;
        int completedTasks = 0;
        double completionPercentage = 0;

        if (rsProgress.next()) {
            totalTasks = rsProgress.getInt("total_tasks");
            completedTasks = rsProgress.getInt("completed_tasks");

            if (totalTasks > 0) {
                completionPercentage = (completedTasks * 100.0) / totalTasks;
            }
            String str = String.valueOf(completionPercentage);
        }
%>

<h1>Project Details</h1>
<div class="project-wrapper">
<%
    while (rs1.next()) {
%>
    <div class="project-card">
        <h2><%= rs1.getString("project_name") %></h2>
        <p><strong>Description:</strong> <%= rs1.getString("project_description") %></p>
        <p><strong>Status:</strong> <%= rs1.getString("status") %></p>
        <p><strong>Start Date:</strong> <%= rs1.getDate("project_startdate") %></p>
        <p><strong>End Date:</strong> <%= rs1.getDate("project_enddate") %></p>
        <p><strong>Budget:</strong> $<%= rs1.getFloat("project_budget") %></p>
        <p><strong>Task Progress:</strong> 
    <%= completedTasks %> of <%= totalTasks %> tasks completed
    (<%= String.format("%.2f", completionPercentage) %>%)
</p>



<div class="progress">
  <div class="progress-bar progress-bar-striped progress-bar-animated bg-secondary" role="progressbar" style="width: <%= String.format("%.2f", completionPercentage) %>%;" aria-valuenow="30" aria-valuemin="0" aria-valuemax="100"><%= String.format("%.0f", completionPercentage) %>%</div>
</div>
        
         <a class="back-button" href="clientDashboard.jsp?client_id=<%= client_id %>"><button class="btn btn-primary" style="margin-top: 10px;">← Back to Dashboard</button></a>
    </div>
<%
    }
%>
</div>

<%
    } catch (Exception e) {
        out.println("Error fetching project details.");
        e.printStackTrace(new java.io.PrintWriter(out));
    }
%>

</div>
</div>
</div>
              <%@include file="components/footer_1.jsp" %>
                <div class="content-backdrop fade"></div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
