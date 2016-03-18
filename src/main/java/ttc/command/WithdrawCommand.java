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

public class WithdrawCommand extends AbstractCommand{


    public ResponseContext execute(ResponseContext resc)throws BusinessLogicException{
        try{
            RequestContext reqc = getRequestContext();

            String userId=reqc.getParameter("userId")[0];

            Map params = new HashMap();
            params.put("value",userId);
            params.put("where","where user_id=?");


            MySqlConnectionManager.getInstance().beginTransaction();
            AbstractDaoFactory factory = AbstractDaoFactory.getFactory("users");
            AbstractDao dao = factory.getAbstractDao();
            UserBean ub = (UserBean)dao.read(params);
			
			params.put("userbean",ub);
			params.put("userStatus", "3");
			params.put("userId",ub.getId());
			dao.update(params);

			MySqlConnectionManager.getInstance().commit();
			
			resc.setTarget("withdrawResult");

			return resc;


        }catch(NullPointerException e){
			throw new ParameterInvalidException("入力内容が足りません", e);
		}catch(IntegrationException e){
            throw new BusinessLogicException(e.getMessage(),e);
        }finally{
			
            MySqlConnectionManager.getInstance().closeConnection();
		}
    }
}
