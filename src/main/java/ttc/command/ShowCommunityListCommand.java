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
import java.util.List;
import ttc.exception.business.ParameterInvalidException;

public class ShowCommunityListCommand extends AbstractCommand{
    public ResponseContext execute(ResponseContext resc)throws BusinessLogicException{
        try{
            RequestContext reqc = getRequestContext();

            HashMap params = new HashMap();

            String intention = reqc.getParameter("intention")[0];

            StringBuffer where = new StringBuffer();

            where.append("where community_delete_flag=0");

            if(intention.equals("search")){
                where.append(" and community_name like ?");

                String keyword = reqc.getParameter("keyword")[0];

                params.put("value","%"+keyword+"%");
            }

            params.put("where",new String(where));


            MySqlConnectionManager.getInstance().beginTransaction();

            AbstractDaoFactory factory = AbstractDaoFactory.getFactory("community");
            AbstractDao dao = factory.getAbstractDao();
            List result =dao.readAll(params);

            MySqlConnectionManager.getInstance().commit();
            MySqlConnectionManager.getInstance().closeConnection();

			resc.setResult(result);

            resc.setTarget("communitySearchResult");

            return resc;
        }catch(NullPointerException e){
			throw new ParameterInvalidException("入力内容が足りません", e);
		}catch(IntegrationException e){
            throw new BusinessLogicException(e.getMessage(),e);
        }
    }
}
