package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import javax.sql.DataSource;
import javax.naming.InitialContext;
import javax.naming.NamingException;

public class SampleConnectionManager implements AbstractConnectionManager{
    private static SampleConnectionManager sampleConnection = null;
    private Connection connection = null;

    private SampleConnectionManager(){}

    public static AbstractConnectionManager getInstance(){
        if(sampleConnection == null){
            synchronized(SampleConnectionManager.class){
                if(sampleConnection == null){
                    sampleConnection = new SampleConnectionManager();
                }
            }
        }
        return sampleConnection;
    }

    public Connection getConnection(){
        if(connection == null){
            try{
                InitialContext init = new InitialContext();
                DataSource source = (DataSource)init.lookup("java:comp/env/jdbc/mysql");
                connection = source.getConnection();
            }catch(NamingException e){
                e.printStackTrace();
            }catch(SQLException e){
                e.printStackTrace();
            }
        }
        return connection;
    }

    public void closeConnection(){
        try{
            if(connection != null){
                connection.close();
            }
        }catch(SQLException e){
            e.printStackTrace();
        }
    }

    public void beginTransaction(){
        if(connection == null){
            getConnection();
        }
        try{
            connection.setAutoCommit(false);
        }catch(SQLException e){
            e.printStackTrace();
        }
    }

    public void commit(){
        try{
            connection.commit();
        }catch(SQLException e){
            e.printStackTrace();
        }
    }

    public void rollback(){
        try{
            connection.rollback();
        }catch(SQLException e){
            e.printStackTrace();
        }
    }

}
