/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package repository;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import models.Task;

/**
 *
 * @author square
 */
public class TaskRepo {
    private ArrayList<Task> tasks = new ArrayList<Task>();

    public TaskRepo() {}
    
    public static Task getTaskById(Long id) {
        Task task = null;        
        try {
            Connection connection = new DBConnection().connect();
            
            if(connection!=null) {
                PreparedStatement statement;
                String sql_command = "SELECT * FROM tasks WHERE id = ?";
                
                statement= connection.prepareStatement(sql_command);
                statement.setLong(1, id);
                
                ResultSet resultSet = statement.executeQuery();
                
                while(resultSet.next()) {
                    task = new Task();
                    task.setId(resultSet.getLong("id"));
                    task.setSubject(resultSet.getString("subject"));
                    task.setCategory(resultSet.getString("category"));
                    task.setDescription(resultSet.getString("description"));
                    task.setExecutor(resultSet.getString("executor"));
                    task.setState(resultSet.getString("state"));                    
                }         
            }
        } catch (SQLException exception) {
            System.err.println(exception.getMessage());
        } 
        return task;
    }
    
    public ArrayList<Task> getAllTasks() {
        try {
            String sqlCommand = "select * from tasks";
            ResultSet resultSet = new DBConnection().connect().createStatement().executeQuery(sqlCommand);
            
            while(resultSet.next()) {
                tasks.add(new Task(resultSet.getLong("id"), 
                        resultSet.getString("subject"), 
                        resultSet.getString("description"), 
                        resultSet.getString("category"), 
                        resultSet.getString("executor"),
                        resultSet.getString("state")
                    )
                );
                      
            }
            
            return getTasks();
        } catch(SQLException exception) {
            System.out.println(exception);
            
        }
        
        return getTasks();
        
    }
    
    public ArrayList<Task> getTasks() {
        return this.tasks;
    }
    
    public static Boolean saveTask(Task task) {
        try {
            Connection connection = new DBConnection().connect();
            if(connection != null) {
                PreparedStatement statement;
                String sql_command = "insert into tasks(subject, description, category, executor, state) values(?,?,?,?,?)";
                statement = connection.prepareStatement(sql_command);
                statement.setString(1, task.getSubject());
                statement.setString(2, task.getDescription());
                statement.setString(3, task.getCategory());
                statement.setString(4, task.getExecutor());
                statement.setString(5, "pendente");
                
                statement.executeUpdate();
                
                connection.close();
                
                return true;
            } else
                return false;
        } catch (SQLException exception) {
            System.err.println(exception.getMessage());
            return false;
            
        }
    }
    
    public static Boolean updateTask(Task task) {
        try {
            Connection connection = new DBConnection().connect();
            if(connection != null) {
                PreparedStatement statement;
                String sql_command = "update tasks set subject=?, description=?, category=?, executor=?, state=? where id=?";
                statement = connection.prepareStatement(sql_command);
                
                statement.setString(1, task.getSubject());
                statement.setString(2, task.getDescription());
                statement.setString(3, task.getCategory());
                statement.setString(4, task.getExecutor());
                statement.setString(5, task.getState());
                statement.setString(6, task.getId().toString());
                
                statement.executeUpdate();
                
                connection.close();
                
                return true;
            } else
                return false;
        } catch (SQLException exception) {
            System.err.println(exception.getMessage());
            return false;
            
        }
    }
    
    public static Boolean deleteTask(Long id) {
        try {
            Connection connection = new DBConnection().connect();
            if(connection != null) {
                PreparedStatement statement;
                String sql_command = "DELETE FROM tasks WHERE id = ?";
                
                statement = connection.prepareStatement(sql_command);
                statement.setLong(1, id);
                
                statement.executeUpdate();
                
                return true;
            } else
                return false;
        } catch (SQLException exception) {
            System.err.println(exception.getMessage());
            return false;
        }
    }
    
}
