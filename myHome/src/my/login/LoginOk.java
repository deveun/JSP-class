package my.login;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class LoginOk {
	public static final int OK = 0;
	public static final int NOT_ID = 1;
	public static final int NOT_PWD = 2;
	public static final int ERROR = -1;
	
	private String id;
	private String passwd;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	
	//
	public int loginCheck() {
		// DB Connection
		Connection con = null;
		// (동적/정적)쿼리문
		PreparedStatement ps = null;
		// 쿼리 결과 ( Update의 경우 True/False, Select의 경우 Rows를 반환함)
		ResultSet rs = null;
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String user = "jsp01";
			String pass = "jsp01";
			con = DriverManager.getConnection(url, user, pass);
			String sql = "select passwd from jsp_member where id = ?";
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			if(rs.next()) {
				String dbPass = rs.getString(1);
				if(dbPass.contentEquals(passwd)) {
					return OK;
				} else {
					return NOT_PWD;
				}
			}else {
				return NOT_ID;
			}
		} catch (Exception e) {
			//System.out.println(e.getMessage());
			e.printStackTrace();
			return ERROR;
		} finally {
			try {
				if(rs != null) rs.close();
				if(ps != null) ps.close();
				if(con != null) con.close();
			} catch(SQLException e) {
				e.printStackTrace();
			}
		}

		
	}
}
