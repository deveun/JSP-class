package memo;

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

public class MemoDAO {
	// DB 연결하기
	Connection con;
	PreparedStatement ps;
	ResultSet rs;

	static DataSource ds;
	static {
		try {
			Context init = new InitialContext();
			ds = (DataSource) init.lookup("java:comp/env/jdbc/oracle");
		} catch (NamingException e) {
			System.out.println("lookup실패 : " + e.getMessage());
		}
	}

	// INSERT
	public int insertMemo(MemoDTO dto) {

		int res = 0;
		try {
			con = ds.getConnection();
			String sql = "insert into memo values(?,?,?)";
			ps = con.prepareStatement(sql);
			ps.setString(1, dto.getId());
			ps.setString(2, dto.getEmail());
			ps.setString(3, dto.getContent());
			res = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (ps != null)
					ps.close();
				if (con != null)
					con.close();
			} catch (Exception e) {
			}
		}
		return res;
	}

	//LIST
	public List<MemoDTO> getList() {
		
		List<MemoDTO> list = new ArrayList<MemoDTO>();
		try {
			con = ds.getConnection();
			String sql = "select * from memo";
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				MemoDTO dto = new MemoDTO();
				dto.setId(rs.getString("id"));
				dto.setEmail(rs.getString("email"));
				dto.setContent(rs.getString("content"));
				list.add(dto);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) rs.close();
				if (ps != null)	ps.close();
				if (con != null) con.close();
			} catch (Exception e) {}
		}
		return list;
	}
}
