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
import ttc.exception.business.ParameterInvalidException;


public class ShowMyCommunityListCommand extends AbstractCommand{
    public ResponseContext execute(ResponseContext resc)throws BusinessLogicException{
        try{
            RequestContext reqc = getRequestContext();

            HashMap params = new HashMap();

            String userId = reqc.getParameter("userId")[0];

			try{
				//targetUserIdパラメータがあるかのチェック
				String targetUserId = reqc.getParameter("targetUserId")[0];

				if(targetUserId.length() > 0){
					userId = targetUserId;
				}
			}catch(NullPointerException e){}

            params.put("value",userId);

            params.put("where"," WHERE community_members_list.fk_user_id= ? and communities.community_delete_flag = '0' ");


            MySqlConnectionManager.getInstance().beginTransaction();

            AbstractDaoFactory factory = AbstractDaoFactory.getFactory("community");
            AbstractDao dao = factory.getAbstractDao();

			Map results = new HashMap();
			results.put("list",dao.readAll(params));

            params.clear();

            factory = AbstractDaoFactory.getFactory("users");
            dao = factory.getAbstractDao();
            params.put("value",userId);
            params.put("where", " where user_id=? ");
            results.put("user", dao.read(params));

            MySqlConnectionManager.getInstance().commit();
            MySqlConnectionManager.getInstance().closeConnection();

			resc.setResult(results);

            boolean myCommListFlag = false;
			try{
				//targetパラメータがあるかのチェック
				String myCommList = reqc.getParameter("myCommunityList")[0];

				if(myCommList.length() > 0){
					myCommListFlag=true;
				}
			}catch(NullPointerException e){}

            if(myCommListFlag){
                resc.setTarget("showMyCommunityList");
            }else{
                resc.setTarget("showMyCommunityResult");
            }

            return resc;

        }catch(NullPointerException e){
			throw new ParameterInvalidException("入力内容が足りません", e);
		}catch(IntegrationException e){
            throw new BusinessLogicException(e.getMessage(),e);
        }
    }
}
