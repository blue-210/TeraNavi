package ttc.util.factory;



import ttc.dao.AbstractDao;
import ttc.dao.DirectMessageDao;



public class DirectMessageDaoFactory extends AbstractDaoFactory{
    public AbstractDao getAbstractDao(){
        return new DirectMessageDao();
    }
}
