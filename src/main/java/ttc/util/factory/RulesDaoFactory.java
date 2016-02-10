package ttc.util.factory;

import ttc.dao.AbstractDao;
import ttc.dao.RulesDao;

public class RulesDaoFactory extends AbstractDaoFactory{
    public AbstractDao getAbstractDao(){
        return new RulesDao();
    }
}
