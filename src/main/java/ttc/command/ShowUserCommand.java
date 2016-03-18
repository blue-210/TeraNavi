package ttc.command;

import ttc.context.RequestContext;
import ttc.context.ResponseContext;

import ttc.util.MySqlConnectionManager;

import ttc.exception.integration.IntegrationException;
import ttc.exception.business.BusinessLogicException;

import java.util.Map;
import java.util.HashMap;
import java.util.List;


import ttc.util.factory.AbstractDaoFactory;
import ttc.dao.AbstractDao;

import ttc.exception.business.ParameterInvalidException;

public class ShowUserCommand extends AbstractCommand{


    public ResponseContext execute(ResponseContext resc)throws BusinessLogicException{
        try{
            RequestContext reqc = getRequestContext();

			String keyword = reqc.getParameter("keyword")[0];

            MySqlConnectionManager.getInstance().beginTransaction();
            AbstractDaoFactory factory = AbstractDaoFactory.getFactory("usersSearch");
            AbstractDao dao = factory.getAbstractDao();

            Map params = new HashMap();
            params.put("keyword",keyword);

            List result = dao.readAll(params);

			MySqlConnectionManager.getInstance().commit();

            resc.setResult(result);
            resc.setTarget("ShowUserResult");

            return resc;
        }catch(NullPointerException e){
			throw new ParameterInvalidException("入力内容が足りません", e);
		}catch(IntegrationException e){
            throw new BusinessLogicException(e.getMessage(),e);
        }finally{
			
            MySqlConnectionManager.getInstance().closeConnection();
		}
    }
}
