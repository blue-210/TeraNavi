package ttc.command;

import java.text.ParseException;
import java.util.Calendar;
import ttc.context.RequestContext;
import ttc.context.ResponseContext;

import ttc.util.MySqlConnectionManager;

import ttc.exception.integration.IntegrationException;
import ttc.exception.business.BusinessLogicException;
import ttc.exception.business.PasswordInvalidException;

import java.util.Map;
import java.util.HashMap;
import java.util.List;

import ttc.util.factory.AbstractDaoFactory;
import ttc.dao.AbstractDao;
import ttc.bean.UserBean;

import ttc.exception.business.ParameterInvalidException;
import ttc.util.PasswordSaffer;

import java.util.Calendar;
import java.text.SimpleDateFormat;
import ttc.exception.business.AccountLockException;

public class LoginCommand extends AbstractCommand{


    public ResponseContext execute(ResponseContext resc)throws BusinessLogicException{
        try{
            RequestContext reqc = getRequestContext();

            String loginId=reqc.getParameter("loginId")[0];
            String password=reqc.getParameter("password")[0];

			password = PasswordSaffer.getStretchedPassword(password, loginId);
			
            Map params = new HashMap();
            params.put("value",loginId);
            params.put("where","where login_id=?");

            MySqlConnectionManager.getInstance().beginTransaction();
            AbstractDaoFactory factory = AbstractDaoFactory.getFactory("users");
            AbstractDao dao = factory.getAbstractDao();
            UserBean ub = (UserBean)dao.read(params);
			
//			ユーザがロックされているかどうかの判定
			String lockStatus = ub.getUserStatus();
			if(lockStatus.equals("1")){
//				ロックされていた場合
				String endDate = ub.getLockEndDate();
				
				Calendar cal1 = Calendar.getInstance();	//現在時刻を保持
				Calendar cal2 = Calendar.getInstance();
				
				SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				try {
					java.util.Date date = formatter.parse(endDate);
					cal2.setTime(date);
				} catch (ParseException ex) {
					throw new BusinessLogicException(ex.getMessage(), ex);
					
				}catch(Exception ex){
					throw new BusinessLogicException(ex.getMessage(), ex);
				}
				
				int endFlag = cal1.compareTo(cal2);
//				日付の比較処理 ロック終了日が現在時刻より前なら整数値が返る

				
				if(endFlag >= 0){
//					ロック終了日が現在の日付より前だったらロックフラグを解除する

					Map params2 = new HashMap();
					params2.put("userbean", ub);
					params2.put("userStatus", "0");
					params2.put("userId", ub.getId());
					
					dao.update(params2);
					
				}else{
					throw new AccountLockException("このアカウントはロックされています 終了日:"+ub.getLockEndDate(), null);
				}
				
				
			}else if(lockStatus.equals("2")){
				throw new AccountLockException("このアカウントは凍結されています", null);
			}
			
			

            if(password.equals(ub.getPassword())){
//				パスワードの比較処理
                ub.setPassword("dummy");
                ub.setSecretAnswer("dummy");
				
                // communities表から所属しているコミュニティを取得する
				factory = AbstractDaoFactory.getFactory("community");
				dao = factory.getAbstractDao();

				params.clear();
				params.put("where","where community_members_list.fk_user_id=?");
				params.put("value", ub.getId());
				List communities = dao.readAll(params);

				Map result = new HashMap();
				result.put("user", ub);
				result.put("community", communities);

                resc.setResult(result);
                resc.setTarget("LoginResult");

            }else{
                throw new PasswordInvalidException("パスワードが違います",null);
            }

            MySqlConnectionManager.getInstance().commit();
            MySqlConnectionManager.getInstance().closeConnection();



            return resc;


        }catch(NullPointerException e){
			throw new ParameterInvalidException("入力内容が足りません", e);
		}catch(IntegrationException e){
            throw new BusinessLogicException(e.getMessage(),e);
        }
    }
}
