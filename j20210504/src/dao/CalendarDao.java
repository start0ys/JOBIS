package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class CalendarDao {
	private static CalendarDao instance;
	private CalendarDao() {}
	public static CalendarDao getInstance() {
		if (instance == null) {
			instance = new CalendarDao();
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
		
	public int insert(int m_num, int cal_cate, Calendar1 calendar) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
	    String sql1 = "select max(substr(cal_num, -2, 2)) from calendar1 where m_num=?";
	    String sql2 = "select m_id from calendar1 where M_num=?";
		String sql =  "INSERT INTO calendar1 values(?,?,?,?,?,?,?,?)";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql1);
			pstmt.setInt(1, m_num);
	        rs = pstmt.executeQuery();
	        rs.next();
	        String cal_num = String.format("%02d", m_num) + String.format("%02d", Integer.parseInt(rs.getString(1))+1);
	        System.out.println(cal_num);
	        rs.close();
	        pstmt.close();
	        pstmt = conn.prepareStatement(sql2);
			pstmt.setInt(1, m_num);
	        rs = pstmt.executeQuery();
	        rs.next();
	        String m_id = rs.getString(1);
	        rs.close();
	        pstmt.close();	        
			pstmt = conn.prepareStatement(sql);	
			pstmt.setInt(1, m_num);
			pstmt.setString(2, cal_num);
            pstmt.setString(3, m_id);
            pstmt.setInt(4, cal_cate);
            pstmt.setString(5, calendar.getCal_title());
            pstmt.setString(6, calendar.getCal_date());
            pstmt.setString(7, calendar.getCal_contents());
            pstmt.setString(8, calendar.getCal_bgcolor());
            result = pstmt.executeUpdate();
            System.out.println(result);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if (pstmt != null) pstmt.close();
			if (conn  != null) conn.close();
		}
		return result; 
	}
	
	public int Delete(String cal_num) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int result = 0;
		String sql =  "delete from calendar1 where cal_num=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, cal_num);
	        result = pstmt.executeUpdate();
	        System.out.println(result);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if (pstmt != null) pstmt.close();
			if (conn  != null) conn.close();
		}
		return result; 
	}
	
	public List<Calendar1> list(int M_num, String first , String last) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Calendar1> list = new ArrayList<Calendar1>();
		String sql = "select "
				+ "case when substr(cal_date,7,8) = 01 then substr(cal_date,8,8)"
				+ "when substr(cal_date,7,8) = 02 then substr(cal_date,8,8)"
				+ "when substr(cal_date,7,8) = 03 then substr(cal_date,8,8)"
				+ "when substr(cal_date,7,8) = 04 then substr(cal_date,8,8)"
				+ "when substr(cal_date,7,8) = 05 then substr(cal_date,8,8)"
				+ "when substr(cal_date,7,8) = 06 then substr(cal_date,8,8)"
				+ "when substr(cal_date,7,8) = 07 then substr(cal_date,8,8)"
				+ "when substr(cal_date,7,8) = 08 then substr(cal_date,8,8)"
				+ "when substr(cal_date,7,8) = 09 then substr(cal_date,8,8)"
				+ "else substr(cal_date,7,8) end as cal_date,"
				+ "cal_Title, cal_bgcolor from calendar1 where M_num in (0,?) and cal_date >= to_date(?,'yyyy-mm-dd') and cal_date < to_date(?,'yyyy-mm-dd')";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, M_num);
			pstmt.setString(2, first);
			pstmt.setString(3, last);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				do {
					Calendar1 calendar = new Calendar1();
					calendar.setCal_date(rs.getString("cal_date"));
					calendar.setCal_title(rs.getString("cal_title"));
					calendar.setCal_bgcolor(rs.getString("cal_bgcolor"));
					list.add(calendar);
				}while(rs.next());
			}			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}finally {
			if ( rs   != null)  rs.close();
			if (pstmt  != null)  pstmt.close();
			if (conn  != null)  conn.close();
		}
		return list;
	}
	
	public List<Calendar1> dlist(int m_num, String cal_date) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Calendar1> dlist = new ArrayList<Calendar1>();
		String sql = "select cal_num, cal_title, cal_bgcolor, cal_contents from calendar1 where M_num=? and cal_date=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, m_num);
			pstmt.setString(2, cal_date);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				do {
					Calendar1 calendar = new Calendar1();
					calendar.setCal_num(rs.getString("cal_num"));
					calendar.setCal_title(rs.getString("cal_title"));
					calendar.setCal_contents(rs.getString("cal_contents"));
					calendar.setCal_bgcolor(rs.getString("cal_bgcolor"));
					dlist.add(calendar);
					System.out.println(rs.getString("cal_num"));
				}while(rs.next());
			}			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}finally {
			if ( rs   != null)  rs.close();
			if (pstmt  != null)  pstmt.close();
			if (conn  != null)  conn.close();
		}
		return dlist;
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
	
	 


}
