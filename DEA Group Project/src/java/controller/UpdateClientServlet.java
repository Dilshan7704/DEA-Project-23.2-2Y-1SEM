package controller;

import dao.clientDAO;
import model.Client;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "UpdateClientServlet", urlPatterns = {"/UpdateClientServlet"})
public class UpdateClientServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone_no = request.getParameter("phone_no");
        String password = request.getParameter("password");
        
        Client client = new Client();
        client.setClient_id(id);
        client.setClient_name(name);
        client.setClient_email(email);
        client.setClient_phoneno(phone_no);
        client.setClient_password(password);
        
        clientDAO dao = new clientDAO();
        boolean isUpdated = dao.updateClient(client);
        
        if (isUpdated) {
            request.setAttribute("successMessage", "Client updated successfully!");
        } else {
            request.setAttribute("errorMessage", "Failed to update client. Please try again.");
        }
        
        response.sendRedirect("ViewClientServlet");
    }
}