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
import ttc.bean.CommunityBean;
import ttc.bean.UserBean;
import ttc.exception.business.ParameterInvalidException;

public class ParticipationCommunityCommand extends AbstractCommand{
    public ResponseContext execute(ResponseContext resc)throws BusinessLogicException{
        try{
            RequestContext reqc = getRequestContext();

            HashMap params = new HashMap();
            HashMap para=new HashMap();

            params.put("userId",reqc.getParameter("userId")[0]);
            params.put("commId",reqc.getParameter("commId")[0]);
            params.put("where", "where community_id = ? ");
            System.out.println("1:パラメータのcommId="+reqc.getParameter("commId")[0]);

            MySqlConnectionManager.getInstance().beginTransaction();

            AbstractDaoFactory factory = AbstractDaoFactory.getFactory("communitymember");
            AbstractDao dao = factory.getAbstractDao();
            dao.insert(params);

            // insertした結果を取得
            CommunityBean cb =(CommunityBean)dao.read(params);
            params.put("community",cb);
            System.out.println("3:insertしてからの～こみゅID："+cb.getId());
            System.out.println("------------------------------------------");
            MySqlConnectionManager.getInstance().commit();
            MySqlConnectionManager.getInstance().closeConnection();

            UserBean ub=new UserBean();
            ub.setCommunity(cb);
            resc.setResult(params);
            resc.setTarget("prticipationCommunityResult");

            return resc;
        }catch(NullPointerException e){
			throw new ParameterInvalidException("入力内容が足りません", e);
		}catch(IntegrationException e){
            throw new BusinessLogicException(e.getMessage(),e);
        }
    }
}
