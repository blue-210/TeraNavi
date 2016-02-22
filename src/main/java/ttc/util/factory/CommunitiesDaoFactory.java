package ttc.util.factory;

import ttc.dao.AbstractDao;
import ttc.dao.CommunitiesDao;


public class CommunitiesDaoFactory extends AbstractDaoFactory{
    public AbstractDao getAbstractDao(){
        return new CommunitiesDao();
    }
}
