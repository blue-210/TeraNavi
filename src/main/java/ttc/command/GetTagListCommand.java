package ttc.command;

import java.util.ArrayList;
import ttc.context.RequestContext;
import ttc.context.ResponseContext;

import ttc.util.MySqlConnectionManager;

import ttc.exception.business.BusinessLogicException;
import ttc.exception.integration.IntegrationException;

import java.util.Map;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import ttc.bean.TagBean;

import ttc.util.factory.AbstractDaoFactory;
import ttc.dao.AbstractDao;
import ttc.exception.business.ParameterInvalidException;

public class GetTagListCommand extends AbstractCommand{
    public ResponseContext execute(ResponseContext resc)throws BusinessLogicException{
        try{

            RequestContext reqc = getRequestContext();
			
			String articleId = null;
			boolean flag = false;
			//記事に付いているタグを取得するかどうかの判定フラグ
			
			List result2 = new ArrayList();
//			記事に付いているタグを取得する場合に結果として返す変数
			try{
				articleId = reqc.getParameter("articleId")[0];
				flag = true;
			}catch(NullPointerException e){
//				パラメータが送られていない時に発生するぬるぽのためのキャッチ処理
			}

            Map params = new HashMap();
            //すべてのタグ一覧をくださいというフラグ
            params.put("tagOnlyFlg", "true");

            MySqlConnectionManager.getInstance().beginTransaction();

            AbstractDaoFactory factory = AbstractDaoFactory.getFactory("tag");
            AbstractDao dao = factory.getAbstractDao();
            List tags = dao.readAll(params);
			
			if(flag){
				params.clear();
				params.put("articleId",articleId);
				List tagData = dao.readAll(params);
//				記事に付いているタグを取得
				
				Iterator itr = tags.iterator();
				while(itr.hasNext()){
					TagBean tag = (TagBean)itr.next();
					Map tagInfo = new HashMap();
					
					boolean checkFlag = false;
					//タグが既にチェックされているかのフラグ
					
					Iterator itr2 = tagData.iterator();
					while(itr2.hasNext()){
						TagBean tagTemp = (TagBean)itr2.next();
						if(tagTemp.getId().equals(tag.getId())){
							checkFlag = true;
						}
					}
					
					if(checkFlag){
//						タグが既に記事に付いているものだったらstatusパラメータを変える
						tagInfo.put("status","true");
					}else{
						tagInfo.put("status", "false");
						
					}
					tagInfo.put("tag", tag);
					result2.add(tagInfo);
				}
			}

            

			if(flag){
				resc.setResult(result2);
			}else{
				resc.setResult(tags);
				
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
