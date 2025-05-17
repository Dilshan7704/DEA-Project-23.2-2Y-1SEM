 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit form</title>
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
            
        <h2 class="mb-3">Edit Employee</h2>
<form id="editEmployeeForm" action="EditEmployeeServlet" method="post" enctype="multipart/form-data">
    <input type="hidden" name="id" value="${employee.id}" />
    
    <div class="mb-3">
        <label for="fullname" class="form-label">Full Name:</label>
        <input type="text" id="fullname" name="fullname" class="form-control" value="${employee.fullname}" required>
    </div>
    
    <div class="mb-3">
        <label for="email" class="form-label">Email:</label>
        <input type="email" id="email" name="email" class="form-control" value="${employee.email}" required>
    </div>
    <label for="password" class="form-label">password</label><br>
             <input type="password" id="password" name="password" class="form-control" value="${employee.password}" required><br><br>
             </div>
    
    <div class="mb-3">
        <label for="phone" class="form-label">Phone Number:</label>
        <input type="tel" id="phone" name="phone" class="form-control" value="${employee.phone}" required>
    </div>
    
    <div class="mb-3">
        <label for="department" class="form-label">Department:</label>
        <input type="text" id="department" name="department" class="form-control" value="${employee.department}" required>
    </div>
    
    <div class="mb-3">
        <label for="profilePicture" class="form-label">Profile Picture:</label>
        <input type="file" id="profilePicture" name="profilePicture" accept="image/*" class="form-control">
        <small class="text-muted">Leave blank to keep current image</small>
    </div>

    <input type="submit" class="btn btn-primary" value="Update">
</form>
        
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
