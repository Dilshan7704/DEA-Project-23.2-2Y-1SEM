<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
        <style>
            :root {
                --primary-color: #4361ee;
                --secondary-color: #3f37c9;
                --accent-color: #4895ef;
                --light-color: #f8f9fa;
                --dark-color: #212529;
                --danger-color: #e63946;
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
                display: flex;
                justify-content: center;
                align-items: center;
                min-height: 100vh;
            }
            
            .login-container {
                width: 100%;
                max-width: 400px;
                background-color: white;
                padding: 30px;
                border-radius: var(--border-radius);
                box-shadow: var(--box-shadow);
            }
            
            .login-header {
                text-align: center;
                margin-bottom: 30px;
            }
            
            .login-header h1 {
                color: var(--primary-color);
                margin-bottom: 10px;
            }
            
            .form-group {
                margin-bottom: 20px;
            }
            
            .form-group label {
                display: block;
                margin-bottom: 8px;
                font-weight: 500;
            }
            
            .form-group input, 
            .form-group select {
                width: 100%;
                padding: 12px 15px;
                border: 1px solid #ddd;
                border-radius: var(--border-radius);
                font-family: 'Poppins', sans-serif;
            }
            
            .form-group input:focus,
            .form-group select:focus {
                outline: none;
                border-color: var(--accent-color);
            }
            
            .btn-login {
                width: 100%;
                padding: 12px;
                background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
                color: white;
                border: none;
                border-radius: var(--border-radius);
                font-family: 'Poppins', sans-serif;
                font-size: 16px;
                cursor: pointer;
                transition: all 0.3s ease;
            }
            
            .btn-login:hover {
                background: linear-gradient(135deg, var(--secondary-color), var(--primary-color));
            }
            
            .alert-error {
                padding: 12px;
                background-color: rgba(230, 57, 70, 0.1);
                color: var(--danger-color);
                border-radius: var(--border-radius);
                margin-bottom: 20px;
                display: flex;
                align-items: center;
            }
            
            .alert-error i {
                margin-right: 10px;
            }
        </style>
    </head>
    <body>
        <div class="login-container">
            <div class="login-header">
                <h1>Project Management</h1>
                <p>Login to your account</p>
            </div>
            
            <% if (request.getAttribute("errorMessage") != null) { %>
                <div class="alert-error">
                    <i class="fas fa-exclamation-circle"></i> ${errorMessage}
                </div>
            <% } %>
            
            <form action="LoginServlet" method="post">
                <div class="form-group">
                    <label for="userType">Login As</label>
                    <select id="userType" name="userType" required>
                        <option value="">Select User Type</option>
                        <option value="admin">Admin</option>
                        <option value="client">Client</option>
                        <option value="employee">Employee</option>
                    </select>
                </div>
                
                <div class="form-group">
                    <label for="email">Email Address</label>
                    <input type="email" id="email" name="email" placeholder="Enter your email" required>
                </div>
                
                <div class="form-group">
                    <label for="password">Password</label>
                    <input type="password" id="password" name="password" placeholder="Enter your password" required>
                </div>
                
                <button type="submit" class="btn-login">Login</button>
            </form>
        </div>
    </body>
</html>