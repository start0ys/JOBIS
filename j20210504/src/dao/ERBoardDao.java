package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class ERBoardDao {
	private static ERBoardDao instance;
	private ERBoardDao() {}
	public static ERBoardDao getInstance() {
		if (instance == null) {	
			instance = new ERBoardDao();		
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
	public ERBoard erSelect(int m_num) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql1 = "select u.m_name, u.mail, u.additions, u.college, u.major, u.date1, u.date2,"
				+ "  u.date2, u.credit, u.millitary, u.m_dept, u.m_class, u.m_date1, u.m_date2,u.photo,"
				+ "  m.ename, m.edate1, m.edate2, m.ejob, m.econtent, m.aname, m.adate1, m.adate2,"
				+ "  m.acontent, c2.col, c1.tnumber, c1.tname, c1.tscore, c1.tdate, c2.ldept, c2.lname, "
				+ "  c2.ldate, p.p_id, p.price, p.pcontent, p.pdate, p.pdept, p.pname"
				+ " from user1 u, mycompany m, cert1 c1, cert2 c2, prizes p"
				+ " where u.m_num = ? "
				+ " and u.m_num = m.m_num(+)"
				+ " and u.m_num = c1.m_num(+)"
				+ " and u.m_num = c2.m_num(+)"
				+ " and u.m_num = p.m_num(+)";
		System.out.println("ERBoardDao erSelect sql1->"+sql1);
		System.out.println("ERBoardDao erSelect m_num->"+m_num);
		ERBoard erboard = new ERBoard();
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql1);
			pstmt.setInt(1, m_num);			
			rs = pstmt.executeQuery();
			if (rs.next()) {
				erboard.setM_num(m_num);
				erboard.setM_name(rs.getString("m_name"));
				erboard.setMail(rs.getString("mail"));
				erboard.setAdditions(rs.getString("additions"));
				erboard.setCollege(rs.getString("college"));
				erboard.setMajor(rs.getString("major"));
				erboard.setDate1(rs.getString("date1"));
				erboard.setDate2(rs.getString("date2"));
				erboard.setCredit(rs.getString("credit"));
				erboard.setMillitary(rs.getString("millitary"));
				erboard.setM_class(rs.getString("m_class"));
				erboard.setM_dept(rs.getString("m_dept"));
				erboard.setM_date1(rs.getString("m_date1"));
				erboard.setM_date2(rs.getString("m_date2"));
				erboard.setPhoto(rs.getString("photo"));
				erboard.setEname(rs.getString("ename"));
				erboard.setEdate1(rs.getString("edate1"));
				erboard.setEdate2(rs.getString("edate2"));
				erboard.setEjob(rs.getString("ejob"));
				erboard.setEcontent(rs.getString("econtent"));
				erboard.setAname(rs.getString("aname"));
				erboard.setAdate1(rs.getString("adate1"));
				erboard.setAdate2(rs.getString("adate2"));
				erboard.setAcontent(rs.getString("acontent"));
				erboard.setTname(rs.getString("tname"));
				erboard.setTdate(rs.getString("tdate"));
				erboard.setTscore(rs.getString("tscore"));
				erboard.setTnumber(rs.getString("tnumber"));
				erboard.setCol(rs.getString("col"));
				erboard.setLname(rs.getString("lname"));
				erboard.setLdept(rs.getString("ldept"));
				erboard.setLdate(rs.getString("ldate"));
				erboard.setPname(rs.getString("pname"));
				erboard.setPrice(rs.getString("price"));
				erboard.setPdept(rs.getString("pdept"));
				erboard.setPdate(rs.getString("pdate"));
				erboard.setPcontent(rs.getString("pcontent"));
				erboard.setP_id(rs.getString("p_id"));
			}
			
		}catch (Exception e) {
			System.out.println("ERBoardDao erSelect->"+e.getMessage());
		}finally {
			if (rs != null) rs.close();
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
		} 
		return erboard;
	}
	
	public int erNew(ERBoard erboard) throws SQLException {
		int num = erboard.getM_num();
		Connection conn = null;
		PreparedStatement pstmt = null;
		int result = 0;
		String sql1 = "update user1 set m_name=?, mail=?, additions=?, college=?, "
				+ "major=?, date1=?, date2=?, credit=?, millitary=?, m_dept=?,"
				+ "m_class=?, m_date1=?, m_date2=? where m_num=? ";
		String sql2 = "insert into mycompany values(?,?,?,?,?,?,?,?,?,?)";
		String sql3 = "insert into cert1 values(?,?,?,?,?)";
		String sql4 = "insert into cert2 values(?,?,?,?,?)";
		String sql5 = "insert into prizes values(?,?,?,?,?,?,?)";
		
		try {
			conn = getConnection(); 
			if (num !=0) { 
				pstmt = conn.prepareStatement(sql1);
				pstmt.setString(1, erboard.getM_name());
				pstmt.setString(2, erboard.getMail());
				pstmt.setString(3, erboard.getAdditions());
				pstmt.setString(4, erboard.getCollege());
				pstmt.setString(5, erboard.getMajor());
				pstmt.setString(6, erboard.getDate1());
				pstmt.setString(7, erboard.getDate2());
				pstmt.setString(8, erboard.getCredit());
				pstmt.setString(9, erboard.getMillitary());
				pstmt.setString(10, erboard.getM_dept());
				pstmt.setString(11, erboard.getM_class());
				pstmt.setString(12, erboard.getM_date1());
				pstmt.setString(13, erboard.getM_date2());
				pstmt.setInt(14, erboard.getM_num());
				result = pstmt.executeUpdate();
				pstmt.close();
				pstmt = conn.prepareStatement(sql2);
				pstmt.setInt(1, erboard.getM_num());
				pstmt.setString(2, erboard.getAname());
				pstmt.setString(3, erboard.getAdate1());
				pstmt.setString(4, erboard.getAdate2());
				pstmt.setString(5, erboard.getEdate1());
				pstmt.setString(6, erboard.getEname());
				pstmt.setString(7, erboard.getAcontent());
				pstmt.setString(8, erboard.getEcontent());
				pstmt.setString(9, erboard.getEjob());
				pstmt.setString(10, erboard.getEdate2());
				pstmt.close();
				pstmt = conn.prepareStatement(sql3);
				pstmt.setString(1, erboard.getTnumber());
				pstmt.setInt(2, erboard.getM_num());
				pstmt.setString(3, erboard.getTname());
				pstmt.setString(4, erboard.getTscore());
				pstmt.setString(5, erboard.getTdate());
				pstmt.close();
				pstmt = conn.prepareStatement(sql4);
				pstmt.setString(1, erboard.getCol());
				pstmt.setInt(2, erboard.getM_num());
				pstmt.setString(3, erboard.getLdept());
				pstmt.setString(4, erboard.getLname());
				pstmt.setString(5, erboard.getLdate());
				pstmt.close();
				pstmt = conn.prepareStatement(sql5);
				pstmt.setInt(1, erboard.getM_num());
				pstmt.setString(2, erboard.getPrice());
				pstmt.setString(3, erboard.getPcontent());
				pstmt.setString(4, erboard.getPdate());
				pstmt.setString(5, erboard.getPdept());
				pstmt.setString(6, erboard.getPname());
				pstmt.setString(7, erboard.getP_id());
			} 
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}
		 finally {
				if (pstmt != null) pstmt.close();
				if (conn != null) conn.close();
		}
		return result;
	}
	
	public int erUpdate1(ERBoard erboard) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int result1 = 0;
		String sql1 = "update user1 set m_name=?,mail=?,additions=?, college=?, major=?,date1=?, "
				+ "date2=?,credit=?,millitary=?,m_dept=?,m_class=?,m_date1=?,m_date2=?, photo=?"
				+ " where m_num=?";		
		System.out.println("ERBoardDao erUpdate sql1->"+sql1);

		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql1);
			pstmt.setString(1, erboard.getM_name());
			pstmt.setString(2, erboard.getMail());
			pstmt.setString(3, erboard.getAdditions());
			pstmt.setString(4, erboard.getCollege());
			pstmt.setString(5, erboard.getMajor());
			pstmt.setString(6, erboard.getDate1());
			pstmt.setString(7, erboard.getDate2());
			pstmt.setString(8, erboard.getCredit());
			pstmt.setString(9, erboard.getMillitary());
			pstmt.setString(10, erboard.getM_dept());
			pstmt.setString(11, erboard.getM_class());
			pstmt.setString(12, erboard.getM_date1());
			pstmt.setString(13, erboard.getM_date2());
			pstmt.setString(14, erboard.getPhoto());
			pstmt.setInt(15, erboard.getM_num());
			result1 = pstmt.executeUpdate();
			System.out.println("ERBoardDao prepareStatement sql1...");
			
			
		} catch (Exception e) {
			System.out.println("ERBoardDao erUpdate1 Exception->"+e.getMessage());
		} finally {
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
		}
		return result1;
	}

	public int erUpdate2(ERBoard erboard) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result2 = 0;
		int number = 0;
		String sql1 = "select count(*) from mycompany where m_num=?";
		String sql2 = "update mycompany set aname=?,adate1=?,adate2=?,edate1=?,ename=?"
				+ ",acontent=?,econtent=?,ejob=?,edate2=? where m_num=?";
		String sql3 = "insert into mycompany values(?,?,?,?,?,?,?,?,?,?)";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql1);
			pstmt.setInt(1, erboard.getM_num());
			System.out.println("ERBoardDao erUpdate2 select sql1->"+sql1);
			System.out.println("ERBoardDao erUpdate2 select m_num->"+erboard.getM_num());
			rs = pstmt.executeQuery();
			if (rs.next()) number = rs.getInt(1);
			else 	       number = 0;
			System.out.println("ERBoardDao erUpdate2 number->"+number);

			rs.close();
			pstmt.close();
			if (number == 1) {
				pstmt = conn.prepareStatement(sql2);
				System.out.println("ERBoardDao erUpdate2 getAname->"+erboard.getAname());
				System.out.println("ERBoardDao erUpdate2 getAdate1->"+erboard.getAdate1());
				System.out.println("ERBoardDao erUpdate2 getAdate2->"+erboard.getAdate2());
				System.out.println("ERBoardDao erUpdate2 getEdate1->"+erboard.getEdate1());
				System.out.println("ERBoardDao erUpdate2 getEname->"+erboard.getEname());
				System.out.println("ERBoardDao erUpdate2 getAcontent->"+erboard.getAcontent());
				System.out.println("ERBoardDao erUpdate2 getEcontent->"+erboard.getEcontent());
				System.out.println("ERBoardDao erUpdate2 getEjob->"+erboard.getEjob());
				System.out.println("ERBoardDao erUpdate2 getEdate2->"+erboard.getEdate2());
				System.out.println("ERBoardDao erUpdate2 getM_num->"+erboard.getM_num());
				pstmt.setString(1, erboard.getAname());
				pstmt.setString(2, erboard.getAdate1());
				pstmt.setString(3, erboard.getAdate2());
				pstmt.setString(4, erboard.getEdate1());
				pstmt.setString(5, erboard.getEname());
				pstmt.setString(6, erboard.getAcontent());
				pstmt.setString(7, erboard.getEcontent());
				pstmt.setString(8, erboard.getEjob());
				pstmt.setString(9, erboard.getEdate2());
				pstmt.setInt(10, erboard.getM_num());
				result2 = pstmt.executeUpdate(); // Update
				System.out.println("ERBoardDao prepareStatement Update2 sql2...");
				}
			else {
				pstmt= conn.prepareStatement(sql3);
				pstmt.setInt(1, erboard.getM_num());
				pstmt.setString(2, erboard.getAname());
				pstmt.setString(3, erboard.getAdate1());
				pstmt.setString(4, erboard.getAdate2());
				pstmt.setString(5, erboard.getEdate1());
				pstmt.setString(6, erboard.getEname());
				pstmt.setString(7, erboard.getAcontent());
				pstmt.setString(8, erboard.getEcontent());
				pstmt.setString(9, erboard.getEjob());
				pstmt.setString(10, erboard.getEdate2());
				result2 = pstmt.executeUpdate();   // Insert
				System.out.println("ERBoardDao prepareStatement Insert2 sql2...");
			}
			
		} catch (Exception e) {
			System.out.println("ERBoardDao erUpdate2 Exception->"+e.getMessage());
		} finally {
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
		}
		return result2;
	}

	public int erUpdate3(ERBoard erboard) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result3 = 0;
		int number = 0;
		String sql1 = "select count(*) from cert1 where m_num=?";
		String sql2 = "update cert1 set tnumber=?, tname=?, tscore=?, tdate=? where m_num=?";
		String sql3 = "insert into cert1 values(?,?,?,?,?)";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql1);
			pstmt.setInt(1, erboard.getM_num());
			rs = pstmt.executeQuery();
			if (rs.next()) number = rs.getInt(1);
			else 	       number = 0;
			System.out.println("ERBoardDao erUpdate3 number->"+number);
			rs.close();
			pstmt.close();
			if (number == 1) {
				pstmt = conn.prepareStatement(sql2);
				System.out.println("ERBoardDao erUpdate3 getTnumber->"+erboard.getTnumber());
				System.out.println("ERBoardDao erUpdate3 getTname->"+erboard.getTname());
				System.out.println("ERBoardDao erUpdate3 getTscore->"+erboard.getTscore());
				System.out.println("ERBoardDao erUpdate3 getTdate->"+erboard.getTdate());
				System.out.println("ERBoardDao erUpdate3 getM_num->"+erboard.getM_num());
				pstmt.setString(1, erboard.getTnumber());
				pstmt.setString(2, erboard.getTname());
				pstmt.setString(3, erboard.getTscore());
				pstmt.setString(4, erboard.getTdate());
				pstmt.setInt(5, erboard.getM_num());
				result3 = pstmt.executeUpdate(); // Update
				System.out.println("ERBoardDao prepareStatement Update3 sql2...");
				}
			else {
				pstmt= conn.prepareStatement(sql3);
				pstmt.setString(1, erboard.getTnumber());
				pstmt.setInt(2, erboard.getM_num());
				pstmt.setString(3, erboard.getTname());
				pstmt.setString(4, erboard.getTscore());
				pstmt.setString(5, erboard.getTdate());
				result3 = pstmt.executeUpdate();   // Insert
				System.out.println("ERBoardDao prepareStatement Insert3 sql2...");
			}
			
		} catch (Exception e) {
			System.out.println("ERBoardDao erUpdate2 Exception->"+e.getMessage());
		} finally {
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
		}
		return result3;
	}

	public int erUpdate4(ERBoard erboard) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result4 = 0;
		int number = 0;
		String sql1 = "select count(*) from cert2 where m_num=?";
		String sql2 = "update cert2 set col=?, ldept=?, lname=?, ldate=? where m_num=?";
		String sql3 = "insert into cert2 values(?,?,?,?,?)";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql1);
			pstmt.setInt(1, erboard.getM_num());
			rs = pstmt.executeQuery();
			if (rs.next()) number = rs.getInt(1);
			else 	       number = 0;
			System.out.println("ERBoardDao erUpdate4 number->"+number);
			rs.close();
			pstmt.close();
			if (number == 1) {
				pstmt = conn.prepareStatement(sql2);
				System.out.println("ERBoardDao erUpdate4 getCol->"+erboard.getCol());
				System.out.println("ERBoardDao erUpdate4 getLdept->"+erboard.getLdept());
				System.out.println("ERBoardDao erUpdate4 getLname->"+erboard.getLname());
				System.out.println("ERBoardDao erUpdate4 getLdate->"+erboard.getLdate());
				System.out.println("ERBoardDao erUpdate4 getM_num->"+erboard.getM_num());
				pstmt.setString(1, erboard.getCol());
				pstmt.setString(2, erboard.getLdept());
				pstmt.setString(3, erboard.getLname());
				pstmt.setString(4, erboard.getLdate());
				pstmt.setInt(5, erboard.getM_num());
				result4 = pstmt.executeUpdate(); // Update
				System.out.println("ERBoardDao prepareStatement Update4 sql2...");
				}
			else {
				pstmt= conn.prepareStatement(sql3);
				pstmt.setString(1, erboard.getCol());
				pstmt.setInt(2, erboard.getM_num());
				pstmt.setString(3, erboard.getLdept());
				pstmt.setString(4, erboard.getLname());
				pstmt.setString(5, erboard.getLdate());
				result4 = pstmt.executeUpdate();   // Insert
				System.out.println("ERBoardDao prepareStatement Insert4 sql2...");
			}
			
		} catch (Exception e) {
			System.out.println("ERBoardDao erUpdate4 Exception->"+e.getMessage());
		} finally {
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
		}
		return result4;
	}

	public int erUpdate5(ERBoard erboard) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result5 = 0;
		int number = 0;
		String sql1 = "select count(*) from prizes where m_num=?";
		String sql2 = "update prizes set p_id=?, price=?, pcontent=?, pdate=?, pdept=?, pname=? where m_num=?";
		String sql3 = "insert into prizes values(?,?,?,?,?,?,?)";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql1);
			pstmt.setInt(1, erboard.getM_num());
			rs = pstmt.executeQuery();
			if (rs.next()) number = rs.getInt(1);
			else 	       number = 0;
			System.out.println("ERBoardDao erUpdate5 number->"+number);
			rs.close();
			pstmt.close();
			if (number == 1) {
				pstmt = conn.prepareStatement(sql2);
				System.out.println("ERBoardDao erUpdate5 getCol->"+erboard.getCol());
				System.out.println("ERBoardDao erUpdate5 getLdept->"+erboard.getLdept());
				System.out.println("ERBoardDao erUpdate5 getLname->"+erboard.getLname());
				System.out.println("ERBoardDao erUpdate5 getLdate->"+erboard.getLdate());
				System.out.println("ERBoardDao erUpdate5 getM_num->"+erboard.getM_num());
				pstmt.setString(1, erboard.getP_id());
				pstmt.setString(2, erboard.getPrice());
				pstmt.setString(3, erboard.getPcontent());
				pstmt.setString(4, erboard.getPdate());
				pstmt.setString(5, erboard.getPdept());
				pstmt.setString(6, erboard.getPname());
				pstmt.setInt(7, erboard.getM_num());
				result5 = pstmt.executeUpdate(); // Update
				System.out.println("ERBoardDao prepareStatement Update5 sql2...");
				}
			else {
				pstmt= conn.prepareStatement(sql3);
				pstmt.setString(1, erboard.getP_id());
				pstmt.setInt(2, erboard.getM_num());
				pstmt.setString(3, erboard.getPrice());
				pstmt.setString(4, erboard.getPcontent());
				pstmt.setString(5, erboard.getPdate());
				pstmt.setString(6, erboard.getPdept());
				pstmt.setString(7, erboard.getPname());
				result5 = pstmt.executeUpdate();   // Insert
				System.out.println("ERBoardDao prepareStatement Insert5 sql2...");
			}
			
		} catch (Exception e) {
			System.out.println("ERBoardDao erUpdate5 Exception->"+e.getMessage());
		} finally {
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
		}
		return result5;
	}
	
	public int setM_divide(int m_num) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = "update user1 set m_divide = 1 where m_num=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, m_num);
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("ERBoardDao setM_divide Exception->"+e.getMessage());
		} finally {
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
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
	
	
	////테스트/////////////////////////////////////////////////////////////
}
