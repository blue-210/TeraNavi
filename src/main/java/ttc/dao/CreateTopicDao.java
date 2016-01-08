package ttc.dao;

import java.util.List;
import java.util.ArrayList;
import java.util.Map;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import ttc.util.MySqlConnectionManager;
import ttc.bean.Bean;
import ttc.bean.TopicBean;
import ttc.bean.UserBean;
import ttc.exception.IntegrationException;

public class CreateTopicDao implements AbstractDao{

    public Bean read(Map map)throws IntegrationException{
        return new TopicBean();
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
            sql.append("topic(fk_community_id,fk_create_user_id,topic_name, ");
            sql.append("topic_update_date,topic_create_date) ");
            sql.append("values(?,?,?,?,?)");

            pst = cn.prepareStatement( new String(sql) );

            pst.setString(1, (String)map.get("communityId"));
            pst.setString(2, (String)map.get("userId"));
            pst.setString(3, (String)map.get("topic_name"));
            pst.setString(4, (String)map.get("topic_update_date"));
            pst.setString(5, (String)map.get("topic_create_date"));

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

    public List readAll(Map map)throws IntegrationException{
        List result = new ArrayList();
        PreparedStatement pst = null;
        String comId= null;
        comId=(String)map.get("communityId");

        try{
            Connection cn = null;
            cn = MySqlConnectionManager.getInstance().getConnection();
            String sql="select topic_id,fk_create_user_id,topic_name,topic_update_date,topic_create_date,users.user_name from topic inner join users on topic.create_user_id=users.user_id where fk_community_Id=?";

            pst.setString(1,comId);

            pst = cn.prepareStatement(sql);

            ResultSet rs = pst.executeQuery();

            while(rs.next()){
                TopicBean topics = new TopicBean();
                topic.setTopicId(rs.getString(1));
                topic.setCreateUserId(rs.getString(2));
                topic.setName(rs.getString(3));
                topic.setUpdateDate(rs.getString(4));
                topic.setCreateDate(rs.getString(5));
                topic.setCreateUserName(rs.getString(6));
                result.add(topics);
            }

        }catch(SQLException e){
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
