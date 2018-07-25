package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;

import Services.ServiceException;
import jdbc.JdbcUtil;
import member.userinfo;

public class userinfoDao {
	private userinfoDao() {
		
	}
	private static userinfoDao instance =new userinfoDao();
	
	
	public static userinfoDao getInstance() { // protected사용가능 ???????
		return instance;
	}


	public int insert(Connection conn, userinfo userinfo) throws SQLException {
		PreparedStatement pstmt = null;
		String sql="insert into userinfo values(?,?,?,?,?,?,?,?)";
		String birth=userinfo.getYear()+"-"+userinfo.getMonth()+"-"+userinfo.getDay();
		String phone="0"+userinfo.getPhone();
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,userinfo.getId());
			pstmt.setString(2,userinfo.getPw());
			pstmt.setString(3,userinfo.getName());
			pstmt.setString(4,birth);
			pstmt.setString(5, userinfo.getGender());
			pstmt.setString(6,phone);
			pstmt.setString(7,userinfo.getEmail());
			pstmt.setString(8, userinfo.getImgname());
			
			return pstmt.executeUpdate();
			
		}finally{
			JdbcUtil.close(pstmt);
		}
	}
	private userinfo makeUserFromRs(ResultSet rs) throws SQLException{
		userinfo Userinfo=new userinfo();
		Userinfo.setId(rs.getString(1));
		Userinfo.setPw(rs.getString(2));
		Userinfo.setName(rs.getString(3));
		//date로 받아서 String바꾸고 년도 달 day로 나누기
		Date date = rs.getDate(4);
		String date1=date.toString();
		String[] finaldate= date1.split("-");
		Userinfo.setYear(finaldate[0]);
		Userinfo.setMonth(finaldate[1]);
		Userinfo.setDay(finaldate[2]);
		Userinfo.setGender(rs.getString(5));
		Userinfo.setPhone(rs.getString(6));
		Userinfo.setEmail(rs.getString(7));
		
		return Userinfo;
	}

	public List<userinfo> selectUser(Connection conn) throws SQLException {		
		Statement stmt = null;
		ResultSet rs=null;
		List<userinfo> userlist=null;
		String sql="select id,pw,name,birth,gender,phone,nvl(email,'없음') from userinfo";
		try {
			stmt=conn.createStatement();
			rs=stmt.executeQuery(sql);
			if(rs.next()) {
				userlist=new ArrayList<userinfo>();
				do {
					userlist.add(makeUserFromRs(rs));
				}while(rs.next());
			}else {
				userlist=Collections.emptyList();
			}
			return userlist;
				
		}  finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(stmt);
		}
		
	}
	
	public String selectUserName(Connection conn,String id) throws SQLException {		
		PreparedStatement pstmt = null;
		ResultSet rs=null;
		String sql="select name from userinfo where id=?";
		try {
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, id);
		rs=pstmt.executeQuery();
		rs.next();
		return rs.getString(1);
		}finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
	}


	public String selectPw(Connection conn, String id) throws SQLException {
		// TODO Auto-generated method stub
		PreparedStatement pstmt = null;
		ResultSet rs=null;		
		String sql="select pw from userinfo where id=?";	
		try {			
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			rs.next();
			return rs.getString(1);
			
		}finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
		
		
		
	}
}
