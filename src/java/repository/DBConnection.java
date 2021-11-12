/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package repository;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
    private Connection connection = null;
    private final String database = "task_requester-JSPClass";
    private final String user = "root";
    private final String password = "rootdatabase";
    
    public Connection connect() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://localhost/"+ this.database, 
              this.user, this.password);
        } catch( ClassNotFoundException exception1 ) {
            System.out.println("Driver error " + exception1.getMessage());
        } catch(SQLException exception2) {
            System.out.println("Erro na tentativa de conexão: " + exception2.getMessage());
        }
        return connection;
    }

    public Connection getConnection() {
        return connection;
    }

    public void setConnection(Connection connection) {
        this.connection = connection;
    }


    
    
}
