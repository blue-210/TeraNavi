package ttc.command;

import ttc.context.RequestContext;
import ttc.context.ResponseContext;

import ttc.util.MySqlConnectionManager;

import ttc.exception.business.BusinessLogicException;
import ttc.exception.integration.IntegrationException;

import java.util.Map;
import java.util.HashMap;

import ttc.util.factory.AbstractDaoFactory;
import ttc.dao.AbstractDao;

import ttc.bean.ArticleBean;
import ttc.exception.business.ParameterInvalidException;

public class PublicationRangeSettingCommand extends AbstractCommand{
    public ResponseContext execute(ResponseContext resc)throws BusinessLogicException{
        try{
            RequestContext reqc = getRequestContext();

            String[] articleId = reqc.getParameter("articleId");

            String status = reqc.getParameter("status")[0];

            Map params = new HashMap();

            params.put("status", status);

            AbstractDaoFactory factory = AbstractDaoFactory.getFactory("article");
            AbstractDao dao = factory.getAbstractDao();

            MySqlConnectionManager.getInstance().beginTransaction();
            
			for(int i = 0; i < articleId.length; i++){
                params.put("articleId", articleId[i]);


                ArticleBean ab = (ArticleBean)dao.read(params);

    			params.put("articlebean",ab);
                dao.update(params);

            }
			


            resc.setTarget("publicationrangesetting");

            return resc;

        }catch(NullPointerException e){
			throw new ParameterInvalidException("入力内容が足りません", e);
		}catch(IntegrationException e){
            throw new BusinessLogicException(e.getMessage(), e);
        }finally{
			MySqlConnectionManager.getInstance().commit();
            MySqlConnectionManager.getInstance().closeConnection();
		}
    }
}
