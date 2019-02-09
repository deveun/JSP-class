package my.member;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

//DAO : Data Access Object (DB의 데이터를 쓰고, 읽고, 수정, 삭제)
//DB 쿼리문 관련 동작을 클래스 함수로 지정하고, DTO의 데이터를 참조하여 값을 추출.
//이 함수들을 JSP에서 사용.
public class MemberDAO {

	// DB Connection
	Connection con;
	// (동적/정적)쿼리문
	PreparedStatement ps;
	// 쿼리 결과 ( Update의 경우 True/False, Select의 경우 Rows를 반환함)
	ResultSet rs;

	String url, user, pass;

	//SEARCH VARIABLES
	private String search;
	private String searchString;
	
	
	// 반드시 public default
	public MemberDAO() {
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

	public boolean checkMember(String name, String ssn1, String ssn2) throws SQLException {
		try {
			con = DriverManager.getConnection(url, user, pass);
			String sql = "select name from jsp_member where ssn1=? and ssn2 =?";
			ps = con.prepareStatement(sql);
			ps.setString(1, ssn1);
			ps.setString(2, ssn2);
			rs = ps.executeQuery();
			if (rs.next()) {
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

	public int insertMember(MemberDTO mbdto) throws SQLException {
		try {
			con = DriverManager.getConnection(url, user, pass);
			String sql = "insert into jsp_member values" + "(member_seq.nextval,?,?,?,?,?,?,?,?,?,?)";
			ps = con.prepareStatement(sql);
			ps.setString(1, mbdto.getName());
			ps.setString(2, mbdto.getId());
			ps.setString(3, mbdto.getPasswd());
			ps.setString(4, mbdto.getSsn1());
			ps.setString(5, mbdto.getSsn2());
			ps.setString(6, mbdto.getEmail());
			ps.setString(7, mbdto.getHp1());
			ps.setString(8, mbdto.getHp2());
			ps.setString(9, mbdto.getHp3());
			// Today date
			java.util.Date date = new java.util.Date();
			java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd");
			ps.setString(10, sdf.format(date));
			return ps.executeUpdate();
		} finally {
			if (ps != null)
				ps.close();
			if (con != null)
				con.close();
		}
	}

	public List<MemberDTO> listMember() throws SQLException {
		try {
			con = DriverManager.getConnection(url, user, pass);
			String sql = "select * from jsp_member";
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			List<MemberDTO> list = makeList(rs);
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
	
	public List<MemberDTO> searchMember() throws SQLException {
		try {
			con = DriverManager.getConnection(url, user, pass);
			String sql = "select * from jsp_member where " + search + " like ?";
			ps = con.prepareStatement(sql);
			ps.setString(1, "%" + searchString + "%");
			rs = ps.executeQuery();
			List<MemberDTO> list = makeList(rs);
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

	protected List<MemberDTO> makeList(ResultSet rs) throws SQLException {
		List<MemberDTO> list = new ArrayList<MemberDTO>();
		while (rs.next()) {
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

	public int deleteMember(int no) throws SQLException {
		try {
			con = DriverManager.getConnection(url, user, pass);
			String sql = "delete from jsp_member where no = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, no);
			return ps.executeUpdate();
		} finally {
			if (ps != null)
				ps.close();
			if (con != null)
				con.close();
		}
	}

	public MemberDTO getMember(int no) throws SQLException {
		try {
			con = DriverManager.getConnection(url, user, pass);
			String sql = "select * from jsp_member where no = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, no);
			rs = ps.executeQuery();
			List<MemberDTO> getMember = makeList(rs);
			return getMember.get(0);
		} finally {
			if (rs != null)
				rs.close();
			if (ps != null)
				ps.close();
			if (con != null)
				con.close();
		}
	}

	public int updateMember(MemberDTO dto) throws SQLException {
		try {
			con = DriverManager.getConnection(url, user, pass);
			String sql = "update jsp_member set " + "passwd=?, email=?, hp1=?, hp2=?, hp3=? where no = ?";
			ps = con.prepareStatement(sql);
			ps.setString(1, dto.getPasswd());
			ps.setString(2, dto.getEmail());
			ps.setString(3, dto.getHp1());
			ps.setString(4, dto.getHp2());
			ps.setString(5, dto.getHp3());
			ps.setInt(6, dto.getNo());
			return ps.executeUpdate();
		} finally {
			if (ps != null)
				ps.close();
			if (con != null)
				con.close();
		}
	}
	
	public String checkId(MemberDTO dto) throws SQLException {
		try {
			con = DriverManager.getConnection(url, user, pass);
			String sql = "Select id from jsp_member where name=? and ssn1=? and ssn2=?" ;
			ps = con.prepareStatement(sql);
			ps.setString(1, dto.getName());
			ps.setString(2, dto.getSsn1());
			ps.setString(3, dto.getSsn2());
			rs = ps.executeQuery();
			if(rs.next()) {
				return rs.getString("id");
			}
			else return "";
		} finally {
			if (rs != null)
				rs.close();
			if (ps != null)
				ps.close();
			if (con != null)
				con.close();
		}
	}
	
	public String checkPasswd(MemberDTO dto) throws SQLException {
		try {
			con = DriverManager.getConnection(url, user, pass);
			String sql = "Select passwd from jsp_member where name=? and ssn1=? and ssn2=? and id=?" ;
			ps = con.prepareStatement(sql);
			ps.setString(1, dto.getName());
			ps.setString(2, dto.getSsn1());
			ps.setString(3, dto.getSsn2());
			ps.setString(4, dto.getId());
			rs = ps.executeQuery();
			if(rs.next()) {
				return rs.getString("passwd");
			}
			else return "";
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
