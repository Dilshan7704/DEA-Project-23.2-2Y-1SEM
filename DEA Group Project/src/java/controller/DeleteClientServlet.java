package controller;

import com.nsbm.dao.clientDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "DeleteClientServlet", urlPatterns = {"/DeleteClientServlet"})
public class DeleteClientServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        
        clientDAO dao = new clientDAO();
        boolean isDeleted = dao.deleteClient(id);
        
        if (isDeleted) {
            request.getSession().setAttribute("successMessage", "Client deleted successfully!");
        } else {
            request.getSession().setAttribute("errorMessage", "Failed to delete client. Please try again.");
        }
        
        response.sendRedirect("ViewClientServlet");
    }
}