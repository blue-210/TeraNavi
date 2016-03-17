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

            MySqlConnectionManager.getInstance().beginTransaction();

            // UsersCommunitiesDaoを取得
            AbstractDaoFactory factory = AbstractDaoFactory.getFactory("communitymember");
            AbstractDao dao = factory.getAbstractDao();
            dao.insert(params);

            
            

            // insertした結果（参加したコミュを取得）
            CommunityBean cb = (CommunityBean)dao.read(params);
            params.put("community",cb);

            

            resc.setResult(params);
            // resc.setTarget("prticipationCommunityResult");

            return resc;
        }catch(NullPointerException e){
			throw new ParameterInvalidException("入力内容が足りません", e);
		}catch(IntegrationException e){
            throw new BusinessLogicException(e.getMessage(),e);
        }finally{
			MySqlConnectionManager.getInstance().commit();
            MySqlConnectionManager.getInstance().closeConnection();
		}
    }
}
