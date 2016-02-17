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
import java.util.List;
import ttc.exception.business.ParameterInvalidException;

public class CommunitySearchCommand extends AbstractCommand{
    public ResponseContext execute(ResponseContext resc)throws BusinessLogicException{
        try{
            RequestContext reqc = getRequestContext();

            Map params = new HashMap();

            String keyword = reqc.getParameter("keyword")[0];

            String where = "where community_name like ? and community_delete_flag=0";

            params.put("where",where);

            params.put("value",keyword);

            MySqlConnectionManager.getInstance().beginTransaction();

            AbstractDaoFactory factory = AbstractDaoFactory.getFactory("community");
            AbstractDao dao = factory.getAbstractDao();
            List result =dao.readAll(params);

            MySqlConnectionManager.getInstance().commit();
            MySqlConnectionManager.getInstance().closeConnection();

			resc.setResult(result);

            resc.setTarget("communitySearchResult");

            return resc;
        }catch(NullPointerException e){
			throw new ParameterInvalidException("入力内容が足りません", e);
		}catch(IntegrationException e){
            throw new BusinessLogicException(e.getMessage(),e);
        }
    }
}
