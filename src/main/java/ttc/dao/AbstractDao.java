package ttc.dao;

import ttc.bean.Bean;
import java.util.List;

public interface AbstractDao{
    public List read(Bean bean);
    public int write(Bean bean);
}
