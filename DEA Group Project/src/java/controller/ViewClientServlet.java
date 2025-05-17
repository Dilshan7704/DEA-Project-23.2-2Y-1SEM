/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.clientDAO;
import model.Client;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
@WebServlet(name = "ViewClientServlet", urlPatterns = {"/ViewClientServlet"})
public class ViewClientServlet extends HttpServlet {
    
       @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        clientDAO dao = new clientDAO();
        
        try {
            List<Client> clients = dao.ListClient();  
            request.setAttribute("clients", clients);  
            
            // Check for success/error messages from session
            String successMessage = (String) request.getSession().getAttribute("successMessage");
            String errorMessage = (String) request.getSession().getAttribute("errorMessage");
            
            if (successMessage != null) {
                request.setAttribute("successMessage", successMessage);
                request.getSession().removeAttribute("successMessage");
            }
            
            if (errorMessage != null) {
                request.setAttribute("errorMessage", errorMessage);
                request.getSession().removeAttribute("errorMessage");
            }
            
        } catch(Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Error retrieving client list: " + e.getMessage());
        }

        RequestDispatcher ds = request.getRequestDispatcher("List_Client.jsp");
        ds.forward(request, response);
    }
}

