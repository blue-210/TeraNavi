package ttc.dao;

import java.util.List;
import java.util.ArrayList;
import java.util.Map;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import ttc.util.MySqlConnectionManager;
import ttc.bean.Bean;
import ttc.bean.ArticleBean;
import ttc.exception.IntegrationException;

public class ArticleDao implements AbstractDao{

    public Bean read(Map map)throws IntegrationException{
        return new ArticleBean();
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
            sql.append("articles(fk_user_id, article_title, article_body, ");
            sql.append("article_created_date, article_status_flag) ");
            sql.append("values(?,?,?,?,?)");

            pst = cn.prepareStatement( new String(sql) );

            pst.setString(1, (String)map.get("userId"));
            pst.setString(2, (String)map.get("title"));
            pst.setString(3, (String)map.get("body"));
            pst.setString(4, (String)map.get("date"));
            pst.setString(5, (String)map.get("status"));

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
        return new ArrayList();
    }

}
