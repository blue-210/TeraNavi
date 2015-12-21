package ttc.sample;
// 必要なJUnitのクラスをimport
import static org.junit.Assert.*;
import org.junit.Test;
import org.junit.*;
import static org.hamcrest.CoreMatchers.*;


// クラス名は必ず「テストしたいクラス名+Test」で書き、public
public class SampleUsersBeanTest {
    SampleUsersBean sut = new SampleUsersBean();
    /* 初期化処理が重複するときは@Beforeアノテーションを使ってくくりだします。
    *  たとえば、このテストでいえば、あらかじめBeanに値をセットしておくというのは共通している処理なので
    *　一つにまとめてしまったほうが楽ですね。
    */
    @Before
    public void setUp(){
        // sutとはSystem Under Testの略で、テスト対象となるクラスのこと。慣習的にこう書きます。
        sut.setId("12345678");
        sut.setName("青木隼人");
    }

    /* テストの基本は4フェーズテストです。
    * 1.初期化・・・テスト対象オブジェクトの初期化、必要な入力値、期待される結果などを準備　
    * 2.実行・・・テスト対象のメソッドを１つだけ実行
    * 3.検証・・・テストの結果として得られた実測値が期待値と等価であるかを検証
    * 4.終了処理（必要な場合）・・・次のテストに影響が内容に後始末
    *
    * 初期化
    * @はアノテーション・・・実態はクラス。メソッドやフィールドに補助的な情報を付け加える。
    * テストメソッドは戻り値がvoidで引数を持たないこと。なお、throwsは自由に定義できる。
    * メソッド名は日本語でもいいので、テストする内容が分かりやすいように書く！
    */
    @Test
    public void setIdでidをセットできる() throws Exception{
    	// 初期化
        // 期待される(expected)値を用意
        String expected = "12345678";

        // 実行
        // 実際にテスト対象メソッドを実行して実際の(actual)値を取得
        String actual = sut.getId();

        // 検証
        // assertThat(実際の値,is(期待される値))
        assertThat(actual,is(expected));
    }

    @Test
    public void getNameでnameを取得できる() throws Exception{
        //  初期化
        // 期待される値
        String expected = "青木隼人";

        // 実行
        String actual = sut.getName();

        // 検証
        assertThat(actual, is(expected));
    }
}
