package ttc.command;

import ttc.context.RequestContext;
import ttc.context.ResponseContext;

import ttc.util.MySqlConnectionManager;

import ttc.exception.business.BusinessLogicException;
import ttc.exception.integration.IntegrationException;

import java.util.Map;
import java.util.HashMap;

import ttc.util.factory.AbstractDaoFactory;
import ttc.dao.AbstractDao;
import ttc.bean.Bean;
import ttc.exception.business.ParameterInvalidException;

public class ShowBlogCommand extends AbstractCommand{
    public ResponseContext execute(ResponseContext resc)throws BusinessLogicException{
        try{
            RequestContext reqc = getRequestContext();
			String target = "";
            String targetURL="";
			try{
				//ログインユーザ以外のブログ情報を取得したい場合はtargetパラメータからIDを取得する
				target = reqc.getParameter("targetId")[0];
			}catch(NullPointerException e){
				//それ以外の場合はログインユーザのIDを取得
				target = reqc.getParameter("userId")[0];
			}

            targetURL=reqc.getParameter("targetURL")[0];

            Map params = new HashMap();
			params.put("userId", target);

            MySqlConnectionManager.getInstance().beginTransaction();

            AbstractDaoFactory factory = AbstractDaoFactory.getFactory("blog");
            AbstractDao dao = factory.getAbstractDao();
            Bean bean = dao.read(params);

            MySqlConnectionManager.getInstance().commit();
            MySqlConnectionManager.getInstance().closeConnection();

            String url="blogSetting";
            System.out.println("飛ばす先"+targetURL+" id :"+target);


            resc.setResult(bean);
            resc.setTarget(targetURL);


            return resc;

        }catch(NullPointerException e){
			throw new ParameterInvalidException("入力内容が足りません", e);
		}catch(IntegrationException e){
            throw new BusinessLogicException(e.getMessage(), e);
        }
    }
}
