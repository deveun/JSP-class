package book;

import java.sql.*;
import java.util.*;

public class BookDAO {
	Connection con;
	PreparedStatement ps;
	ResultSet rs;
	String url, user, pass;

	// DAO������. oracle DB connect
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
	// (ADD) data_update ������ �۾� ����. ������ DB�� INSERT
	// INSERT�� �����ϸ� return 1, �����ϸ� return 0;
	public int addBook(BookDTO book_dto)
	throws SQLException {
		try {
			//DB Connection
			con = DriverManager.getConnection(url,user,pass);
			//SQL Query (������ ���� nextval�� ����, ��¥�� Date�Լ��� ����.)
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
			//INSERT or DELETE or UPDATE�� executeUpdate() ���
			//���� ����� ����, 1 or 0�� ��ȯ
			return ps.executeUpdate();
		} finally { //try�� �����ϴ� �����ϴ� ����, ���⿡�� query�� ����� db������ ������.
			if (ps != null)
				ps.close();
			if (con != null)
				con.close();
		}
	}
	//////////////////////////////
	// (EDIT) data_update ������ �۾� ����. ������ DB�� UPDATE
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
			//INSERT or DELETE or UPDATE�� executeUpdate() ���
			//���� ����� ����, 1 or 0�� ��ȯ
			return ps.executeUpdate();
		} finally {
			if (ps != null)
				ps.close();
			if (con != null)
				con.close();
		}
	}
	//////////////////////////////
	// (DELETE) data_update ������ �۾� ����. ������ DB�� DELETE
	public int delBook(int bookid)
	throws SQLException {
		try { 
			con = DriverManager.getConnection(url,user,pass);
			String sql = "delete from book where bookid = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, bookid);
			//INSERT or DELETE or UPDATE�� executeUpdate() ���
			//���� ����� ����, 1 or 0�� ��ȯ
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
	// SELECT�� ��� ������ ����Ʈ�� ������.
	public List<BookDTO> listBook()
	throws SQLException {
		try {
			//DB Connection
			con = DriverManager.getConnection(url,user,pass);
			//SQL Query
			String sql = "select * from book";
			ps = con.prepareStatement(sql);
			//SELECT�� ��� executeQuery() �Լ������Ͽ� ����� rs�� ����.
			rs = ps.executeQuery();
			
			//����� �������� ���, ArrayList�� ���.
			//makeList�� ���� �ݺ����� ��� ���� ����.
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
	// ����(LIKES) SELECT�� �˻����
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
	// �Լ��� ���� �����Ͽ� List�� ����.
	protected List<BookDTO> makeList(ResultSet rs)
	throws SQLException {
		List<BookDTO> list = new ArrayList<BookDTO>();
		//rs�� �������� ���� ������ �ݺ��ϸ� ����.
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