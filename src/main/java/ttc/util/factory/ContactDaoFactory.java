package ttc.util.factory;

import ttc.dao.AbstractDao;
import ttc.dao.ContactDao;


public class ContactDaoFactory extends AbstractDaoFactory{
    public AbstractDao getAbstractDao(){
        return new ContactDao();
    }
}
