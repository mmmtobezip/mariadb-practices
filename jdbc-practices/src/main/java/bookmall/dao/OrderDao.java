package bookmall.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import bookmall.vo.BookVo;
import bookmall.vo.OrderBookVo;
import bookmall.vo.OrderVo;
import bookmall.vo.UserVo;

public class OrderDao {

	public int insert(OrderVo vo) {
		int result = 0;

		try (
			Connection conn = getConnection();
			PreparedStatement pstmt1 = conn.prepareStatement("insert into orders(number, status, payment, shipping, user_no) values(?, ?, ?, ?, ?)");
			PreparedStatement pstmt2 = conn.prepareStatement("select last_insert_id() from dual");) {
			
			pstmt1.setString(1, vo.getNumber());
			pstmt1.setString(2, vo.getStatus());
			pstmt1.setInt(3, vo.getPayment());
			pstmt1.setString(4, vo.getShipping());
			pstmt1.setLong(5, vo.getUserNo());
			
			result = pstmt1.executeUpdate();
			
			ResultSet rs = pstmt2.executeQuery();
			
			vo.setNo(rs.next() ? rs.getLong(1) : null);
			rs.close();
		} catch (SQLException e) {
			System.out.println("ERROR: " + e);
		}
		return result;
	}
	
	public int insertBook(OrderBookVo vo) {
		int result = 0;

		try (
			Connection conn = getConnection();
			PreparedStatement pstmt1 = conn.prepareStatement("insert into orders_book(orders_no, book_no, quantity, price) values(?, ?, ?, ?)");
			PreparedStatement pstmt2 = conn.prepareStatement("select last_insert_id() from dual");) {
			
			pstmt1.setLong(1, vo.getOrderNo());
			pstmt1.setLong(2, vo.getBookNo());
			pstmt1.setLong(3, vo.getQuantity());
			pstmt1.setLong(4, vo.getPrice());
			
			result = pstmt1.executeUpdate();
		} catch (SQLException e) {
			System.out.println("ERROR: " + e);
		}
		return result;
	}

	public int deleteBooksByNo(Long ordersNo) {
		int result = 0;
		
		try (
			Connection conn = getConnection();
			PreparedStatement pstmt = conn.prepareStatement("delete from orders_book where orders_no = ?");) {
			    
			pstmt.setLong(1, ordersNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("ERROR: " + e);
		}
		return result;
	}
	
	public int deleteByNo(Long no) {
		int result = 0;
		
		try (
			Connection conn = getConnection();
		    PreparedStatement pstmt = conn.prepareStatement("delete from orders where no = ?");) {
		    
			pstmt.setLong(1, no);
			
		    result = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("ERROR: " + e);
		}
		return result;
		
	}

	public OrderVo findByNoAndUserNo(Long orderNo, Long userNo) {
		OrderVo result = null;
		
		try (
			Connection conn = getConnection();
			PreparedStatement pstmt = conn.prepareStatement("select no, number, status, payment, shipping, user_no from orders where no = ? and user_no = ?");) {
				    
			pstmt.setLong(1, orderNo);
			pstmt.setLong(2, userNo);
			
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				Long no = rs.getLong(1);
				String number = rs.getString(2);
				String status = rs.getString(3);
				Integer payment = rs.getInt(4);
				String shipping = rs.getString(5);
				Long resultUserNo = rs.getLong(6);
				
				OrderVo vo = new OrderVo();
				vo.setNo(no);
				vo.setNumber(number);
				vo.setStatus(status);
				vo.setPayment(payment);
				vo.setShipping(shipping);
				vo.setUserNo(resultUserNo);
				
				result = vo;
			}
			rs.close();
		} catch (SQLException e) {
			System.out.println("ERROR: " + e);
		}
		return result;
	}

	public List<OrderBookVo> findBooksByNoAndUserNo(Long orderNo, Long userNo) {
		List<OrderBookVo> result = new ArrayList<>();
		
		try (
				Connection conn = getConnection();
				PreparedStatement pstmt = conn.prepareStatement("select a.orders_no, a.book_no, a.quantity, a.price, b.title "
																+ "from orders_book a, book b, orders c "
																+ "where a.book_no = b.no "
																+ "and a.orders_no = c.no "
																+ "and a.orders_no = ? and c.user_no = ?");) {
				
				pstmt.setLong(1, orderNo);
				pstmt.setLong(2, userNo);
	
				ResultSet rs = pstmt.executeQuery();
				while(rs.next()) {
					Long resultOrderNo = rs.getLong(1);
					Long resultBookNo = rs.getLong(2);
					Integer quantity = rs.getInt(3);
					Integer price = rs.getInt(4);
					String title = rs.getString(5);
					
					OrderBookVo vo = new OrderBookVo();
					vo.setOrderNo(resultOrderNo);
					vo.setBookNo(resultBookNo);
					vo.setQuantity(quantity);
					vo.setPrice(price);
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
