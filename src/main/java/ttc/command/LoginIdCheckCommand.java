package ttc.command;

import java.text.ParseException;
import java.util.Calendar;
import ttc.context.RequestContext;
import ttc.context.ResponseContext;

import ttc.util.MySqlConnectionManager;

import ttc.exception.integration.IntegrationException;
import ttc.exception.business.BusinessLogicException;

import java.util.Map;
import java.util.HashMap;


import ttc.util.factory.AbstractDaoFactory;
import ttc.dao.AbstractDao;


import ttc.exception.business.ParameterInvalidException;

import ttc.exception.integration.UserUnregisteredException;

public class LoginIdCheckCommand extends AbstractCommand{


    public ResponseContext execute(ResponseContext resc)throws BusinessLogicException{
        try{
            RequestContext reqc = getRequestContext();

            String loginId=reqc.getParameter("loginId")[0];
			
            Map params = new HashMap();
            params.put("value",loginId);
            params.put("where","where login_id=?");

            MySqlConnectionManager.getInstance().beginTransaction();
            AbstractDaoFactory factory = AbstractDaoFactory.getFactory("users");
            AbstractDao dao = factory.getAbstractDao();
            boolean flag = false;
			//入力されたログインIDが使用可能かどうかを判定するためのフラグ
			try{
				dao.read(params);
				
			}catch(UserUnregisteredException e){
				//ログインIDが登録されていなかったっ場合発生する例外をキャッチし、フラグをtrueにする
				flag = true;
			}
			
            
			String result = "false";
			if(flag){
				result = "true";
			}

			resc.setResult(result);
            return resc;


        }catch(NullPointerException e){
			throw new ParameterInvalidException("入力内容が足りません", e);
		}catch(IntegrationException e){
            throw new BusinessLogicException(e.getMessage(),e);
        }finally{
			MySqlConnectionManager.getInstance().commit();
            MySqlConnectionManager.getInstance().closeConnection();
		}
    }
}
