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
import ttc.bean.ArticleBean;
import ttc.bean.UserBean;
import ttc.bean.BlogBean;
import ttc.bean.TagBean;
import ttc.bean.CommentBean;
import ttc.exception.IntegrationException;

public class ArticleDao implements AbstractDao{

    public Bean read(Map map)throws IntegrationException{
        /*
        PreparedStatement pst = null;
        int result = 0;
        try{
            Connection cn = null;
            cn = MySqlConnectionManager.getInstance().getConnection();
            MySqlConnectionManager.getInstance().beginTransaction();
            StringBuffer sql = new StringBuffer();
            sql.append("");
            sql.append("");
            sql.append("");
            sql.append("where article_id = ?");

            pst = cn.prepareStatement( new String(sql) );

            pst.setString(1, (String)map.get("articleId"));

            result = pst.executeQuery();

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
        */
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
        PreparedStatement pst = null;
        List results = new ArrayList();
        try{
            Connection cn = null;
            cn = MySqlConnectionManager.getInstance().getConnection();
            MySqlConnectionManager.getInstance().beginTransaction();
            StringBuffer sql = new StringBuffer();

            //ブログ情報の取得----------------------------------------------------
            sql.append("select user_name, user_icon_path, blog_title, ");
            sql.append("blog_header_path, blog_explanation ");
            sql.append("from users ");
            sql.append("where user_id = ?");

            pst = cn.prepareStatement( new String(sql) );

            pst.setInt(1, (Integer)map.get("userId"));

            ResultSet rs = pst.executeQuery();
            rs.next();

            UserBean ub = new UserBean();
            ub.setUserName( rs.getString(1) );
            ub.setIconPath( rs.getString(2) );
            BlogBean bb = new BlogBean();
            bb.setTitle( rs.getString(3) );
            bb.setHeaderPath( rs.getString(4) );
            bb.setExplanation( rs.getString(5) );

            results.add(ub);
            results.add(bb);
            //------------------------------------------------------------------

            sql.setLength(0);//StringBuffer初期化

            //記事一覧の取得----------------------------------------------------------------------
            sql.append("select article_id, article_title, article_body, ");
            sql.append("to_char(article_created_date,'YYYY/MMDD日 HH24:MI:SS') ");
            sql.append("from articles ");
            sql.append("where fk_user_id = ? and article_status_flag = '0'");

            pst = cn.prepareStatement( new String(sql) );

            pst.setInt(1, (Integer)map.get("userId"));

            rs = pst.executeQuery();

            while( rs.next() ){
                ArticleBean ab = new ArticleBean();
                ab.setArticleId( rs.getString(1) );
                ab.setTitle( rs.getString(2) );
                ab.setArticleBody( rs.getString(3) );
                ab.setCreatedDate( rs.getString(4) );

                List tags = new ArrayList();
                //記事一件あたりのタグを取得-----------------------------------------
                StringBuffer sql2 = new StringBuffer();
                sql2.append("select tag_id, tag_name ");
                sql2.append("from articles_tags join tags ");
                sql2.append("on fk_tag_id = tag_id ");
                sql2.append("where fk_article_id = ?");
                PreparedStatement pst2 = cn.prepareStatement( new String(sql2) );
                pst2.setInt( 1, Integer.parseInt( ab.getArticleId() ) );
                ResultSet rs2 = pst2.executeQuery();
                while( rs2.next() ){
                    TagBean tb = new TagBean();
                    tb.setId( rs2.getString(1) );
                    tb.setName( rs2.getString(2) );
                    tags.add(tb);
                }
                //---------------------------------------------------------------
                ab.setTags(tags);

                results.add(ab);
            }
            //-----------------------------------------------------------------------------------

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

        return results;//ArrayListの1つ目にはUserBean、2つ目にはBlogBean、それ以降にArticleBeanが入ってます
    }

}
