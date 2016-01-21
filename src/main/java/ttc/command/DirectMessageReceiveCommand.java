package ttc.command;

import ttc.context.RequestContext;
import ttc.context.ResponseContext;

import ttc.util.MySqlConnectionManager;

import ttc.exception.BusinessLogicException;
import ttc.exception.IntegrationException;

import java.util.Map;
import java.util.HashMap;
import java.util.List;

import java.util.Calendar;
import java.text.SimpleDateFormat;

import ttc.util.factory.AbstractDaoFactory;
import ttc.dao.AbstractDao;

import ttc.bean.DirectMessageBean;

public class DirectMessageReceiveCommand extends AbstractCommand{
    public ResponseContext execute(ResponseContext resc)throws BusinessLogicException{
        try{
            RequestContext reqc = getRequestContext();

            String sendUserId=reqc.getParameter("userId")[0];

            Map params = new HashMap();
            params.put("sendUserId", sendUserId);

            MySqlConnectionManager.getInstance().beginTransaction();

            AbstractDaoFactory factory = AbstractDaoFactory.getFactory("dm");
            AbstractDao dao = factory.getAbstractDao();

			List result = dao.readAll(params);

			MySqlConnectionManager.getInstance().commit();
            MySqlConnectionManager.getInstance().closeConnection();


			resc.setResult(result);

            resc.setTarget("showdm");

            return resc;

        }catch(IntegrationException e){
            throw new BusinessLogicException(e.getMessage(), e);
        }
    }
}
