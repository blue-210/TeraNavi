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

import java.util.List;
import java.util.ArrayList;

public class ArticlePostCommand extends AbstractCommand{
    public ResponseContext execute(ResponseContext resc)throws BusinessLogicException{
        try{
            RequestContext reqc = getRequestContext();

            String userId = reqc.getParameter("userId")[0];

            String title = reqc.getParameter("title")[0];
            //タグエスケープ
            title = title.replaceAll("<script", "&lt;script");
            title = title.replaceAll("</script>", "&lt;/script&gt;");
            title = title.replaceAll("<form", "&lt;form");
            title = title.replaceAll("</form>", "&lt;/form&gt;");
            title = title.replaceAll("<input", "&lt;/input");
            title = title.replaceAll("</input>", "&lt;/input&gt;");
            title = title.replaceAll("<style", "&lt;/style");
            title = title.replaceAll("</style>", "&lt;/style&gt;");
            title = title.replaceAll("&nbsp;", " ");//スペース

            String body = reqc.getParameter("body")[0];
            //タグエスケープ
            body = body.replaceAll("<script", "&lt;script");
            body = body.replaceAll("</script>", "&lt;/script&gt;");
            body = body.replaceAll("<form", "&lt;form");
            body = body.replaceAll("</form>", "&lt;/form&gt;");
            body = body.replaceAll("<input", "&lt;/input");
            body = body.replaceAll("</input>", "&lt;/input&gt;");
            body = body.replaceAll("<style", "&lt;/style");
            body = body.replaceAll("</style>", "&lt;/style&gt;");
            body = body.replaceAll("&nbsp;", " ");//スペース

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



            String status = "0";

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
//				記事に対してのタグ情報をinsert
                //さっきインサートした記事情報を取得したいとき
				params.put("lastInsert","true");
				ArticleBean article = (ArticleBean)dao.read(params);

                params.clear();

				factory = AbstractDaoFactory.getFactory("tag");
				dao = factory.getAbstractDao();

				List tagData = new ArrayList();
				//insertしたタグを保持しておく

				for(int i = 0;i < tags.length;i++){

					if(tagData.indexOf(tags[i])<0){
						params.put("articleId", article.getArticleId());
						params.put("tag", tags[i]);
						dao.insert(params);
						params.clear();
						tagData.add(tags[i]);
					}

				}

			}

			

			resc.setResult(params);

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
