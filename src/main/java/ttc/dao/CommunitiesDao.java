package ttc.dao;

import java.util.List;
import java.util.ArrayList;
import java.util.Map;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import ttc.util.MySqlConnectionManager;
import ttc.bean.Bean;
import ttc.bean.CommunityBean;
import ttc.exception.IntegrationException;

public class CommunitiesDao implements AbstractDao{

    public Bean read(Map map)throws IntegrationException{
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
            StringBuffer sql = new StringBuffer();
            sql.append("insert into communities(");
            sql.append("community_name,community_profile");
            sql.append("community_icon_path,community_header_path");
            sql.append("community_created_date,fk_user_name");
            sql.append("community_delete_flag)");
            sql.append(" values(?,?,?,?,?,?,?)");

            pst = cn.prepareStatement(new String(sql));

            pst.setString(1,(String)map.get("commName"));
            pst.setString(2,(String)map.get("commProfile"));

            if(map.containsKey("commIcon")){
                pst.setString(3,(String)map.get("commIcon"));
            }else{
                // デフォルト画像のパス
                // プロパティファイルを使って書き換えられるようにするのもありかも
                pst.setString(3,"/images/icon/icon.jpg");
            }

            if(map.containsKey("commHeader")){
                pst.setString(4,(String)map.get("commHeader"));
            }else{
                pst.setString(4,"/images/header/header.jpg");
            }

            pst.setString(5,"sysdate");
            pst.setString(6,(String)map.get("userName"));
            pst.setString(7,"0");

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
        return null;
    }

}
