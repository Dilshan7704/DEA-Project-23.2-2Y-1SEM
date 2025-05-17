package model;

public class Employee {

    public Employee(int employee_Id, String employee_name, String employee_email,
                String employee_password, int phone, String department,
                byte[] profilePicture) {
        this.employee_Id = employee_Id;
        this.employee_name = employee_name;
        this.employee_email = employee_email;
        this.employee_password = employee_password;
        this.department = department;
        this.profilePicture = profilePicture;
        this.phone = phone;
    }
    
    public Employee(int employee_Id, String employee_name, String employee_email,
                int phone, String department) {
        this.employee_Id = employee_Id;
        this.employee_name = employee_name;
        this.employee_email = employee_email;
        this.department = department;
        this.phone = phone;
    }
    
    public Employee(int employee_Id, String employee_name, String employee_email,
                int phone, String department, byte[] profilePicture) {
        this.employee_Id = employee_Id;
        this.employee_name = employee_name;
        this.employee_email = employee_email;
        this.department = department;
        this.phone = phone;
        this.profilePicture = profilePicture;
    }

    
    
      public Employee(int employee_Id, String employee_name, String employee_email,
                String employee_password, int phone, String department ) {
        this.employee_Id = employee_Id;
        this.employee_name = employee_name;
        this.employee_email = employee_email;
        this.employee_password = employee_password;
        this.department = department;
        
        this.phone = phone;
    }
    
    public Employee(){}

    public int getEmployee_Id() {
        return employee_Id;
    }

    public void setEmployee_Id(int employee_Id) {
        this.employee_Id = employee_Id;
    }

    public String getEmployee_name() {
        return employee_name;
    }

    public void setEmployee_name(String employee_name) {
        this.employee_name = employee_name;
    }

    public String getEmployee_email() {
        return employee_email;
    }

    public void setEmployee_email(String employee_email) {
        this.employee_email = employee_email;
    }

    public String getEmployee_password() {
        return employee_password;
    }

    public void setEmployee_password(String employee_password) {
        this.employee_password = employee_password;
    }

    public int getPhone() {
        return phone;
    }
 
    public void setPhone(int phone) {
        this.phone = phone;
    }
 
    public String getDepartment() {
        return department;
    }
 
    public void setDepartment(String department) {
        this.department = department;
    }
    public byte[] getProfilePicture() {
        return profilePicture;
    }

    public void setProfilePicture(byte[] profilePicture) {
        this.profilePicture = profilePicture;
    }
    
    private int employee_Id;
    private String employee_name;
    private String employee_email;
    private String employee_password;
    private String department;
    private byte[] profilePicture;
    private int phone;

}