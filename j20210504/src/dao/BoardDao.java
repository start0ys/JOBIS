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

public class BoardDao {
	private static BoardDao instance;
	private BoardDao() { }
	
	public static BoardDao getInstance() {
		if(instance == null) {
			instance = new BoardDao();
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
	
	public int write(Board board ) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		String sql1 = "select nvl(max(b_idx),0) + 1 from board";
		String sql = "insert into board values(?,?,?,?,?,sysdate,?,?,?,?)";
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
			pstmt.setInt(2, board.getM_num());
			pstmt.setInt(3, board.getB_type());
			pstmt.setString(4, board.getB_title());
			pstmt.setString(5, board.getM_nickname());
			pstmt.setString(6, board.getB_content());
			pstmt.setInt(7, board.getB_count());
			pstmt.setString(8, board.getB_img());
			pstmt.setInt(9, board.getB_notice());
			
			result = pstmt.executeUpdate();

		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if ( rs   != null)  rs.close();
			if (pstmt != null) pstmt.close();
			if (conn  != null) conn.close();
		}
		return result;
	}
	
	
	////////////////////////////////////
	public void readCount(int b_idx) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "update board set b_count = b_count + 1 where b_idx = ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,b_idx);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			if (pstmt != null) pstmt.close();
			if (conn  != null) conn.close();
		}
	}
	
	public int getTotalCnt(int b_type, String s_type, String search) throws SQLException {
		int type = Integer.parseInt(s_type);
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int tot = 0;
		String sql = "select count(*) from board where b_type = ?";
		String sql1 = "select count(*) from board where b_type = ? and b_title like ?";
		String sql2 = "select count(*) from board where b_type = ? and m_nickname like ?";
		try {
			if(type == 1) {
				conn = getConnection();
				pstmt = conn.prepareStatement(sql1);
				pstmt.setInt(1, b_type);
				pstmt.setString(2, "%"+search+"%");
				rs = pstmt.executeQuery();
				if(rs.next()){
					tot = rs.getInt(1);
				}
			} else if (type == 2) {
				conn = getConnection();
				pstmt = conn.prepareStatement(sql2);
				pstmt.setInt(1, b_type);
				pstmt.setString(2, "%"+search+"%");
				rs = pstmt.executeQuery();
				if(rs.next()){
					tot = rs.getInt(1);
				}
			} else {
				conn = getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, b_type);
				rs = pstmt.executeQuery();
				if(rs.next()){
					tot = rs.getInt(1);
				}
			}
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}  finally {
			if ( rs   != null)  rs.close();
			if (pstmt  != null)  pstmt.close();
			if (conn  != null)  conn.close();
		}
		return tot;
	}
	
	public List<Board> list (int startRow, int endRow, int b_type, String s_type, String search) throws SQLException{
		int type = Integer.parseInt(s_type);
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Board> list = new ArrayList<Board>();
		String sql = "select * from "
								+ "(select rownum rn, a.* from "
																+ "(select * from board where b_type = ? order by b_idx desc) a )"
								+ " where rn between ? and ?";
		
		String sql1 = "select * from "
				+ "(select rownum rn, a.* from "
												+ "(select * from board where b_type = ? and b_title like ? order by b_idx desc) a )"
				+ " where rn between ? and ?";
		
		String sql2 = "select * from "
				+ "(select rownum rn, a.* from "
												+ "(select * from board where b_type = ? and m_nickname like ? order by b_idx desc) a )"
				+ " where rn between ? and ?";
		
		try {
			
			if(type == 1) {
				conn = getConnection();
				pstmt = conn.prepareStatement(sql1);
				pstmt.setInt(1, b_type);
				pstmt.setString(2, "%"+search+"%");
				pstmt.setInt(3, startRow);
				pstmt.setInt(4, endRow);
				rs = pstmt.executeQuery();
				if(rs.next()){
					do{
						Board board = new Board();
						board.setB_idx(rs.getInt("b_idx"));
						board.setM_num(rs.getInt("m_num"));
						board.setB_type(rs.getInt("b_type"));
						board.setB_title(rs.getString("b_title"));
						board.setM_nickname(rs.getString("m_nickname"));
						board.setB_regdate(rs.getDate("b_regdate"));
						board.setB_content(rs.getString("b_content"));
						board.setB_count(rs.getInt("b_count"));
						board.setB_img(rs.getString("b_img"));
						board.setB_notice(rs.getInt("b_notice"));
						list.add(board);
					} while(rs.next());
				}
			} else if (type == 2) {
				conn = getConnection();
				pstmt = conn.prepareStatement(sql2);
				pstmt.setInt(1, b_type);
				pstmt.setString(2, "%"+search+"%");
				pstmt.setInt(3, startRow);
				pstmt.setInt(4, endRow);
				rs = pstmt.executeQuery();
				if(rs.next()){
					do{
						Board board = new Board();
						board.setB_idx(rs.getInt("b_idx"));
						board.setM_num(rs.getInt("m_num"));
						board.setB_type(rs.getInt("b_type"));
						board.setB_title(rs.getString("b_title"));
						board.setM_nickname(rs.getString("m_nickname"));
						board.setB_regdate(rs.getDate("b_regdate"));
						board.setB_content(rs.getString("b_content"));
						board.setB_count(rs.getInt("b_count"));
						board.setB_img(rs.getString("b_img"));
						board.setB_notice(rs.getInt("b_notice"));
						list.add(board);
					} while(rs.next());
				}
			} else {
				conn = getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, b_type);
				pstmt.setInt(2, startRow);
				pstmt.setInt(3, endRow);
				rs = pstmt.executeQuery();
				if(rs.next()){
					do{
						Board board = new Board();
						board.setB_idx(rs.getInt("b_idx"));
						board.setM_num(rs.getInt("m_num"));
						board.setB_type(rs.getInt("b_type"));
						board.setB_title(rs.getString("b_title"));
						board.setM_nickname(rs.getString("m_nickname"));
						board.setB_regdate(rs.getDate("b_regdate"));
						board.setB_content(rs.getString("b_content"));
						board.setB_count(rs.getInt("b_count"));
						board.setB_img(rs.getString("b_img"));
						board.setB_notice(rs.getInt("b_notice"));
						list.add(board);
					} while(rs.next());
				}
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}  finally {
			if ( rs   != null)  rs.close();
			if (pstmt  != null)  pstmt.close();
			if (conn  != null)  conn.close();
		}
		return list;
	}
	
	public List<Board> best (int b_type) throws SQLException{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Board> list = new ArrayList<Board>();
		String sql = "select * from "
								+ "(select rownum rn, a.* from "
																+ "(select * from board where b_type = ? order by b_count desc) a )"
								+ " where rn between 1 and 3";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, b_type);
			rs = pstmt.executeQuery();
			if(rs.next()){
				do{
					Board board = new Board();
					board.setB_idx(rs.getInt("b_idx"));
					board.setM_num(rs.getInt("m_num"));
					board.setB_type(rs.getInt("b_type"));
					board.setB_title(rs.getString("b_title"));
					board.setM_nickname(rs.getString("m_nickname"));
					board.setB_regdate(rs.getDate("b_regdate"));
					board.setB_content(rs.getString("b_content"));
					board.setB_count(rs.getInt("b_count"));
					board.setB_img(rs.getString("b_img"));
					board.setB_notice(rs.getInt("b_notice"));
					list.add(board);
				} while(rs.next());
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}  finally {
			if ( rs   != null)  rs.close();
			if (pstmt  != null)  pstmt.close();
			if (conn  != null)  conn.close();
		}
		return list;
	}
	
	
	
	
	public Board select(int b_idx) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Board board = new Board();
		String sql = "select * from board where b_idx = ? ";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, b_idx);
			rs = pstmt.executeQuery();
			if(rs.next()){
				board.setB_idx(rs.getInt("b_idx"));
				board.setM_num(rs.getInt("m_num"));
				board.setB_type(rs.getInt("b_type"));
				board.setB_title(rs.getString("b_title"));
				board.setM_nickname(rs.getString("m_nickname"));
				board.setB_regdate(rs.getDate("b_regdate"));
				board.setB_content(rs.getString("b_content"));
				board.setB_count(rs.getInt("b_count"));
				board.setB_img(rs.getString("b_img"));
				board.setB_notice(rs.getInt("b_notice"));
				
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}  finally {
			if ( rs   != null)  rs.close();
			if (pstmt  != null)  pstmt.close();
			if (conn  != null)  conn.close();
		}
		return board;
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
	
	
	////테스트/////////////////////////////////////////////////////////////
}
