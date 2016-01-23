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
import java.util.ArrayList;

public class ShowCommunityCommand extends AbstractCommand{
    public ResponseContext execute(ResponseContext resc)throws BusinessLogicException{
        try{
            RequestContext reqc = getRequestContext();

            HashMap params = new HashMap();

            params.put("where","where community_id=? and community_delete_flag=0");
            params.put("commId",reqc.getParameter("commId")[0]);

            MySqlConnectionManager.getInstance().beginTransaction();

            AbstractDaoFactory factory = AbstractDaoFactory.getFactory("community");
            AbstractDao dao = factory.getAbstractDao();
            CommunityBean cb =(CommunityBean)dao.read(params);
            cb.setId(reqc.getParameter("commId")[0]);

            MySqlConnectionManager.getInstance().commit();
            MySqlConnectionManager.getInstance().closeConnection();


			resc.setResult(cb);

            resc.setTarget("showCommunityResult");

            return resc;
        }catch(IntegrationException e){
            throw new BusinessLogicException(e.getMessage(),e);
        }
    }
}
