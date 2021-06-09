package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemberDao {
	private static MemberDao instance;
	private MemberDao() {}
	public static MemberDao getInstance() {
		if (instance == null) {
			instance = new MemberDao();
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
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return conn;
	}
		
	public int insert(Member member) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
	    String sql1 = "select nvl(max(M_num),0) + 1 from user1";
		String sql =  "INSERT INTO user1(M_num,M_id,M_birth,M_sex,M_pw,M_nickname,M_name,mail) values(?,?,?,?,?,?,?,?)";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql1);
	        rs = pstmt.executeQuery();
	        rs.next();
	        int number = rs.getInt(1);
	        rs.close();
	        pstmt.close();
			pstmt = conn.prepareStatement(sql);	
			pstmt.setInt(1, number);
			pstmt.setString(2, member.getId());
            pstmt.setDate(3, (Date) member.getBirth());
            pstmt.setString(4, member.getGender());
            pstmt.setString(5, member.getPw());
            pstmt.setString(6, member.getNickname());
            pstmt.setString(7, member.getName());
            pstmt.setString(8, member.getEmail());
            result = pstmt.executeUpdate();
            System.out.println(result);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result; 
	}
	public int idchk(String id) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		String sql = "select count(*) from user1 where M_id=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			rs.next();
			result = rs.getInt(1);
			rs.close();
			pstmt.close();
			conn.close();
			System.out.println(result);
		} catch (Exception e) {
		System.out.println(e.getMessage());
		} 
		return result;
	}
		
	public int getM_divide(int m_num) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select m_divide from user1 where m_num = ?";
		int m_divide = 0;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, m_num);
			rs = pstmt.executeQuery();
			if (rs.next()) {
			m_divide = rs.getInt("m_divide");
			} 
			
		} catch (Exception e) {
		System.out.println(e.getMessage());
		} finally {
		if (rs != null) rs.close();
		if (pstmt != null) pstmt.close();
		if (conn  != null) conn.close();
		}
		return m_divide;
	}
	

	/////테스트/////////////////////////////////////////////////////////
	
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
			else                                      result = 0;
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
			
			
			////테스트/////////////////////////////////////////////////////////////

}
