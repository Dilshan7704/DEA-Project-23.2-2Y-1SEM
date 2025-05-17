<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.nsbm.model.Client, com.nsbm.model.Project, java.util.List" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Client & Project Details</title>
    
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" rel="stylesheet">
        <style>
            :root {
                --primary-color: #6366f1;
                --primary-hover: #4f46e5;
                --secondary-color: #f8fafc;
                --text-color: #334155;
                --light-border: #e2e8f0;
                --success-color: #10b981;
                --warning-color: #f59e0b;
                --info-color: #3b82f6;
                --danger-color: #ef4444;
            }
            
            body {
                background-color: #f1f5f9;
                color: var(--text-color);
                font-family: 'Inter', -apple-system, BlinkMacSystemFont, sans-serif;
            }
            
            .card {
                border: none;
                border-radius: 12px;
                box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06);
                overflow: hidden;
                margin-bottom: 24px;
                background-color: white;
                transition: transform 0.3s ease, box-shadow 0.3s ease;
            }
            
            .card:hover {
                transform: translateY(-2px);
                box-shadow: 0 10px 15px -3px rgba(0, 0, 0, 0.1), 0 4px 6px -2px rgba(0, 0, 0, 0.05);
            }
            
            .card-header {
                background-color: var(--primary-color);
                color: white;
                padding: 1.25rem 1.5rem;
                border-bottom: none;
            }
            
            .card-header h3 {
                font-weight: 600;
                margin: 0;
                font-size: 1.25rem;
            }
            
            .detail-table {
                width: 100%;
                border-collapse: collapse;
            }
            
            .detail-table tr:not(:last-child) {
                border-bottom: 1px solid var(--light-border);
            }
            
            .detail-table th, 
            .detail-table td {
                padding: 1rem 1.5rem;
                text-align: left;
                vertical-align: top;
            }
            
            .detail-table th {
                width: 30%;
                font-weight: 500;
                color: #64748b;
                background-color: #c5d3fa;
            }
            
            .detail-table td {
                font-weight: 400;
                color: var(--text-color);
            }
            
            .status-badge {
                padding: 0.35rem 0.65rem;
                border-radius: 50px;
                font-size: 0.75rem;
                font-weight: 600;
                text-transform: capitalize;
            }
            
            .status-pending {
                background-color: rgba(245, 158, 11, 0.1);
                color: var(--warning-color);
            }
            
            .status-completed {
                background-color: rgba(16, 185, 129, 0.1);
                color: var(--success-color);
            }
            
            .status-inprogress {
                background-color: rgba(59, 130, 246, 0.1);
                color: var(--info-color);
            }
            
            .budget-amount {
                font-weight: 600;
                color: var(--success-color);
            }
            
            .empty-state {
                padding: 3rem 1rem;
                text-align: center;
                color: #94a3b8;
            }
            
            .empty-state i {
                font-size: 2.5rem;
                margin-bottom: 1rem;
                color: #cbd5e1;
            }
            
            .empty-state p {
                margin: 0;
                font-size: 1rem;
            }
            
            .btn-back {
                background-color: var(--primary-color);
                color: white;
                padding: 0.65rem 1.25rem;
                border-radius: 8px;
                text-decoration: none;
                display: inline-flex;
                align-items: center;
                font-weight: 500;
                transition: all 0.2s ease;
                border: none;
                box-shadow: 0 1px 2px 0 rgba(0, 0, 0, 0.05);
            }
            
            .btn-back:hover {
                background-color: var(--primary-hover);
                color: white;
                transform: translateY(-1px);
                box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06);
            }
            
            .section-title {
                font-size: 1.5rem;
                font-weight: 600;
                color: var(--text-color);
                margin-bottom: 1.5rem;
                display: flex;
                align-items: center;
            }
            
            .section-title i {
                margin-right: 0.75rem;
                color: var(--primary-color);
            }
            
            .content-container {
                background-color: white;
                border-radius: 12px;
                padding: 2rem;
                box-shadow: 0 1px 3px 0 rgba(0, 0, 0, 0.1), 0 1px 2px 0 rgba(0, 0, 0, 0.06);
                margin-bottom: 2rem;
                }</style>
        
    </head>
    <body>
        <div class="layout-wrapper layout-content-navbar">
            <div class="layout-container">
                <%@include file="../components/menubar.jsp" %>
                <div class="layout-page">
                    <%@include file="../components/navbar.jsp" %>
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
                        <%@include file="../components/footer.jsp" %>
                        <div class="content-backdrop fade"></div>
                    </div>
                </div>
            </div>
        </div>
        
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>