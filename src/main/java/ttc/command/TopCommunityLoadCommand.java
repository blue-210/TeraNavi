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

import ttc.util.factory.AbstractDaoFactory;
import ttc.dao.AbstractDao;
import ttc.exception.business.ParameterInvalidException;
/**
 *
 * @author Masaki
 */
public class TopCommunityLoadCommand extends AbstractCommand{
	public ResponseContext execute(ResponseContext resc)throws BusinessLogicException{
        try{
            RequestContext reqc = getRequestContext();

			Map result = new HashMap();

			MySqlConnectionManager.getInstance().beginTransaction();

			// コミュニティの取得
			AbstractDaoFactory factory = AbstractDaoFactory.getFactory("community");
			AbstractDao dao = factory.getAbstractDao();

			Map param2 = new HashMap();
			// 新規コミュニティの取得処理
			param2.put("where","Where community_delete_flag = 0");
			param2.put("sort", " order by communities.community_created_date desc ");
			List communities = dao.readAll(param2);

			if(communities.size() <= 5){
				result.put("hotCommunity",communities);
			}else{
				List nCommunities = new ArrayList();
				for(int i = 0;i < 5;i++){
					nCommunities.add(communities.get(i));
				}

				result.put("hotCommunity",nCommunities);
			}

			//人気コミュニティの取得処理
			param2.clear();
			param2.put("where","where community_delete_flag = 0");
			param2.put("sort", " order by membercount limit 5 offset 0");
			List popularCommunity = dao.readAll(param2);
			result.put("popularCommunity", popularCommunity);




			resc.setResult(result);
            resc.setTarget("topcommunity");

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
