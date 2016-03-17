package ttc.command;

import ttc.context.RequestContext;
import ttc.context.ResponseContext;

import ttc.util.MySqlConnectionManager;

import ttc.exception.business.BusinessLogicException;
import ttc.exception.integration.IntegrationException;

import ttc.util.factory.AbstractDaoFactory;
import ttc.dao.AbstractDao;
import ttc.dao.UsersCommunitiesDao;

import java.util.Map;
import java.util.HashMap;
import java.util.List;
import ttc.exception.business.ParameterInvalidException;

public class DeleteCommunityCommand extends AbstractCommand{
    public ResponseContext execute(ResponseContext resc)throws BusinessLogicException{
        try{
            RequestContext reqc = getRequestContext();

            Map params = new HashMap();
            Map result = new HashMap();

            params.put("commId",reqc.getParameter("commId")[0]);
            params.put("deleteFlag", "true");

            MySqlConnectionManager.getInstance().beginTransaction();

            AbstractDaoFactory factory = AbstractDaoFactory.getFactory("community");
            AbstractDao dao = factory.getAbstractDao();
            // deleteFlagを削除にupdate
            dao.update(params);

            MySqlConnectionManager.getInstance().commit();

            // 削除した結果を取得する処理
            // 値を一度クリア
            params.clear();
            // whereで絞り込み条件を、valueにはバインド変数にセットする値を入れる
            // ユーザーが所属し、かつ退会していないコミュニティを取得する条件を設定
            params.put("where","where community_members_list.fk_user_id=?");
            System.out.println(reqc.getParameter("userId")[0]);
            params.put("value", reqc.getParameter("userId")[0]);

            List communities = dao.readAll(params);

            result.put("community", communities);
            MySqlConnectionManager.getInstance().closeConnection();

		    resc.setResult(result);

            return resc;
        }catch(NullPointerException e){
			throw new ParameterInvalidException("入力内容が足りません", e);
		}catch(IntegrationException e){
            throw new BusinessLogicException(e.getMessage(),e);
        }
    }
}
