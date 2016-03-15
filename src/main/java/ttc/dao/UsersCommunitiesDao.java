package ttc.dao;

import java.util.List;

import java.util.Map;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.ResultSet;
import java.util.ArrayList;

import ttc.util.MySqlConnectionManager;
import ttc.bean.Bean;
import ttc.bean.CommunityBean;
import ttc.bean.MembersBean;
import ttc.exception.integration.IntegrationException;
import ttc.exception.integration.NoMemberException;

public class UsersCommunitiesDao implements AbstractDao{

    public Bean read(Map map)throws IntegrationException{
        CommunityBean cb=new CommunityBean();
        PreparedStatement pst = null;
        try{
            Connection cn = null;
            cn = MySqlConnectionManager.getInstance().getConnection();
            StringBuffer sql=new StringBuffer();
            sql.append("select fk_community_id ");
            // 退会していないものを取得する
            sql.append("from community_members_list where fk_user_id = ? and fk_community_id = ?");

            pst = cn.prepareStatement(new String(sql));
            pst.setInt(1, Integer.parseInt((String)map.get("userId")));
            pst.setInt(2, Integer.parseInt((String)map.get("commId")));

            ResultSet rs = pst.executeQuery();

            if(rs.next()){
                cb.setId(rs.getString("fk_community_id"));
            }else{
				throw new NoMemberException(null,null);
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
        return cb;

    }

    // 退会時の処理では使わない。理由は↓のdelteメソッド前のコメント参照
    public int update(Map map)throws IntegrationException{
        PreparedStatement pst = null;
        int result = 0;
        try{
            Connection cn = null;
            cn = MySqlConnectionManager.getInstance().getConnection();

            StringBuffer sql = new StringBuffer();

            sql.append("update community_members_list set ");
			sql.append(map.get("target"));
            sql.append(" where fk_user_id=? and fk_community_id=?");
            System.out.println(new String(sql));
            pst = cn.prepareStatement(new String(sql));

            pst.setString(1,(String)map.get("userId"));
            pst.setString(2,(String)map.get("commId"));

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

    public int insert(Map map)throws IntegrationException{
        PreparedStatement pst = null;
        int result = 0;
        try{
            Connection cn = null;
            cn = MySqlConnectionManager.getInstance().getConnection();
            StringBuffer sql = new StringBuffer();
            sql.append("insert into community_members_list ");
            sql.append("values(?,?,?)");

            pst = cn.prepareStatement(new String(sql));

            pst.setString(1,(String)map.get("userId"));
            pst.setString(2,(String)map.get("commId"));

//			コミュニティ作成者の時に管理者フラグを立てるための分岐処理
			if(map.containsKey("adminFlag")){
				pst.setString(3, (String)map.get("adminFlag"));
			}else{
				pst.setString(3,"0");
			}

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
        List members = null;
        PreparedStatement pst = null;
		//Communityのメンバを取得する処理

        try{
            Connection cn = null;
            cn = MySqlConnectionManager.getInstance().getConnection();
            StringBuffer sql=new StringBuffer();
            sql.append("select users.user_id,users.user_name,users.user_name_kana,");
			sql.append("users.user_icon_path,community_members_list.community_admin_flag ");
            sql.append("from users right outer join community_members_list ");
			sql.append("on users.user_id = fk_user_id where fk_community_id = ?");

            pst = cn.prepareStatement(new String(sql));
            pst.setString(1,(String)map.get("communityId"));

            ResultSet rs = pst.executeQuery();
			members = new ArrayList();
			while(rs.next()){
				MembersBean member = new MembersBean();
				member.setId(rs.getString(1));
				member.setUserName(rs.getString(2));
				member.setNameKana(rs.getString(3));
				member.setIconPath(rs.getString(4));
				member.setCommunityAdminFlag(rs.getString(5));
				members.add(member);
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

        return members;

    }

    /* UsersCommunities表は、一度参加して退会したコミュニティに参加しようとすると、
       主キー制約に違反してしまう。そのため、退会時にはフラグ変更ではなくdeleteする必要がある。
       表の主キー制約をなくすという手もあるが、deleteしたほうが更新異状などがなくて確実だと判断して
       deleteメソッドを作成
    */
    public void delete(Map map) throws IntegrationException{
        PreparedStatement pst = null;
        int result = 0;
        try{
            Connection cn = null;
            cn = MySqlConnectionManager.getInstance().getConnection();

            StringBuffer sql = new StringBuffer();

            sql.append("delete from community_members_list ");
            sql.append("where fk_user_id=? and fk_community_id=?");
            System.out.println(new String(sql));
            pst = cn.prepareStatement(new String(sql));

            pst.setString(1,(String)map.get("userId"));
            pst.setString(2,(String)map.get("commId"));

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
    }
}
