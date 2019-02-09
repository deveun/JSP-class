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

	// 반드시 public default
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
	// SELECT로 모든 데이터 리스트를 가져옴.
		public List<BoardDBBean> listBoard()
		throws SQLException {
			try {
				//DB Connection
				con = DriverManager.getConnection(url,user,pass);
				//SQL Query
				String sql = "select * from jsp_board";
				ps = con.prepareStatement(sql);
				//SELECT의 경우 executeQuery() 함수수행하여 결과를 rs에 저장.
				rs = ps.executeQuery();
				
				//결과가 여러개일 경우, ArrayList에 담기.
				//makeList를 만들어서 반복으로 모든 열을 저장.
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
		// 함수를 새로 생성하여 List를 만듬.
		protected List<BoardDBBean> makeList(ResultSet rs)
		throws SQLException {
			List<BoardDBBean> list = new ArrayList<BoardDBBean>();
			//rs의 다음값이 없을 때까지 반복하며 저장.
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
