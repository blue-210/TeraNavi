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
import java.util.Iterator;
import java.util.List;

import ttc.util.factory.AbstractDaoFactory;
import ttc.dao.AbstractDao;

import ttc.bean.ArticleBean;
import ttc.bean.TagBean;
import ttc.exception.business.ParameterInvalidException;

public class EditArticleCommand extends AbstractCommand{
    public ResponseContext execute(ResponseContext resc)throws BusinessLogicException{
        try{
            RequestContext reqc = getRequestContext();

            String articleId = reqc.getParameter("articleId")[0];

            String title = reqc.getParameter("title")[0];
            //タグエスケープ
            title = title.replaceAll("<script", "&lt;script");
            title = title.replaceAll("</script>", "&lt;/script&gt;");
            title = title.replaceAll("<form", "&lt;form");
            title = title.replaceAll("</form>", "&lt;/form&gt;");
            title = title.replaceAll("<input", "&lt;/input");
            title = title.replaceAll("</input>", "&lt;/input&gt;");

            String body = reqc.getParameter("body")[0];
            //タグエスケープ
            body = body.replaceAll("<script", "&lt;script");
            body = body.replaceAll("</script>", "&lt;/script&gt;");
            body = body.replaceAll("<form", "&lt;form");
            body = body.replaceAll("</form>", "&lt;/form&gt;");
            body = body.replaceAll("<input", "&lt;/input");
            body = body.replaceAll("</input>", "&lt;/input&gt;");

            String status = reqc.getParameter("status")[0];

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

            Calendar cal = Calendar.getInstance();
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy/MM/dd HH:mm");
            String date = formatter.format(cal.getTime());


            Map params = new HashMap();
            params.put("articleId", articleId);
            params.put("title", title);
            params.put("body", body);
            params.put("status", status);
            params.put("date", date);

            MySqlConnectionManager.getInstance().beginTransaction();

            AbstractDaoFactory factory = AbstractDaoFactory.getFactory("article");
            AbstractDao dao = factory.getAbstractDao();
            ArticleBean ab = (ArticleBean)dao.read(params);

			params.put("articlebean",ab);
            dao.update(params);


            if(tagFlag){
                params.clear();

				factory = AbstractDaoFactory.getFactory("tag");
				dao = factory.getAbstractDao();

				params.put("articleId", ab.getArticleId());
				dao.update(params);
				
				//既に記事に付いているタグを保持しておくList
				
				
				params.clear();
				
				for(int i = 0;i < tags.length;i++){
					
					
					params.put("articleId", ab.getArticleId());
					params.put("tag", tags[i]);
					dao.insert(params);
					params.clear();
					
					
				}

			}

            MySqlConnectionManager.getInstance().commit();
            

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
