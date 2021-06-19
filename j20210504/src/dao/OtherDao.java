package dao;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import service.CommandProcess;

public class OtherDao {
	private static OtherDao instance;
	private OtherDao() { }
	
	public static OtherDao getInstance() {
		if(instance == null) {
			instance = new OtherDao();
		}
		return instance;
	}
	
	private Connection getConnection() {
		Connection conn = null;
		try {
			Context ctx = new InitialContext();
			DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/OracleDB");
			conn = ds.getConnection();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return conn;
	}
	
	public int login(String id , String password) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = -1;
		String sql = "select m_pw from user1 where m_id = ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				if(rs.getString("m_pw").equals(password)) result = 1;
				else                                          result = 0;
			} 
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if (rs != null) rs.close();
			if (pstmt != null) pstmt.close();
			if (conn  != null) conn.close();
		}
		return result;
	}
	
	public String getNickname(int m_num) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select m_nickname from user1 where m_num = ?";
		String m_nickname = "";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, m_num);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				m_nickname = rs.getString("m_nickname");
			} 
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if (rs != null) rs.close();
			if (pstmt != null) pstmt.close();
			if (conn  != null) conn.close();
		}
		return m_nickname;
	}
	
	public int getM_num(String id) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select m_num from user1 where m_id = ?";
		int m_num = 0;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				m_num = rs.getInt("m_num");
			} 
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if (rs != null) rs.close();
			if (pstmt != null) pstmt.close();
			if (conn  != null) conn.close();
		}
		return m_num;
	}
	
	public int delete(int m_num) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		String sql = "delete from user1 where m_num= ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, m_num);
			result = pstmt.executeUpdate();					
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			if (pstmt != null) pstmt.close();
			if (conn  != null) conn.close();
		}
		return result;
	}
	
	public Other select(int m_num) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Other other = new Other();
		String sql = "select * from user1 where m_num = ? ";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, m_num);
			rs = pstmt.executeQuery();
			if(rs.next()){
				other.setM_id(rs.getString("m_id"));
				other.setM_pw(rs.getString("m_pw"));
				other.setM_name(rs.getString("m_name"));
				other.setM_sex(rs.getString("m_sex"));
				other.setMail(rs.getString("mail"));
				other.setCollege(rs.getString("college"));
				other.setMajor(rs.getString("major"));
				other.setMillitary(rs.getString("millitary"));
				other.setM_dept(rs.getString("m_dept"));
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}  finally {
			if ( rs   != null)  rs.close();
			if (pstmt != null)  pstmt.close();
			if (conn  != null)  conn.close();
		}
		return other;
	}
	
	public int update(Other other) throws SQLException {
		Connection conn = null;	
		PreparedStatement pstmt= null; 
		int result = 0;
		String sql = "update user1 set m_pw=?, m_name=?, m_sex=?, mail=?, m_nickname=?,"
				   + "college=?, major=?, millitary=?, m_dept=? where m_num=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, other.getM_pw());
			pstmt.setString(2, other.getM_name());
			pstmt.setString(3, other.getM_sex());
			pstmt.setString(4, other.getMail());
			pstmt.setString(5, other.getM_nickname());
			pstmt.setString(6, other.getCollege());
			pstmt.setString(7, other.getMajor());
			pstmt.setString(8, other.getMillitary());
			pstmt.setString(9, other.getM_dept());
			pstmt.setInt(10, other.getM_num());
			result = pstmt.executeUpdate();
		} catch(Exception e) {
			System.out.println(e.getMessage());
		} finally{
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
		}
		return result;
	}
}