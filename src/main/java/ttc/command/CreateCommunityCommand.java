package ttc.command;

import ttc.context.RequestContext;
import ttc.context.ResponseContext;

import ttc.util.MySqlConnectionManager;

import ttc.exception.BusinessLogicException;
import ttc.exception.IntegrationException;

import ttc.util.factory.AbstractDaoFactory;
import ttc.dao.AbstractDao;

import java.util.Map;
import java.util.HashMap;
import ttc.bean.UserBean;
import ttc.dao.UsersDao;

public class CreateCommunityCommand extends AbstractCommand{
    public ResponseContext execute(ResponseContext resc)throws BusinessLogicException{
        try{
            RequestContext reqc = getRequestContext();

            HashMap params = new HashMap();

            params.put("commName",reqc.getParameter("commName")[0]);
            params.put("commProfile",reqc.getParameter("commProfile")[0]);

            String icon = (reqc.getParameter("commIcon")[0]);
            if(icon!=null && icon.length()!=0){
                params.put("commIcon",icon);
            }else{
                params.put("commIcon",null);
            }

            String header = (String)reqc.getParameter("commHeader")[0];
            if(header != null && header.length() != 0){
                params.put("commHeader",header);
            }else{
                params.put("commIcon",null);
            }

            String userId=reqc.getParameter("userId")[0];
            params.put("userId",userId);



            MySqlConnectionManager.getInstance().beginTransaction();

            AbstractDaoFactory factory = AbstractDaoFactory.getFactory("community");
            AbstractDao dao = factory.getAbstractDao();
            dao.insert(params);

            MySqlConnectionManager.getInstance().commit();
            MySqlConnectionManager.getInstance().closeConnection();


            resc.setTarget("communityCreateResult");

            return resc;
        }catch(IntegrationException e){
            throw new BusinessLogicException(e.getMessage(),e);
        }
    }
}
