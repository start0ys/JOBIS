package dao;
import java.sql.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.sql.*;
import javax.naming.*;

public class UserDao {
	private static UserDao instance;
	private UserDao() {}
	public static UserDao getInstance() {
		if (instance == null) {	
			instance = new UserDao();		
		}
		return instance;
	}
	private Connection getConnection() {
		Connection conn = null;
		try {
			Context ctx = new InitialContext();
			DataSource ds = (DataSource)
				ctx.lookup("java:comp/env/jdbc/OracleDB");
			conn = ds.getConnection();
		}catch(Exception e) { 
			System.out.println(e.getMessage());	
		}
		return conn;
	}
	
	/*
	 * public User list(int num) throws SQLException { Connection conn = null;
	 * Statement stmt= null; ResultSet rs = null; String sql =
	 * "select * from user1"; User user = new User(); try { conn = getConnection();
	 * stmt = conn.createStatement(); rs = stmt.executeQuery(sql); if (rs.next()) {
	 * user.setM_num(rs.getInt("M_num")); user.setM_id(rs.getString("M_id"));
	 * user.setM_divide(rs.getInt("M_divide"));
	 * user.setM_birth(rs.getInt("M_birth"));
	 * user.setM_name(rs.getString("M_name"));
	 * user.setM_nickname(rs.getString("M_nickname"));
	 * user.setMail(rs.getString("Mail")); } } catch(Exception e) {
	 * System.out.println(e.getMessage()); } finally { if (rs !=null) rs.close(); if
	 * (stmt != null) stmt.close(); if (conn !=null) conn.close(); } return user; }
	 */
	
	
	public int getTotalUser() throws SQLException {
		Connection conn = null;	
		Statement stmt= null; 
		ResultSet rs = null;    
		int tou = 0;
		String sql = "select count(*) from user1";
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if (rs.next()) tou = rs.getInt(1);
		} catch(Exception e) {	
			System.out.println(e.getMessage()); 
		} finally {
			if (rs !=null) rs.close();
			if (stmt != null) stmt.close();
			if (conn !=null) conn.close();
		}
		return tou;
	}
	
	public List<User> list(int startRow, int endRow) throws SQLException {
		List<User> list = new ArrayList<User>();
		Connection conn = null;	
		PreparedStatement pstmt= null;
		ResultSet rs = null;
		 String sql = "select * from (select rownum rn ,a.* from " + 
			"  (select * from user1 order by M_num asc) a ) "+
			" where rn between ? and ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				User user = new User();
				user.setM_num(rs.getInt("m_num"));
				user.setM_id(rs.getString("m_id"));
				user.setM_divide(rs.getInt("m_divide"));
				user.setM_birth(rs.getDate("m_birth"));
				user.setM_name(rs.getString("m_name"));
				user.setM_nickname(rs.getString("m_nickname"));
				user.setMail(rs.getString("mail"));
				list.add(user);
			}
		} catch(Exception e) {	
			System.out.println(e.getMessage()); 
		} finally {
			if (rs !=null) rs.close();
			if (pstmt != null) pstmt.close();
			if (conn !=null) conn.close();
		} 
		return list;
	}
	
	public int GradeUp(int m_num) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = "update user1 set m_divide = 1 where m_num = ? ";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, m_num);
			pstmt.executeUpdate();
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			if (pstmt != null) pstmt.close();
			if (conn  != null) conn.close();
		}
		return result;
	}
	
	public int GradeDown(int m_num) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = "update user1 set m_divide = 0 where m_num = ? ";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,m_num);
			pstmt.executeUpdate();
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			if (pstmt != null) pstmt.close();
			if (conn  != null) conn.close();
		}
		return result;
	}	
	
		
	
}
