package ttc.command;

import ttc.context.RequestContext;
import ttc.context.ResponseContext;

import ttc.util.MySqlConnectionManager;

import ttc.exception.business.BusinessLogicException;
import ttc.exception.integration.IntegrationException;

import ttc.util.factory.AbstractDaoFactory;
import ttc.dao.AbstractDao;
import ttc.bean.CommunityBean;

import java.util.Map;
import java.util.HashMap;
import ttc.exception.business.ParameterInvalidException;

public class WithDrawCommunityCommand extends AbstractCommand{
    public ResponseContext execute(ResponseContext resc)throws BusinessLogicException{
        try{
            RequestContext reqc = getRequestContext();

            HashMap params = new HashMap();
            HashMap result = new HashMap();

            params.put("userId",reqc.getParameter("userId")[0]);
            params.put("commId",reqc.getParameter("commId")[0]);
			params.put("target",reqc.getParameter("target")[0]);
			
            MySqlConnectionManager.getInstance().beginTransaction();

            AbstractDaoFactory factory = AbstractDaoFactory.getFactory("communitymember");
            AbstractDao dao = factory.getAbstractDao();
            dao.update(params);

            MySqlConnectionManager.getInstance().commit();
            MySqlConnectionManager.getInstance().closeConnection();

			

            result.put("commName",reqc.getParameter("commName")[0]);
            resc.setResult(result);
            resc.setTarget("communityWithDrawResult");

            return resc;
        }catch(NullPointerException e){
			throw new ParameterInvalidException("入力内容が足りません", e);
		}catch(IntegrationException e){
            throw new BusinessLogicException(e.getMessage(),e);
        }
    }
}
