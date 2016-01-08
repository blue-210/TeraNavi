package ttc.command;

import ttc.context.RequestContext;
import ttc.context.ResponseContext;

import ttc.util.MySqlConnectionManager;

import ttc.exception.BusinessLogicException;
import ttc.exception.IntegrationException;

import java.util.Map;
import java.util.HashMap;

import ttc.util.factory.AbstractDaoFactory;
import ttc.dao.AbstractDao;

import ttc.bean.ArticleBean;

public class DeleteArticleCommand extends AbstractCommand{
    public ResponseContext execute(ResponseContext resc)throws BusinessLogicException{
        try{
            RequestContext reqc = getRequestContext();

            String[] articleId = reqc.getParameter("articleId");

            String status = "2";

            Map params = new HashMap();
            params.put("articleId", articleId);
            params.put("status", status);

            MySqlConnectionManager.getInstance().beginTransaction();

            AbstractDaoFactory factory = AbstractDaoFactory.getFactory("article");
            AbstractDao dao = factory.getAbstractDao();
            ArticleBean ab = (ArticleBean)dao.read(params);

			params.put("articlebean",ab);
            dao.update(params);

            MySqlConnectionManager.getInstance().commit();
            MySqlConnectionManager.getInstance().closeConnection();

            resc.setTarget("deletearticle");

            return resc;

        }catch(IntegrationException e){
            throw new BusinessLogicException(e.getMessage(), e);
        }
    }
}
