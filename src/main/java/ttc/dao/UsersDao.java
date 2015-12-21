package ttc.dao;

import java.util.List;
import java.util.ArrayList;
import java.util.Map;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import ttc.bean.UserBean;

public class UsersDao extends AbstractDao{
    PreparedStatement pst=null;
    Connection cn=null;
    ResultSet rs=null;

    public List readAll(Map map)throws IntegrationException{
        cn=MySqlConnectionManager.getInstance().getConnection();
        String sql="select * from users where user_status_flag=?";
        pst=cn.prepareStatement(sql);
        rs=pst.executeQuery();

        pst.setString(19,(String)map.get("userStatus"));

        List list=new ArrayList();

        try{
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
                ub.setQuestion(rs.getString(10));
                ub.setSecretAnswer(rs.getString(11));
                ub.setHeaderPath(rs.getString(12));
                ub.setIconPath(rs.getString(13));
                ub.setTitle(rs.getString(14));
                ub.setHeadPhotoPath(rs.getString(15));
                ub.setAdminFlag(rs.getString(16));
                ub.setLastLoginDate(rs.getString(17));
                ub.setAdminLastLoginDate(rs.getString(18));
                ub.setUserStatus(rs.getString(19));
                ub.setLockEndDate(rs.getString(20));
                ub.setLockStart(rs.getString(21));
                ub.setBlogExplanation(rs.getString(22));
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
        return null;
    }

    public int insert(Map map)throws IntegrationException{

    try{
        cn=MySqlConnectionManager.getInstance().getConnection();

        String sql="insert into users(user_id,login_id,user_name,user_name_kana,sex,sex_visible_flg,birth_date,mail_address,password,fk_secret_question_id,secret_answer,user_eader_path,user_icon_path,blog_title,blog_header_path,admin_flag,last_login_date,admin_last_login_date,user_status_flag,user_lock_start_date,user_lock_end_date,blog_explanation,user_profile) " + "values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
        pst=cn.prepareStatement(sql);

        st.setString(1,(String)map.get("id"));
        st.setString(2,(String)map.get("loginId"));
        st.setString(3,(String)map.get("userName"));
        st.setString(4,(String)map.get("nameKana"));
        st.setString(5,(String)map.get("sex"));
        st.setString(6,(String)map.get("sexVisibleFlag"));
        st.setString(7,(String)map.get("birthDate"));
        st.setString(8,(String)map.get("mailAddress"));
        st.setString(9,(String)map.get("password"));
        st.setString(10,(String)map.get("questionId"));
        st.setString(11,(String)map.get("secretAnswer"));
        st.setString(12,(String)map.get("headerPath"));
        st.setString(13,(String)map.get("iconPath"));
        st.setString(14,(String)map.get("title"));
        st.setString(15,(String)map.get("headPhotoPath"));
        st.setString(16,(String)map.get("adminFlag"));
        st.setString(17,(String)map.get("lastLoginDate"));
        st.setString(18,(String)map.get("adminLastLoginDate"));
        st.setString(19,(String)map.get("userStatus"));
        st.setString(20,(String)map.get("lockEndDate"));
        st.setString(21,(String)map.get("lockStartDate"));
        st.setString(22,(String)map.get("blogExplanation"));
        st.setString(23,(String)map.get("profile"));

        pst.executeUpdate();
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

    public Bean read(Map map)throws IntegrationException{
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
            ub.setQuestion(rs.getString(10));
            ub.setSecretAnswer(rs.getString(11));
            ub.setHeaderPath(rs.getString(12));
            ub.setIconPath(rs.getString(13));
            ub.setTitle(rs.getString(14));
            ub.setHeadPhotoPath(rs.getString(15));
            ub.setAdminFlag(rs.getString(16));
            ub.setLastLoginDate(rs.getString(17));
            ub.setAdminLastLoginDate(rs.getString(18));
            ub.setUserStatus(rs.getString(19));
            ub.setLockEndDate(rs.getString(20));
            ub.setLockStart(rs.getString(21));
            ub.setBlogExplanation(rs.getString(22));
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
}
