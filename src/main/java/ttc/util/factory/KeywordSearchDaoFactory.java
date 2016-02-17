package ttc.util.factory;

import ttc.dao.AbstractDao;
import ttc.dao.KeyWordSearchDao;

public class KeywordSearchDaoFactory extends AbstractDaoFactory{
    public AbstractDao getAbstractDao(){
        return new KeyWordSearchDao();
    }
}
