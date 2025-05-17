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
    <%@include file="components/menubar.jsp" %>
    <div class="layout-page">
    <%@include file="components/navbar.jsp" %>
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
                    <label for="description" class="form-label">Description:</label><br>
                    <textarea type="text" name="description" class="form-control" required></textarea><br>
                </div>
                
                <div class="mb-1">
                    <label for="employee" class="form-label">Employee:</label><br>
                    <select class="form-select" name="employee" required>
                        <option value="">Select Employee</option>
                        <option value="1">someone</option>
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
    <%@include file="components/footer.jsp" %>
    <div class="content-backdrop fade"></div>
    </div>
      <!-- Content wrapper -->
    </div>
    <!-- / Layout page -->
    </div>
</body>
</html>
