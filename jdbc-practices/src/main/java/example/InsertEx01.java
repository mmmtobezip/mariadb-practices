package example;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

// statement interface 사용
public class InsertEx01 {

  public static void insert() {
    Connection connection = null;
    try {
      // 1. JDBC Driver 로딩
      Class.forName("org.mariadb.jdbc.Driver"); // driver class 이름
      String url = "jdbc:mariadb://192.168.0.191:3306/webdb?charset=utf8"; // jdbc:mariadb://서버주소:서버포트/스키마
      connection = DriverManager.getConnection(url, "webdb", "webdb");

      System.out.println("success!");
    } catch (ClassNotFoundException e) {
      System.out.println("드라이버 로딩 실패:" + e);
    } catch (SQLException e) {
      System.out.println("error:" + e);
    } finally {
      try {
        if (connection != null) {
          connection.close();
        }
      } catch (SQLException e) {
        System.out.println("error: " + e);
      }
    }
  }

  public static void main(String[] args) {
    System.out.println(insert("기획1팀"));
    System.out.println(insert("기획2팀")); // 클래스 돌리고 워크밴치에서 select문으로 데이터 들어갔는지 체크하기
  }

  private static boolean insert(String deptName) {
    boolean result = false;

    Connection conn = null;
    Statement stmt = null;

    try {

      // 1. JDBC Driver 로딩
      Class.forName("org.mariadb.jdbc.Driver");

      // 2. 연결하기
      String url = "jdbc:mariadb://192.168.0.191:3306/webdb?charset=utf8";
      conn = DriverManager.getConnection(url, "webdb", "webdb");

      // 3. Statement 생성하기
      stmt = conn.createStatement();

      // 4. SQL 실행
      String sql = "insert into dept values(null, '" + deptName + "')"; // query 작성 시 String으로 만들 땐
                                                                        // ';' 붙이지 말기
      int count = stmt.executeUpdate(sql); // 데이터 갱신 insert/update/delete는 executeUpdate() 사용

      // 5. 결과 처리
      result = count == 1; // count = 1 성공, 0이면 실패
    } catch (ClassNotFoundException e) {
      System.out.println("드라이버 로딩 실패:" + e);
    } catch (SQLException e) {
      System.out.println("error:" + e);
    } finally {
      try {
        if (stmt != null) {
          stmt.close();
        }
        if (conn != null) {
          conn.close();
        }
      } catch (SQLException e) {
        System.out.println("error: " + e);
      }
    }
    return result;
  }
}
