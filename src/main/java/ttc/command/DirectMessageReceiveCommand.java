package ttc.command;

import java.util.ArrayList;
import ttc.context.RequestContext;
import ttc.context.ResponseContext;

import ttc.util.MySqlConnectionManager;

import ttc.exception.business.BusinessLogicException;
import ttc.exception.integration.IntegrationException;

import java.util.Map;
import java.util.HashMap;
import java.util.List;


import ttc.util.factory.AbstractDaoFactory;
import ttc.dao.AbstractDao;

import ttc.exception.business.ParameterInvalidException;

import java.util.Collections;
import ttc.util.DMComparator;

public class DirectMessageReceiveCommand extends AbstractCommand{
    public ResponseContext execute(ResponseContext resc)throws BusinessLogicException{
        try{
            RequestContext reqc = getRequestContext();

            String userId=reqc.getParameter("userId")[0];
			String sendUser = reqc.getParameter("sendUserId")[0];
			
            Map params = new HashMap();
			

            MySqlConnectionManager.getInstance().beginTransaction();

            AbstractDaoFactory factory = AbstractDaoFactory.getFactory("dm");
            AbstractDao dao = factory.getAbstractDao();

            params.put("receiveUserId",userId);
			params.put("sendUserId",sendUser);
			
			List receiveDm = dao.readAll(params);
			//特定の相手から自分に送信されたDMを取得
			
			params.clear();
			params.put("receiveUserId", sendUser);
			params.put("sendUserId", userId);
			
			List sendDm = dao.readAll(params);
			//自分から特定の相手に送信したDMを取得
			
			MySqlConnectionManager.getInstance().commit();
            MySqlConnectionManager.getInstance().closeConnection();

			List resultDm = new ArrayList();
			resultDm.addAll(receiveDm);
			resultDm.addAll(sendDm);
			//2つのListを結合して結果として返すListを生成
			//(この時点ではソートされていないので日付順になっていない)
			
			Collections.sort(resultDm,new DMComparator());
			//DMを日付順にソート
			
			Map result = new HashMap();
			result.put("dm",resultDm);
			result.put("partnerId", sendUser);
			
			resc.setResult(result);

            resc.setTarget("showdm");

            return resc;

        }catch(NullPointerException e){
			throw new ParameterInvalidException("入力内容が足りません", e);
		}catch(IntegrationException e){
            throw new BusinessLogicException(e.getMessage(), e);
        }
    }
}
