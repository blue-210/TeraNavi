package ttc.util.factory;

import ttc.dao.AbstractDao;
import ttc.dao.TopicDao;

public class TopicDaoFactory extends AbstractDaoFactory{
    public AbstractDao getAbstractDao(){
        return new TopicDao();
    }
}
