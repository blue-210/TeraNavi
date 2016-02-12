package ttc.exception.Business;

import ttc.exception.PresentationException;

public class BusinessLogicException extends PresentationException{
    public BusinessLogicException(String mess,Throwable t){
        super(mess,t);
    }
}
