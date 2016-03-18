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


import ttc.exception.business.ParameterInvalidException;


public class SendContactCommand extends AbstractCommand{
    public ResponseContext execute(ResponseContext resc)throws BusinessLogicException{
        try{
            RequestContext reqc = getRequestContext();

            MySqlConnectionManager.getInstance().beginTransaction();

            AbstractDaoFactory factory=AbstractDaoFactory.getFactory("contact");
            AbstractDao dao= factory.getAbstractDao();

            Map params = new HashMap();

			
			params.put("userName", reqc.getParameter("name")[0]);
			params.put("title", reqc.getParameter("title")[0]);
			params.put("body", reqc.getParameter("body")[0]);
			
			String address = null;
			try{
				address = reqc.getParameter("address")[0];
			}catch(NullPointerException e){
				address = "";
			}finally{
				if(address == null || address.equals("")){
					address = "返信未希望です";
				}
			}
			
			params.put("address",reqc.getParameter("address")[0]);
			params.put("category",reqc.getParameter("category")[0]);
			
			dao.insert(params);


			Map result = new HashMap();
			result.put("userName","userName");
			
			resc.setResult(result);

			MySqlConnectionManager.getInstance().commit();
            
			
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
