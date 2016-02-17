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

import ttc.exception.business.ParameterInvalidException;



public class MemberSettingCommand extends AbstractCommand{
    public ResponseContext execute(ResponseContext resc)throws BusinessLogicException{
        try{
            RequestContext reqc = getRequestContext();

            String loginId=reqc.getParameter("userId")[0];

            String[] targetNo=reqc.getParameter("targetNo");
            String communityId = reqc.getParameter("communityId")[0];
            String userId=reqc.getParameter("userId")[0];

            String target="community_admin_flag=1";



            Map params = new HashMap();


            params.put("commId",communityId);
            params.put("userId",loginId);
            params.put("target",target);


            MySqlConnectionManager.getInstance().beginTransaction();
            AbstractDaoFactory factory = AbstractDaoFactory.getFactory("communitymember");
            AbstractDao dao = factory.getAbstractDao();
            System.out.println("これからアップ");
            for(int i=0;i<targetNo.length;i++){
                params.put("targetNo",targetNo[i]);
                dao.update(params);
            }


            MySqlConnectionManager.getInstance().commit();
            MySqlConnectionManager.getInstance().closeConnection();

			resc.setResult(params);
            resc.setTarget("CommunityGrantMemberResult");

            return resc;
        }catch(NullPointerException e){
			throw new ParameterInvalidException("入力内容が足りません", e);
		}catch(IntegrationException e){
            throw new BusinessLogicException(e.getMessage(),e);
        }
    }
}
