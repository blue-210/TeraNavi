package ttc.dao;
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
import com.mysql.jdbc.jdbc2.optional.MysqlDataSource;

import ttc.dao.BlogDao;

import java.util.HashMap;

public class BlogDaoTest {
    // DBに接続し、初期化としてTableをいったんキレイにして期待されるデータをセットする
    @Before
    public void setUp(){
        try{
            System.setProperty(Context.INITIAL_CONTEXT_FACTORY, "org.apache.naming.java.javaURLContextFactory");
            System.setProperty(Context.URL_PKG_PREFIXES, "org.apache.naming");
            InitialContext ic = new InitialContext();
            ic.createSubcontext("java:");
            ic.createSubcontext("java:comp");
            ic.createSubcontext("java:comp/env");
            ic.createSubcontext("java:comp/env/jdbc");
            MysqlDataSource ds = new MysqlDataSource();
            ds.setUser("TERA_NAVI");
            ds.setPassword("tera");
            ds.setURL("jdbc:mysql://localhost:3306/tera_db");
            ic.bind("java:comp/env/jdbc/mysql", ds);

            SampleUsersBean bean = new SampleUsersBean();
            // bean.setId("12345678");
            // bean.setName("ぶるー");
            // DBのセットアップ
            // データセットの取得
            Connection conn = null;
            IDatabaseConnection connection = null;
            IDataSet dataset1 = new XlsDataSet(SampleDaoTest.class.getClassLoader().getResourceAsStream("Secret_questions.xls"));
            IDataSet dataset2 = new XlsDataSet(SampleDaoTest.class.getClassLoader().getResourceAsStream("users.xls"));

            // セットアップ
            // conn = MySqlConnectionManager.getInstance().getConnection();
            connection =  new JndiDatabaseTester("java:comp/env/jdbc/mysql").getConnection();

            DatabaseOperation.CLEAN_INSERT.execute(connection,dataset1);
            DatabaseOperation.CLEAN_INSERT.execute(connection,dataset2);
        }catch(Exception e){
            e.printStackTrace();
        }
    }

    @Test
    public void readでユーザを1人取得できる() throws Exception{
        // 初期化
        BlogDao bdao = new BlogDao();
        BlogBean blog = null;

        HashMap param = new HashMap();
        param.put("userId","2");
        // 実行
        blog = bdao.read(param);

        // 検証
        assertThat(blog.getTitle(),is("くるっぽー"));
        assertThat(blog.getExplanation(),is("ハナコブログ"));
    }
}
