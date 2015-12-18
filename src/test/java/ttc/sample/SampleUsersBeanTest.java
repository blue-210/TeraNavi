package ttc.sample;
// 必要なJUnitのクラスをimport
import static org.junit.Assert.*;
import org.junit.Test;
import static org.hamcrest.CoreMatchers.*;
import java.util.Properties;


// クラス名は必ず「テストしたいクラス名+Test」で書き、public
public class SampleUsersBeanTest {
    // テストの基本は4フェーズテストです。
    // 1.初期化・・・テスト対象オブジェクトの初期化、必要な入力値、期待される結果などを準備　
    // 2.実行・・・テスト対象のメソッドを１つだけ実行
    // 3.検証・・・テストの結果として得られた実測値が期待値と等価であるかを検証
    // 4.終了処理（必要な場合）・・・次のテストに影響が内容に後始末

    // 初期化
    // @はアノテーション・・・実態はクラス。メソッドやフィールドに補助的な情報を付け加える。
    // テストメソッドは戻り値がvoidで引数を持たないこと。なお、throwsは自由に定義できる。
    // メソッド名は日本語でもいいので、テストする内容が分かりやすいように書く！
    @Test
    public void setIdでidをセットできる() throws Exception{
    	// 初期化

    	Properties prop = new Properties();
        prop.load(SampleUsersBeanTest.class.getClassLoader().getResourceAsStream("test.properties"));
        String id = prop.getProperty("id");
        // 期待される値
        String expected = "12345678";

        // 実行
        sut.setId(id);
        String actual = sut.getId();

        //  検証
        assertThat(actual,is(expected));
    }

    @Test
    public void getNameでnameを取得できる() throws Exception{
//    	初期化
    	Properties prop = new Properties();
    	prop.load(SampleUsersBeanTest.class.getClassLoader().getResourceAsStream("test.properties"));
        String name = prop.getProperty("name");

        // 期待される値
        String expected = "blue210";

//        実行
        sut.setName(name);
        String actual = sut.getName();
//        検証
        assertThat(actual, is(expected));
    }
}
