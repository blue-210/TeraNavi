package ttc.command;

import ttc.context.RequestContext;
import ttc.context.ResponseContext;

import ttc.util.MySqlConnectionManager;

import ttc.exception.IntegrationException;
import ttc.exception.BusinessLogicException;

import java.util.Map;
import java.util.HashMap;

import ttc.util.factory.AbstractDaoFactory;
import ttc.dao.AbstractDao;

public class KeywordSearchCommand extends AbstractCommand{
	public ResponseContext execute(ResponseContext resc)throws BusinessLogicException{
		try{
			RequestContext reqc = getRequestContext();
			String[] keywords=null;
			String keyword = reqc.getParameter("keyword")[0];
			String target = reqc.getParameter("target")[0];
			keywords=keyword.split(" ", 0);

			Map params = new HashMap();

			for(int i=0;i<keywords.length;i++){
				params.put("keyword"+i,keywords[i]);
			}

			MySqlConnectionManager.getInstance().beginTransaction();
			AbstractDaoFactory factory = AbstractDaoFactory.getFactory(target);
			AbstractDao dao = factory.getAbstractDao();
			dao.readAll(params);

			MySqlConnectionManager.getInstance().commit();
			MySqlConnectionManager.getInstance().closeConnection();

			resc.setTarget("comment");

			return resc;
		}catch(IntegrationException e){
				throw new BusinessLogicException(e.getMessage(),e);
		}

	}
}
