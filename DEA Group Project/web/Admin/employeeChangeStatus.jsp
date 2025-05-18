<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Assign Employee</title>
    <link rel="stylesheet" href="your-styles.css"> <!-- Add your CSS if needed -->
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
    String t_id = request.getParameter("task_id");
        int task_id = Integer.parseInt(t_id);
        
String p_id = request.getParameter("project_id");
        int project_id = Integer.parseInt(p_id);
        
        String e_id = request.getParameter("employee_id");
        int employee_id = Integer.parseInt(e_id);
        
%>  

 <form action="ChangeTaskStatus?task_id=<%=task_id%>&project_id=<%=project_id%>&employee_id=<%=employee_id%>" method="post">
            
     <div style="text-align: center;color: gray"><h2>Change Status</h2></div>
    
  
      <div class="mb-3">
        <label for="projectname" class="form-label">Project Id</label>
        <input type="text" id="task" name="task_id" class="form-control" required value="<%=task_id%>" readonly >
    </div>
      
  

    <div class="mb-3">
        <label for="Status" class="form-label">Status</label>
        
        <select name="status" id="client" class="form-select">
            <option>Pending</option> 
            <option>In Progres</option> 
            <option>Completed</option> 
        </select>
   

      <div class="text-center">
        <input type="submit" value="Change" class="btn btn-primary mt-2">
        <a><button class="btn btn-primary mt-2">Back</button></a>
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
</body>
</html>
