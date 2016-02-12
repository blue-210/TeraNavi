package ttc.exception.Integration;

import ttc.exception.Business.BusinessLogicException;

public class IntegrationException extends BusinessLogicException{
    public IntegrationException(String mess,Throwable t){
        super(mess,t);
    }
}
