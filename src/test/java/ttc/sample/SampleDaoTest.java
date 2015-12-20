package ttc.sample;
// 必要なJUnitのクラスをimport
import static org.junit.Assert.*;
import org.junit.Test;
import static org.hamcrest.CoreMatchers.*;

public class SampleDaoTest {
    // DBに接続し、初期化としてTableをいったんキレイにして期待されるデータをセットする
    @Rule
    public DbUnitTester tester = new DbUnitTester(
    "com.mysql.jdbc.Driver",
    "jdbc:mysql://localhost/tera_db",
    "TERA_NAVI",
    "tera"){

        @Override
        protected void before() throws Exception{

        }

        @Override
        protected org.dbunit.dataset.IDataSet createDataSet() throws Exception{
            return new XlsDatasetBuilder()
            .build(getClass().getResourceAsStream("testdata.xls"));
        }
    };

    @Before
    public void setUp(){
        SampleUsersBean bean = new SampleUsersBean();
        bean.setId("12345678");
        bean.setName("ぶるー");
    }

    @Test
    public void writeでユーザを登録できる(){
        // 初期化
        SampleUserDao sut = new SampleUserDao();
        sut.write(bean);
    }

    @Test
    public void readでユーザを1人取得できる(){

    }

    @Test
    public void readでユーザーリストを取得できる(){

    }
}
