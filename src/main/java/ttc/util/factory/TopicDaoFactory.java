package ttc.util.factory;

import java.util.Properties;
import java.io.IOException;

import ttc.dao.AbstractDao;
import ttc.dao.TopicDao;

import ttc.exception.Integration.IntegrationException;

public class TopicDaoFactory extends AbstractDaoFactory{
    public AbstractDao getAbstractDao(){
        return new TopicDao();
    }
}
