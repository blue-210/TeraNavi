package ttc.command;

import ttc.context.RequestContext;
import ttc.context.ResponseContext;

import ttc.util.MySqlConnectionManager;

import ttc.exception.integration.IntegrationException;
import ttc.exception.business.BusinessLogicException;

import java.util.Map;
import java.util.HashMap;

import ttc.util.factory.AbstractDaoFactory;
import ttc.dao.AbstractDao;
import ttc.exception.business.ParameterInvalidException;

public class TagSearchCommand extends AbstractCommand{
	public ResponseContext execute(ResponseContext resc)throws BusinessLogicException{
		try{
			RequestContext reqc = getRequestContext();
			String[] tags=null;
			String tag = reqc.getParameter("tag")[0];
			tags=tag.split(" ", 0);

			Map params = new HashMap();

			for(int i=0;i<tags.length;i++){
				params.put("tag"+i,tags[i]);
			}

			MySqlConnectionManager.getInstance().beginTransaction();
			AbstractDaoFactory factory = AbstractDaoFactory.getFactory("tagsearch");
			AbstractDao dao = factory.getAbstractDao();

			MySqlConnectionManager.getInstance().commit();

			resc.setTarget("tagsearch_show");
			resc.setResult(dao.readAll(params));

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
