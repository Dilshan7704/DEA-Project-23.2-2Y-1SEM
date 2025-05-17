package model;

import java.time.LocalDate;

public class Project {
    
    public Project(int id, String project_name, String project_description, LocalDate project_startdate, 
              LocalDate project_enddate, String status, float project_budget, int client_id) {
    this.project_id = id;
    this.project_name = project_name;
    this.project_description = project_description;
    this.project_startdate = project_startdate;
    this.project_enddate = project_enddate;
    this.status = status;
    this.project_budget = project_budget;
    this.client_id = client_id;
}
    public  Project(){}


    public int getProject_id() {
        return project_id;
    }

    public void setProject_id(int project_id) {
        this.project_id = project_id;
    }

    public String getProject_name() {
        return project_name;
    }

    public void setProject_name(String project_name) {
        this.project_name = project_name;
    }

    public String getProject_description() {
        return project_description;
    }

    public void setProject_description(String project_description) {
        this.project_description = project_description;
    }

    public LocalDate getProject_startdate() {
        return project_startdate;
    }

    public void setProject_startdate(LocalDate project_startdate) {
        this.project_startdate = project_startdate;
    }

    public LocalDate getProject_enddate() {
        return project_enddate;
    }

    public void setProject_enddate(LocalDate project_enddate) {
        this.project_enddate = project_enddate;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public float getProject_budget() {
        return project_budget;
    }

    public void setProject_budget(float project_budget) {
        this.project_budget = project_budget;
    }

    public int getClient_id() {
        return client_id;
    }

    public void setClient_id(int client_id) {
        this.client_id = client_id;
    }

    
    private int project_id;
    private String project_name;
    private String project_description;
    private LocalDate project_startdate;
    private LocalDate project_enddate;
    private String status;
    private float project_budget;
    private int client_id;
}


