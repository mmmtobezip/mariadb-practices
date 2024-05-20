package bookshop.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import bookshop.vo.AuthorVo;

public class AuthorDao {

  // 중복된 부분의 함수화
  private Connection getConnection() throws SQLException {
    Connection conn = null;

    try {
      Class.forName("org.mariadb.jdbc.Driver");

      String url = "jdbc:mariadb://192.168.0.191:3306/webdb?charset=utf8";
      conn = DriverManager.getConnection(url, "webdb", "webdb"); // sqlexception 처리 필요 -> findAll() 에서도 필요하기에 부르는 쪽에서 exception을 터지게 throw 던짐
 
    } catch (ClassNotFoundException e) {
      System.out.println("드라이버 로딩 실패:" + e);
    }
    return conn;
  }

  public List<AuthorVo> findAll() {
    List<AuthorVo> result = new ArrayList<>();

    try (
        Connection conn = getConnection(); // 자원 close 등, JDBC 연결과 관련된 작업 가능 {}이 아니기에 본문에서도 conn 사용 가능
        PreparedStatement pstmt = conn.prepareStatement("select no, name ");
        ResultSet rs = pstmt.executeQuery(); // sqlexception 처리 필요
       ) {

      while (rs.next()) {
        Long no = rs.getLong(1);
        String name = rs.getString(2);

        AuthorVo vo = new AuthorVo();
        vo.setNo(no);
        vo.setName(name);
        
        result.add(vo);
      }


    } catch (SQLException e) {
      System.out.println("error:" + e);
    }
    
    return result;
  }
}
