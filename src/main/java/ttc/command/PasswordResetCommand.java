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
import ttc.util.PasswordSaffer;

public class PasswordResetCommand extends AbstractCommand{


    public ResponseContext execute(ResponseContext resc)throws BusinessLogicException{
        try{
			RequestContext reqc = getRequestContext();

			String loginId = reqc.getParameter("loginId")[0];
			String password = reqc.getParameter("password")[0];
			
			password = PasswordSaffer.getStretchedPassword(password, loginId);

            Map params = new HashMap();
			params.put("value",loginId);
			params.put("where","where login_id=?");

			params.put("password",password);

            MySqlConnectionManager.getInstance().beginTransaction();
            AbstractDaoFactory factory = AbstractDaoFactory.getFactory("users");
            AbstractDao dao = factory.getAbstractDao();
            UserBean ub = (UserBean)dao.read(params);

			params.put("userbean",ub);
			params.put("userId",ub.getId());
			dao.update(params);

			MySqlConnectionManager.getInstance().commit();

			resc.setResult(params);

            resc.setTarget("resetResult");

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
