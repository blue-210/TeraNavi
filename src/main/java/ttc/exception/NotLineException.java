package ttc.exception;

import ttc.exception.Integration.IntegrationException;

public class NotLineException extends IntegrationException{
    public NotLineException(String mess,Throwable t){
        super(mess,t);
    }
}
