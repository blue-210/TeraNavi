
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
/**
 *
 * @author Masaki
 */
public class MypageLoadCommand extends AbstractCommand{
	public ResponseContext execute(ResponseContext resc)throws BusinessLogicException{
        try{
            RequestContext reqc = getRequestContext();

            String userId = reqc.getParameter("userId")[0];

            Map result = new HashMap();

			MySqlConnectionManager.getInstance().beginTransaction();

			//TOPで表示する新着記事の取得
			AbstractDaoFactory factory = AbstractDaoFactory.getFactory("article");
			AbstractDao dao = factory.getAbstractDao();
			Map param = new HashMap();
			param.put("userId", userId);
			param.put("flag", "0");
			List articles = dao.readAll(param);

			if(articles.size() <= 3){
				result.put("article", articles);
			}else{
				List nArticles = new ArrayList();
				for(int i = 0;i < 3;i++){
					nArticles.add(articles.get(i));
				}
				result.put("article",nArticles);
			}

			resc.setResult(result);
            resc.setTarget("mypage");

            return resc;

        }catch(NullPointerException e){
			throw new ParameterInvalidException("入力内容が足りません", e);
		}catch(IntegrationException e){
            throw new BusinessLogicException(e.getMessage(), e);
        }
    }

}
