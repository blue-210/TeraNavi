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
    public int insert(Map map)throws IntegrationException{
        return 0;
    }

    public int update(Map map)throws IntegrationException{
        PreparedStatement pst = null;
        int result = 0;

        try{

            Connection cn = null;
            cn = MySqlConnectionManager.getInstance().beginTransaction();
            String sql = "update users set blog_title=?,blog_header_path=?,blog_explanation=? where user_id=?";
            pst = cn.prepareStatement(sql);

            pst.setString(1,(String)map.get("title"));
            pst.setString(2,(String)map.get("header"));
            pst.setString(3,(String)map.get("explanation"));
            pst.setString(4,(String)map.get("userId"));

            result =  pst.executeUpdate();

        }catch(SQLException e){
            throw new IntegrationException(e.getMessage(),e);
        }

        return result;
    }
}
