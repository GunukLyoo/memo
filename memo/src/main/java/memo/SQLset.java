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
}
