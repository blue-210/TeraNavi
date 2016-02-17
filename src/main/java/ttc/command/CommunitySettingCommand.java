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
import ttc.bean.CommunityBean;
import ttc.exception.business.ParameterInvalidException;



public class CommunitySettingCommand extends AbstractCommand{
    public ResponseContext execute(ResponseContext resc)throws BusinessLogicException{
        try{
            RequestContext reqc = getRequestContext();

            String loginId=reqc.getParameter("userId")[0];



            String communityName = reqc.getParameter("commName")[0];
            String communityProfile = reqc.getParameter("commProfile")[0];
            String iconPath = reqc.getParameter("iconPath")[0];
            String headerPath = reqc.getParameter("headerPath")[0];
            String deleteFlag = reqc.getParameter("deleteFlag")[0];
            String communityId = reqc.getParameter("commId")[0];
            String userId=reqc.getParameter("userId")[0];
            String nowIconPath=reqc.getParameter("nowIconPath")[0];
            String nowHeaderPath=reqc.getParameter("nowHeaderPath")[0];

            HashMap params = new HashMap();
            params.put("value",loginId);
			params.put("where","where user_id=?");
            params.put("communityName",communityName);
            params.put("communityProfile",communityProfile);

            if(iconPath!=null && iconPath.length()!=0){
                params.put("iconPath",iconPath);
            }else{
                params.put("iconPath",nowIconPath);
            }
            if(headerPath != null && headerPath.length() != 0){
                params.put("headerPath",headerPath);
            }else{
                params.put("headerPath",nowHeaderPath);
            }
            params.put("deleteFlag",deleteFlag);
            params.put("commId",communityId);
            params.put("userId",loginId);

            params.put("target",(String)reqc.getParameter("target")[0]);


            MySqlConnectionManager.getInstance().beginTransaction();
            AbstractDaoFactory factory = AbstractDaoFactory.getFactory("community");
            AbstractDao dao = factory.getAbstractDao();
            dao.update(params);

            MySqlConnectionManager.getInstance().commit();
            MySqlConnectionManager.getInstance().closeConnection();

			    resc.setResult(params);
                resc.setTarget((String)params.get("target"));

            return resc;
        }catch(NullPointerException e){
			throw new ParameterInvalidException("入力内容が足りません", e);
		}catch(IntegrationException e){
            throw new BusinessLogicException(e.getMessage(),e);
        }
    }
}
