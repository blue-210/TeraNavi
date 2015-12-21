package ttc.dao;

import java.util.List;
import java.util.Map;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import ttc.bean.BlogBean;
import ttc.bean.Bean;

import ttc.exception.IntegrationException;

import ttc.util.MySqlConnectionManager;

public class BlogDao implements AbstractDao{
    public int insert(Map map)throws IntegrationException{
        return 0;
    }

    public int update(Map map)throws IntegrationException{
        PreparedStatement pst = null;
        int result = 0;

        try{

            Connection cn = null;
            cn = MySqlConnectionManager.getInstance().getConnection();
            String sql = "update users set blog_title=?,blog_header_path=?,blog_explanation=? where user_id=?";
            pst = cn.prepareStatement(sql);

            pst.setString(1,(String)map.get("title"));
            pst.setString(2,(String)map.get("header"));
            pst.setString(3,(String)map.get("explanation"));
            pst.setString(4,(String)map.get("userId"));

            result =  pst.executeUpdate();

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

    public List readAll()throws IntegrationException{
        List result = null;
        PreparedStatement pst = null;

        try{
            Connection cn = null;
            cn = MySqlConnectionManager.getInstance().getConnection();
            String sql = "select blog_title,blog_header_path,blog_explanation from users where blog_title is not null";

            pst = cn.prepareStatement(sql);

            ResultSet rs = pst.executeQuery();

            while(rs.next()){
                BlogBean blog = new BlogBean();
                blog.setTitle(rs.getString(1));
                blog.setHeaderPath(rs.getString(2));
                blog.setExplanation(rs.getString(3));

                result.add(blog);
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

    public Bean read(Map map)throws IntegrationException{
        BlogBean blog = null;
        PreparedStatement pst = null;
        try{
            Connection cn = null;
            cn = MySqlConnectionManager.getInstance().getConnection();
            String sql = "select blog_title,blog_header_path,blog_explanation from emp where user_id=?";

            pst = cn.prepareStatement(sql);

            pst.setString(1,(String)map.get("userId"));

            ResultSet rs = pst.executeQuery();

            rs.next();

            blog.setTitle(rs.getString(1));
            blog.setHeaderPath(rs.getString(2));
            blog.setExplanation(rs.getString(3));


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

        return blog;
    }
}
