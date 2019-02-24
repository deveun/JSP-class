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

	//// �ݵ�� public default
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

	// **�ټ��� ������ �����ϵ��� ����
	static DataSource ds; // javax.sql.*
	static {
		try {
			Context init = new InitialContext(); // javax.naming.*
			ds = (DataSource) init.lookup("java:comp/env/jdbc/oracle");
		} catch (NamingException e) {
			System.out.println("lookup���� : " + e.getMessage());
		}
		// *********************

	}

	//////////////////////////////////
	// ��ü �� ���� (Pagination)
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
	// SELECT�� ��� ������ ����Ʈ�� ������.
	public List<BoardDTO> listBoard() throws SQLException {
		try {
			// DB Connection
			// con = DriverManager.getConnection(url, user, pass);
			// ���2 (�ټ� ����)
			con = ds.getConnection();
			// SQL Query
			String sql = "select * from jsp_board";
			
			
			ps = con.prepareStatement(sql);
			// SELECT�� ��� executeQuery() �Լ������Ͽ� ����� rs�� ����.
			rs = ps.executeQuery();

			// ����� �������� ���, ArrayList�� ���.
			// makeList�� ���� �ݺ����� ��� ���� ����.
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
	// �Լ��� ���� �����Ͽ� List�� ����.
	protected List<BoardDTO> makeList(ResultSet rs) throws SQLException {
		List<BoardDTO> list = new ArrayList<BoardDTO>();
		// rs�� �������� ���� ������ �ݺ��ϸ� ����.
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
	// SELECT�� ���ñ� �������� (plusReadcount ����)
	public BoardDTO getBoard(int num, String mode) throws SQLException {
		try {
			if (mode.equals("context"))
				plusReadcount(num);
			// DB Connection
			// con = DriverManager.getConnection(url, user, pass);
			// ���2 (�ټ� ����)
			con = ds.getConnection();

			// SQL Query
			String sql = "select * from jsp_board where num = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, num);
			// SELECT�� ��� executeQuery() �Լ������Ͽ� ����� rs�� ����.
			rs = ps.executeQuery();
			rs.next();
			// DTO��ü�� �ش簪�� �����Ͽ� context.jsp�� ����
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
			// ���2 (�ټ� ����)
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

	// (ADD) data_update ������ �۾� ����. ������ DB�� INSERT
	// INSERT�� �����ϸ� return 1, �����ϸ� return 0;
	public int addBoard(BoardDTO board_dto) throws SQLException {
		try {
			// DB Connection
			// con = DriverManager.getConnection(url, user, pass);
			// ���2 (�ټ� ����)
			con = ds.getConnection();

			// SQL Query (������ ���� nextval�� ����, ��¥�� Date�Լ��� ����.)
			String sql = null;
			if (board_dto.getNum()==0) {//�����϶�
				sql = "update jsp_board set re_step=re_step + 1";
				//dto.setRe_step(0);
				//dto.setRe_level(0);
			}else {
				sql = "update jsp_board set re_step=re_step + 1 "
						+ "  where re_step>"+board_dto.getRe_step();
				board_dto.setRe_step(board_dto.getRe_step() + 1);
				board_dto.setRe_level(board_dto.getRe_level() + 1);
				board_dto.setSubject("[���]" + board_dto.getSubject());
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

			// INSERT or DELETE or UPDATE�� executeUpdate() ���
			// ���� ����� ����, 1 or 0�� ��ȯ
			return ps.executeUpdate();
		} finally { // try�� �����ϴ� �����ϴ� ����, ���⿡�� query�� ����� db������ ������.
			if (ps != null)
				ps.close();
			if (con != null)
				con.close();
		}
	}

	//////////////////////////////
	// (EDIT) data_update ������ �۾� ����. ������ DB�� UPDATE ����
	// Password �� ��ġ�� ������.
	public int editBoard(BoardDTO board_dto) throws SQLException {
		if (!isPassword(board_dto)) {
			return -1;
		}
		try {
			// DB Connection
			// con = DriverManager.getConnection(url, user, pass);
			// ���2 (�ټ� ����)
			con = ds.getConnection();

			// SQL Query (������ ���� nextval�� ����, ��¥�� Date�Լ��� ����.)
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

			// INSERT or DELETE or UPDATE�� executeUpdate() ���
			// ���� ����� ����, 1 or 0�� ��ȯ
			return ps.executeUpdate();
		} finally { // try�� �����ϴ� �����ϴ� ����, ���⿡�� query�� ����� db������ ������.
			if (ps != null)
				ps.close();
			if (con != null)
				con.close();
		}
	}

	//////////////////////////////
	// (DELETE) data_update ������ �۾� ����. ������ DB�� DELETE
	public int deleteBoard(BoardDTO board_dto) throws SQLException {
		// ���� �н����带 Ȯ�� -> TRUE�� �� �ش� �Խñ��� ����
		if (!isPassword(board_dto)) {
			return -1;
		}
		try {
			// DB Connection
			// con = DriverManager.getConnection(url, user, pass);
			// ���2 (�ټ� ����)
			con = ds.getConnection();

			// SQL Query
			String sql = "delete from jsp_board where num = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, board_dto.getNum());
			// INSERT or DELETE or UPDATE�� executeUpdate() ���
			// ���� ����� ����, 1 or 0�� ��ȯ
			return ps.executeUpdate();
		} finally { // try�� �����ϴ� �����ϴ� ����, ���⿡�� query�� ����� db������ ������.
			if (ps != null)
				ps.close();
			if (con != null)
				con.close();
		}
	}

	//////////////////////////////
	// ������ ��й�ȣ Ȯ�� TRUE / FALSE
	protected boolean isPassword(BoardDTO board_dto) throws SQLException {
		try {
			// DB Connection
			// con = DriverManager.getConnection(url, user, pass);
			// ���2 (�ټ� ����)
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
