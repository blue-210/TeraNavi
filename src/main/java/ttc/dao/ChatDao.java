package ttc.dao;

import java.text.SimpleDateFormat;

import java.util.List;
import java.util.ArrayList;
import java.util.Map;
import java.sql.Date;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import ttc.bean.UserBean;
import ttc.bean.Bean;
import ttc.exception.IntegrationException;
import ttc.util.MySqlConnectionManager;

import ttc.exception.NotLineException;


public class ChatDao implements AbstractDao{
    PreparedStatement pst=null;
    Connection cn=null;
    ResultSet rs=null;

    public List readAll(Map map)throws IntegrationException{
        return null;
    }

    public int update(Map map)throws IntegrationException{
        return 0;

    }

    public int insert(Map map)throws IntegrationException{
        int count = 0;
        try{
            cn=MySqlConnectionManager.getInstance().getConnection();
            StringBuffer sql = new StringBuffer();
            sql.append("insert into chat(fk_user_id,fk_topic_id,chat_body,chat_date,chat_delete_flag)");
            sql.append("values(?,?,?,?,?)");
            pst=cn.prepareStatement(new String(sql));

            pst.setString(1,(String)map.get("userId"));
            pst.setString(2,(String)map.get("topicId"));
            pst.setString(3,(String)map.get("chatBody"));
            pst.setString(4,(String)map.get("chatDate"));
            pst.setString(5,(String)map.get("chatDeleteFlag"));


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
    public Bean read(Map map) throws IntegrationException{
        return null;
    }


}
