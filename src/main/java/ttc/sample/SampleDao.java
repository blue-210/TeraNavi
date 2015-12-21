package ttc.sample;

import ttc.util.MySqlConnectionManager;
import ttc.sample.SampleUsersBean;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;
import java.util.ArrayList;

public class SampleDao{
    public List<SampleUsersBean> read(SampleUsersBean bean){
        MySqlConnectionManager.getInstance().beginTransaction();

        String sql = "SELECT * FROM sampleusers";

        PreparedStatement pst = MySqlConnectionManager.getInstance().getConnection().prepareStatement(sql);

        ResultSet rs = pst.executeQuery();
        List<SampleUsersBean> users = new ArrayList<>();
        while(rs.next()){
            bean.setId(rs.getString(1));
            bean.setName(rs.getString(2));
            users.add(bean);
        }
        MySqlConnectionManager.getInstance().closeConnection();
        return users;
    }
}
