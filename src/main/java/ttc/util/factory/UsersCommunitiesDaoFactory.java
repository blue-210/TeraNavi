package ttc.util.factory;


import ttc.dao.AbstractDao;
import ttc.dao.UsersCommunitiesDao;


public class UsersCommunitiesDaoFactory extends AbstractDaoFactory{
    public AbstractDao getAbstractDao(){
        return new UsersCommunitiesDao();
    }
}
