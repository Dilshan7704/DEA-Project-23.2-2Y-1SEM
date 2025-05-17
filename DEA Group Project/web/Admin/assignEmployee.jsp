<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page  import="java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Employee Assign</title>

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
                  <div class="card" style="width: 25rem;">
	<div class="card-body ">
 <%


    try {
    
                String p_id = request.getParameter("project_id");
                int project_id = Integer.parseInt(p_id);
                    // Load MySQL Driver
                Class.forName("com.mysql.cj.jdbc.Driver");
                
               // Connect to Database
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/projectmanagementdb", "root", "");
                
                
                String query1 = "SELECT * FROM project WHERE project_id = ?";
                
                PreparedStatement ps1 = conn.prepareStatement(query1);
                 ps1.setInt(1, project_id);
                ResultSet rs1 = ps1.executeQuery();
                
                
               


%>  
        <form action="ProjectAssignServlet" method="post">
            <div style="text-align: center;color: gray"><h2>Assign Employee</h2></div>
    <%
                while(rs1.next()){
                
      %>  
    
      <div class="mb-3">
        <label for="projectname" class="form-label">Project Name</label>
        <input type="text" id="projectname" name="projectname" class="form-control" required value="<%=rs1.getString("project_name")%>">
        <input type="hidden" name="project_id" value="<%=rs1.getInt("project_id")%>"/>
    </div>
      
    <%
          }
    %>
    
    <%
         String query2 = "SELECT * FROM employee";
                PreparedStatement ps2 = conn.prepareStatement(query2);
                
                ResultSet rs2 = ps2.executeQuery();
    %>    

    <div class="mb-3">
        <label for="Employee" class="form-label">Employee </label>
        <select name="assign" id="client" class="form-select">
              
        <%
            while (rs2.next()) {
        %>
        <option value="<%= rs2.getInt("employee_id") %>"><%= rs2.getString("employee_name") %></option>
        <%
            }
        %>
</select>
   

      <div class="text-center">
        <input type="submit" value="Assign" class="btn btn-primary mt-2">
    </div>
 
        </form>
    </div>
              <!--/ Layout Demo -->
            </div>
       
        <div class="content-backdrop fade"></div>
          </div>
          <!-- Content wrapper -->
        </div>
        <!-- / Layout page -->
      </div>
        
 

 <%
    } catch (Exception e) {
    out.println("Error fetching internships.");
    e.printStackTrace(new java.io.PrintWriter(out));
}

%>


    </body>
</html>
