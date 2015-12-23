package ttc.sample;
// 必要なJUnitのクラスをimport
import static org.junit.Assert.*;
import org.junit.Test;
import org.junit.*;
import org.dbunit.database.*;
import org.dbunit.JndiDatabaseTester;
import org.dbunit.dataset.*;
import org.dbunit.dataset.excel.*;
import org.dbunit.operation.*;
import static org.hamcrest.CoreMatchers.*;
import java.util.List;
import java.util.ArrayList;
import java.sql.Connection;
import java.sql.SQLException;
import javax.naming.Context;
import javax.naming.InitialContext;
import org.dbunit.database.IDatabaseConnection;
import org.dbunit.ext.mysql.MySqlMetadataHandler;
import org.dbunit.ext.mysql.MySqlDataTypeFactory;
import ttc.dao.MySqlJndiDatabaseTester;

import com.mysql.jdbc.jdbc2.optional.MysqlDataSource;

public class SampleDaoTest {
    // DBに接続し、初期化としてTableをいったんキレイにして期待されるデータをセットする
    @Before
    public void setUp(){
        try{
            System.setProperty(Context.INITIAL_CONTEXT_FACTORY, "org.apache.naming.java.javaURLContextFactory");
            System.setProperty(Context.URL_PKG_PREFIXES, "org.apache.naming");
            InitialContext ic = new InitialContext();
            // ic.createSubcontext("java:");
            // ic.createSubcontext("java:comp");
            // ic.createSubcontext("java:comp/env");
            // ic.createSubcontext("java:comp/env/jdbc");
            MysqlDataSource ds = new MysqlDataSource();
            ds.setUser("TERA_NAVI");
            ds.setPassword("tera");
            ds.setURL("jdbc:mysql://localhost:3306/tera_db");
            // ic.bind("java:comp/env/jdbc/mysql", ds);

            // SampleUsersBean bean = new SampleUsersBean();
            // bean.setId("12345678");
            // bean.setName("ぶるー");
            // DBのセットアップ
            // データセットの取得
            Connection conn = null;
            IDatabaseConnection connection = null;
            IDataSet dataset = new XlsDataSet(SampleDaoTest.class.getClassLoader().getResourceAsStream("sampletestdata.xls"));
            // セットアップ
            // conn = MySqlConnectionManager.getInstance().getConnection();
            connection =  new MySqlJndiDatabaseTester("java:comp/env/jdbc/mysql").getConnection();
            connection.getConfig().setProperty(DatabaseConfig.PROPERTY_DATATYPE_FACTORY,new MySqlDataTypeFactory());
            connection.getConfig().setProperty(DatabaseConfig.PROPERTY_METADATA_HANDLER, new MySqlMetadataHandler());

            DatabaseOperation.CLEAN_INSERT.execute(connection,dataset);
        }catch(Exception e){
            e.printStackTrace();
        }
    }

    @Test
    public void readでユーザを1人取得できる() throws Exception{
        // 初期化
        SampleDao sut = new SampleDao();
        SampleUsersBean bean = new SampleUsersBean();

        // 実行
        List<SampleUsersBean> actual = sut.read(bean);

        // 検証
        assertThat(actual.get(0).getId(),is("12345678"));
        // assertThat(actual.get(0).getName(),is("青木隼人"));
    }
}
