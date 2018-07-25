package Services;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import DAO.userinfoDao;

import jdbc.JdbcUtil;
import jdbc.connection.ConnectionProvider;
import member.userinfo;

public class GetUserService {
	
	private GetUserService() {}
	
	private static GetUserService instance = new GetUserService();
	
	public static GetUserService getInstance() {
		return instance;
	}
	
	public List<userinfo> getUser() throws ServiceException {
		Connection conn=null;
		List<userinfo> userinfolist=null;
		try {
		conn = ConnectionProvider.getConnection();
		userinfoDao userinfodao=userinfoDao.getInstance();
		userinfolist=userinfodao.selectUser(conn);
		return userinfolist;
		} catch (SQLException e) {
			throw new ServiceException("메시지 목록 구하기 실패: " + e.getMessage(), e);
		} finally {
			JdbcUtil.close(conn);
		}
	}
	
	public String getUserName(String id) throws ServiceException {
		Connection conn=null;
		String userName="";
		try {
		conn = ConnectionProvider.getConnection();
		userinfoDao userinfodao=userinfoDao.getInstance();
		userName=userinfodao.selectUserName(conn,id);
		
		return userName;
		} catch (SQLException e) {
			throw new ServiceException("메시지 목록 구하기 실패: " + e.getMessage(), e);
		} finally {
			JdbcUtil.close(conn);
		}
	}
	
}
