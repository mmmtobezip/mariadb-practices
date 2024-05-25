package bookmall.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import bookmall.vo.BookVo;
import bookmall.vo.CartVo;
import bookmall.vo.CategoryVo;

public class CartDao {

	public int insert(CartVo vo) {
		int result = 0;

		try(
			Connection conn = getConnection();
			PreparedStatement pstmt1 = conn.prepareStatement("insert into cart(user_no, book_no, quantity) values(?, ?, ?)");) {
			
			pstmt1.setLong(1, vo.getUserNo());
			pstmt1.setLong(2, vo.getBookNo());
			pstmt1.setInt(3, vo.getQuantity());
			
			result = pstmt1.executeUpdate();
		} catch (SQLException e) {
			System.out.println("ERROR: " + e);
		}
		return result;
	}

	public int deleteByUserNoAndBookNo(Long userNo, Long bookNo) {
		int result = 0;
		
		try (
			Connection conn = getConnection();
		    PreparedStatement pstmt = conn.prepareStatement("delete from cart where user_no = ? and book_no = ?");) {
		    
			pstmt.setLong(1, userNo);
			pstmt.setLong(2, bookNo);
		    result = pstmt.executeUpdate();

		} catch (SQLException e) {
			System.out.println("ERROR: " + e);
		}
		return result;	
	}

	public List<CartVo> findByUserNo(Long userNo) {
		List<CartVo> result = new ArrayList<>();
		
		try (
			Connection conn = getConnection();
			PreparedStatement pstmt = conn.prepareStatement("select a.user_no, a.book_no, a.quantity, b.title "
															+ "from cart a, book b "
															+ "where a.book_no = b.no "
															+ "and a.user_no = ?");) {
			pstmt.setLong(1, userNo);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Long resultUserNo = rs.getLong(1);
				Long bookNo = rs.getLong(2);
				Integer quantity = rs.getInt(3);
				String title = rs.getString(4);
				
				CartVo vo = new CartVo();
				vo.setUserNo(resultUserNo);
				vo.setBookNo(bookNo);
				vo.setQuantity(quantity);
				vo.setBookTitle(title);
				
				result.add(vo);
			}
			rs.close();
		} catch (SQLException e) {
			System.out.println("ERROR: " + e);
		}
		return result;
	}
	
	private Connection getConnection() throws SQLException {
		Connection conn = null;
		
		try {
			Class.forName("org.mariadb.jdbc.Driver");
			String url = "jdbc:mariadb://192.168.64.2:3306/bookmall?charset=utf8";
			conn = DriverManager.getConnection(url, "bookmall", "bookmall");
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 로딩 실패: " + e);
		}
		return conn;
	}
}
