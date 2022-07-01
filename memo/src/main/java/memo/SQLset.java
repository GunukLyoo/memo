package memo;

import java.sql.*;
import java.util.*;

import memo.DBconnect;

public class SQLset {

	public SQLset() {
		
	}
	
	public void SQLreg(String title, String content, String author, String pwd) throws Exception{
		DBconnect dbc = new DBconnect();
		Connection conn = dbc.getConnection();
		
		int num=0;
		String sql="select max(bno) from board";
		PreparedStatement pstmt=conn.prepareStatement(sql);
		ResultSet rs=pstmt.executeQuery();

		if(rs.next()){
			num=rs.getInt("max(bno)")+1;	
		}
	
		Timestamp reg_date=new Timestamp(System.currentTimeMillis());
		
		String encodepwd = Base64.getEncoder().encodeToString(pwd.getBytes());
		System.out.println(encodepwd);
		
		sql = "insert into board (BNO, TITLE, CONTENT, REGDATE, AUTHOR, PWD) values(?,?,?,?,?,?)";
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setInt(1, num);
		pstmt.setString(2, title);
		pstmt.setString(3, content);
		pstmt.setTimestamp(4, reg_date);
		pstmt.setString(5, author);
		pstmt.setString(6, encodepwd);
		
		pstmt.executeUpdate();
		
		pstmt.close();
	}
	
	public void SQLupdate(String bno, String title, String content, String author, String pwd) throws Exception{
		DBconnect dbc = new DBconnect();
		Connection conn = dbc.getConnection();
	
		String encodepwd = Base64.getEncoder().encodeToString(pwd.getBytes());
		System.out.println(encodepwd);
		
		String sql = "SELECT * FROM board WHERE bno=" + bno;
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		rs.next();
		
		pstmt.clearParameters();
		
		if(rs.getString("pwd")!=encodepwd){
			System.out.print("<script>alert(\"비밀번호 불일치!\");</script>");
			System.out.print("<script>history.back();</script>");
		}
		else{
			sql = "update board set title='"+title+"', content='"+content + "' where bno="+bno;
		
			System.out.println(sql);
		
			pstmt.executeUpdate();
			pstmt.clearParameters();
		
			sql = "update board set author='"+ author + "' where bno="+bno;
		
			System.out.println(sql);
		
			pstmt = conn.prepareStatement(sql);
			pstmt.executeUpdate();
			pstmt.close();
		}
	}
	
	public ResultSet SQLmain() throws Exception{
		DBconnect dbc = new DBconnect();
		Connection conn = dbc.getConnection();
		
		String sql = "select * from board order by bno desc";
  		PreparedStatement pstmt=conn.prepareStatement(sql);
  		
  		return pstmt.executeQuery();
	}
	
	public ResultSet SQLview(String bno) throws Exception{
		DBconnect dbc = new DBconnect();
		Connection conn = dbc.getConnection();
		
		String sql = "select * from board where bno=" + bno;
  		PreparedStatement pstmt=conn.prepareStatement(sql);
  		
  		return pstmt.executeQuery();
	}
	
	public void SQLdelete(String bno) throws Exception{
		DBconnect dbc = new DBconnect();
		Connection conn = dbc.getConnection();
		
		int bnoc = Integer.parseInt(bno);
		
		String sql = "delete from board where bno="+bno;
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.executeUpdate();
		
		pstmt.close();
		
		sql="select * from board where bno>"+bno;
		
		pstmt = conn.prepareStatement(sql);
		
		ResultSet rs = pstmt.executeQuery();
		
		sql = "update board set bno=? where bno=?";
		PreparedStatement pstmt1 = conn.prepareStatement(sql);
		
		while(rs.next()){
			pstmt1.setInt(1, bnoc);
			pstmt1.setInt(2, bnoc+1);
			pstmt1.executeUpdate();
			pstmt1.clearParameters();
			bnoc++;
		}
		
		pstmt.close();
		pstmt1.close();
	}
	
	public ResultSet SQLselect(String bno) throws Exception{
		DBconnect dbc = new DBconnect();
		Connection conn = dbc.getConnection();
		
		String sql = "select * from board where bno=" + bno;
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		return pstmt.executeQuery();
	}
	
	public ResultSet getAuthor() throws Exception {
		DBconnect dbc = new DBconnect();
		Connection conn = dbc.getConnection();
		
		String sql = "select distinct author from board";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		return pstmt.executeQuery();
	}
}
