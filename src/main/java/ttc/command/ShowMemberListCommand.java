package ttc.command;

import ttc.context.RequestContext;
import ttc.context.ResponseContext;

import ttc.util.MySqlConnectionManager;

import ttc.exception.business.BusinessLogicException;
import ttc.exception.integration.IntegrationException;

import ttc.util.factory.AbstractDaoFactory;
import ttc.dao.AbstractDao;

import java.util.Map;
import java.util.HashMap;
import ttc.bean.Bean;
import ttc.bean.CommunityBean;
import java.util.List;
import java.util.ArrayList;
import ttc.exception.business.ParameterInvalidException;

public class ShowMemberListCommand extends AbstractCommand{
    public ResponseContext execute(ResponseContext resc)throws BusinessLogicException{
        try{
            RequestContext reqc = getRequestContext();

            HashMap params = new HashMap();

            MySqlConnectionManager.getInstance().beginTransaction();

            AbstractDaoFactory fact=AbstractDaoFactory.getFactory("users");
            AbstractDao abdao= fact.getAbstractDao();
            ArrayList memebers=new ArrayList();

            params.put("where"," and fk_community_id=?");
            params.put("join"," join community_members_list on users.user_id = fk_user_id ");

            params.put("value",reqc.getParameter("commId")[0]);
            params.put("userStatus","0");
            HashMap para=new HashMap();

            para.put("where","where community_id=?");
            para.put("commId",reqc.getParameter("commId")[0]);

            HashMap result=new HashMap();
            result.put("value",reqc.getParameter("commId")[0]);
            result.put("members",abdao.readAll(params));
			
			fact = AbstractDaoFactory.getFactory("community");
			abdao = fact.getAbstractDao();
			Map params2 = new HashMap();
			
			params2.put("where","where community_id=? and community_delete_flag=0");
            params2.put("commId",reqc.getParameter("commId")[0]);

			Bean comm = abdao.read(params2);
			
			result.put("community",comm);

            MySqlConnectionManager.getInstance().commit();
            MySqlConnectionManager.getInstance().closeConnection();


			resc.setResult(result);

            resc.setTarget("showMemberListResult");

            return resc;
        }catch(NullPointerException e){
			throw new ParameterInvalidException("入力内容が足りません", e);
		}catch(IntegrationException e){
            throw new BusinessLogicException(e.getMessage(),e);
        }
    }
}
