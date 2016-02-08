package ttc.command;

import ttc.context.RequestContext;
import ttc.context.ResponseContext;

import ttc.util.MySqlConnectionManager;

import ttc.exception.IntegrationException;
import ttc.exception.BusinessLogicException;

import java.util.Map;
import java.util.HashMap;
import java.util.List;

import ttc.util.factory.AbstractDaoFactory;
import ttc.dao.AbstractDao;
import ttc.bean.Bean;

public class TermsDisplayCommand extends AbstractCommand{


    public ResponseContext execute(ResponseContext resc)throws BusinessLogicException{
        try{
            RequestContext reqc = getRequestContext();
 
			String target = reqc.getParameter("target")[0];
			
			Map params = new HashMap();
			
			try{
				String id = reqc.getParameter("id")[0];
				
				params.put("value", id);
				params.put("where",reqc.getParameter("where")[0]);
			}catch(NullPointerException e){
				
			}
			
            MySqlConnectionManager.getInstance().beginTransaction();
            AbstractDaoFactory factory = AbstractDaoFactory.getFactory(target);
            AbstractDao dao = factory.getAbstractDao();
			Bean policy = dao.read(params);
			List list = dao.readAll(params);

            MySqlConnectionManager.getInstance().commit();
            MySqlConnectionManager.getInstance().closeConnection();

			Map result = new HashMap();
			result.put("main",policy);
			result.put("list",list);
			
			resc.setResult(result);

            return resc;
        }catch(IntegrationException e){
            throw new BusinessLogicException(e.getMessage(),e);
        }
    }
}
