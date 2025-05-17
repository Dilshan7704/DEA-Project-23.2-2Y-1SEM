
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Employee Management</title>
    
    <script>
        function toggleForm() {
            var form = document.getElementById("employeeForm");
            var registeredEmployees = document.querySelector(".registeredEmployees"); 
            if (form.style.display === "none") {
                form.style.display = "block";
                registeredEmployees.style.display = "none"; 
            } else {
                form.style.display = "none";
                registeredEmployees.style.display = "block"; 
            }
        }
        


    </script>
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

	<form id="employeeForm" action="EmployeeServlet" method="post" enctype="multipart/form-data">
        
	<div class="mb-1">

             <label for="fullname"  class="form-label">Full Name:</label><br>
             <input type="text" id="fullname" name="fullname"  class="form-control" required><br><br>
	</div>
             <div class="mb-1">
             <label for="email" class="form-label">Email:</label><br>
             <input type="email" id="email" name="email" class="form-control" required><br><br>
             </div>
            
            <div class="mb-1">
             <label for="phone" class="form-label">Phone Number:</label><br>
             <input type="tel" id="phone" name="phone" class="form-control" required><br><br>
             </div>
             
             <div class="mb-1">
             <label for="department" class="form-label">Department:</label><br>
             <input type="text" id="department" name="department" class="form-control" required><br><br>
             </div>
        
             <div class="mb-1">
             <label for="profilePicture" class="form-label">Profile Picture:</label><br>
             <input type="file" id="profilePicture" name="profilePicture" accept="image/*" class="form-control" required><br><br>
             </div>

        <input type="submit" class="btn btn-primary" value="Register">
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
