package book;

import java.sql.*;
import java.util.*;

public class BookDAO {
	Connection con;
	PreparedStatement ps;
	ResultSet rs;
	String url, user, pass;

	// DAO생성자. oracle DB connect
	public BookDAO() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			System.err.println("Fail finding Oracle driver");
			// System.exit(0);
		}
		url = "jdbc:oracle:thin:@localhost:1521:xe";
		user = "user1";
		pass = "1234";
	}
	//////////////////////////////
	// (ADD) data_update 파일의 작업 수행. 데이터 DB에 INSERT
	// INSERT가 성공하면 return 1, 실패하면 return 0;
	public int addBook(BookDTO book_dto)
	throws SQLException {
		try {
			//DB Connection
			con = DriverManager.getConnection(url,user,pass);
			//SQL Query (시퀀스 값은 nextval로 구함, 날짜는 Date함수로 구함.)
			String sql = "insert into book values" 
			+ "(book_seq.nextval, ?, ?, ?, ?, ?)";
			ps = con.prepareStatement(sql);
			ps.setString(1, book_dto.getBookname());
			ps.setString(2, book_dto.getWriter());
			ps.setString(3, book_dto.getPublisher());
			ps.setInt(4, book_dto.getPrice());
			//DATE
			java.util.Date date = new java.util.Date();
			java.text.SimpleDateFormat sdf 
			= new java.text.SimpleDateFormat("yyyy-MM-dd");
			ps.setString(5, sdf.format(date));
			//INSERT or DELETE or UPDATE는 executeUpdate() 사용
			//실행 결과에 따라서, 1 or 0을 반환
			return ps.executeUpdate();
		} finally { //try를 성공하던 실패하던 실행, 여기에서 query의 결과나 db연결을 끊어줌.
			if (ps != null)
				ps.close();
			if (con != null)
				con.close();
		}
	}
	//////////////////////////////
	// (EDIT) data_update 파일의 작업 수행. 데이터 DB를 UPDATE
	public int editBook(BookDTO book_dto)
	throws SQLException {
		try {
			//DB Connection
			con = DriverManager.getConnection(url,user,pass);
			String sql = "update book set bookname=?, writer=?, publisher=?,"
					+ " price = ? where bookid = ?";
			ps = con.prepareStatement(sql);
			ps.setString(1,book_dto.getBookname());
			ps.setString(2,book_dto.getWriter());
			ps.setString(3,book_dto.getPublisher());
			ps.setInt(4,book_dto.getPrice());
			ps.setInt(5, book_dto.getBookid());
			//INSERT or DELETE or UPDATE는 executeUpdate() 사용
			//실행 결과에 따라서, 1 or 0을 반환
			return ps.executeUpdate();
		} finally {
			if (ps != null)
				ps.close();
			if (con != null)
				con.close();
		}
	}
	//////////////////////////////
	// (DELETE) data_update 파일의 작업 수행. 데이터 DB를 DELETE
	public int delBook(int bookid)
	throws SQLException {
		try { 
			con = DriverManager.getConnection(url,user,pass);
			String sql = "delete from book where bookid = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, bookid);
			//INSERT or DELETE or UPDATE는 executeUpdate() 사용
			//실행 결과에 따라서, 1 or 0을 반환
			return ps.executeUpdate();
		}
		finally {
			if (ps != null)
				ps.close();
			if (con != null)
				con.close();
		}
		
	}
	/////////////////////////////
	// SELECT로 모든 데이터 리스트를 가져옴.
	public List<BookDTO> listBook()
	throws SQLException {
		try {
			//DB Connection
			con = DriverManager.getConnection(url,user,pass);
			//SQL Query
			String sql = "select * from book";
			ps = con.prepareStatement(sql);
			//SELECT의 경우 executeQuery() 함수수행하여 결과를 rs에 저장.
			rs = ps.executeQuery();
			
			//결과가 여러개일 경우, ArrayList에 담기.
			//makeList를 만들어서 반복으로 모든 열을 저장.
			List<BookDTO> list = makeList(rs);
			return list;
		} finally {
			if (rs != null)
				rs.close();
			if (ps != null)
				ps.close();
			if (con != null)
				con.close();
		}
	}
	///////////////////////////////////
	// 조건(LIKES) SELECT로 검색기능
	public List<BookDTO> search_listBook(String search)
	throws SQLException {
		try {
			con = DriverManager.getConnection(url, user, pass);
			String sql = "select * from book where bookname like ?";
			ps = con.prepareStatement(sql);
			ps.setString(1,  "%" + search + "%");
			rs = ps.executeQuery();
			List<BookDTO> list = makeList(rs);
			return list;
		} finally {
			if (rs != null)
				rs.close();
			if (ps != null)
				ps.close();
			if (con != null)
				con.close();
		}
	}
	///////////////////////////////////
	// 함수를 새로 생성하여 List를 만듬.
	protected List<BookDTO> makeList(ResultSet rs)
	throws SQLException {
		List<BookDTO> list = new ArrayList<BookDTO>();
		//rs의 다음값이 없을 때까지 반복하며 저장.
		while(rs.next()) {
			BookDTO dto = new BookDTO();
			dto.setBookid(rs.getInt("bookid"));
			dto.setBookname(rs.getString("bookname"));
			dto.setWriter(rs.getString("writer"));
			dto.setPublisher(rs.getString("publisher"));
			dto.setPrice(rs.getInt("price"));
			dto.setIndate(rs.getString("indate"));
			list.add(dto);
		}
		return list;
	}
	//////////////////////////////////
}