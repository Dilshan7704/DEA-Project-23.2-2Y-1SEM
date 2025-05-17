<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.nsbm.model.Client, com.nsbm.model.Project, java.util.List" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Client & Project Details</title>
        <link rel="stylesheet" href="css/style.css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" rel="stylesheet">
        
    </head>
    <body>
        <div class="layout-wrapper layout-content-navbar">
            <div class="layout-container">
                <%@include file="components/menubar.jsp" %>
                <div class="layout-page">
                    <%@include file="components/navbar.jsp" %>
                    <div class="content-wrapper">
                        <div class="container-xxl flex-grow-1 container-p-y">
                            <div class="content-container">
                                <h1 class="section-title">
                                    <i class="fas fa-user-tie"></i> Client & Project Details
                                </h1>
                                
                                <% 
                                    Client client = (Client) request.getAttribute("client");
                                    List<Project> projects = (List<Project>) request.getAttribute("projects");
                                %>
                                
                                <!-- Client Information Section -->
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <h3><i class="fas fa-user-circle me-2"></i>Client Information</h3>
                                    </div>
                                    <div class="card-body p-0">
                                        <table class="detail-table">
                                            <tr>
                                                <th>Client ID</th>
                                                <td><%= client.getId() %></td>
                                            </tr>
                                            <tr>
                                                <th>Name</th>
                                                <td><%= client.getName() %></td>
                                            </tr>
                                            <tr>
                                                <th>Email</th>
                                                <td><%= client.getEmail() %></td>
                                            </tr>
                                            <tr>
                                                <th>Phone Number</th>
                                                <td><%= client.getPhone_no() %></td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>
                                
                                <!-- Project Details Section -->
                                <div class="card">
                                    <div class="card-header">
                                        <h3><i class="fas fa-project-diagram me-2"></i>Project Details</h3>
                                    </div>
                                    <div class="card-body p-0">
                                        <% if (projects != null && !projects.isEmpty()) { %>
                                            <% for (Project project : projects) { %>
                                                <table class="detail-table">
                                                    <tr>
                                                        <th>Project ID</th>
                                                        <td><%= project.getProjectId() %></td>
                                                    </tr>
                                                    <tr>
                                                        <th>Project Name</th>
                                                        <td><%= project.getProjectName() %></td>
                                                    </tr>
                                                    <tr>
                                                        <th>Description</th>
                                                        <td><%= project.getProjectDescription() %></td>
                                                    </tr>
                                                    <tr>
                                                        <th>Start Date</th>
                                                        <td><%= project.getProjectStartDate() %></td>
                                                    </tr>
                                                    <tr>
                                                        <th>End Date</th>
                                                        <td><%= project.getProjectEndDate() %></td>
                                                    </tr>
                                                    <tr>
                                                        <th>Status</th>
                                                        <td>
                                                            <span class="status-badge status-<%= project.getStatus().toLowerCase() %>">
                                                                <%= project.getStatus() %>
                                                            </span>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <th>Budget (LKR)</th>
                                                        <td class="budget-amount">
                                                            <%= String.format("%,.2f", project.getProjectBudget()) %>
                                                        </td>
                                                    </tr>
                                                </table>
                                                <% if (projects.size() > 1) { %>
                                                    <hr class="m-0" style="border-top: 1px dashed var(--light-border);">
                                                <% } %>
                                            <% } %>
                                        <% } else { %>
                                            <div class="empty-state">
                                                <i class="fas fa-folder-open"></i>
                                                <p>No projects found for this client</p>
                                            </div>
                                        <% } %>
                                    </div>
                                </div>
                                
                                <div class="mt-4">
                                    <a href="ViewClientServlet" class="btn-back">
                                        <i class="fas fa-arrow-left me-2"></i> Back to Client List
                                    </a>
                                </div>
                            </div>
                        </div>
                        <%@include file="components/footer.jsp" %>
                        <div class="content-backdrop fade"></div>
                    </div>
                </div>
            </div>
        </div>
        
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>