package ttc.util.factory;


import ttc.dao.AbstractDao;
import ttc.dao.ArticleDao;



public class ArticleDaoFactory extends AbstractDaoFactory{
    public AbstractDao getAbstractDao(){
        return new ArticleDao();
    }
}
