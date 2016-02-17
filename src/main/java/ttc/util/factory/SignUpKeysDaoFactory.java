package ttc.util.factory;

import ttc.dao.AbstractDao;
import ttc.dao.SignUpKeysDao;


public class SignUpKeysDaoFactory extends AbstractDaoFactory{
    public AbstractDao getAbstractDao(){
        return new SignUpKeysDao();
    }
}
