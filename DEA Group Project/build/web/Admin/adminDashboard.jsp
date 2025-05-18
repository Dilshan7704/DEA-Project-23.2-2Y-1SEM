<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Add Project</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined" rel="stylesheet" />

    <style>
            :root {
                --primary: #4361ee;
                --primary-light: #4895ef;
                --primary-dark: #3a0ca3;
                --secondary: #3f37c9;
                --accent: #4cc9f0;
                --light: #f8f9fa;
                --light-gray: #e9ecef;
                --dark: #212529;
                --gray: #6c757d;
                --success: #38b000;
                --warning: #ffaa00;
                --danger: #ef233c;
                --border-radius: 10px;
                --shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
                --transition: all 0.3s cubic-bezier(0.25, 0.8, 0.25, 1);
            }

            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }

            body {
                font-family: 'Poppins', sans-serif;
                background-color: #f5f7fa;
                color: var(--dark);
                line-height: 1.6;
            }

            /* Content Wrapper */
            .content-wrapper {
                padding: 30px;
            }

            .page-header {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin-bottom: 30px;
            }

            .page-title h1 {
                font-size: 1.8rem;
                font-weight: 700;
                color: var(--dark);
                display: flex;
                align-items: center;
            }

            .page-title h1 i {
                margin-right: 15px;
                color: var(--primary);
            }

            .page-title p {
                color: var(--gray);
                margin-top: 5px;
            }

            /* Stats Cards */
            .stats-container {
                display: grid;
                grid-template-columns: repeat(auto-fit, minmax(240px, 1fr));
                gap: 20px;
                margin-bottom: 30px;
            }

            .stat-card {
                background: white;
                border-radius: var(--border-radius);
                padding: 25px;
                box-shadow: var(--shadow);
                transition: var(--transition);
                border-left: 4px solid var(--primary);
            }

            .stat-card:hover {
                transform: translateY(-5px);
                box-shadow: 0 15px 30px rgba(0, 0, 0, 0.1);
            }

            .stat-card.projects {
                border-left-color: var(--primary);
            }

            .stat-card.tasks {
                border-left-color: var(--success);
            }

            .stat-card.completed {
                border-left-color: var(--accent);
            }

            .stat-card.team {
                border-left-color: var(--warning);
            }

            .stat-header {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin-bottom: 15px;
            }

            .stat-icon {
                width: 50px;
                height: 50px;
                border-radius: 50%;
                display: flex;
                align-items: center;
                justify-content: center;
                font-size: 1.2rem;
            }

            .stat-icon.projects {
                background-color: rgba(67, 97, 238, 0.1);
                color: var(--primary);
            }

            .stat-icon.tasks {
                background-color: rgba(56, 176, 0, 0.1);
                color: var(--success);
            }

            .stat-icon.completed {
                background-color: rgba(76, 201, 240, 0.1);
                color: var(--accent);
            }

            .stat-icon.team {
                background-color: rgba(255, 170, 0, 0.1);
                color: var(--warning);
            }

            .stat-value {
                font-size: 2rem;
                font-weight: 700;
                margin-bottom: 5px;
            }

            .stat-title {
                color: var(--gray);
                font-size: 0.95rem;
            }

            /* Charts Section */
            .charts-container {
                display: grid;
                grid-template-columns: 2fr 1fr;
                gap: 20px;
                margin-bottom: 30px;
            }

            .chart-card {
                background: white;
                border-radius: var(--border-radius);
                padding: 25px;
                box-shadow: var(--shadow);
            }

            .chart-header {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin-bottom: 20px;
            }

            .chart-header h3 {
                font-size: 1.2rem;
                font-weight: 600;
            }

            .chart-container {
                height: 300px;
                position: relative;
            }

            /* Calendar Section */
            .calendar-container {
                background: white;
                border-radius: var(--border-radius);
                padding: 25px;
                box-shadow: var(--shadow);
                margin-bottom: 30px;
            }

            .calendar-header {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin-bottom: 20px;
            }

            .calendar-header h3 {
                font-size: 1.2rem;
                font-weight: 600;
            }

            .calendar-controls {
                display: flex;
                align-items: center;
            }

            .calendar-controls button {
                background: none;
                border: none;
                cursor: pointer;
                font-size: 1.2rem;
                color: var(--gray);
                padding: 5px 10px;
                border-radius: 5px;
                transition: var(--transition);
            }

            .calendar-controls button:hover {
                background: var(--light-gray);
                color: var(--primary);
            }

            .calendar-month {
                margin: 0 15px;
                font-weight: 500;
            }

            .calendar-grid {
                display: grid;
                grid-template-columns: repeat(7, 1fr);
                gap: 10px;
            }

            .calendar-day-header {
                text-align: center;
                font-weight: 600;
                color: var(--gray);
                padding: 10px 0;
                font-size: 0.9rem;
            }

            .calendar-day {
                height: 80px;
                padding: 5px;
                border-radius: 5px;
                background-color: var(--light);
                display: flex;
                flex-direction: column;
            }

            .calendar-day.empty {
                background-color: transparent;
            }

            .calendar-day-number {
                align-self: flex-end;
                font-size: 0.9rem;
                font-weight: 500;
                margin-bottom: 5px;
            }

            .calendar-day.today .calendar-day-number {
                background-color: var(--primary);
                color: white;
                width: 25px;
                height: 25px;
                border-radius: 50%;
                display: flex;
                align-items: center;
                justify-content: center;
            }

            .calendar-event {
                font-size: 0.7rem;
                padding: 2px 5px;
                border-radius: 3px;
                margin-bottom: 3px;
                overflow: hidden;
                text-overflow: ellipsis;
                white-space: nowrap;
            }

            .calendar-event.primary {
                background-color: rgba(67, 97, 238, 0.1);
                color: var(--primary);
                border-left: 3px solid var(--primary);
            }

            .calendar-event.success {
                background-color: rgba(56, 176, 0, 0.1);
                color: var(--success);
                border-left: 3px solid var(--success);
            }

            /* Recent Activity */
            .activity-container {
                background: white;
                border-radius: var(--border-radius);
                padding: 25px;
                box-shadow: var(--shadow);
            }

            .activity-header {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin-bottom: 20px;
            }

            .activity-header h3 {
                font-size: 1.2rem;
                font-weight: 600;
            }

            .activity-list {
                list-style: none;
            }

            .activity-item {
                display: flex;
                padding: 15px 0;
                border-bottom: 1px solid var(--light-gray);
            }

            .activity-item:last-child {
                border-bottom: none;
            }

            .activity-icon {
                width: 40px;
                height: 40px;
                border-radius: 50%;
                display: flex;
                align-items: center;
                justify-content: center;
                margin-right: 15px;
                font-size: 1rem;
                flex-shrink: 0;
            }

            .activity-icon.primary {
                background-color: rgba(67, 97, 238, 0.1);
                color: var(--primary);
            }

            .activity-icon.success {
                background-color: rgba(56, 176, 0, 0.1);
                color: var(--success);
            }

            .activity-icon.warning {
                background-color: rgba(255, 170, 0, 0.1);
                color: var(--warning);
            }

            .activity-content {
                flex: 1;
            }

            .activity-title {
                font-weight: 500;
                margin-bottom: 5px;
            }

            .activity-time {
                font-size: 0.8rem;
                color: var(--gray);
            }

            /* Footer */
            .footer {
                background-color: white;
                padding: 20px 30px;
                margin-top: 30px;
                border-top: 1px solid var(--light-gray);
                text-align: center;
                color: var(--gray);
                font-size: 0.9rem;
            }

            /* Responsive Styles */
            @media (max-width: 1200px) {
                .charts-container {
                    grid-template-columns: 1fr;
                }
            }

            @media (max-width: 768px) {
                .stats-container {
                    grid-template-columns: repeat(2, 1fr);
                }
                .page-header {
                    flex-direction: column;
                    align-items: flex-start;
                }
                .page-title {
                    margin-bottom: 15px;
                }
            }

            @media (max-width: 576px) {
                .stats-container {
                    grid-template-columns: 1fr;
                }
                .content-wrapper {
                    padding: 20px;
                }
                .calendar-day {
                    height: 60px;
                }
            }
        </style>
        
</head>
<body>

<div class="layout-wrapper layout-content-navbar">
    <div class="layout-container">
        <%@include file="components/menubar_1.jsp" %>
        <div class="layout-page">
            <%@include file="components/navbar_1.jsp" %>
            <div class="content-wrapper">
                <div class="container-xxl flex-grow-1 ">
                    <div class="layout-demo-wrapper">
                        <div class="card mx-auto" style="width: 70rem;">
                            <div class="card-body">
                                 <!-- Content Wrapper -->
                                 
<%
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/projectmanagementdb", "root", "");

        // Get total clients
        String query1 = "SELECT COUNT(*) AS total_client FROM client";
        PreparedStatement ps1 = conn.prepareStatement(query1);
        ResultSet rs1 = ps1.executeQuery();
        int clientRows = 0;
        if (rs1.next()) {
            clientRows = rs1.getInt("total_client");
        }

        // Get total projects
        String query2 = "SELECT COUNT(*) AS total_project FROM project";
        PreparedStatement ps2 = conn.prepareStatement(query2);
        ResultSet rs2 = ps2.executeQuery();
        int projectRows = 0;
        if (rs2.next()) {
            projectRows = rs2.getInt("total_project");
        }

        // Get total employees
        String query3 = "SELECT COUNT(*) AS total_employee FROM employee";
        PreparedStatement ps3 = conn.prepareStatement(query3);
        ResultSet rs3 = ps3.executeQuery();
        int employeeRows = 0;
        if (rs3.next()) {
            employeeRows = rs3.getInt("total_employee");
        }
%>
                                    <div class="content-wrapper">
 
                                        
            <!-- Stats Cards -->
            <div class="stats-container">
                <div class="stat-card projects">
                    <div class="stat-header">
                        <div>
                            <div class="stat-value"><%= projectRows %></div>
                            <div class="stat-title">Total Projects</div>
                        </div>
                        <div class="stat-icon projects">
                            <span class="material-symbols-outlined">assignment_add</span>
                        </div>
                    </div>
                </div>
                <div class="stat-card tasks">
                    <div class="stat-header">
                        <div>
                            <div class="stat-value"><%= employeeRows %></div>
                            <div class="stat-title">Total Employees</div>
                        </div>
                        <div class="stat-icon tasks">
                            <span class="material-symbols-outlined">person</span>
                        </div>
                    </div>
                </div>
                <div class="stat-card completed">
                    <div class="stat-header">
                        <div>
                            <div class="stat-value"><%= clientRows %></div>
                            <div class="stat-title">Total Clients</div>
                        </div>
                        <div class="stat-icon completed">
                            <span class="material-symbols-outlined">group</span>
                        </div>
                    </div>
                </div>
                
            </div>

            <!-- Charts Section -->
            <div class="charts-container">
                <div class="chart-card">
                    <div class="chart-header">
                        <h3>Project Progress</h3>
                    </div>
                    <div class="chart-container">
                        <canvas id="progressChart"></canvas>
                    </div>
                </div>
                <div class="chart-card">
                    <div class="chart-header">
                        <h3>Task Distribution</h3>
                    </div>
                    <div class="chart-container">
                        <canvas id="taskChart"></canvas>
                    </div>
                </div>
            </div>

           

            <!-- Recent Activity -->
            <div class="activity-container">
                <div class="activity-header">
                    <h3>Recent Activity</h3>
                    <a href="#" class="btn btn-text">View All</a>
                </div>
                 <ul class="activity-list">
                    
                    
<%
   
        // Get total projects
        String query4 = "SELECT task_name, project_id, task_status, task_deadline FROM tasks ORDER BY task_id DESC LIMIT 5";;
        PreparedStatement ps4 = conn.prepareStatement(query4);
        ResultSet rs4 = ps4.executeQuery();
         
         while(rs4.next()){
         

                        String taskName = rs4.getString("task_name");
                        int projectId = rs4.getInt("project_id");
                        String taskStatus = rs4.getString("task_status");
                        String deadline = rs4.getString("task_deadline");

                        // Optional logic for friendly timestamps
                        String activityTime = "Just now"; 

                        String query5 = "SELECT * FROM project WHERE project_id = ?";;
                        PreparedStatement ps5 = conn.prepareStatement(query5);
                        ps5.setInt(1, projectId);
                        ResultSet rs5 = ps5.executeQuery();
         
         while(rs5.next()){
%> 

                    <li class="activity-item mb-3 d-flex">
                <div class="activity-icon text-primary me-3">
                    <span class="material-symbols-outlined">notifications_active</span>
                </div>
                <div class="activity-content">
                    <div class="activity-title">
                        Task "<strong><%= taskName %></strong>" was added to project <strong><%= rs5.getString("project_name") %></strong>
                    </div>
                    <div class="activity-meta small text-muted">
                        Status: <%= taskStatus %> | Deadline: <%= deadline %> | <%= activityTime %>
                    </div>
                </div>
            </li>
                    
                
     
<%
    
    }
    
}
        conn.close();
    } catch (Exception e) {
        out.println("<div class='alert alert-danger'>Error loading data: " + e.getMessage() + "</div>");
    }
%>                                 
                            
            </ul>
            </div>

            
        </div>
            </div>
                        </div>
                    </div>

                    <%@include file="components/footer_1.jsp" %>
                    <div class="content-backdrop fade"></div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js@3.7.1/dist/chart.min.js"></script>
        <script>
            // Charts
            const progressCtx = document.getElementById('progressChart').getContext('2d');
            const progressChart = new Chart(progressCtx, {
                type: 'line',
                data: {
                    labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun'],
                    datasets: [{
                        label: 'Completed Projects',
                        data: [12, 19, 15, 25, 22, 30],
                        borderColor: 'rgba(67, 97, 238, 1)',
                        backgroundColor: 'rgba(67, 97, 238, 0.1)',
                        tension: 0.4,
                        fill: true
                    }, {
                        label: 'New Projects',
                        data: [5, 10, 8, 15, 12, 18],
                        borderColor: 'rgba(76, 201, 240, 1)',
                        backgroundColor: 'rgba(76, 201, 240, 0.1)',
                        tension: 0.4,
                        fill: true
                    }]
                },
                options: {
                    responsive: true,
                    maintainAspectRatio: false,
                    plugins: {
                        legend: {
                            position: 'top',
                        }
                    },
                    scales: {
                        y: {
                            beginAtZero: true
                        }
                    }
                }
            });

            const taskCtx = document.getElementById('taskChart').getContext('2d');
            const taskChart = new Chart(taskCtx, {
                type: 'doughnut',
                data: {
                    labels: ['Completed', 'In Progress', 'Pending', 'Overdue'],
                    datasets: [{
                        data: [45, 30, 15, 10],
                        backgroundColor: [
                            'rgba(56, 176, 0, 0.8)',
                            'rgba(67, 97, 238, 0.8)',
                            'rgba(255, 170, 0, 0.8)',
                            'rgba(239, 35, 60, 0.8)'
                        ],
                        borderWidth: 0
                    }]
                },
                options: {
                    responsive: true,
                    maintainAspectRatio: false,
                    plugins: {
                        legend: {
                            position: 'right',
                        }
                    },
                    cutout: '70%'
                }
            });
        </script>

</body>
</html>
