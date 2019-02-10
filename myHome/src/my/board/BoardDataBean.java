package my.board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import my.board.BoardDBBean;

public class BoardDataBean {

	Connection con;
	PreparedStatement ps;
	ResultSet rs;

	String url, user, pass;

	// �ݵ�� public default
	public BoardDataBean() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			System.err.println("Fail finding Oracle driver");
			// System.exit(0);
		}

		url = "jdbc:oracle:thin:@localhost:1521:xe";
		user = "jsp01";
		pass = "jsp01";
	}

	////////////////////////////////
	// SELECT�� ��� ������ ����Ʈ�� ������.
	public List<BoardDBBean> listBoard() throws SQLException {
		try {
			// DB Connection
			con = DriverManager.getConnection(url, user, pass);
			// SQL Query
			String sql = "select * from jsp_board";
			ps = con.prepareStatement(sql);
			// SELECT�� ��� executeQuery() �Լ������Ͽ� ����� rs�� ����.
			rs = ps.executeQuery();

			// ����� �������� ���, ArrayList�� ���.
			// makeList�� ���� �ݺ����� ��� ���� ����.
			List<BoardDBBean> list = makeList(rs);
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
	protected List<BoardDBBean> makeList(ResultSet rs) throws SQLException {
		List<BoardDBBean> list = new ArrayList<BoardDBBean>();
		// rs�� �������� ���� ������ �ݺ��ϸ� ����.
		while (rs.next()) {
			BoardDBBean dto = new BoardDBBean();
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
	public BoardDBBean getBoard(int num, String mode) throws SQLException {
		try {
			if(mode.equals("context"))
			plusReadcount(num);
			// DB Connection
			con = DriverManager.getConnection(url, user, pass);
			// SQL Query
			String sql = "select * from jsp_board where num = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, num);
			// SELECT�� ��� executeQuery() �Լ������Ͽ� ����� rs�� ����.
			rs = ps.executeQuery();
			rs.next();
			// DTO��ü�� �ش簪�� �����Ͽ� context.jsp�� ����
			BoardDBBean dto = new BoardDBBean();
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
			con = DriverManager.getConnection(url, user, pass);
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
	public int addBoard(BoardDBBean board_dto) throws SQLException {
		try {
			// DB Connection
			con = DriverManager.getConnection(url, user, pass);
			// SQL Query (������ ���� nextval�� ����, ��¥�� Date�Լ��� ����.)
			String sql = "insert into jsp_board values" + "(board_seq.nextval, ?, ?, ?, ?, sysdate, 0, ?, ?)";
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
	//Password �� ��ġ�� ������.
	public int editBoard(BoardDBBean board_dto) throws SQLException {
		if (!isPassword(board_dto)) {
			return -1;
		}
		try {
			// DB Connection
			con = DriverManager.getConnection(url, user, pass);
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
	public int deleteBoard(BoardDBBean board_dto) throws SQLException {
		// ���� �н����带 Ȯ�� -> TRUE�� �� �ش� �Խñ��� ����
		if (!isPassword(board_dto)) {
			return -1;
		}
		try {
			// DB Connection
			con = DriverManager.getConnection(url, user, pass);
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
	protected boolean isPassword(BoardDBBean board_dto) throws SQLException {
		try {
			// DB Connection
			con = DriverManager.getConnection(url, user, pass);
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