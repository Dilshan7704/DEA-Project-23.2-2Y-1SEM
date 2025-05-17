<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.nsbm.model.Client, com.nsbm.dao.clientDAO" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Client</title>
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
        <style>
            :root {
                --primary-color: #4361ee;
                --secondary-color: #3f37c9;
                --accent-color: #4895ef;
                --light-color: #f8f9fa;
                --dark-color: #212529;
                --success-color: #4cc9f0;
                --border-radius: 8px;
                --box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            }
            
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }
            
            body {
                font-family: 'Poppins', sans-serif;
                background-color: #f5f7fa;
                color: var(--dark-color);
                line-height: 1.6;
            }
            
            .container {
                max-width: 1200px;
                margin: 0 auto;
                padding: 20px;
            }
            
            .form-container {
                max-width: 500px;
                margin: 0 auto;
                padding: 30px;
                background-color: white;
                border-radius: var(--border-radius);
                box-shadow: var(--box-shadow);
            }
            
            .form-container h2 {
                text-align: center;
                margin-bottom: 25px;
                color: var(--primary-color);
                display: flex;
                align-items: center;
                justify-content: center;
            }
            
            .form-container h2 i {
                margin-right: 10px;
            }
            
            .form-group {
                margin-bottom: 20px;
            }
            
            .form-group label {
                display: block;
                margin-bottom: 8px;
                font-weight: 500;
                color: var(--dark-color);
            }
            
            .form-group input {
                width: 100%;
                padding: 12px 15px;
                border: 1px solid #ddd;
                border-radius: var(--border-radius);
                font-family: 'Poppins', sans-serif;
                transition: border 0.3s ease;
            }
            
            .form-group input:focus {
                outline: none;
                border-color: var(--accent-color);
                box-shadow: 0 0 0 3px rgba(67, 97, 238, 0.2);
            }
            
            .btn {
                padding: 12px 20px;
                background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
                color: white;
                border: none;
                border-radius: var(--border-radius);
                font-family: 'Poppins', sans-serif;
                font-size: 16px;
                font-weight: 500;
                cursor: pointer;
                transition: all 0.3s ease;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
                display: inline-flex;
                align-items: center;
                justify-content: center;
                text-decoration: none;
            }
            
            .btn:hover {
                background: linear-gradient(135deg, var(--secondary-color), var(--primary-color));
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
                transform: translateY(-2px);
            }
            
            .btn i {
                margin-right: 8px;
            }
            
            .btn-primary {
                background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
            }
            
            .btn-block {
                width: 100%;
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
               
                color: white;
                transform: translateY(-1px);
                box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06);
            }
            @media (max-width: 768px) {
                .form-container {
                    padding: 20px;
                }
                
                .back-button-container {
                    padding-left: 20px;
                }
            }
        </style>
    </head>
    <body>
        <div class="layout-wrapper layout-content-navbar">
            <div class="layout-container">
                <%@include file="components/menubar.jsp" %>
                <div class="layout-page">
                    <%@include file="components/navbar.jsp" %>
                    <div class="content-wrapper">
                        <div class="container-xxl flex-grow-1 container-p-y">
                            <div class="layout-demo-wrapper">
                                <div class="form-container" style="width: 450px" >
                <h2><i class="fas fa-user-plus"></i> Add New Client</h2>
                                    <% 
                                        String id = request.getParameter("id");
                                        Client client = null;
                                        if (id != null && !id.isEmpty()) {
                                            clientDAO dao = new clientDAO();
                                            client = dao.getClientById(Integer.parseInt(id));
                                        }
                                    %>
                                     
                <form action="AddClientServlet" method="post">
                    <div class="form-group">
                        <label for="name">Full Name</label>
                        <input type="text" id="name" name="name" placeholder="Enter client's full name" required>
                    </div>
                    
                    <div class="form-group">
                        <label for="email">Email Address</label>
                        <input type="email" id="email" name="email" placeholder="Enter client's email" required>
                    </div>
                    
                    <div class="form-group">
                        <label for="phone_no">Phone Number</label>
                        <input type="text" id="phone_no" name="phone_no" placeholder="Enter client's phone number" required>
                    </div>
                    
                    <div class="form-group">
                        <label for="password">Password</label>
                        <input type="password" id="password" name="password" placeholder="Create a password" required>
                    </div>
                    
                    <button type="submit" class="btn" style=" color: white; padding: 12px 140px " >
                        <i class="fas fa-save"></i> Add Client</button>
                </form>
                                </div>
                                
                                                   <div class="mt-4" style="padding-right:1150px ">
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
    </body>
</html>