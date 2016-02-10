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

public class CautionUserCommand extends AbstractCommand{
    public ResponseContext execute(ResponseContext resc)throws BusinessLogicException{
        try{
            RequestContext reqc = getRequestContext();
            
            //警告した人のID
            String userId = reqc.getParameter("userId")[0];
            
            //警告された人のID
            String cautionUserId=reqc.getParameter("cautionUserId")[0];
            
            String cautionTitle =reqc.getParameter("cautionTitle")[0];
            
            String cautionBody=reqc.getParameter("cautionBody")[0];
            
            String url=reqc.getParameter("url")[0];
          
            Map params = new HashMap();
            params.put("userId", userId);
            params.put("cautionUserId", cautionUserId);
            params.put("url", url);
            params.put("cautionTitle",cautionTitle);
            params.put("cautionBody",cautionBody);
            
            
            
            MySqlConnectionManager.getInstance().beginTransaction();

            AbstractDaoFactory factory = AbstractDaoFactory.getFactory("caution");
            AbstractDao dao = factory.getAbstractDao();
            dao.insert(params);

            
            MySqlConnectionManager.getInstance().commit();
            MySqlConnectionManager.getInstance().closeConnection();

            resc.setResult(params);
            resc.setTarget("cautionuserresult");

            return resc;

        }catch(IntegrationException e){
            throw new BusinessLogicException(e.getMessage(), e);
        }
    }
}