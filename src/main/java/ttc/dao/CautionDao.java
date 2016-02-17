package ttc.dao;

import java.util.List;

import java.util.Map;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import ttc.bean.Bean;

import ttc.exception.integration.IntegrationException;

import ttc.util.MySqlConnectionManager;

public class CautionDao implements AbstractDao{
    PreparedStatement pst=null;
    Connection cn=null;
    ResultSet rs=null;
    public int insert(Map map)throws IntegrationException{
         int count = 0;
        try{
            cn=MySqlConnectionManager.getInstance().getConnection();
            StringBuffer sql = new StringBuffer();
            sql.append("insert into ");
            sql.append("cautions(fk_user_id,fk_caution_user_id,caution_date,caution_title,caution_body,report_page_url)");
            sql.append("values(?,?,sysdate(),?,?,?)");
            pst=cn.prepareStatement(new String(sql));
            System.out.println("警告insert");

            pst.setString(1,(String)map.get("userId"));
            pst.setString(2,(String)map.get("cautionUserId"));
            pst.setString(3,(String)map.get("cautionTitle"));
            pst.setString(4,(String)map.get("cautionBody"));
            pst.setString(5,(String)map.get("url"));


            count = pst.executeUpdate();
        }catch(SQLException e){
            MySqlConnectionManager.getInstance().rollback();
        }finally{
            try{
                if(pst!=null){
                    pst.close();
                }
            }catch(SQLException e){
                e.printStackTrace();
            }
        }
        return count;
    }

    public int update(Map map)throws IntegrationException{
        int i=0;

        return i;
    }

    public List readAll(Map map)throws IntegrationException{
        return null;
    }

    public Bean read(Map map)throws IntegrationException{
        
        return null;
    }
}
