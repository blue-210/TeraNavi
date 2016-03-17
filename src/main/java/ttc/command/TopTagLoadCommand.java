/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ttc.command;



import ttc.context.RequestContext;
import ttc.context.ResponseContext;

import ttc.util.MySqlConnectionManager;

import ttc.exception.business.BusinessLogicException;
import ttc.exception.integration.IntegrationException;

import java.util.Map;
import java.util.HashMap;
import java.util.List;
import java.util.ArrayList;
import java.util.Iterator;

import ttc.bean.Bean;
import ttc.bean.ArticleBean;
import ttc.bean.UserBean;
import ttc.bean.TagBean;

import ttc.util.factory.AbstractDaoFactory;
import ttc.dao.AbstractDao;
import ttc.exception.business.ParameterInvalidException;
/**
 *
 * @author Ishida
 */
public class TopTagLoadCommand extends AbstractCommand{
	public ResponseContext execute(ResponseContext resc)throws BusinessLogicException{
        try{
            RequestContext reqc = getRequestContext();

			Map result = new HashMap();

			MySqlConnectionManager.getInstance().beginTransaction();

			Map param1 = new HashMap();

			//人気タグ取得
			AbstractDaoFactory factory = AbstractDaoFactory.getFactory("tag");
			AbstractDao dao = factory.getAbstractDao();

			param1.put("topFlg","true");
			//登録された記事の多い順にTagBeanを3件まで取得（なければ3件未満の可能性も）
			List tags = dao.readAll(param1);


			param1.clear();

			param1.put("whereTagIdFlg", "true");

			List tagArticleIdList = new ArrayList();
			for(int i=0; i<tags.size(); i++){
				TagBean tb = (TagBean)tags.get(i);
				param1.put("tagId",tb.getId() );
				//多い順でとったタグからそのタグに登録されている記事ID一覧を取得
				List list = dao.readAll(param1);

				tagArticleIdList.add(list);
			}

			param1.clear();

			factory = AbstractDaoFactory.getFactory("article");
			dao = factory.getAbstractDao();

			List tagArticles = new ArrayList();

			int tagDeleteCount = 0;
			for(int i=0; i<tagArticleIdList.size(); i++){
				List list = (List)tagArticleIdList.get(i);
				List oneTagArticles = new ArrayList();
				for(int j=0; j<list.size(); j++){
					String articleId = (String)list.get(j);
					param1.put("articleId", articleId);
					param1.put("flag", "0");
					Bean article = dao.read(param1);
					if(article!=null){
						oneTagArticles.add(article);
					}
					param1.clear();
				}
				if(oneTagArticles.isEmpty()){
					tags.remove(tagDeleteCount);
					System.out.println("tags.size="+tags.size());
				}else{
					tagDeleteCount++;
					tagArticles.add(oneTagArticles);
				}
			}

			result.put("tags",tags);
			result.put("tagArticles",tagArticles);

			//MySqlConnectionManager.getInstance().commit();

			resc.setResult(result);
            resc.setTarget("toptag");

            return resc;

        }catch(NullPointerException e){
			throw new ParameterInvalidException("入力内容が足りません", e);
		}catch(IntegrationException e){
            throw new BusinessLogicException(e.getMessage(), e);
        }finally{
			//MySqlConnectionManager.getInstance().commit();
            MySqlConnectionManager.getInstance().closeConnection();
		}
    }

}
