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

@WebServlet(name = "AddClientServlet", urlPatterns = {"/AddClientServlet"})
public class AddClientServlet extends HttpServlet {

    
   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name=request.getParameter("name");
        String email=request.getParameter("email");
        String phone_no=request.getParameter("phone_no");
        String password=request.getParameter("password");
        
        Client  Client1=new Client();
        Client1.setName(name);
        Client1.setEmail(email);
        Client1.setPhone_no(phone_no);
        Client1.setPassword(password);
        
        clientDAO DAO=new clientDAO();
        DAO.insertClient(Client1);
        
        
         try {
        List<Client> clients = DAO.ListClient();  
        request.setAttribute("clients", clients);  
        
        
    } catch(Exception e) {
        e.printStackTrace();
    }

       RequestDispatcher ds = request.getRequestDispatcher("List_Client.jsp");
        ds.forward(request, response);
        
    }

   

}
