package model;

public class Admin {

    public int getAdmin_Id() {
        return admin_Id;
    }

    public void setAdmin_Id(int admin_Id) {
        this.admin_Id = admin_Id;
    }

    public String getAdmin_email() {
        return admin_email;
    }

    public void setAdmin_email(String admin_email) {
        this.admin_email = admin_email;
    }

    public String getAdmin_password() {
        return admin_password;
    }

    public void setAdmin_password(String admin_password) {
        this.admin_password = admin_password;
    }
    private int admin_Id;
    private String admin_email;
    private String admin_password;

    // Getters and Setters
    
}