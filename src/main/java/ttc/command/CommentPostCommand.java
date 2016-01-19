package ttc.command;

import ttc.context.RequestContext;
import ttc.context.ResponseContext;

import ttc.util.MySqlConnectionManager;

import ttc.exception.IntegrationException;
import ttc.exception.BusinessLogicException;

import java.util.Map;
import java.util.HashMap;

import java.util.Calendar;
import java.text.SimpleDateFormat;

import ttc.util.factory.AbstractDaoFactory;
import ttc.dao.AbstractDao;

public class CommentPostCommand extends AbstractCommand{
    public ResponseContext execute(ResponseContext resc)throws BusinessLogicException{
        try{
            RequestContext reqc = getRequestContext();

            String userId = reqc.getParameter("userId")[0];
            System.out.println(userId);
            String articleId = reqc.getParameter("articleId")[0];
System.out.println(articleId);
            Calendar cal = Calendar.getInstance();
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
            String date = formatter.format(cal.getTime());
System.out.println(date);
            String body = reqc.getParameter("body")[0];
System.out.println(body);
            Map params = new HashMap();
            params.put("userId",userId);
            params.put("articleId",articleId);
            params.put("body",body);

            MySqlConnectionManager.getInstance().beginTransaction();
            AbstractDaoFactory factory = AbstractDaoFactory.getFactory("comment");
            AbstractDao dao = factory.getAbstractDao();
            dao.insert(params);

            MySqlConnectionManager.getInstance().commit();
            MySqlConnectionManager.getInstance().closeConnection();

            resc.setTarget("comment");

            return resc;
        }catch(IntegrationException e){
            throw new BusinessLogicException(e.getMessage(),e);
        }
    }
}
