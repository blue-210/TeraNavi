package ttc.util.factory;


import ttc.dao.AbstractDao;
import ttc.dao.PolicyDao;

public class PolicyDaoFactory extends AbstractDaoFactory{
    public AbstractDao getAbstractDao(){
        return new PolicyDao();
    }
}
