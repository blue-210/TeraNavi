package ttc.dao;

import ttc.bean.Bean;
import java.util.List;
import java.util.Map;

public interface AbstractDao{
    public List read(Map map);
    public int write(Map map);
}
