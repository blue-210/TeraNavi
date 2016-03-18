package ttc.command;

import ttc.context.RequestContext;
import ttc.context.ResponseContext;

import ttc.util.MySqlConnectionManager;

import ttc.exception.business.BusinessLogicException;
import ttc.exception.integration.IntegrationException;

import java.util.Map;
import java.util.HashMap;

import java.util.Calendar;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import ttc.util.factory.AbstractDaoFactory;
import ttc.dao.AbstractDao;
import ttc.exception.business.ParameterInvalidException;
import ttc.util.DMComparator;

public class DirectMessageSendCommand extends AbstractCommand{
    public ResponseContext execute(ResponseContext resc)throws BusinessLogicException{
        try{
            RequestContext reqc = getRequestContext();

//            Calendar c = Calendar.getInstance();
//            SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
//            String date=sdf.format(c.getTime());

            String messageBody=reqc.getParameter("messageBody")[0];

            String sendUserId = reqc.getParameter("userId")[0];

            String receiveUserId=reqc.getParameter("receiveUserId")[0];

            Map params = new HashMap();
            params.put("messageBody", messageBody);
//            params.put("messageDate", date);
            params.put("sendUserId", sendUserId);
            params.put("receiveUserId", receiveUserId);

            MySqlConnectionManager.getInstance().beginTransaction();

            AbstractDaoFactory factory = AbstractDaoFactory.getFactory("dm");
            AbstractDao dao = factory.getAbstractDao();
            dao.insert(params);
			
			params.put("receiveUserId",sendUserId);
			params.put("sendUserId",receiveUserId);
			
			List receiveDm = dao.readAll(params);
			//特定の相手から自分に送信されたDMを取得
			
			params.clear();
			params.put("receiveUserId", receiveUserId);
			params.put("sendUserId", sendUserId);
			
			List sendDm = dao.readAll(params);
			//自分から特定の相手に送信したDMを取得
			

            

			
			List resultDm = new ArrayList();
			resultDm.addAll(receiveDm);
			resultDm.addAll(sendDm);
			//2つのListを結合して結果として返すListを生成
			//(この時点ではソートされていないので日付順になっていない)
			
			Collections.sort(resultDm,new DMComparator());
			//DMを日付順にソート
			
			
			resc.setResult(resultDm);
            
			//福田案採用果たして動くのか・・・
			//↑
			//これ書いた人後で説教
			
			MySqlConnectionManager.getInstance().commit();
			
            resc.setTarget("sendResult");

            return resc;

        }catch(NullPointerException e){
			throw new ParameterInvalidException("入力内容が足りません", e);
		}catch(IntegrationException e){
            throw new BusinessLogicException(e.getMessage(), e);
        }finally{
			
            MySqlConnectionManager.getInstance().closeConnection();
		}
    }
}
