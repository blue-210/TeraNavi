package ttc.command;

import ttc.context.RequestContext;
import ttc.context.ResponseContext;

import ttc.util.MySqlConnectionManager;

import ttc.exception.IntegrationException;
import ttc.exception.BusinessLogicException;

import java.util.Map;
import java.util.HashMap;

import java.util.Calendar;
import java.text.SimpleDateFormat;

import ttc.util.factory.AbstractDaoFactory;
import ttc.dao.AbstractDao;
import ttc.bean.UserBean;

public class LogoutCommand extends AbstractCommand{


    public ResponseContext execute(ResponseContext resc)throws BusinessLogicException{
        try{
            RequestContext reqc = getRequestContext();
            Calendar c = Calendar.getInstance();

            String userId=reqc.getParameter("userId")[0];
            SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
            String date=sdf.format(c.getTime());




            Map params = new HashMap();
            params.put("userId",userId);
            params.put("lastLoginDate",date);


            MySqlConnectionManager.getInstance().beginTransaction();
            AbstractDaoFactory factory = AbstractDaoFactory.getFactory("users");
            AbstractDao dao = factory.getAbstractDao();
            dao.insert(params);


            MySqlConnectionManager.getInstance().commit();
            MySqlConnectionManager.getInstance().closeConnection();




            resc.setTarget("LogoutResult");

            return resc;
        }catch(IntegrationException e){
            throw new BusinessLogicException(e.getMessage(),e);
        }
    }
}
