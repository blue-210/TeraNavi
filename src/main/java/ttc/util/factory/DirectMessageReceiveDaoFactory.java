package ttc.util.factory;

import java.util.Properties;
import java.io.IOException;

import ttc.dao.AbstractDao;
import ttc.dao.DirectMessageReceiveDao;

import ttc.exception.IntegrationException;

public class DirectMessageReceiveDaoFactory extends AbstractDaoFactory{
    public AbstractDao getAbstractDao(){
        return new DirectMessageReceiveDao();
    }
}
