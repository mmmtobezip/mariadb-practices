package example;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionEx {

  public static void main(String[] args) {

    Connection connection = null;
    try {
      // 1. JDBC Driver 로딩
      Class.forName("org.mariadb.jdbc.Driver"); // driver class 이름
      String url = "jdbc:mariadb://192.168.64.2:3306/webdb?charset=utf8"; // jdbc:mariadb://서버주소:서버포트/스키마?
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
}
