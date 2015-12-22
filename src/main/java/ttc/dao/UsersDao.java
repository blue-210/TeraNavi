package ttc.dao;

import java.util.List;
import java.util.ArrayList;
import java.util.Map;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import ttc.bean.UserBean;
import ttc.bean.Bean;
import ttc.exception.IntegrationException;
import ttc.util.MySqlConnectionManager;

public class UsersDao implements AbstractDao{
    PreparedStatement pst=null;
    Connection cn=null;
    ResultSet rs=null;

    public List readAll(Map map)throws IntegrationException{
        List list=new ArrayList();
        try{
            cn=MySqlConnectionManager.getInstance().getConnection();
            String sql="select * from users where user_status_flag=?";
            pst=cn.prepareStatement(sql);
            rs=pst.executeQuery();

            pst.setString(19,(String)map.get("userStatus"));


            while(rs.next()){
                UserBean ub=new UserBean();

                ub.setId(rs.getString(1));
                ub.setLoginId(rs.getString(2));
                ub.setUserName(rs.getString(3));
                ub.setNameKana(rs.getString(4));
                ub.setSex(rs.getString(5));
                ub.setSexVisibleFlag(rs.getString(6));
                ub.setBirthDate(rs.getString(7));
                ub.setMailAddress(rs.getString(8));
                ub.setPassword(rs.getString(9));
                // あとでなおしてね
                // ub.setQuestion(rs.getString(10));
                ub.setSecretAnswer(rs.getString(11));
                ub.setHeaderPath(rs.getString(12));
                ub.setIconPath(rs.getString(13));
                // あとでなおしてね
                // ub.setTitle(rs.getString(14));
                // ub.setHeadPhotoPath(rs.getString(15));
                ub.setAdminFlag(rs.getString(16));
                ub.setLastLoginDate(rs.getString(17));
                ub.setAdminLastLoginDate(rs.getString(18));
                ub.setUserStatus(rs.getString(19));
                ub.setLockEndDate(rs.getString(20));
                ub.setLockStartDate(rs.getString(21));
                // ub.setBlogExplanation(rs.getString(22));
                ub.setProfile(rs.getString(23));
                list.add(ub);
            }
            MySqlConnectionManager.getInstance().commit();
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
    return list;
    }

    public int update(Map map)throws IntegrationException{
        return new Integer(1);
    }

    public int insert(Map map)throws IntegrationException{
        int count = 0;
        try{
            cn=MySqlConnectionManager.getInstance().getConnection();
            StringBuffer sql = new StringBuffer();
            sql.append("insert into users(login_id,user_name,user_name_kana,sex,sex_visible_flg,birth_date,mail_address,password,fk_secret_question_id,secret_answer)");
            sql.append("values(?,?,?,?,?,?,?,?,?,?);");
            pst=cn.prepareStatement(new String(sql));

            pst.setString(2,(String)map.get("loginId"));
            pst.setString(3,(String)map.get("userName"));
            pst.setString(4,(String)map.get("nameKana"));
            pst.setString(5,(String)map.get("sex"));
            pst.setString(6,(String)map.get("sexVisibleFlag"));
            pst.setString(7,(String)map.get("birthDate"));
            pst.setString(8,(String)map.get("mailAddress"));
            pst.setString(9,(String)map.get("password"));
            pst.setString(10,(String)map.get("quepstionId"));
            pst.setString(11,(String)map.get("secretAnswer"));

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
        UserBean ub = new UserBean();
        PreparedStatement pst = null;
        try{
            Connection cn = null;
            cn = MySqlConnectionManager.getInstance().getConnection();

            String sql = "select * from users where user_id=?";
            pst = cn.prepareStatement(sql);

            pst.setString(1,(String)map.get("userId"));

            ResultSet rs = pst.executeQuery();

            rs.next();
            ub.setId(rs.getString(1));
            ub.setLoginId(rs.getString(2));
            ub.setUserName(rs.getString(3));
            ub.setNameKana(rs.getString(4));
            ub.setSex(rs.getString(5));
            ub.setSexVisibleFlag(rs.getString(6));
            ub.setBirthDate(rs.getString(7));
            ub.setMailAddress(rs.getString(8));
            ub.setPassword(rs.getString(9));
            // あとでなおしてね
            // ub.setQuestion(rs.getString(10));
            ub.setSecretAnswer(rs.getString(11));
            ub.setHeaderPath(rs.getString(12));
            ub.setIconPath(rs.getString(13));
            // ub.setTitle(rs.getString(14));
            // ub.setHeadPhotoPath(rs.getString(15));
            ub.setAdminFlag(rs.getString(16));
            ub.setLastLoginDate(rs.getString(17));
            ub.setAdminLastLoginDate(rs.getString(18));
            ub.setUserStatus(rs.getString(19));
            ub.setLockEndDate(rs.getString(20));
            ub.setLockStartDate(rs.getString(21));
            // ub.setBlogExplanation(rs.getString(22));
            ub.setProfile(rs.getString(23));
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
        return ub;
    }

    public List readAll()throws IntegrationException{
        return new ArrayList();
    }
}
