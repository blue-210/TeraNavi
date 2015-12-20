package ttc.sample;
// 必要なJUnitのクラスをimport
import static org.junit.Assert.*;
import org.junit.Test;
import static org.hamcrest.CoreMatchers.*;

public class SampleDaoTest {
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
}
