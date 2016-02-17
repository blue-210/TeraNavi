package ttc.util.factory;



import ttc.dao.AbstractDao;
import ttc.dao.BlogDao;


public class BlogDaoFactory extends AbstractDaoFactory{
    public AbstractDao getAbstractDao(){
        return new BlogDao();
    }
}
