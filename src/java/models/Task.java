/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

import java.sql.PreparedStatement;
import java.sql.Connection; 
import java.sql.SQLException;
import repository.DBConnection;

/**
 *
 * @author square
 */
public class Task {
    private Long id;
    private String subject;
    private String description;
    private String category;
    private String executor;
    private String state;

    public Task() {}
    public Task(String suject, String description, String category, String executor) {
        this.subject = suject;
        this.description = description;
        this.category = category;
        this.executor = executor;
        this.state = "aberto";
    }
    
    public Task(Long id, String suject, String description, String category, String executor) {
        this.id = id;
        this.subject = suject;
        this.description = description;
        this.category = category;
        this.executor = executor;
        this.state = "aberto";
    }    

    public Task(Long id, String subject, String description, String category, String executor, String state) {
        this.id = id;
        this.subject = subject;
        this.description = description;
        this.category = category;
        this.executor = executor;
        this.state = state;
    }
    
    public Long getId() {
        return id;
    }
    
    public void setId(Long id) {
        this.id = id;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getExecutor() {
        return executor;
    }

    public void setExecutor(String executor) {
        this.executor = executor;
    }    
    
    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject.toLowerCase();
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }
    
        
}
