<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Project List</title>
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
                  <div class="card" >
	<div class="card-body ">
                  <a href="addProjectForm.jsp"><Button class="btn btn-primary mb-4">Add project</Button></a>
                  <div class="card" style="width: 65rem;">
	<div class="card-body ">
            
        <div class="table-responsive">
            <table class="table mb-0">
    <thead class="table-dark">
      <tr>
        <th>Project Name</th>
        <th>Start Date</th>
        <th>End Date</th>
        <th>Status</th>
        <th>Actions</th>
        <th>Assign</th>
        <th>View</th>
      </tr>
    </thead>
    <tbody>
           
        <c:forEach var="project" items="${projectList}">
            
            <tr onclick="window.location.href='assignEmployee.jsp?project_id=${project.id}'" style="cursor: pointer;">
                
                <td>${project.project_name}</td>
                <td>${project.project_startdate}</td>
                <td>${project.project_enddate}</td>
                <td>${project.status}</td>
                <td>
                    <a href="UpdateProjectServlet?project_id=${project.id}"><Button class="btn btn-success sm">Update</Button></a>
                    <a href="DeleteProjectServlet?project_id=${project.id}" onclick="return confirm('Are you sure ou want to delete this project')"><Button class="btn btn-danger sm">Delete</Button></a>
                </td>s
                <td>
                    <a href="assignEmployee.jsp?project_id=${project.id}"><Button class="btn xs btn-primary">Assign</Button></a>
                </td>
                <td>
                    <a href="viewProject.jsp?project_id=${project.id}"><img src="components/view_icon.svg"></a>
                    
                </td>
                
            </tr>
            
        </c:forEach>
            
        </tbody>
  </table>
            </div>
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
