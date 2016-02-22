package ttc.util.factory;


import ttc.dao.AbstractDao;
import ttc.dao.ChatDao;


public class ChatDaoFactory extends AbstractDaoFactory{
    public AbstractDao getAbstractDao(){
        return new ChatDao();
    }
}
