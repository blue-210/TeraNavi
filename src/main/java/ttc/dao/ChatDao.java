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


public class UsersDao implements AbstractDao{
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
            sql.append("insert into users(login_id,user_name,user_name_kana,sex,sex_visible_flg,birth_date,mail_address,password,fk_secret_question_id,secret_answer)");
            sql.append("values(?,?,?,?,?,?,?,?,?,?)");
            pst=cn.prepareStatement(new String(sql));

            pst.setString(1,(String)map.get("loginId"));
            pst.setString(2,(String)map.get("userName"));
            pst.setString(3,(String)map.get("nameKana"));
            pst.setString(4,(String)map.get("sex"));
            pst.setString(5,(String)map.get("sexVisibleFlag"));
            pst.setString(6,(String)map.get("birthDate"));
            pst.setString(7,(String)map.get("mailAddress"));
            pst.setString(8,(String)map.get("password"));
            pst.setString(9,(String)map.get("quepstionId"));
            pst.setString(10,(String)map.get("secretAnswer"));

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
