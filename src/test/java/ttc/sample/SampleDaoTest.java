package ttc.sample;
// 必要なJUnitのクラスをimport
import static org.junit.Assert.*;
import org.junit.Test;
import static org.hamcrest.CoreMatchers.*;

public class SampleDaoTest {
    // DBに接続し、初期化としてTableをいったんキレイにして期待されるデータをセットする
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
