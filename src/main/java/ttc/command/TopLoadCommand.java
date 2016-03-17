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
 * @author Masaki
 */
public class TopLoadCommand extends AbstractCommand{
	public ResponseContext execute(ResponseContext resc)throws BusinessLogicException{
        try{
            RequestContext reqc = getRequestContext();

			Map result = new HashMap();

			MySqlConnectionManager.getInstance().beginTransaction();

			//TOPで表示する新着記事の取得
			AbstractDaoFactory factory = AbstractDaoFactory.getFactory("sort");
			AbstractDao dao = factory.getAbstractDao();
			Map param1 = new HashMap();
			param1.put("sortType","0");
			List articles = dao.readAll(param1);
			Iterator itr = articles.iterator();

			while(itr.hasNext()){
				//取得したarticleに対してコメントとタグをセットする

				ArticleBean ab = (ArticleBean)itr.next();
				param1.clear();


				param1.put("articleId", ab.getArticleId());
				factory = AbstractDaoFactory.getFactory("tag");
				dao = factory.getAbstractDao();

				ab.setTags(dao.readAll(param1));

				factory = AbstractDaoFactory.getFactory("comment");
				dao = factory.getAbstractDao();
				ab.setComments(dao.readAll(param1));
			}

			if(articles.size() <= 6){
				result.put("article", articles);
			}else{
				List nArticles = new ArrayList();
				for(int i = 0;i < 6;i++){
					nArticles.add(articles.get(i));
				}
				result.put("article",nArticles);
			}

			//ブログタブで表示する学科ごとの新着記事の取得

			param1.clear();

			resc.setResult(result);
            resc.setTarget("top");

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
