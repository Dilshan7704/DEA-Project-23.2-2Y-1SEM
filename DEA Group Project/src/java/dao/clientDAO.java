
package dao;

import model.Client;
import util.DB;
import java.sql.Connection;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;


public class clientDAO {
    
     public void insertClient(Client Client) {
 
        try {
            
            String sql = "INSERT INTO client(client_name, client_email, client_phoneno,client_password) VALUES(?, ?, ?, ?)";
            Connection conn =DB.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            
            ps.setString(1, Client.getClient_name());
            ps.setString(2, Client.getClient_email());
            ps.setString(3, Client.getClient_phoneno());
            ps.setString(4, Client.getClient_password());
            
            int add = ps.executeUpdate();
            if (add > 0) {
                System.out.println("Record inserted successfully");
            } else {
                System.out.println("Failed to insert record");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
     
     
    public List<Client> ListClient() {
    List<Client> clients = new ArrayList();
    try {
        String sql = "SELECT * FROM client";  
        
        try (Connection conn = DB.getConnection();
             Statement st = conn.createStatement();
             ResultSet rs = st.executeQuery(sql);) {
            
            while (rs.next()) {
                Client client = new Client();
                client.setClient_id(rs.getInt("client_id")); 
                client.setClient_name(rs.getString("client_name")); 
                client.setClient_email(rs.getString("client_email"));  
                client.setClient_phoneno(rs.getString("client_phoneno")); 
                client.setClient_password(rs.getString("client_password")); 
                clients.add(client);
            }
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    return clients;
}
      
  public Client getClientById(int id) {
    Client client = null;
    try {
        String sql = "SELECT * FROM client WHERE client_id = ?";
        Connection conn = DB.getConnection();
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setInt(1, id);
        
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            client = new Client();
            client.setClient_id(rs.getInt("client_id"));
            client.setClient_name(rs.getString("client_name"));
            client.setClient_email(rs.getString("client_email"));
            client.setClient_phoneno(rs.getString("client_phoneno"));
            client.setClient_password(rs.getString("client_password"));
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    return client;
}

public boolean updateClient(Client client) {
    boolean isUpdated = false;
    try {
        String sql = "UPDATE client SET client_name = ?, client_email = ?, client_phoneno = ?, client_password = ? WHERE client_id = ?";
        Connection conn = DB.getConnection();
        PreparedStatement ps = conn.prepareStatement(sql);
        
        ps.setString(1, client.getClient_name());
        ps.setString(2, client.getClient_email());
        ps.setString(3, client.getClient_phoneno());
        ps.setString(4, client.getClient_password());
        ps.setInt(5, client.getClient_id());
        
        int rowsAffected = ps.executeUpdate();
        if (rowsAffected > 0) {
            isUpdated = true;
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    return isUpdated;
}
public boolean deleteClient(int id) {
    boolean isDeleted = false;
    try {
        String sql = "DELETE FROM client WHERE client_id = ?";
        Connection conn = DB.getConnection();
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setInt(1, id);
        
        int rowsAffected = ps.executeUpdate();
        if (rowsAffected > 0) {
            isDeleted = true;
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    return isDeleted;
}

// Add this method to your existing clientDAO class
 public Client validateClient(String email, String password) {
        Client client = null;
        try {
            String sql = "SELECT * FROM client WHERE client_email = ? AND client_password = ?";
            Connection conn = DB.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, password);
            
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                client = new Client();
                client.setClient_id(rs.getInt("client_id"));
                client.setClient_name(rs.getString("client_name"));
                client.setClient_email(rs.getString("client_email"));
                client.setClient_phoneno(rs.getString("client_phoneno"));
                client.setClient_password(rs.getString("client_password"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return client;
    }
 public Client validateclient(String username, String password) {
        
        Client client = null;
        
         try{
 
        String sql = "SELECT * FROM client WHERE client_email=? AND client_password=?";
         Connection conn = DB.getConnection();
        PreparedStatement statement = conn.prepareStatement(sql);
        statement.setString(1, username);
        statement.setString(2, password);
        
        ResultSet resultSet = statement.executeQuery();
        
         if (resultSet.next()) {
            int id = resultSet.getInt("client_id");
            String name = resultSet.getString("client_name");
            String pwd = resultSet.getString("client_password");
            String email = resultSet.getString("client_email");
            
            client = new Client(id,name,pwd,email);

            
        }
         }
         catch (Exception e) {
        e.printStackTrace();
        
        
    }
         return client;
    }
  public List<Client> ClientList() {
     ArrayList<Client> clientList  = new ArrayList<>();
    try {
        

       

        String sql = "SELECT * FROM client";
         Connection conn = DB.getConnection();
        Statement statement = conn.createStatement();
        ResultSet resultSet = statement.executeQuery(sql);
       while (resultSet.next()) {
    int id = resultSet.getInt(1);
    String name = resultSet.getString(2);
    String email = resultSet.getString(3);
    String phone = resultSet.getString(4);
    String password = resultSet.getString(5);
    
    Client pt = new Client(id,name,email,phone);
     clientList.add(pt);
     
    
}

    } catch (Exception e) {
    
        e.printStackTrace();
    } 
    return clientList;
}
    
}
