<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List, com.nsbm.model.Client" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>All Client List</title>
           <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" rel="stylesheet">
        <style>
  .table {
    border-radius: 0.5rem;
    overflow: hidden;
    box-shadow: 0 0.15rem 1rem rgba(0, 0, 0, 0.1);  /* Added shadow for depth */
  }
  
  thead {
    background-color: #2b2c40 !important;
    color: #fbfbfb;/* Primary blue color */
  }
  
  .table th {
    font-weight: 600;
    text-transform: uppercase;
    letter-spacing: 0.5px;
    vertical-align: middle;
  }
  
  .table-hover tbody tr:hover {
    background-color: rgba(78, 115, 223, 0.05);  /* Light blue hover */
  }
  
  .btn {
    font-size:30px;  /* Slightly larger buttons */
    transition: all 0.2s;  /* Smooth hover effects */
  }
  
  .btn:hover {
    transform: translateY(-1px);
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
  }
</style>
    </head>
    <body>
         <div class="layout-wrapper layout-content-navbar">
      <div class="layout-container">
        <%@include file="../components/menubar.jsp" %>
        <div class="layout-page">
        <%@include file="../components/navbar.jsp" %>
        <div class="content-wrapper">
            <!-- Content -->

            <div class="container-xxl flex-grow-1 container-p-y">
              <!-- Layout Demo -->
              <div class="layout-demo-wrapper">
        
            <h2><i class="fas fa-list-ul"></i> All Client List</h2>
            
            <%-- Display success message if any --%>
            <% if (request.getAttribute("successMessage") != null) { %>
                <div class="message">
                    <i class="fas fa-check-circle"></i> <%= request.getAttribute("successMessage") %>
                </div>
            <% } %>
            <% if (request.getAttribute("errorMessage") != null) { %>
    <div class="alert alert-error">
        <i class="fas fa-exclamation-circle"></i> ${errorMessage}
    </div>
<% } %>
          
           <div class="card">
               
  <div class="card-body">
      
      <div class="card-header d-flex justify-content-between align-items-center">
                        <h4 class="mb-0"><i class="fas fa-users me-2"></i>Registered Clients</h4>
                      <a href="Client_Form.jsp" class="btn btn-secondary px-3 py-1">
                                        <i class="fas fa-plus me-1"></i> Add Client
                            </a>           
                        </div>
          <div class="table-responsive-lg">
            <table class="table table-hover mb-4" style="font-size: 1.05rem;">  <!-- Increased font size -->
    <thead style="background-color: #2b2c40; color: #fbfbfb;" >  <!-- Custom header color -->
      <tr>
        <th class="text-center py-3" style="font-size: 1.1rem; color: white">ID</th>  <!-- Increased header font size -->
        <th class="py-3" style="font-size: 1.1rem; color: white">Name</th>
        <th class="py-3" style="font-size: 1.1rem; color: white">Email</th>
        <th class="py-3" style="font-size: 1.1rem; color: white">Phone Number</th>
        <th class="text-center py-3" style="font-size: 1.1rem; color: white">Actions</th>
        <th class="text-center py-3" style="font-size: 1.1rem; color: white">View</th>
      </tr>
    </thead>
    <tbody>
      <% 
        List<Client> clients = (List<Client>) request.getAttribute("clients");
        if (clients != null && !clients.isEmpty()) {
          for (Client client : clients) { 
      %>
        <tr class="align-middle" style="height: 60px;">  <!-- Increased row height -->
          <td class="text-center"><%= client.getId() %></td>
          <td><%= client.getName() %></td>
          <td><a href="mailto:<%= client.getEmail() %>"><%= client.getEmail() %></a></td>
          <td><%= client.getPhone_no() %></td>
          <td class="text-center">
            <div class="d-flex gap-3 justify-content-center">  <!-- Increased gap between buttons -->
              <a href="Update_Client.jsp?id=<%= client.getId() %>" class="btn btn-primary px-3 py-1">  <!-- Larger buttons -->
                <i class="fas fa-edit me-2"></i> Update  <!-- Increased icon spacing -->
              </a>
              <form action="DeleteClientServlet" method="post" class="d-inline">
                <input type="hidden" name="id" value="<%= client.getId() %>">
                <button type="submit" class="btn btn-danger px-3 py-1" onclick="return confirmDelete()">
                  <i class="fas fa-trash-alt me-2"></i> Delete
                </button>
              </form>
            </div>
          </td>
          <td class="text-center">
            <a href="ProjectDetailsServlet?id=<%= client.getId() %>" class="btn btn-secondary px-3 py-1">
              <i class="fas fa-eye me-2"></i> View
            </a>
          </td>
        </tr>
      <% 
          }
        } else { 
      %>
        <tr>
          <td colspan="6" class="text-center py-5" style="font-size: 1.1rem;">  <!-- Increased empty state size -->
            <div class="d-flex flex-column align-items-center">
              <i class="fas fa-info-circle fa-2x text-muted mb-3"></i>  <!-- Larger icon -->
              <span class="text-muted">No clients found</span>
            </div>
          </td>
        </tr>
      <% } %>
    </tbody>
  </table>
          </div>

  </div></div>                   </div>
              <!--/ Layout Demo -->
            </div>
        <%@include file="../components/footer.jsp" %>
        <div class="content-backdrop fade"></div>
          </div>
          <!-- Content wrapper -->
        </div>
        <!-- / Layout page -->
      </div>
        
        <script>
            // Enhanced confirmation for delete action
            document.querySelectorAll('.btn-delete').forEach(btn => {
                btn.addEventListener('click', function(e) {
                    if (!confirm('Are you sure you want to delete this participant?\nThis action cannot be undone.')) {
                        e.preventDefault();
                    }
                });
            });
        </script>
        <script>
    function confirmDelete() {
        return confirm('Are you sure you want to delete this client?\nThis action cannot be undone.');
    }
</script>
    </body>
</html>