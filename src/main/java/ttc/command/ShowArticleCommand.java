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
import ttc.bean.BlogBean;
import ttc.exception.business.ParameterInvalidException;

public class ShowArticleCommand extends AbstractCommand{
    public ResponseContext execute(ResponseContext resc)throws BusinessLogicException{
        try{
            RequestContext reqc = getRequestContext();

            Map result = new HashMap();

            String articleId = reqc.getParameter("articleId")[0];

            Map params = new HashMap();
            params.put("articleId", articleId);

            MySqlConnectionManager.getInstance().beginTransaction();

            AbstractDaoFactory factory = AbstractDaoFactory.getFactory("article");
            AbstractDao dao = factory.getAbstractDao();
            ArticleBean ab = (ArticleBean)dao.read(params);
            result.put("article", ab);


            Map params2 = new HashMap();
            params2.put("userId", ab.getUserId());

            factory = AbstractDaoFactory.getFactory("blog");
            dao = factory.getAbstractDao();
            BlogBean bb = (BlogBean)dao.read(params2);
            result.put("blog", bb);


            MySqlConnectionManager.getInstance().commit();
            MySqlConnectionManager.getInstance().closeConnection();

            resc.setResult(result);
            resc.setTarget("showArticleResult");

            return resc;

        }catch(NullPointerException e){
			throw new ParameterInvalidException("入力内容が足りません", e);
		}catch(IntegrationException e){
            throw new BusinessLogicException(e.getMessage(), e);
        }
    }
}
