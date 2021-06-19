package dao;
import java.sql.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.sql.*;
import javax.naming.*;

public class SeBoardDao {
	private static SeBoardDao instance;
	private SeBoardDao() {}
	public static SeBoardDao getInstance() {
		if (instance == null) {	
			instance = new SeBoardDao();		
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
	

	
	public SeBoard select(int s_idx) throws SQLException {
		Connection conn = null;	
		Statement stmt= null; 
		ResultSet rs = null;
		String sql = "select * from selfid where s_idx="+s_idx;
		SeBoard Seboard = new SeBoard();
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			String s_content = null;
			rs = stmt.executeQuery(sql);
			if (rs.next()) {				
				Seboard.setS_idx(rs.getInt("s_idx"));
				Seboard.setM_num(rs.getInt("m_num"));
				Seboard.setS_type(rs.getInt("s_type"));
				Seboard.setS_companyname(rs.getString("s_companyname"));
				Seboard.setM_nickname(rs.getString("m_nickname"));
				Seboard.setS_content(rs.getString("s_content"));
				s_content = rs.getString("s_content");
				s_content = s_content.replace("\r\n","<br>");
				Seboard.setS_regdate(rs.getDate("s_regdate"));
			}
		} catch(Exception e) {	System.out.println(e.getMessage()); 
		} finally {
			if (rs !=null) rs.close();
			if (stmt != null) stmt.close();
			if (conn !=null) conn.close();
		}
		return Seboard;
	}

	public int getTotalCnt() throws SQLException {
		Connection conn = null;	
		Statement stmt= null; 
		ResultSet rs = null;    
		int tot = 0;
		String sql = "select count(*) from selfid where s_type=1";
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if (rs.next()) tot = rs.getInt(1);
		} catch(Exception e) {	
			System.out.println(e.getMessage()); 
		} finally {
			if (rs !=null) rs.close();
			if (stmt != null) stmt.close();
			if (conn !=null) conn.close();
		}
		return tot;
	}
	
//	public int getTotalCnt1() throws SQLException {
//		Connection conn = null;	
//		Statement stmt= null; 
////		PreparedStatement pstmt= null; 
//		ResultSet rs = null;    
//		int tot = 0;
//		String sql = "select count(*) from selfid where s_type=1";
//		try {
//			conn = getConnection();
////			pstmt = conn.prepareStatement(sql);
//			stmt = conn.createStatement();
//			rs = stmt.executeQuery(sql);
//			//pstmt.setInt(1, s_type);
////			rs = pstmt.executeQuery();
//			if (rs.next()) tot = rs.getInt(1);
//		} catch(Exception e) {	
//			System.out.println(e.getMessage()); 
//		} finally {
//			if (rs !=null) rs.close();
//			if (stmt != null) stmt.close();
////			if (pstmt != null) pstmt.close();
//			if (conn !=null) conn.close();
//		}
//		return tot;
//	}

	public int getTotalCnt1(int m_num) throws SQLException {
		Connection conn = null;	
//		Statement stmt= null; 
		PreparedStatement pstmt= null; 
		ResultSet rs = null;    
		int tot = 0;
		String sql = "select count(*) from selfid where m_num=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
//			stmt = conn.createStatement();
//			rs = stmt.executeQuery(sql);
			pstmt.setInt(1, m_num);
			rs = pstmt.executeQuery();
			if (rs.next()) tot = rs.getInt(1);
		} catch(Exception e) {	
			System.out.println(e.getMessage()); 
		} finally {
			if (rs !=null) rs.close();
//			if (stmt != null) stmt.close();
			if (pstmt != null) pstmt.close();
			if (conn !=null) conn.close();
		}
		return tot;
	}
	
	public List<SeBoard> list(int startRow, int endRow) throws SQLException {
		List<SeBoard> list = new ArrayList<SeBoard>();
		Connection conn = null;	
		PreparedStatement pstmt= null; 
		ResultSet rs = null;
		 String sql = "select * from (select rownum rn ,a.* from " + 
			"  (select * from selfid where s_type = 1 order by s_idx desc) a ) "+
			" where rn between ? and ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				SeBoard Seboard = new SeBoard();
				Seboard.setS_idx(rs.getInt("s_idx"));
				Seboard.setM_num(rs.getInt("m_num"));
				Seboard.setS_type(rs.getInt("s_type"));
				Seboard.setS_companyname(rs.getString("s_companyname"));
				Seboard.setM_nickname(rs.getString("m_nickname"));
				Seboard.setS_content(rs.getString("s_content"));
				Seboard.setS_regdate(rs.getDate("s_regdate"));
				list.add(Seboard);
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

	public List<SeBoard> list2(int startRow, int endRow,int m_num ) throws SQLException {
		List<SeBoard> list = new ArrayList<SeBoard>();
		Connection conn = null;	
		PreparedStatement pstmt= null;
		ResultSet rs = null;
		 String sql = "select * from (select rownum rn ,a.* from " + 
			"  (select * from selfid where m_num = ? order by s_regdate desc) a ) "+
			" where rn between ? and ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, m_num);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				SeBoard Seboard = new SeBoard();
				Seboard.setS_idx(rs.getInt("s_idx"));
				Seboard.setM_num(rs.getInt("m_num"));
				Seboard.setS_type(rs.getInt("s_type"));
				Seboard.setS_companyname(rs.getString("s_companyname"));
				Seboard.setM_nickname(rs.getString("m_nickname"));
				Seboard.setS_content(rs.getString("s_content"));
				Seboard.setS_regdate(rs.getDate("s_regdate"));
				list.add(Seboard);
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

	public int update(SeBoard Seboard) throws SQLException {
		System.out.println("update옴");
		Connection conn = null;	
		PreparedStatement pstmt= null; 
		int result = 0;			
		String sql="update selfid set s_companyname=?, s_content=?, s_type=? where s_idx=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, Seboard.getS_companyname());
			pstmt.setString(2, Seboard.getS_content());
			pstmt.setInt(3, Seboard.getS_type());
			pstmt.setInt(4, Seboard.getS_idx());
			
			result = pstmt.executeUpdate();
		} catch(Exception e) {	
			System.out.println(e.getMessage()); 
		} finally {
			if (pstmt != null) pstmt.close();
			if (conn !=null) conn.close();
		}
		return result;
	}
	public int insert(SeBoard Seboard) throws SQLException  {		
		System.out.println("insert왔음");
		System.out.println(Seboard.getS_content());
		int s_idx = Seboard.getS_idx();
		Connection conn = null;	
		PreparedStatement pstmt= null; 
		int result = 0;			
		ResultSet rs = null;
		String sql1 = "select nvl(max(s_idx),0)  from selfid";
		String sql="insert into selfid values(?,?,?,?,?,?,sysdate)";
		try {			
			conn = getConnection();
			pstmt = conn.prepareStatement(sql1);
			rs = pstmt.executeQuery();
			rs.next();
			int number = rs.getInt(1) + 1;  
			rs.close();   
			pstmt.close();
			if(s_idx == 0) Seboard.setS_idx(number);
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, number);
			pstmt.setInt(2, Seboard.getM_num());
			pstmt.setInt(3, Seboard.getS_type());
			pstmt.setString(4, Seboard.getS_companyname());
			pstmt.setString(5, Seboard.getM_nickname());
			pstmt.setString(6, Seboard.getS_content());
			result = pstmt.executeUpdate(); 
		} catch(Exception e) {	
			System.out.println(e.getMessage()); 
		} finally {
			if (rs !=null) rs.close();
			if (pstmt != null) pstmt.close();
			if (conn !=null) conn.close();
		}
		return result;	
    }
	
	
	
	
	public int delete(int s_idx) throws SQLException {
			Connection conn = null;
			PreparedStatement pstmt = null;
			int result = 0;
			String sql = "delete from selfid where s_idx=?";
			try {
				conn = getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, s_idx);	
				result = pstmt.executeUpdate();
						
				
			} catch(Exception e) {
				System.out.println(e.getMessage());
			} finally {
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
			}
		return result;
	}
/////////////////////////////////////////////////
	   
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
		
		public int enupdate(int m_num) throws SQLException {
		System.out.println("enupdate옴");
		Connection conn = null;	
		PreparedStatement pstmt= null;
		int result = 0;
		String sql="update user1 set m_divide=1 where m_num=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql); 
			pstmt.setInt(1, m_num);
			result = pstmt.executeUpdate();
		} catch(Exception e) {	
			System.out.println(e.getMessage());
		} finally {
			if (pstmt != null) pstmt.close();
			if (conn !=null) conn.close();
		}
		return result;
	}
		
		////테스트/////////////////////////////////////////////////////////////
}