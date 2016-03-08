package ttc.util.factory;



import ttc.dao.AbstractDao;
import ttc.dao.CommentsDao;


public class CommentsDaoFactory extends AbstractDaoFactory{
    public AbstractDao getAbstractDao(){
        return new CommentsDao();
    }
}
