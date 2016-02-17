package ttc.util.factory;


import ttc.dao.AbstractDao;
import ttc.dao.UserSearchDao;

public class UserSearchDaoFactory extends AbstractDaoFactory{
    public AbstractDao getAbstractDao(){
        return new UserSearchDao();
    }
}
