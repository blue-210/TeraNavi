package ttc.command;

import ttc.context.RequestContext;
import ttc.context.ResponseContext;

import ttc.util.MySqlConnectionManager;

import ttc.exception.business.BusinessLogicException;
import ttc.exception.integration.IntegrationException;

import java.util.Map;
import java.util.HashMap;
import java.util.List;

import ttc.bean.Bean;

import ttc.util.factory.AbstractDaoFactory;
import ttc.dao.AbstractDao;
import ttc.bean.ChatBean;
import ttc.exception.business.ParameterInvalidException;

public class ShowChatCommand extends AbstractCommand{
    public ResponseContext execute(ResponseContext resc)throws BusinessLogicException{
        try{
            RequestContext reqc = getRequestContext();

            String topicId=reqc.getParameter("topicId")[0];
			String communityId = reqc.getParameter("communityId")[0];

            Map params = new HashMap();
            params.put("topicId", topicId);


            MySqlConnectionManager.getInstance().beginTransaction();

            AbstractDaoFactory factory = AbstractDaoFactory.getFactory("chat");
            AbstractDao dao = factory.getAbstractDao();

			List result = dao.readAll(params);

			factory = AbstractDaoFactory.getFactory("community");
			dao = factory.getAbstractDao();

			params = new HashMap();
			params.put( "commId", communityId);
			params.put("where","where community_id=? and community_delete_flag=0");

			Bean community = dao.read(params);

            MySqlConnectionManager.getInstance().commit();
            MySqlConnectionManager.getInstance().closeConnection();

            // topicのDAO取得
            params = new HashMap();
            params.put("topicId", topicId);

            factory = AbstractDaoFactory.getFactory("topic");
            dao = factory.getAbstractDao();

            Bean topic = dao.read(params);


            // 投稿が一度もない場合
            if(result.isEmpty()){
                ChatBean bean = new ChatBean();
                bean.setFkTopicId(topicId);
                result.add(bean);

            }

			Map resultMap = new HashMap();
			resultMap.put("chat",result);
			resultMap.put("community",community);
			resultMap.put("topic",topic);

			resc.setResult(resultMap);

			resc.setTarget("showchat");

            return resc;

        }catch(NullPointerException e){
			throw new ParameterInvalidException("入力内容が足りません", e);
		}catch(IntegrationException e){
            throw new BusinessLogicException(e.getMessage(), e);
        }
    }
}
