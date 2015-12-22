package ttc.dao;

import java.util.List;
import java.util.ArrayList;
import java.util.Map;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import ttc.bean.ArticleBean;
import ttc.bean.Bean;

import ttc.exception.IntegrationException;

import ttc.util.MySqlConnectionManager;

public class ArticleSearchDao implements AbstractDao{
    public int insert(Map map)throws IntegrationException{
        return 0;
    }
    public int update(Map map)throws IntegrationException{
        return 0;
    }
    public Bean read(Map map)throws IntegrationException{
        return null;
    }

    public List readAll(Map map)throws IntegrationException{
        List tag_result = new ArrayList();
        List result = new ArrayList();
        PreparedStatement pst = null;
        String[] tags = null;
        for(int i=0;i<map.size();i++){
            tags[i]=(String)map.get("tag"+i);
        }

        try{
            Connection cn = null;
            cn = MySqlConnectionManager.getInstance().getConnection();
            StringBuffer tag_sql = new StringBuffer();
            sql.append("select tag_id,tag_name from tags where tag_name=?");
            for(int i=1;i<keywords.length;i++){
                sql.append(" and");
                sql.append(" tag_name=? ");
            }
            for(int i=0;i<tags.length;i++){
                pst.setString(i+1,tags[i]);
            }
            pst = cn.prepareStatement(new String(tag_sql));

            ResultSet rs = pst.executeQuery();

            while(rs.next()){
                TagBean tag = new TagBean();
                tag.setId(rs.getString(1));
                tag.setName(rs.getString(2));

                tag_result.add(tag);
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
