package ttc.dao;

import java.util.List;
import java.util.ArrayList;
import java.util.Map;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.ResultSet;

import ttc.util.MySqlConnectionManager;
import ttc.bean.Bean;
import ttc.bean.DirectMessageBean;
import ttc.exception.IntegrationException;

public class DirectMessageSendDao implements AbstractDao{

    public Bean read(Map map)throws IntegrationException{
        return null;
    }


    public List readAll(Map map)throws IntegrationException{
        return null;
    }

    public int update(Map map)throws IntegrationException{
        return 0;
    }

    public int insert(Map map)throws IntegrationException{
        PreparedStatement pst = null;
        int result = 0;
        try{
            Connection cn = null;
            cn = MySqlConnectionManager.getInstance().getConnection();
            MySqlConnectionManager.getInstance().beginTransaction();
            StringBuffer sql = new StringBuffer();
            sql.append("insert into ");
            sql.append("direct_messages(message_id,message_body,message_date, ");
            sql.append("fk_send_user_id,fk_receive_user_id) ");
            sql.append("values(?,?,?,?,?)");

            pst = cn.prepareStatement( new String(sql) );

            pst.setString(1, (String)map.get("messageId"));
            pst.setString(2, (String)map.get("messageBody"));
            pst.setString(3, (String)map.get("messageDate"));
            pst.setString(4, (String)map.get("sendUserId"));
            pst.setString(5, (String)map.get("receiveUserId"));

            result = pst.executeUpdate();

        }catch(SQLException e){
            MySqlConnectionManager.getInstance().rollback();
            throw new IntegrationException(e.getMessage(),e);
        }finally{
            try{
                if(pst!=null){
                    pst.close();
                }
            }catch(SQLException e){
                throw new IntegrationException(e.getMessage(),e);
            }
        }

        return result;
    }
}
