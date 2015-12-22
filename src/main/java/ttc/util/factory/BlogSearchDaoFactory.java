package ttc.util.factory;

import java.util.Properties;
import java.io.IOException;

import ttc.dao.AbstractDao;
import ttc.dao.BlogSearchDao;

import ttc.exception.IntegrationException;

public class BlogSearchDaoFactory extends AbstractDaoFactory{
    public AbstractDao getAbstractDao(){
        return new BlogSearchDao();
    }
}
