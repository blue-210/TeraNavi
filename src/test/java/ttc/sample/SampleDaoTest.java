package ttc.sample;
// 必要なJUnitのクラスをimport
import static org.junit.Assert.*;
import org.junit.Test;
import static org.hamcrest.CoreMatchers.*;
import org.dbunit.database.*;
import ttc.util.MySqlConnectionManager;


public class SampleDaoTest {
    // DBに接続し、初期化としてTableをいったんキレイにして期待されるデータをセットする
    @Before
    public void setUp(){
        SampleUsersBean bean = new SampleUsersBean();
        bean.setId("12345678");
        bean.setName("ぶるー");

        // DBのセットアップ
        // データセットの取得
        Connection conn = null;
        IDatabaseConnection connection = null;

        try{
            IDataSet dataset = new XlsDataSetBuilder().build(this.getClass().getResourceAsStream("testdata.xlsx"));
            // セットアップ
            conn = MySqlConnectionManager.getInstance().getConnection();
            connection =  new DatabaseConnection(conn);

            DatabaseOperation.CLEAN_INSERT.execute(connection,dataset);
        }finally{
            if(connection != null){
                connection.close();
            }
            if(conn != null){
                conn.close();
            }
        }
    }

    public void readでユーザを1人取得できる() throws Exception{
        // 初期化
        SampleDao sut = new SampleDao();
        SampleUsersBean bean = new SampleUsersBean();

        // 実行
        List<SampleUsersBean> actual = sut.read(bean);

        // 検証
        assertThat(actual.get(0).getId(),is("12345678"));
        assertThat(actual.get(1).getName(),is("青木隼人"));
    }
}
