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
import ttc.util.UniqueKeyGenerator;

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
            String quepstionId=reqc.getParameter("questionId")[0];
            String questionAnswer=reqc.getParameter("questionAnswer")[0];
            String adminFlag = reqc.getParameter("adminFlag")[0];
			String signKey = reqc.getParameter("signKey")[0];

			if(birthDate.length()>8){
				String[] dcash = birthDate.split("-");
				birthDate = dcash[0]+dcash[1]+dcash[2];
			}
			
			String hash = UniqueKeyGenerator.getHashCode(signKey);

            MySqlConnectionManager.getInstance().beginTransaction();
            AbstractDaoFactory factory = AbstractDaoFactory.getFactory("signKey");
            AbstractDao dao2 = factory.getAbstractDao();
            
			Map kParam = new HashMap();
			kParam.put("key",hash);
			dao2.read(kParam);
			
			factory = AbstractDaoFactory.getFactory("users");
			AbstractDao dao = factory.getAbstractDao();
			
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
            params.put("secretAnswer",questionAnswer);
            params.put("adminFlag",adminFlag);
			int userId = dao.insert(params);
			
			dao2.update(kParam);
            
			MySqlConnectionManager.getInstance().commit();
            MySqlConnectionManager.getInstance().closeConnection();
			
			UserBean ub = new UserBean();
            ub.setId(String.valueOf(userId));
			ub.setLoginId(loginId);
			ub.setUserName(userName);
			ub.setNameKana(nameKana);
			ub.setSex(sex);
			ub.setSexVisibleFlag(sexVisibleFlag);
			ub.setBirthDate(birthDate);
			ub.setMailAddress(mailAddress);
			ub.setAdminFlag(adminFlag);
			

            resc.setResult(ub);
            resc.setTarget("signupResult");

            return resc;
        }catch(NullPointerException e){
			throw new ParameterInvalidException("入力内容が足りません", e);
		}catch(IntegrationException e){
            throw new BusinessLogicException(e.getMessage(),e);
        }
    }
}
