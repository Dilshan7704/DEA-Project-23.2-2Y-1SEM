<%@page  import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Project Form</title>
    </head>
    <body>

<!--        page layout-->
         <div class="layout-wrapper layout-content-navbar">
      <div class="layout-container">
        <%@include file="components/menubar.jsp" %>
        <div class="layout-page">
        <%@include file="components/navbar.jsp" %>
        <div class="content-wrapper">
            <!-- Content -->

            <div class="container-xxl flex-grow-1 container-p-y">
              <!-- Layout Demo -->
              <div class="layout-demo-wrapper">

                  <!--        2 step-->
                  <div class="card" style="width: 25rem;">
	<div class="card-body ">

     <form action="AddProjectServlet" method="post">

    <div class="text-center text-secondary mb-4">
        <h2>Add Project</h2>
    </div>
      
                      
    <div class="mb-3">
        <label for="projectname" class="form-label">Project Name:</label>
        <input type="text" id="projectname" name="projectname" class="form-control" required>
    </div>

    <div class="mb-3">
        <label for="projectdescription" class="form-label">Project Description:</label>
        <input type="text" id="projectdescription" name="projectdescription" class="form-control">
    </div>

    <div class="mb-3">
        <label for="startdate" class="form-label">Project Start Date:</label>
        <input type="date" id="startdate" name="startdate" class="form-control">
    </div>

    <div class="mb-3">
        <label for="enddate" class="form-label">Project End Date:</label>
        <input type="date" id="enddate" name="enddate" class="form-control" required>
    </div>

    <div class="mb-3">
        <label for="status" class="form-label">Status:</label>
        <select name="status" id="status" class="form-select">
            <option value="Not Started">Not Started</option>
            <option value="In Progress">In Progress</option>
            <option value="Completed">Completed</option>
        </select>
    </div>

    <div class="mb-3">
        <label for="budget" class="form-label">Project Budget:</label>
        <input type="number" min="0" id="budget" name="budget" class="form-control">
    </div>

    <div class="mb-3">
        <label for="client" class="form-label">Client:</label>
        <select name="client" id="client" class="form-select">
            <option value="none">none</option>
            <%
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/projectmanagementdb", "root", "");
                    String query1 = "SELECT * FROM client";
                    PreparedStatement ps1 = conn.prepareStatement(query1);
                    ResultSet rs = ps1.executeQuery();
                    while (rs.next()) {
            %>
                        <option value="<%= rs.getInt("client_id") %>"><%= rs.getString("client_name") %></option>
            <%
                    }
                } catch (Exception e) {
                    out.println("Error loading clients: " + e.getMessage());
                }
            %>
        </select>
    </div>

    <div class="text-center">
        <input type="submit" value="Register" class="btn btn-primary">
    </div>

</form>

 </div>
              <!--/ Layout Demo -->
            </div>
        <%@include file="components/footer.jsp" %>
        <div class="content-backdrop fade"></div>
          </div>
          <!-- Content wrapper -->
        </div>
        <!-- / Layout page -->
      </div>   

     
    </body>
</html>
