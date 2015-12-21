package ttc.dao;

import java.util.List;
import java.util.Map;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


import ttc.exception.IntegrationException;

import ttc.util.MySqlConnectionManager;

public class BlogDao implements AbstractDao{
    public insert(Map map)throws IntegrationException{
        PreparedStatement pst = null;
        try{
            Connection cn = null;
            con = MySqlConnectionManager.getInstance().beginTransaction();
            String sql =
        }
    }
}
