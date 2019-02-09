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
		public List<BoardDBBean> listBoard()
		throws SQLException {
			try {
				//DB Connection
				con = DriverManager.getConnection(url,user,pass);
				//SQL Query
				String sql = "select * from jsp_board";
				ps = con.prepareStatement(sql);
				//SELECT�� ��� executeQuery() �Լ������Ͽ� ����� rs�� ����.
				rs = ps.executeQuery();
				
				//����� �������� ���, ArrayList�� ���.
				//makeList�� ���� �ݺ����� ��� ���� ����.
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
		protected List<BoardDBBean> makeList(ResultSet rs)
		throws SQLException {
			List<BoardDBBean> list = new ArrayList<BoardDBBean>();
			//rs�� �������� ���� ������ �ݺ��ϸ� ����.
			while(rs.next()) {
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
}
