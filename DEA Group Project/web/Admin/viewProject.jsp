<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <!--        page layout-->
         <div class="layout-wrapper layout-content-navbar">
      <div class="layout-container">
        <%@include file="components/menubar_1.jsp" %>
        <div class="layout-page">
        <%@include file="components/navbar_1.jsp" %>
        <div class="content-wrapper">
            <!-- Content -->

            <div class="container-xxl flex-grow-1 container-p-y">
              <!-- Layout Demo -->
              <div class="layout-demo-wrapper">

                  <!--        2 step-->
                  <div class="card" style="width: 75rem;">
	<div class="card-body ">
<%
    try {
    
        String p_id = request.getParameter("project_id");
        int project_id = Integer.parseInt(p_id);

        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/projectmanagementdb", "root", "");

        String query1 = "SELECT * FROM project WHERE project_id = ?";
        PreparedStatement ps1 = conn.prepareStatement(query1);
        ps1.setInt(1, project_id);
        ResultSet rs1 = ps1.executeQuery();

    while (rs1.next()) {
%>
    <div>
        <h2><%= rs1.getString("project_name") %></h2>
        <p><%= rs1.getString("project_description") %></p>
        <p><strong>Status:</strong> <%= rs1.getString("status") %></p>
        <p><strong>Start Date:</strong> <%= rs1.getDate("project_startdate") %></p>
        <p><strong>End Date:</strong> <%= rs1.getDate("project_enddate") %></p>
        <p><strong>Budget:</strong> $<%= rs1.getFloat("project_budget") %></p>
    
<%
    
    String query2 = "SELECT * FROM client Where client_id = ?";
                PreparedStatement ps2 = conn.prepareStatement(query2);
                ps2.setInt(1, rs1.getInt("client_id"));
                ResultSet rs2 = ps2.executeQuery();

  
                while(rs2.next()){
%>
        <p><strong>Client Name :</strong><%= rs2.getString("client_name") %></p>
<%
    }

    }
    } catch (Exception e) {
        out.println("Error fetching project details.");
        e.printStackTrace(new java.io.PrintWriter(out));
    }
%>

</div>

</div>
<div class="card-body ">
    <a href="addProjectForm.jsp"><Button class="btn btn-primary mb-4">Add Task</Button></a>
    <div class="card-body ">
        <div class="table-responsive">
            <table class="table mb-0">
    <thead class="table-light">
      <tr>
        <th>Task Name</th>
        <th>Task Description</th>
        <th>Task Status</th>
        <th>Contributor</th>
        <th>Task Deadline</th>
        <th>Actions</th>
      </tr>
    </thead>
    <tbody>
<%
    try {
    
        String p_id = request.getParameter("project_id");
        int project_id = Integer.parseInt(p_id);

        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/projectmanagementdb", "root", "");

        String query3 = "SELECT * FROM tasks WHERE project_id = ?";
        PreparedStatement ps3 = conn.prepareStatement(query3);
        ps3.setInt(1, project_id);
        ResultSet rs3 = ps3.executeQuery();

    while (rs3.next()) {

    String query4 = "SELECT * FROM employee Where employee_id = ?";
                PreparedStatement ps4 = conn.prepareStatement(query4);
                ps4.setInt(1, rs3.getInt("employee_id"));
                ResultSet rs4 = ps4.executeQuery();

  
                while(rs4.next()){
%>
    
    <tr>
        <td><%= rs3.getString("task_name") %></td>
        <td><%= rs3.getString("task_description") %></td>
        <td><%= rs3.getString("task_status") %></td>
        <td><%= rs4.getString("employee_name") %></td>
        <td><%= rs3.getDate("task_deadline") %></td>
         <td>
            <a href="UpdateProjectServlet?project_id=${project.id}"><Button class="btn btn-success btn-xs">Update</Button></a>
            <a href="DeleteProjectServlet?project_id=${project.id}"><Button class="btn btn-danger btn-xs">Delete</Button></a>
        </td>
    </tr>
       
  
<%
    }
    }
    } catch (Exception e) {
        out.println("Error fetching project details.");
        e.printStackTrace(new java.io.PrintWriter(out));
    }
%>
    
 </tbody>
  </table>    
        </div>
</div>

              
            <!--/ Layout Demo -->
            </div>
        <%@include file="components/footer_1.jsp" %>
        <div class="content-backdrop fade"></div>
          </div>
          <!-- Content wrapper -->
        </div>
        <!-- / Layout page -->
      </div>
    </body>
</html>
