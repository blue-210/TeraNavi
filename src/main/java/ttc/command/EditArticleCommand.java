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

public class EditArticleCommand extends AbstractCommand{
    public ResponseContext execute(ResponseContext resc)throws BusinessLogicException{
        try{
            RequestContext reqc = getRequestContext();

            String articleId = reqc.getParameter("articleId")[0];
            String title = reqc.getParameter("title")[0];
            System.out.println(title);
            String body = reqc.getParameter("body")[0];
            String status = "0";

            Map params = new HashMap();
            params.put("articleId", articleId);
            if(title.equals("変更しない")){

            }else{
                params.put("title", title);
            }
            if(body.equals("変更しない")){

            }else{
                params.put("body", body);
            }
            params.put("status", status);

            MySqlConnectionManager.getInstance().beginTransaction();

            AbstractDaoFactory factory = AbstractDaoFactory.getFactory("article");
            AbstractDao dao = factory.getAbstractDao();
            ArticleBean ab = (ArticleBean)dao.read(params);

			params.put("articlebean",ab);
            dao.update(params);

            MySqlConnectionManager.getInstance().commit();
            MySqlConnectionManager.getInstance().closeConnection();

            resc.setTarget("editArticleResult");

            return resc;

        }catch(IntegrationException e){
            throw new BusinessLogicException(e.getMessage(), e);
        }
    }
}
