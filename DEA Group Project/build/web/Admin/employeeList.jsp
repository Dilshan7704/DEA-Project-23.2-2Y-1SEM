<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Employee Management</title>
     
</head>
<body>
    
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
                      
                  
        <div class="card">
	<div class="card-body">
        
        <div class="d-flex justify-content-end ">
        <a href="employeeForm.jsp" class="btn btn-outline-primary"> +Add Employee </a>
        </div>
    
    <%
        if (request.getAttribute("employeeList") == null) {
            response.sendRedirect("EmployeeServlet");
            return;
        }
    %>

    <div class="registeredEmployees mt-4">
    <h3 class="mb-4">Registered Employees</h3>
    <div class="table-responsive">
        <table class="table table-striped table-hover">
            <thead class="table-dark">
                <tr>
                    <th>ID</th>
                    <th>Photo</th>
                    <th>Full Name</th>
                    <th>Email</th>
                    <th>Phone</th>
                    <th>Department</th>
                    <th class="text-center">Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="employee" items="${employeeList}">
                    <tr>
                        <td class="align-middle">${employee.id}</td>
                        <td class="align-middle">
                            <img src="imageServlet?id=${employee.id}" 
                                 alt="Profile Picture" 
                                 class="rounded-circle profile-pic"
                                 width="50" 
                                 height="50">
                        </td>
                        <td class="align-middle">${employee.fullname}</td>
                        <td class="align-middle">${employee.email}</td>
                        <td class="align-middle">${employee.phone}</td>
                        <td class="align-middle">${employee.department}</td>
                        <td class="align-middle text-center">
                            <div class="btn-group" role="group">
                                <a href="${pageContext.request.contextPath}/EditEmployeeServlet?id=${employee.id}" 
                                   class=" btn btn-sm btn-outline-primary">
                                   <i class="bi bi-pencil-square"></i> Edit
                                </a>
                                <a href="${pageContext.request.contextPath}/emy/deleteEmployee?id=${employee.id}" 
                                   class="btn btn-sm btn-outline-danger" 
                                   onclick="return confirm('Are you sure you want to delete this employee?')">
                                   <i class="bi bi-trash"></i> Delete
                                </a>
                            </div>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>

    
    </div>
</div>       
        
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
