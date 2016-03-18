package ttc.command;

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
import ttc.bean.ArticleBean;
import ttc.bean.BlogBean;
import ttc.bean.UserBean;
import ttc.exception.business.ParameterInvalidException;

public class ShowBlogCommand extends AbstractCommand{
    public ResponseContext execute(ResponseContext resc)throws BusinessLogicException{
        try{
            RequestContext reqc = getRequestContext();

            Map result = new HashMap();

            String userId = reqc.getParameter("bloguserId")[0];

            //編集だったらターゲットを変える
            boolean editFlag = false;
			try{
				//editパラメータがあるかのチェック
				String edit = reqc.getParameter("edit")[0];

				if(edit.length() > 0){
					editFlag=true;
                    userId = reqc.getParameter("userId")[0];//編集は自分のしかできないように
			    }
			}catch(NullPointerException e){}

            Map params = new HashMap();
            params.put("userId",userId);

            MySqlConnectionManager.getInstance().beginTransaction();

            //ブログ情報取得----------------------------------------------------
            AbstractDaoFactory factory = AbstractDaoFactory.getFactory("blog");
            AbstractDao dao = factory.getAbstractDao();
            BlogBean bb = (BlogBean)dao.read(params);
            result.put("blog", bb);
            //----------------------------------------------------------------
            //記事一覧取得----------------------------------------------------
            params.put("flag","0");
            factory = AbstractDaoFactory.getFactory("article");
            dao = factory.getAbstractDao();
            List results = dao.readAll(params);
            result.put("articleList", results);
            //----------------------------------------------------------------
            //月別アーカイブ用のリスト作成-----------------------------------------
            params.put("archive", "true");
            List archives = dao.readAll(params);
            result.put("archives", archives);
            //----------------------------------------------------------------
            factory = AbstractDaoFactory.getFactory("users");
            dao = factory.getAbstractDao();
            params.put("value",userId);
            params.put("where", " where user_id=? ");
            UserBean ub = (UserBean)dao.read(params);
            result.put("user", ub);

            
            resc.setResult(result);



            if(editFlag){
                resc.setTarget("blogSetting");
            }else{
                resc.setTarget("blogTop");
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
