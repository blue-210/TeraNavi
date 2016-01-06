package ttc.util.factory;

import java.util.Properties;
import java.io.IOException;

import ttc.dao.AbstractDao;
import ttc.dao.DirectMessageSendDao;

import ttc.exception.IntegrationException;

public class DirectMessageSendDaoFactory extends AbstractDaoFactory{
    public AbstractDao getAbstractDao(){
        return new DirectMessageSendDao();
    }
}
