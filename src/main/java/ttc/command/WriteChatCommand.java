package ttc.command;

import ttc.context.RequestContext;
import ttc.context.ResponseContext;

import ttc.util.MySqlConnectionManager;

import ttc.exception.IntegrationException;
import ttc.exception.BusinessLogicException;

import java.util.Map;
import java.util.HashMap;


import ttc.util.factory.AbstractDaoFactory;
import ttc.dao.AbstractDao;
import ttc.bean.UserBean;

public class WriteChatCommand extends AbstractCommand{


    public ResponseContext execute(ResponseContext resc)throws BusinessLogicException{
        try{
            RequestContext reqc = getRequestContext();


            String userId=reqc.getParameter("userId")[0];
            String topicId=reqc.getParameter("topicId")[0];
            String chatBody=reqc.getParameter("chatBody")[0];
            String chatDate=reqc.getParameter("chatDate")[0];
            String chatDeleteFlag=reqc.getParameter("chatDeleteFlag")[0];





            Map params = new HashMap();
            params.put("userId",userId);
            params.put("topicId",topicId);
            params.put("chatBody",chatBody);
            params.put("chatDate",chatDate);
            params.put("chatDeleteFlag",chatDeleteFlag);



            MySqlConnectionManager.getInstance().beginTransaction();
            AbstractDaoFactory factory = AbstractDaoFactory.getFactory("beisc");
            AbstractDao dao = factory.getAbstractDao();
            dao.insert(params);


            MySqlConnectionManager.getInstance().commit();
            MySqlConnectionManager.getInstance().closeConnection();




            resc.setTarget("ChatResult");

            return resc;
        }catch(IntegrationException e){
            throw new BusinessLogicException(e.getMessage(),e);
        }
    }
}
