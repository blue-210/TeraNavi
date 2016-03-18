package ttc.command;

import ttc.context.RequestContext;
import ttc.context.ResponseContext;

import ttc.util.MySqlConnectionManager;

import ttc.exception.integration.IntegrationException;
import ttc.exception.business.BusinessLogicException;

import java.util.Map;
import java.util.HashMap;
import java.util.List;
import java.util.ArrayList;

import java.util.Calendar;
import java.text.SimpleDateFormat;

import ttc.util.factory.AbstractDaoFactory;
import ttc.dao.AbstractDao;
import ttc.exception.business.ParameterInvalidException;

public class WriteChatCommand extends AbstractCommand{


    public ResponseContext execute(ResponseContext resc)throws BusinessLogicException{
        try{
            RequestContext reqc = getRequestContext();

            String userId=reqc.getParameter("userId")[0];
            String topicId=reqc.getParameter("topicId")[0];
            String chatBody=reqc.getParameter("chatBody")[0];

			chatBody= chatBody.replaceAll("<script","&lt;script");
			chatBody=chatBody.replaceAll("</script","&lt;/script");
			
			Calendar c = Calendar.getInstance();
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            String date=sdf.format(c.getTime());

            String chatDeleteFlag="0";

            Map params = new HashMap();
            params.put("userId",userId);
            params.put("topicId",topicId);
            params.put("chatBody",chatBody);
            params.put("chatDate",date);
            params.put("chatDeleteFlag",chatDeleteFlag);

            MySqlConnectionManager.getInstance().beginTransaction();
            AbstractDaoFactory factory = AbstractDaoFactory.getFactory("chat");
            AbstractDao dao = factory.getAbstractDao();
            dao.insert(params);

            List result = new ArrayList();
            result = dao.readAll(params);

			MySqlConnectionManager.getInstance().commit();
			
            resc.setResult(result);
            //resc.setTarget("showchat");

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
