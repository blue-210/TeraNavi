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

public class WithDrawCommunityCommand extends AbstractCommand{
    public ResponseContext execute(ResponseContext resc)throws BusinessLogicException{
        try{
            RequestContext reqc = getRequestContext();

            Map params = new HashMap();
            Map result = new HashMap();

            // targetはなぜかcommunity_withdrawal_flag=1というSQLのパラメータの一部が入っている。
            // 本当は列名を外部に晒すのはイクナイ
			// String target = reqc.getParameter("target")[0];
            // userIdで、ログイン時にsessionからWebRequestContextのparameterに入れられたログインユーザのIDを取得できる
			String userId = reqc.getParameter("userId")[0];

            params.put("userId",userId);
            params.put("commId",reqc.getParameter("commId")[0]);
			// params.put("target",target);

            MySqlConnectionManager.getInstance().beginTransaction();

            // UsersCommunitiesDaoを取得
            AbstractDaoFactory factory = AbstractDaoFactory.getFactory("communitymember");
            // 退会時に使うdeleteメソッドはAbstractDaoにはないので、UsersCommunitiesDaoを直接指定
            UsersCommunitiesDao udao = (UsersCommunitiesDao)factory.getAbstractDao();
            udao.delete(params);

            MySqlConnectionManager.getInstance().commit();

            // communities表を取得
			factory = AbstractDaoFactory.getFactory("community");
			AbstractDao dao = factory.getAbstractDao();

            // 値を一度クリア
			params.clear();
            // whereで絞り込み条件を、valueにはバインド変数にセットする値を入れる
            // ユーザーが所属し、かつ退会していないコミュニティを取得する条件を設定
			params.put("where","where community_members_list.fk_user_id=?");
			params.put("value", userId);
			List communities = dao.readAll(params);

			result.put("community", communities);

            MySqlConnectionManager.getInstance().closeConnection();

            // result.put("commName",reqc.getParameter("commName")[0]);
            // communities表から取得した最新の参加コミュニティがWebApplicationControllerのhandleResponse内でsessionに反映される
            resc.setResult(result);
            // resc.setTarget("communityWithDrawResult");

            return resc;
        }catch(NullPointerException e){
			throw new ParameterInvalidException("入力内容が足りません", e);
		}catch(IntegrationException e){
            throw new BusinessLogicException(e.getMessage(),e);
        }
    }
}
