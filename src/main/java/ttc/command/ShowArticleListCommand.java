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
import ttc.bean.BlogBean;

import ttc.util.factory.AbstractDaoFactory;
import ttc.dao.AbstractDao;
import ttc.exception.business.ParameterInvalidException;

public class ShowArticleListCommand extends AbstractCommand{
    public ResponseContext execute(ResponseContext resc)throws BusinessLogicException{
        try{

            RequestContext reqc = getRequestContext();

            Map results = new HashMap();

            String userId = reqc.getParameter("writeUserId")[0];
            System.out.println(userId);

            String scope = null;//期間を指定して投稿記事を取得する場合つかう
            boolean scopeFlag = false;
			try{
				//scope(指定期間)パラメータがあるかのチェック
				scope =reqc.getParameter("scope")[0];

				if(scope.length() > 0){
					scopeFlag=true;
				}
			}catch(NullPointerException e){}

            Map params = new HashMap();
            params.put("userId", userId);
            params.put("flag", "0");


            MySqlConnectionManager.getInstance().beginTransaction();

            AbstractDaoFactory factory = AbstractDaoFactory.getFactory("article");
            AbstractDao dao = factory.getAbstractDao();
            List articles = dao.readAll(params);
            results.put("articles",articles);

            params.clear();

            //ユーザー情報の取得
			factory = AbstractDaoFactory.getFactory("users");
			dao = factory.getAbstractDao();
			params.put("where", "where user_id = ?");
			params.put("value", userId);
			Bean user = dao.read(params);
			results.put("user", user);

            //ブログ情報取得----------------------------------------------------
            factory = AbstractDaoFactory.getFactory("blog");
            dao = factory.getAbstractDao();

            params.put("userId",userId);
            BlogBean bb = (BlogBean)dao.read(params);
            System.out.println("こんにてゃ"+bb);
            results.put("blog", bb);

            


            resc.setResult(results);

            if(scopeFlag==false){
                resc.setTarget("showArticleListResult");
            }else{
                resc.setTarget("monthlyArchive");
            }

            return resc;

        }catch(NullPointerException e){
			throw new ParameterInvalidException("入力内容が足りません", e);
		}catch(IntegrationException e){
            throw new BusinessLogicException(e.getMessage(), e);
        }finally{
			MySqlConnectionManager.getInstance().commit();
            MySqlConnectionManager.getInstance().closeConnection();
		}
    }
}
