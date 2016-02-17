package ttc.command;

import ttc.context.RequestContext;
import ttc.context.ResponseContext;

import ttc.util.MySqlConnectionManager;

import ttc.exception.business.BusinessLogicException;
import ttc.exception.integration.IntegrationException;

import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;

import ttc.util.factory.AbstractDaoFactory;
import ttc.dao.AbstractDao;

import ttc.bean.ArticleBean;
import ttc.exception.business.ParameterInvalidException;

public class DeleteArticleCommand extends AbstractCommand{
    public ResponseContext execute(ResponseContext resc)throws BusinessLogicException{
        try{
            System.out.println("DeleteArticleCommand");
            RequestContext reqc = getRequestContext();

            String[] articleId = reqc.getParameter("articleId");

            String loginUserId = reqc.getParameter("loginUserId")[0];

            String status = "2";

            Map params = new HashMap();

            params.put("status", status);

            AbstractDaoFactory factory = AbstractDaoFactory.getFactory("article");
            AbstractDao dao = factory.getAbstractDao();

            for(int i = 0; i < articleId.length; i++){
                params.put("articleId", articleId[i]);
                System.out.println("parameterArticleId="+articleId[i]);

                MySqlConnectionManager.getInstance().beginTransaction();

                ArticleBean ab = (ArticleBean)dao.read(params);

    			params.put("articlebean",ab);
                dao.update(params);

                params.put("userId", loginUserId);
                ArrayList al = (ArrayList)dao.readAll( params );
                resc.setResult(al);

                MySqlConnectionManager.getInstance().commit();
                MySqlConnectionManager.getInstance().closeConnection();
            }

            resc.setTarget("showArticleListResult");

            return resc;

        }catch(NullPointerException e){
			throw new ParameterInvalidException("入力内容が足りません", e);
		}catch(IntegrationException e){
            throw new BusinessLogicException(e.getMessage(), e);
        }
    }
}
