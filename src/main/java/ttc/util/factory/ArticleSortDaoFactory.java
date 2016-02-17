package ttc.util.factory;



import ttc.dao.AbstractDao;
import ttc.dao.ArticleSortDao;


public class ArticleSortDaoFactory extends AbstractDaoFactory{
    public AbstractDao getAbstractDao(){
        return new ArticleSortDao();
    }
}
