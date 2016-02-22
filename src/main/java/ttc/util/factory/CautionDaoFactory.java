package ttc.util.factory;


import ttc.dao.AbstractDao;
import ttc.dao.CautionDao;


public class CautionDaoFactory extends AbstractDaoFactory{
    public AbstractDao getAbstractDao(){
        return new CautionDao();
    }
}
   

