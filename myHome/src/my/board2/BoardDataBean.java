package my.board2;

import java.io.File;
import java.sql.*;
import java.util.*;

import javax.sql.*;

import com.oreilly.servlet.MultipartRequest;

import javax.naming.*;

public class BoardDataBean {
	Connection con;
	PreparedStatement ps;
	ResultSet rs;         
	
	static DataSource ds;	//javax.sql.*
	static{
		try{
			Context init = new InitialContext();	//javax.naming.*
			ds = (DataSource)init.lookup("java:comp/env/jdbc/oracle");
		}catch(NamingException e){
			System.out.println("lookup실패 : " + e.getMessage());
		}
	}
	
	public List<BoardDBBean> listBoard() 
													throws SQLException{
		try {
			con = ds.getConnection();
			String sql = "select * from jsp_board2 order by num desc";
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			List<BoardDBBean> boardList = makeList(rs);
			return boardList;
		}finally {
			if (rs != null) rs.close();
			if (ps != null) ps.close();
			if (con != null) con.close();
		}
	}
	
	protected List<BoardDBBean> makeList(ResultSet rs) throws SQLException{
		List<BoardDBBean> list = new ArrayList<>();
		while(rs.next()) {
			BoardDBBean dto = new BoardDBBean();
			dto.setNum(rs.getInt("num"));
			dto.setWriter(rs.getString("writer"));
			dto.setEmail(rs.getString("email"));
			dto.setSubject(rs.getString("subject"));
			dto.setPasswd(rs.getString("passwd"));
			dto.setReg_date(rs.getString("reg_date"));
			dto.setReadcount(rs.getInt("readcount"));
			dto.setContent(rs.getString("content"));
			dto.setIp(rs.getString("ip"));
			dto.setFilename(rs.getString("filename"));
			dto.setFilesize(rs.getInt("filesize"));
			list.add(dto);
		}
		return list;
	}
	
	public int insertBoard(MultipartRequest mr, String ip) throws SQLException{
		try {
			con = ds.getConnection();
	
			String sql = "insert into jsp_board2 values"
									+ "(board2_seq.nextval, ?,?,?,?,sysdate,0,?,?,?,?)";
			ps = con.prepareStatement(sql);
			ps.setString(1, mr.getParameter("writer"));
			ps.setString(2, mr.getParameter("email"));
			ps.setString(3, mr.getParameter("subject"));
			ps.setString(4, mr.getParameter("passwd"));
			ps.setString(5, mr.getParameter("content"));
			ps.setString(6, ip);
			ps.setString(7, mr.getFilesystemName("filename"));
			File file = mr.getFile("filename");
			int filesize = 0;
			if (file != null) {
				filesize = (int)file.length();
			}
			ps.setInt(8, filesize);
			return ps.executeUpdate();
		}finally {
			if (ps != null) ps.close();
			if (con != null) con.close();
		}
	}
	
	protected void plusReadcount(int num) throws SQLException{
		try {
			con = ds.getConnection();
			String sql = "update jsp_board2 set "
								+ "readcount = readcount + 1 where num = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, num);
			ps.executeUpdate();
		}finally {
			if (ps != null) ps.close();
			if (con != null) con.close();
		}
	}
	
	public BoardDBBean getBoard(int num, String mode) throws SQLException{
		try {
			if (mode.equals("content")) {
				plusReadcount(num);
			}
			con = ds.getConnection();
			String sql = "select * from jsp_board2 where num=?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, num);
			rs = ps.executeQuery();
			List<BoardDBBean> getBoard = makeList(rs);
			return getBoard.get(0);
			//return makeList(rs).get(0)
		}finally {
			if (rs != null) rs.close();
			if (ps != null) ps.close();
			if (con != null) con.close();
		}
	}
	
	protected boolean isPassword(int num, String passwd) 
																throws SQLException{
		try {
			con = ds.getConnection();
			String sql = "select passwd from jsp_board2 where num = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, num);
			rs = ps.executeQuery();
			rs.next();
			String dbPass = rs.getString(1);
			if (dbPass.equals(passwd)) {
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
	
	public int deleteBoard(int num, String passwd) throws SQLException{
		if (!isPassword(num, passwd)) {
			return -1;
		}
		try {
			con = ds.getConnection();
			String sql = "delete from jsp_board2 where num = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, num);
			int res = ps.executeUpdate();
			return res;//res값이 0이면 삭제 실패, 1이상이면 삭제 성공
		}finally {
			if (ps != null) ps.close();
			if (con != null) con.close();
		}
	}
	
	public int updateBoard(MultipartRequest mr) throws SQLException{
		int num = Integer.parseInt(mr.getParameter("num"));
		String passwd = mr.getParameter("passwd");
		if (!isPassword(num, passwd)) {
			return -1;
		}
		try {
			con = ds.getConnection();
			String sql = "update jsp_board2 set "
						+ "writer=?, email=?, subject=?, content=?, "
						+ "filename=?, filesize=? where num=?";
			ps = con.prepareStatement(sql);
			ps.setString(1, mr.getParameter("writer"));
			ps.setString(2, mr.getParameter("email"));
			ps.setString(3, mr.getParameter("subject"));
			ps.setString(4, mr.getParameter("content"));
			String filename = mr.getFilesystemName("filename");
			int filesize = 0;
			if (filename == null) {
				filename = mr.getParameter("filename2");
				filesize = Integer.parseInt(mr.getParameter("filesize"));
			}else {
				File file = mr.getFile("filename");
				filesize = (int)file.length();
			}
			ps.setString(5, filename);
			ps.setInt(6, filesize);
			ps.setInt(7, num);
			return ps.executeUpdate();
		}finally {
			if (ps != null) ps.close();
			if (con != null) con.close();
		}
	}
}






















