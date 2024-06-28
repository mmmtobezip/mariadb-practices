package example;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class DeleteEx02 {

  public static void main(String[] args) {
    boolean result = delete(8L);
    System.out.println(result ? "성공" : "실패");

  }

  // pk지우는 역할
  private static boolean delete(long no) {
    boolean result = false;

    Connection conn = null;
    PreparedStatement pstmt = null;

    try {

      // 1. JDBC Driver 로딩
      Class.forName("org.mariadb.jdbc.Driver");

      // 2. 연결하기
      String url = "jdbc:mariadb://192.168.64.2:3306/webdb?charset=utf8";
      conn = DriverManager.getConnection(url, "webdb", "webdb");

      // 3. Statement 준비시키기(prepare)
      String sql = "delete from dept where no = ?";
      pstmt = conn.prepareStatement(sql);

      // 4. Parameter Binding
      pstmt.setLong(1, no);

      // 5. SQL 실행
      int count = pstmt.executeUpdate(sql);

      // 6. 결과 처리
      result = count == 1;
    } catch (ClassNotFoundException e) {
      System.out.println("드라이버 로딩 실패:" + e);
    } catch (SQLException e) {
      System.out.println("error:" + e);
    } finally {
      try {
        if (pstmt != null) {
          pstmt.close();
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
