package ttc.sample;

import ttc.util.MySqlConnectionManager;
import ttc.sample.SampleUsersBean;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Connection;
import java.util.List;
import java.util.ArrayList;

public class SampleDao{
    public List<SampleUsersBean> read(SampleUsersBean bean){
        List<SampleUsersBean> users = new ArrayList<>();
        try{
            String sql = "SELECT * FROM sampleusers";

            PreparedStatement pst = MySqlConnectionManager.getInstance().getConnection().prepareStatement(sql);

            ResultSet rs = pst.executeQuery();
            while(rs.next()){
                bean.setId(rs.getString(1));
                bean.setName(rs.getString(2));
                users.add(bean);
            }
            MySqlConnectionManager.getInstance().closeConnection();
        }catch(SQLException e){
            e.printStackTrace();
        }
        return users;
    }
}
