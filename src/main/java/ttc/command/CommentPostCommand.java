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

public class CommentPostCommand extends AbstractCommand{
    public ResponseContext execute(ResponseContext resc)throws BusinessLogicException{
        try{
            RequestContext reqc = getRequestContext();

            String userId = reqc.getParameter("userId")[0];
            String articleId = reqc.getParameter("articleId")[0];

            

            String body = reqc.getParameter("body")[0];

            String status = "0";

            Map params = new HashMap();
            params.put("userId",userId);
            params.put("articleId",articleId);
            
            params.put("body",body);
            params.put("status",status);

            MySqlConnectionManager.getInstance().beginTransaction();
            AbstractDaoFactory factory = AbstractDaoFactory.getFactory("comment");
            AbstractDao dao = factory.getAbstractDao();
            dao.insert(params);
			List result = dao.readAll(params);

            MySqlConnectionManager.getInstance().commit();

            resc.setResult(result);

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
