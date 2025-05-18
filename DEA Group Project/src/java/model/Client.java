package model;

public class Client {

    public int getClient_id() {
        return client_id;
    }

    public void setClient_id(int client_id) {
        this.client_id = client_id;
    }

    public String getClient_name() {
        return client_name;
    }

    public void setClient_name(String client_name) {
        this.client_name = client_name;
    }

    public String getClient_email() {
        return client_email;
    }

    public void setClient_email(String client_email) {
        this.client_email = client_email;
    }

    public String getClient_phoneno() {
        return client_phoneno;
    }

    public void setClient_phoneno(String client_phoneno) {
        this.client_phoneno = client_phoneno;
    }

    public String getClient_password() {
        return client_password;
    }

    public void setClient_password(String client_password) {
        this.client_password = client_password;
    }
    public Client(){
    
    }
    
    public Client(String name,String email,String phone_no,String password){
        
        this.client_name=name;
        this.client_email=email;
        this.client_phoneno=phone_no;
        this.client_password=password;
    }
    
       public Client(int id,String name,String email,String password){
         this.client_id=id;
        this.client_name=name;
        this.client_email=email;
        this.client_password=password;
    }
    
     
    
     
     
     
    private int client_id;
    private String client_name;
    private String client_email;
    private String client_phoneno;
    private String client_password;

    
    
}
