<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Add Tasks</title>
</head>
<body>
    <div class="layout-wrapper layout-content-navbar">
    <div class="layout-container">
    <%@include file="components/menubar_1.jsp" %>
    <div class="layout-page">
    <%@include file="components/navbar_1.jsp" %>
    <div class="content-wrapper">
        <!-- Content -->
    <div class="container-xxl flex-grow-1 container">
          <!-- Layout Demo -->
    <div class="layout-demo-wrapper">
        <div class="card col-7 mb-2">
	<div class="card-body">
            <h4 class="card-title text-center">Add Task</h4>
            <form action="TaskServlet" method="post">
                <input type="hidden" name="projectId" value="1"/>
                <div class="mb-1">
                    <label for="name" class="form-label">Task Name:</label><br>
                    <input type="text" id="name" name="name" class="form-control" required><br>
                </div>
                
                <div class="mb-1">
                    <label for="description" class="form-label">Description:</label><br><br>
                </div>
                
                <div class="mb-1">
                    
                        
                        
                    <select name="employee" id="employee" class="form-select">
                        <option value="">Select Employee</option>
            <%
                try {
                String p_id = request.getParameter("project_id");
                int project_id = Integer.parseInt(p_id);
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/projectmanagementdb", "root", "");
                    String query1 = "SELECT * FROM projectassign WHERE project_id=?";
                    PreparedStatement ps1 = conn.prepareStatement(query1);
                    ps1.setInt(1, project_id);
                    ResultSet rs1 = ps1.executeQuery();
                    while (rs1.next()) {
                       
                    String query2 = "SELECT * FROM employee WHERE employee_id= ?";
                    PreparedStatement ps2 = conn.prepareStatement(query2);
                    ps2.setInt(1, rs1.getInt("employee_id"));
                    ResultSet rs2 = ps2.executeQuery();
                   while (rs2.next()) {
            %>
                        <option value="<%= rs1.getInt("employee_id") %>"><%= rs2.getString("employee_name") %></option>
            <%
                }
                    }
                } catch (Exception e) {
                    out.println("Error loading clients: " + e.getMessage());
                }
            %>
        </select>
                    <br>
                </div>

                
                <div class="mb-1">
                    <label for="status" class="form-label">Status:</label><br>
                    <select class="form-select" name="status" required>
                        <option value="">Select Status</option>
                        <option value="Pending">Pending</option>
                        <option value="In Progress">In Progress</option>
                        <option value="Completed">Completed</option>
                    </select>
                    <br>
                </div>
                
                <div class="mb-1">
                    <label for="deadline" class="form-label">Deadline:</label><br>
                    <input type="date" name="deadline" class="form-control" required/><br>
                </div>
                <input type="submit" class="btn btn-primary" value="Add Task"/>
            </form>
        </div>
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