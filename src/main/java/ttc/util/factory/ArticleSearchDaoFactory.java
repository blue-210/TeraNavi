package ttc.util.factory;

import ttc.dao.AbstractDao;
import ttc.dao.ArticleSearchDao;



public class ArticleSearchDaoFactory extends AbstractDaoFactory{
    public AbstractDao getAbstractDao(){
        return new ArticleSearchDao();
    }
}
