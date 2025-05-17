
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
            
            ps.setString(1, Client.getName());
            ps.setString(2, Client.getEmail());
            ps.setString(3, Client.getPhone_no());
            ps.setString(4, Client.getPassword());
            
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
                client.setId(rs.getInt("client_id")); 
                client.setName(rs.getString("client_name")); 
                client.setEmail(rs.getString("client_email"));  
                client.setPhone_no(rs.getString("client_phoneno")); 
                client.setPassword(rs.getString("client_password")); 
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
            client.setId(rs.getInt("client_id"));
            client.setName(rs.getString("client_name"));
            client.setEmail(rs.getString("client_email"));
            client.setPhone_no(rs.getString("client_phoneno"));
            client.setPassword(rs.getString("client_password"));
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
        
        ps.setString(1, client.getName());
        ps.setString(2, client.getEmail());
        ps.setString(3, client.getPhone_no());
        ps.setString(4, client.getPassword());
        ps.setInt(5, client.getId());
        
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
                client.setId(rs.getInt("client_id"));
                client.setName(rs.getString("client_name"));
                client.setEmail(rs.getString("client_email"));
                client.setPhone_no(rs.getString("client_phoneno"));
                client.setPassword(rs.getString("client_password"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return client;
    }
    
}
