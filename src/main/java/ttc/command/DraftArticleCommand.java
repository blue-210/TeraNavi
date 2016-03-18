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
import ttc.bean.BlogBean;
import ttc.bean.ArticleBean;
import ttc.exception.business.ParameterInvalidException;

public class DraftArticleCommand extends AbstractCommand{
    public ResponseContext execute(ResponseContext resc)throws BusinessLogicException{
        try{
            RequestContext reqc = getRequestContext();

            String userId = reqc.getParameter("userId")[0];

            String title = reqc.getParameter("title")[0];

            String body = reqc.getParameter("body")[0];

			String[] tags = null;
			//タグはチェックボックス等で複数来る事を想定してます

			boolean tagFlag = false;
			try{
				//tagパラメータがあるかのチェック、jsp変更前の例外防止
				tags =reqc.getParameter("tag[]");

				if(tags.length > 0){
					tagFlag=true;
				}
			}catch(NullPointerException e){

			}

			

            String status = "1";

			Map params = new HashMap();
            params.put("userId",userId);
            params.put("title",title);
            params.put("body",body);
            params.put("status",status);


			// ブログが解説しているかどうかのチェック
			MySqlConnectionManager.getInstance().beginTransaction();

			AbstractDaoFactory factory = AbstractDaoFactory.getFactory("blog");
			AbstractDao dao = factory.getAbstractDao();
			BlogBean blog = (BlogBean)dao.read(params);

			if(blog.getStatus().equals("0")){
				throw new BusinessLogicException("ブログが開設されていません",null);
			}


            factory = AbstractDaoFactory.getFactory("article");
            dao = factory.getAbstractDao();
            dao.insert(params);

            params.clear();

			if(tagFlag){
                //さっきインサートした記事情報を取得したいとき
				params.put("lastInsert","true");
				ArticleBean article = (ArticleBean)dao.read(params);

                params.clear();

				factory = AbstractDaoFactory.getFactory("tag");
				dao = factory.getAbstractDao();

				for(int i = 0;i < tags.length;i++){
					params.put("articleId", article.getArticleId());
					params.put("tag", tags[i]);
					dao.insert(params);
					params.clear();
				}

			}

			MySqlConnectionManager.getInstance().commit();
			
			
			resc.setResult(params);

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
