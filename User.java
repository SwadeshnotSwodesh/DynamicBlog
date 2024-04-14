 
package com.tech.blog.entities;
import java.sql.*;
public class User {
    private int id;
    private String name;
    private String password;
    private String email;
    private String gender;
    private Timestamp dateTime;
    private String profile;

    
    
    //constructor section starts here
    public User(int id, String name, String password, String email, String gender, Timestamp dateTime) {
        this.id = id;
        this.name = name;
   
        this.password = password;
        this.email = email;
        this.gender = gender;
        this.dateTime = dateTime;
    }

    public User() {
        //this is a default constructor
    }

    public User(String name, String password, String email, String gender) {
        this.name = name;
        this.password = password;
        this.email = email;
        
        this.gender = gender;
     
    }//constructor section ends here...
    
    
//this is getter and setter methods

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public Timestamp getDateTime() {
        return dateTime;
    }

    public void setDateTime(Timestamp dateTime) {
        this.dateTime = dateTime;
    }
    
    public String getProfile() {
        return profile;
    }

    public void setProfile(String profile) {
        this.profile = profile;
    }
    //getters and setters ends here...
    
    
    
    
    
    
}
