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

public class SignUpCommand extends AbstractCommand{
    public ResponseContext execute(ResponseContext resc)throws BusinessLogicException{
        try{
            RequestContext reqc = getRequestContext();

            String loginId=reqc.getParameter("loginId")[0];
            String userName=reqc.getParameter("userName")[0];
            String nameKana=reqc.getParameter("nameKana")[0];
            String sex=reqc.getParameter("sex")[0];
            String sexVisibleFlag=reqc.getParameter("sexVisibleFlag")[0];
            String birthDate=reqc.getParameter("birthDate")[0];
            String mailAddress=reqc.getParameter("mailAddress")[0];
            String password=reqc.getParameter("password")[0];
            String quepstionId=reqc.getParameter("quepstionId")[0];
            String quepstionAnswer=reqc.getParameter("quepstionAnswer")[0];

            Map params = new HashMap();
            params.put("loginId",loginId);
            params.put("userName",userName);
            params.put("nameKana",nameKana);
            params.put("sex",sex);
            params.put("sexVisibleFlag",sexVisibleFlag);
            params.put("birthDate",birthDate);
            params.put("mailAddress",mailAddress);
            params.put("password",password);
            params.put("quepstionId",quepstionId);
            params.put("quepstionAnswer",quepstionAnswer);


            MySqlConnectionManager.getInstance().beginTransaction();
            AbstractDaoFactory factory = AbstractDaoFactory.getFactory("users");
            AbstractDao dao = factory.getAbstractDao();
            dao.insert(params);

            MySqlConnectionManager.getInstance().commit();
            MySqlConnectionManager.getInstance().closeConnection();

            resc.setResult("params");
            resc.setTarget("signupResult");

            return resc;
        }catch(IntegrationException e){
            throw new BusinessLogicException(e.getMessage(),e);
        }
    }
}
