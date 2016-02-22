package ttc.command;

import ttc.context.RequestContext;
import ttc.context.ResponseContext;

import ttc.util.MySqlConnectionManager;

import ttc.exception.integration.IntegrationException;
import ttc.exception.business.BusinessLogicException;

import java.util.Map;
import java.util.HashMap;

import ttc.util.factory.AbstractDaoFactory;
import ttc.dao.AbstractDao;
import ttc.bean.UserBean;
import ttc.exception.business.ParameterInvalidException;

public class ShowUserSettingCommand extends AbstractCommand{


    public ResponseContext execute(ResponseContext resc)throws BusinessLogicException{
        try{
            RequestContext reqc = getRequestContext();

            String loginId=reqc.getParameter("targetId")[0];



            Map params = new HashMap();
            params.put("value",loginId);
            params.put("where","where login_id=?");


            MySqlConnectionManager.getInstance().beginTransaction();
            AbstractDaoFactory factory = AbstractDaoFactory.getFactory("users");
            AbstractDao dao = factory.getAbstractDao();
            UserBean ub = (UserBean)dao.read(params);

            MySqlConnectionManager.getInstance().commit();
            MySqlConnectionManager.getInstance().closeConnection();



            ub.setPassword("dummy");
            ub.setSecretAnswer("dummy");
            resc.setResult(ub);
            resc.setTarget("LoginResult");

            return resc;


        }catch(NullPointerException e){
			throw new ParameterInvalidException("入力内容が足りません", e);
		}catch(IntegrationException e){
            throw new BusinessLogicException(e.getMessage(),e);
        }
    }
}
