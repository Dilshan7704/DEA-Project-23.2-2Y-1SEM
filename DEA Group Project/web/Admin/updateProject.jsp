<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page  import="java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Project</title>

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
        <form action="AddProjectServlet" method="post">
            
        
<div class="text-center text-secondary mb-4">
        <h2>Update Project</h2>
    </div>
      
                      
    <div class="mb-3">
        <label for="projectname" class="form-label">Project Name:</label>
        <input type="text" id="projectname" name="projectname" class="form-control" required value="${project.project_name}">
    </div>

    <div class="mb-3">
        <label for="projectdescription" class="form-label">Project Description:</label>
        <input type="text" id="projectdescription" name="projectdescription" class="form-control" value="${project.project_description}">
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
    
    <div class="text-center">
        <input type="submit" value="Register" class="btn btn-primary">
        <a class="back-button" href="ShowProjectServlet"><button class="btn btn-primary">Back to Dashboard</button></a>
    </div>

</form>
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
