package student;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class StudentDAO {
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
	
	public int insertStudent(StudentDTO dto) throws SQLException{
		try {
			con = ds.getConnection();
			String sql = "insert into jspstudent values(?,?,?)";
			ps = con.prepareStatement(sql);
			ps.setString(1, dto.getId());
			ps.setString(2, dto.getName());
			ps.setString(3, dto.getCname());
			return ps.executeUpdate();
		}finally {
			if (ps != null) ps.close();
			if (con != null) con.close();
		}
	}
	
	protected List<StudentDTO> makeList(ResultSet rs) throws SQLException{
		List<StudentDTO> list = new ArrayList<StudentDTO>();
		while(rs.next()) {
			StudentDTO dto = new StudentDTO();
			dto.setId(rs.getString("id"));
			dto.setName(rs.getString("name"));
			dto.setCname(rs.getString("cname"));
			list.add(dto);
		}
		return list;
	}
	
	public List<StudentDTO> listStudent() throws SQLException{
		try {
			con = ds.getConnection();
			String sql = "select * from jspstudent";
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			List<StudentDTO> list = makeList(rs);
			return list;
		}finally {
			if (rs != null) rs.close();
			if (ps != null) ps.close();
			if (con != null) con.close();
		}
	}
	
	public int deleteStudent(String id) throws SQLException{
		try {
			con = ds.getConnection();
			String sql = "delete from jspstudent where id = ?";
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			return ps.executeUpdate();
		}finally {
			if (ps != null) ps.close();
			if (con != null) con.close();
		}
	}
	
	public List<StudentDTO> findStudent(String name) throws SQLException{
		try {
			con = ds.getConnection();
			String sql = "select * from jspstudent where name = ?";
			ps = con.prepareStatement(sql);
			ps.setString(1, name);
			rs = ps.executeQuery();
			List<StudentDTO> find = makeList(rs);
			return find;
		}finally {
			if (rs != null) rs.close();
			if (ps != null) ps.close();
			if (con != null) con.close();
		}
	}
}

