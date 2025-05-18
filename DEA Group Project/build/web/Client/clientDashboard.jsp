<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>My Projects</title>
    
</head>

<body>
    
 <!-- Layout Start -->
<div class="layout-wrapper layout-content-navbar">
    <div class="layout-container">
        <%@include file="components/menubar_1.jsp" %>
        <div class="layout-page">
            <%@include file="components/navbar_1.jsp" %>
            <div class="content-wrapper">
                <div class="container-xxl flex-grow-1 container-p-y">
                    
                    
                    <div class="row" style="display:flex;justify-content: center;">
                        
                        <%
    try {
        String c_id = request.getParameter("client_id");
        int client_id = Integer.parseInt(c_id);

        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/projectmanagementdb", "root", "");

        String query1 = "SELECT * FROM project WHERE client_id = ?";
        PreparedStatement ps1 = conn.prepareStatement(query1);
        ps1.setInt(1, client_id);
        ResultSet rs1 = ps1.executeQuery();
%>
<%
    while(rs1.next()) {
%>
                        <div class="card m-2 col-3" style="max-width:100%;">
                            <div class="card-body">
                                <h2 style="height: 40%;"><%= rs1.getString("project_name") %></h2>
                                <p><%= rs1.getString("project_description") %></p>
                                <a class="view-button" href="clientProjectView.jsp?project_id=<%= rs1.getInt("project_id") %>&client_id=<%= client_id %>"><button class="btn btn-primary">View</button></a>
                            </div>
                        </div>

<%
    }

    } catch (Exception e) {
        out.println("Error fetching projects.");
        e.printStackTrace(new java.io.PrintWriter(out));
    }
%>                        

                    </div>
                </div>

                <%@include file="components/footer_1.jsp" %>
                <div class="content-backdrop fade"></div>
            </div>
        </div>
    </div>
</div>   


 

        
</body>
</html>
