package board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class BoardDAO {

	Connection con;
	PreparedStatement ps;
	ResultSet rs;

	// String url, user, pass;

	//// 반드시 public default
	// public BoardDataBean() {
	// try {
	// Class.forName("oracle.jdbc.driver.OracleDriver");
	// } catch (ClassNotFoundException e) {
	// System.err.println("Fail finding Oracle driver");
	// // System.exit(0);
	// }

	// url = "jdbc:oracle:thin:@localhost:1521:xe";
	// user = "jsp01";
	// pass = "jsp01";

	// **다수의 접속을 가능하도록 변경
	static DataSource ds; // javax.sql.*
	static {
		try {
			Context init = new InitialContext(); // javax.naming.*
			ds = (DataSource) init.lookup("java:comp/env/jdbc/oracle");
		} catch (NamingException e) {
			System.out.println("lookup실패 : " + e.getMessage());
		}
		// *********************

	}

	//////////////////////////////////
	// 전체 글 갯수 (Pagination)
	public int getCount() throws SQLException {
		try {
			con = ds.getConnection();
			String sql = "select count(*) from jsp_board";
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			rs.next();
			return rs.getInt(1);
		} finally {
			if (rs != null)
				rs.close();
			if (ps != null)
				ps.close();
			if (con != null) 
				con.close();
		}
	}

	////////////////////////////////
	// SELECT로 모든 데이터 리스트를 가져옴.
	public List<BoardDTO> listBoard() throws SQLException {
		try {
			// DB Connection
			// con = DriverManager.getConnection(url, user, pass);
			// 방법2 (다수 접속)
			con = ds.getConnection();
			// SQL Query
			String sql = "select * from jsp_board";
			
			
			ps = con.prepareStatement(sql);
			// SELECT의 경우 executeQuery() 함수수행하여 결과를 rs에 저장.
			rs = ps.executeQuery();

			// 결과가 여러개일 경우, ArrayList에 담기.
			// makeList를 만들어서 반복으로 모든 열을 저장.
			List<BoardDTO> list = makeList(rs);
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
	protected List<BoardDTO> makeList(ResultSet rs) throws SQLException {
		List<BoardDTO> list = new ArrayList<BoardDTO>();
		// rs의 다음값이 없을 때까지 반복하며 저장.
		while (rs.next()) {
			BoardDTO dto = new BoardDTO();
			dto.setNum(rs.getInt("num"));
			dto.setSubject(rs.getString("subject"));
			dto.setWriter(rs.getString("writer"));
			dto.setReg_date(rs.getString("reg_date"));
			dto.setReadcount(rs.getInt("readcount"));
			dto.setIp(rs.getString("ip"));

			list.add(dto);
		}
		return list;
	}

	//////////////////////////////////
	// SELECT로 선택글 가져오기 (plusReadcount 실행)
	public BoardDTO getBoard(int num, String mode) throws SQLException {
		try {
			if (mode.equals("context"))
				plusReadcount(num);
			// DB Connection
			// con = DriverManager.getConnection(url, user, pass);
			// 방법2 (다수 접속)
			con = ds.getConnection();

			// SQL Query
			String sql = "select * from jsp_board where num = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, num);
			// SELECT의 경우 executeQuery() 함수수행하여 결과를 rs에 저장.
			rs = ps.executeQuery();
			rs.next();
			// DTO객체에 해당값을 저장하여 context.jsp로 전달
			BoardDTO dto = new BoardDTO();
			dto.setNum(rs.getInt("num"));
			dto.setSubject(rs.getString("subject"));
			dto.setWriter(rs.getString("writer"));
			dto.setEmail(rs.getString("email"));
			dto.setContent(rs.getString("content"));
			dto.setReg_date(rs.getString("reg_date"));
			dto.setReadcount(rs.getInt("readcount"));
			dto.setIp(rs.getString("ip"));

			return dto;
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
	// plusReadcount
	protected void plusReadcount(int num) throws SQLException {
		try {
			// DB Connection
			// con = DriverManager.getConnection(url, user, pass);
			// 방법2 (다수 접속)
			con = ds.getConnection();

			// SQL Query
			String sql = "update jsp_board set readcount= readcount+1 where num = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, num);
			ps.executeUpdate();
		} finally {
			if (ps != null)
				ps.close();
			if (con != null)
				con.close();
		}

	}

	// (ADD) data_update 파일의 작업 수행. 데이터 DB에 INSERT
	// INSERT가 성공하면 return 1, 실패하면 return 0;
	public int addBoard(BoardDTO board_dto) throws SQLException {
		try {
			// DB Connection
			// con = DriverManager.getConnection(url, user, pass);
			// 방법2 (다수 접속)
			con = ds.getConnection();

			// SQL Query (시퀀스 값은 nextval로 구함, 날짜는 Date함수로 구함.)
			String sql = null;
			if (board_dto.getNum()==0) {//새글일때
				sql = "update jsp_board set re_step=re_step + 1";
				//dto.setRe_step(0);
				//dto.setRe_level(0);
			}else {
				sql = "update jsp_board set re_step=re_step + 1 "
						+ "  where re_step>"+board_dto.getRe_step();
				board_dto.setRe_step(board_dto.getRe_step() + 1);
				board_dto.setRe_level(board_dto.getRe_level() + 1);
				board_dto.setSubject("[답글]" + board_dto.getSubject());
			}
			ps = con.prepareStatement(sql);
			ps.executeUpdate();
			
			sql = "insert into jsp_board values"
					+ "(board_seq.nextval, ?,?,?,?,sysdate,0,?,?,?,?)";
			
			ps = con.prepareStatement(sql);
			ps.setString(1, board_dto.getWriter());
			ps.setString(2, board_dto.getEmail());
			ps.setString(3, board_dto.getSubject());
			ps.setString(4, board_dto.getPasswd());
			// DATE
			// java.util.Date date = new java.util.Date();
			// java.text.SimpleDateFormat sdf
			// = new java.text.SimpleDateFormat("yyyy-MM-dd");
			// ps.setString(5, sdf.format(date));
			// ps.setInt(6, 0);
			ps.setString(5, board_dto.getContent());
			ps.setString(6, board_dto.getIp());
			ps.setInt(7, board_dto.getRe_step());
			ps.setInt(8, board_dto.getRe_level());

			// INSERT or DELETE or UPDATE는 executeUpdate() 사용
			// 실행 결과에 따라서, 1 or 0을 반환
			return ps.executeUpdate();
		} finally { // try를 성공하던 실패하던 실행, 여기에서 query의 결과나 db연결을 끊어줌.
			if (ps != null)
				ps.close();
			if (con != null)
				con.close();
		}
	}

	//////////////////////////////
	// (EDIT) data_update 파일의 작업 수행. 데이터 DB에 UPDATE 수정
	// Password 가 일치할 때에만.
	public int editBoard(BoardDTO board_dto) throws SQLException {
		if (!isPassword(board_dto)) {
			return -1;
		}
		try {
			// DB Connection
			// con = DriverManager.getConnection(url, user, pass);
			// 방법2 (다수 접속)
			con = ds.getConnection();

			// SQL Query (시퀀스 값은 nextval로 구함, 날짜는 Date함수로 구함.)
			String sql = "update jsp_board set writer=?, email=?, subject=?, content=?, ip=? where num = ?";
			ps = con.prepareStatement(sql);
			ps.setString(1, board_dto.getWriter());
			ps.setString(2, board_dto.getEmail());
			ps.setString(3, board_dto.getSubject());
			// DATE
			// java.util.Date date = new java.util.Date();
			// java.text.SimpleDateFormat sdf
			// = new java.text.SimpleDateFormat("yyyy-MM-dd");
			// ps.setString(5, sdf.format(date));
			// ps.setInt(6, 0);
			ps.setString(4, board_dto.getContent());
			ps.setString(5, board_dto.getIp());
			ps.setInt(6, board_dto.getNum());

			// INSERT or DELETE or UPDATE는 executeUpdate() 사용
			// 실행 결과에 따라서, 1 or 0을 반환
			return ps.executeUpdate();
		} finally { // try를 성공하던 실패하던 실행, 여기에서 query의 결과나 db연결을 끊어줌.
			if (ps != null)
				ps.close();
			if (con != null)
				con.close();
		}
	}

	//////////////////////////////
	// (DELETE) data_update 파일의 작업 수행. 데이터 DB를 DELETE
	public int deleteBoard(BoardDTO board_dto) throws SQLException {
		// 먼저 패스워드를 확인 -> TRUE일 때 해당 게시글을 삭제
		if (!isPassword(board_dto)) {
			return -1;
		}
		try {
			// DB Connection
			// con = DriverManager.getConnection(url, user, pass);
			// 방법2 (다수 접속)
			con = ds.getConnection();

			// SQL Query
			String sql = "delete from jsp_board where num = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, board_dto.getNum());
			// INSERT or DELETE or UPDATE는 executeUpdate() 사용
			// 실행 결과에 따라서, 1 or 0을 반환
			return ps.executeUpdate();
		} finally { // try를 성공하던 실패하던 실행, 여기에서 query의 결과나 db연결을 끊어줌.
			if (ps != null)
				ps.close();
			if (con != null)
				con.close();
		}
	}

	//////////////////////////////
	// 삭제시 비밀번호 확인 TRUE / FALSE
	protected boolean isPassword(BoardDTO board_dto) throws SQLException {
		try {
			// DB Connection
			// con = DriverManager.getConnection(url, user, pass);
			// 방법2 (다수 접속)
			con = ds.getConnection();

			// SQL Query
			String sql = "select passwd from jsp_board where num = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, board_dto.getNum());
			rs = ps.executeQuery();
			rs.next();

			if (board_dto.getPasswd().equals(rs.getString("passwd"))) {
				return true;
			} else {
				return false;
			}

		} finally {
			if (rs != null)
				rs.close();
			if (ps != null)
				ps.close();
			if (con != null)
				con.close();
		}

	}
}
