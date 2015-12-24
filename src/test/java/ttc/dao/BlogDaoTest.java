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
import org.dbunit.ext.mysql.MySqlConnection;
import org.dbunit.ext.mysql.MySqlMetadataHandler;
import org.dbunit.ext.mysql.MySqlDataTypeFactory;
import com.mysql.jdbc.jdbc2.optional.MysqlDataSource;
import ttc.dao.MySqlJndiDatabaseTester;


import ttc.dao.BlogDao;
import ttc.bean.BlogBean;

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

            // DBのセットアップ
            // データセットの取得
            Connection conn = null;
            IDatabaseConnection connection = null;
            // IDataSet dataset2 = new XlsDataSet(SampleDaoTest.class.getClassLoader().getResourceAsStream("users.xls"));

            // セットアップ
            // conn = MySqlConnectionManager.getInstance().getConnection();
            connection =  new MySqlJndiDatabaseTester("java:comp/env/jdbc/mysql").getConnection();

            IDataSet dataset1 = new XlsDataSet(BlogDaoTest.class.getClassLoader().getResourceAsStream("testdata.xls"));
            System.out.println(dataset1);
            // DatabaseOperation.REFRESH.execute(connection,dataset1);
            DatabaseOperation.CLEAN_INSERT.execute(connection,dataset1);
            // DatabaseOperation.CLEAN_INSERT.execute(connection,dataset2);
        }catch(Exception e){
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
    }

    @Test
    public void readでブログを一個取得する() throws Exception{
        // 初期化
        BlogDao bdao = new BlogDao();
        BlogBean blog = null;

        HashMap param = new HashMap();
        param.put("userId","2");
        // 実行
        blog = (BlogBean)bdao.read(param);

        // 検証
        assertThat(blog.getTitle(),is("くるっぽー"));
        assertThat(blog.getExplanation(),is("ハナコブログ"));
    }
}
