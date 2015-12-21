package ttc.dao;

import java.util.List;
import java.util.Map;

import ttc.exception.IntegrationException;

public interface AbstractDao{
    public List read(Map map)throws IntegrationException;
    public int update(Map map)throws IntegrationException;
    public int insert(Map map)throws IntegrationException;
}
