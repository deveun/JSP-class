package member;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class MemberDAO {
	Connection con;
	PreparedStatement ps;
	ResultSet rs;
	
	private String search;
	private String searchString;
	
	public void setSearch(String search) {
		this.search = search;
	}

	public void setSearchString(String searchString) {
		this.searchString = searchString;
	}

	static DataSource ds;
	static{
		try{
			Context init = new InitialContext();
			ds = (DataSource)init.lookup("java:comp/env/jdbc/oracle");
		}catch(NamingException e){
			System.out.println("lookup½ÇÆÐ : " + e.getMessage());
		}
	}
	
	public MemberDAO() {}

	public boolean checkMember(String name, String ssn1, String ssn2)
																		throws SQLException{
		try {
			con = ds.getConnection();
			String sql = "select name from jsp_member where ssn1=? and ssn2=?";
			ps = con.prepareStatement(sql);
			ps.setString(1, ssn1);
			ps.setString(2, ssn2);
			rs = ps.executeQuery();
			if (rs.next()) {
				return true;
			}else {
				return false;
			}
		}finally {
			if (rs != null) rs.close();
			if (ps != null) ps.close();
			if (con != null) con.close();
		}
	}
	
	public int insertMember(MemberDTO dto) throws SQLException{
		try {
			con = ds.getConnection();
			String sql = "insert into jsp_member values"
								+ "(member_seq.nextval, ?,?,?,?,?,?,?,?,?,?)";
			ps = con.prepareStatement(sql);
			ps.setString(1, dto.getName());
			ps.setString(2, dto.getId());
			ps.setString(3, dto.getPasswd());
			ps.setString(4, dto.getSsn1());
			ps.setString(5, dto.getSsn2());
			ps.setString(6, dto.getEmail());
			ps.setString(7, dto.getHp1());
			ps.setString(8, dto.getHp2());
			ps.setString(9, dto.getHp3());
			java.util.Date date = new java.util.Date();
			java.text.SimpleDateFormat sdf = 
					new java.text.SimpleDateFormat("yyyy-MM-dd");
			ps.setString(10, sdf.format(date));
			return ps.executeUpdate();
		}finally {
			if (ps != null) ps.close();
			if (con != null) con.close();
		}
	}
	
	public List<MemberDTO> listMember() throws SQLException{
		try {
			con = ds.getConnection();
			String sql = "select * from jsp_member";
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			List<MemberDTO> list = makeList(rs);
			return list;
		}finally {
			if (rs != null) rs.close();
			if (ps != null) ps.close();
			if (con != null) con.close();
		}
	}
	
	protected List<MemberDTO> makeList(ResultSet rs) throws SQLException{
		List<MemberDTO> list = new ArrayList<MemberDTO>();
		while(rs.next()) {
			MemberDTO dto = new MemberDTO();
			dto.setNo(rs.getInt("no"));
			dto.setName(rs.getString("name"));
			dto.setId(rs.getString("id"));
			dto.setPasswd(rs.getString("passwd"));
			dto.setSsn1(rs.getString("ssn1"));
			dto.setSsn2(rs.getString("ssn2"));
			dto.setEmail(rs.getString("email"));
			dto.setHp1(rs.getString("hp1"));
			dto.setHp2(rs.getString("hp2"));
			dto.setHp3(rs.getString("hp3"));
			dto.setJoindate(rs.getString("joindate"));
			list.add(dto);
		}
		return list;
	}
	
	public int deleteMember(int no) throws SQLException{
		try {
			con = ds.getConnection();
			String sql = "delete from jsp_member where no = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, no);
			return ps.executeUpdate();
		}finally {
			if (ps != null) ps.close();
			if (con != null) con.close();
		}
	}
	
	public MemberDTO getMember(int no) throws SQLException{
		try {
			con = ds.getConnection();
			String sql = "select * from jsp_member where no = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, no);
			rs = ps.executeQuery();
			List<MemberDTO> getMember = makeList(rs);
			return getMember.get(0);
		}finally {
			if (rs != null) rs.close();
			if (ps != null) ps.close();
			if (con != null) con.close();
		}
	}
	
	public int updateMember(MemberDTO dto) throws SQLException{
		try {
			con = ds.getConnection();
			String sql = "update jsp_member set "
					+ "passwd=?, email=?, hp1=?, hp2=?, hp3=? where no = ?";
			ps = con.prepareStatement(sql);
			ps.setString(1, dto.getPasswd());
			ps.setString(2, dto.getEmail());
			ps.setString(3, dto.getHp1());
			ps.setString(4, dto.getHp2());
			ps.setString(5, dto.getHp3());
			ps.setInt(6, dto.getNo());
			return ps.executeUpdate();
		}finally {
			if (ps != null) ps.close();
			if (con != null) con.close();
		}
	}
	
	public List<MemberDTO> findMember(String search, String searchString) throws SQLException{
		try {
			con = ds.getConnection();
			String sql = "select * from jsp_member where    "+search+" = ?";
			ps = con.prepareStatement(sql);
			ps.setString(1, searchString);
			rs = ps.executeQuery();
			List<MemberDTO> list = makeList(rs);
			return list;
		}finally {
			if (rs != null) rs.close();
			if (ps != null) ps.close();
			if (con != null) con.close();
		}
	}
	public String searchId(String name, String ssn1, String ssn2) throws SQLException{
		String sql = "select id from jsp_member where name=? and ssn1=? and ssn2=?";
		try{
			con = ds.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, name);
			ps.setString(2, ssn1);
			ps.setString(3, ssn2);
			rs = ps.executeQuery();
			if (rs.next()){
				String msg = rs.getString(1);
				return msg;
			}
			return null;
		}finally{
			if (rs != null) rs.close();
			if (ps != null) ps.close();
			if (con != null) con.close();
		}
	}
	public String searchPw(String name, String ssn1, String ssn2, String id) throws SQLException{
		String sql = "select passwd from jsp_member where name=? and ssn1=? and ssn2=? and id=?";
		try{
			con = ds.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, name);
			ps.setString(2, ssn1);
			ps.setString(3, ssn2);
			ps.setString(4, id);
			rs = ps.executeQuery();
			if (rs.next()){
				String msg = rs.getString(1);
				return msg;
			}
			return null;
		}finally{
			if (rs != null) rs.close();
			if (ps != null) ps.close();
			if (con != null) con.close();
		}
	}
}














