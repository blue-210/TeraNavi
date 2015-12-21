package ttc.dao;

import java.util.List;
import java.util.Map;

import ttc.exception.IntegrationException;

public interface AbstractDao{
    public List read(Map map)throws IntegrationException;
    public int write(Map map)throws IntegrationException;
}
