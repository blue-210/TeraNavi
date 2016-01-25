package ttc.command;

import ttc.context.RequestContext;
import ttc.context.ResponseContext;

import ttc.util.MySqlConnectionManager;

import ttc.exception.BusinessLogicException;
import ttc.exception.IntegrationException;

import ttc.util.factory.AbstractDaoFactory;
import ttc.dao.AbstractDao;

import java.util.Map;
import java.util.HashMap;
import ttc.bean.UserBean;
import ttc.bean.CommunityBean;
import java.util.List;
import java.util.ArrayList;

public class ShowMemberListCommand extends AbstractCommand{
    public ResponseContext execute(ResponseContext resc)throws BusinessLogicException{
        try{
            RequestContext reqc = getRequestContext();

            HashMap params = new HashMap();

            MySqlConnectionManager.getInstance().beginTransaction();

            AbstractDaoFactory fact=AbstractDaoFactory.getFactory("users");
            AbstractDao abdao= fact.getAbstractDao();
            ArrayList memebers=new ArrayList();

            params.put("where"," and fk_community_id=?");
            params.put("join"," join community_members_list on users.user_id = fk_user_id ");

            params.put("value",reqc.getParameter("commId")[0]);
            params.put("userStatus","0");

            List result = abdao.readAll(params);


            MySqlConnectionManager.getInstance().commit();
            MySqlConnectionManager.getInstance().closeConnection();


			resc.setResult(result);

            resc.setTarget("showMemberListResult");

            return resc;
        }catch(IntegrationException e){
            throw new BusinessLogicException(e.getMessage(),e);
        }
    }
}
