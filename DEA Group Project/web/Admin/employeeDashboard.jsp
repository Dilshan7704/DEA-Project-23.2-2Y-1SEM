<%@page  import="java.sql.*"%>
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
            <div class="row row-cols-1 row-cols-md-3 g-4">

            
<%


    try {
    
                String e_id = request.getParameter("employee_id");
                int employee_id = Integer.parseInt(e_id);
                    // Load MySQL Driver
                Class.forName("com.mysql.cj.jdbc.Driver");
                
               // Connect to Database
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/projectmanagementdb", "root", "");
                
                
                String query1 = "SELECT * FROM projectassign WHERE employee_id = ?";
                
                PreparedStatement ps1 = conn.prepareStatement(query1);
                 ps1.setInt(1, employee_id);
                 ResultSet rs1 = ps1.executeQuery();


%>  


<%
                while(rs1.next()){

                String query2 = "SELECT * FROM project Where project_id = ?";
                PreparedStatement ps2 = conn.prepareStatement(query2);
                ps2.setInt(1, rs1.getInt("project_id"));
                ResultSet rs2 = ps2.executeQuery();

                while(rs2.next()){
                
%>
      <div class="col">
  <div class="card h-100">
    
    <div class="card-body">
      <h5 class="card-title"><%= rs2.getString("project_name")%></h5>
      <p class="card-text"><%= rs2.getString("project_description")%></p>
      <p class="card-text"><%= rs2.getString("status")%></p>
      <a href="employeeProjectView.jsp?project_id=<%= rs1.getInt("project_id") %>&employee_id=<%= employee_id %>"><button class="btn btn-primary">View</button></a>
    </div>
  </div>
</div>
    

<%
         
    }
        
}

    } catch (Exception e) {
    out.println("Error fetching internships.");
    e.printStackTrace(new java.io.PrintWriter(out));
}

%>
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
