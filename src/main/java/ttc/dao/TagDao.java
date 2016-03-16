
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ttc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import java.util.Map;

import ttc.bean.Bean;
import ttc.bean.TagBean;

import ttc.exception.integration.IntegrationException;
import ttc.util.MySqlConnectionManager;


public class TagDao implements AbstractDao{
    public int insert(Map map)throws IntegrationException{


        PreparedStatement pst = null;
        int result = 0;
        try{
            Connection cn = null;
            cn = MySqlConnectionManager.getInstance().getConnection();

            StringBuffer sql = new StringBuffer();

			String tag = (String)map.get("tag");
			String articleId = (String)map.get("articleId");
			sql.setLength(0);
			sql.append("insert into articles_tags values(?,?)");

			pst = cn.prepareStatement(new String(sql));
			pst.setString(1,articleId);
			pst.setString(2,tag);
			pst.executeUpdate();



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

	private int delete(String articleId)throws IntegrationException{
		//記事に対してタグをつける前にその記事に付いているタグを削除するためのメソッド
		//updateメソッドの内部から呼び出されるのでprivate
		PreparedStatement pst = null;
        int result = 0;
        try{
            Connection cn = null;
            cn = MySqlConnectionManager.getInstance().getConnection();

            StringBuffer sql = new StringBuffer();

			sql.append("delete from articles_tags where fk_article_id=?");

			pst = cn.prepareStatement(new String(sql));
			pst.setString(1,articleId);
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


    public int update(Map map)throws IntegrationException{
        //内部でdeleteメソッドを呼び出している
		String articleId = (String)map.get("articleId");

		int result = delete(articleId);
		//記事を削除するためのメソッドを呼び出す

		return result;

    }
    public Bean read(Map map)throws IntegrationException{
        return null;
    }

    public List readAll(Map map)throws IntegrationException{
        PreparedStatement pst = null;
        List tags = new ArrayList();
		try{
            Connection cn = null;
            cn = MySqlConnectionManager.getInstance().getConnection();

            StringBuffer sql = new StringBuffer();

            if( map.containsKey("tagOnlyFlg") ){
                //すべてのタグ一覧がほしい場合
                sql.append("select * from tags ");
                pst = cn.prepareStatement( new String(sql) );

                ResultSet rs = pst.executeQuery();

                while( rs.next() ){
                    TagBean tb = new TagBean();
                    tb.setId( rs.getString(1) );
                    tb.setName( rs.getString(2) );
                    tags.add(tb);
                }

            }else if( map.containsKey("topFlg") ){
                //タグを登録数が多い順に3件とる
                sql.append("select fk_tag_id, tag_name, count(fk_tag_id) as count ");
                sql.append("from articles_tags join tags ");
                sql.append("on fk_tag_id = tag_id ");
                sql.append("group by fk_tag_id ");
                sql.append("order by count desc ");
                sql.append("limit 3 ");

                pst = cn.prepareStatement( new String(sql) );
                ResultSet rs = pst.executeQuery();

                while( rs.next() ){
                    TagBean tb = new TagBean();
                    tb.setId( rs.getString(1) );
                    tb.setName( rs.getString(2) );
                    tags.add(tb);
                }

            }else if( map.containsKey("whereTagIdFlg") ){
                //fk_tag_idを指定してarticleIdを調べる場合
                sql.append("select fk_article_id from articles_tags ");
                sql.append("where fk_tag_id = ? ");
                sql.append("order by fk_article_id desc ");

                pst = cn.prepareStatement( new String(sql) );
                pst.setString( 1,(String)map.get("tagId"));

                ResultSet rs = pst.executeQuery();

                while( rs.next() ){
                    String articleId = rs.getString(1);
                    tags.add(articleId);
                }

            }else{
                //ある記事に紐づけられているタグ一覧がほしい場合
                sql.append("select tag_id, tag_name ");
                sql.append("from articles_tags join tags ");
                sql.append("on fk_tag_id = tag_id ");
                sql.append("where fk_article_id = ?");

                pst = cn.prepareStatement( new String(sql) );
                pst.setString( 1,(String)map.get("articleId"));

                ResultSet rs = pst.executeQuery();

                while( rs.next() ){
                    TagBean tb = new TagBean();
                    tb.setId( rs.getString(1) );
                    tb.setName( rs.getString(2) );
                    tags.add(tb);
                }

            }


        }catch(SQLException e){
            //MySqlConnectionManager.getInstance().rollback();
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

        return tags;
    }
}
