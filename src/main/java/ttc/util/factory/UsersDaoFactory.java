package ttc.util.factory;


import ttc.dao.AbstractDao;
import ttc.dao.UsersDao;

public class UsersDaoFactory extends AbstractDaoFactory{
    public AbstractDao getAbstractDao(){
        return new UsersDao();
    }
}
