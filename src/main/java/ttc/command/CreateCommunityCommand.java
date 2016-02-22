package ttc.command;

import ttc.context.RequestContext;
import ttc.context.ResponseContext;

import ttc.util.MySqlConnectionManager;

import ttc.exception.business.BusinessLogicException;
import ttc.exception.integration.IntegrationException;

import ttc.util.factory.AbstractDaoFactory;
import ttc.dao.AbstractDao;

import java.util.Map;
import java.util.HashMap;
import ttc.bean.UserBean;
import ttc.bean.CommunityBean;
import ttc.exception.business.ParameterInvalidException;


public class CreateCommunityCommand extends AbstractCommand{
    public ResponseContext execute(ResponseContext resc)throws BusinessLogicException{
        try{
            RequestContext reqc = getRequestContext();

            HashMap params = new HashMap();

			String loginId=reqc.getParameter("userId")[0];

			params.put("value",loginId);
			params.put("where","where user_id=?");
            params.put("commName",reqc.getParameter("commName")[0]);
            params.put("commProfile",reqc.getParameter("commProfile")[0]);

            String icon = (reqc.getParameter("commIcon")[0]);
            if(icon!=null && icon.length()!=0){
                params.put("commIcon",icon);
            }else{
                params.put("commIcon","");
            }

            String header = (String)reqc.getParameter("commHeader")[0];
            if(header != null && header.length() != 0){
                params.put("commHeader",header);
            }else{
                params.put("commHeader","");
            }

            String userId=reqc.getParameter("userId")[0];
            params.put("userId",userId);

            MySqlConnectionManager.getInstance().beginTransaction();

            AbstractDaoFactory factory = AbstractDaoFactory.getFactory("community");
            AbstractDao dao = factory.getAbstractDao();
            dao.insert(params);

			AbstractDaoFactory factory2 = AbstractDaoFactory.getFactory("users");
			dao = factory2.getAbstractDao();

			UserBean user = (UserBean)dao.read(params);

            MySqlConnectionManager.getInstance().commit();
            MySqlConnectionManager.getInstance().closeConnection();


			CommunityBean community = new CommunityBean();

			community.setName((String)params.get("commName"));
			community.setProfile((String)params.get("commProfile"));
			community.setIconPath((String)params.get("commIcon"));
			community.setHeaderPath((String)params.get("commHeader"));

			user.setCommunity(community);

			resc.setResult(user);


            resc.setTarget("communityCreateResult");

            return resc;
        }catch(NullPointerException e){
			throw new ParameterInvalidException("入力内容が足りません", e);
		}catch(IntegrationException e){
            throw new BusinessLogicException(e.getMessage(),e);
        }
    }
}
