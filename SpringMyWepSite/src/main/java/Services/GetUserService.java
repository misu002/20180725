package Services;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import DAO.userinfoDao;

import jdbc.JdbcUtil;
import jdbc.connection.ConnectionProvider;
import BeanModel.userinfo;

public class GetUserService {
	@Autowired
	userinfoDao userinfodao;
	
	public List<userinfo> getUser() throws ServiceException {
		Connection conn=null;
		List<userinfo> userinfolist=null;
		try {
		conn = ConnectionProvider.getConnection();
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
		userName=userinfodao.selectUserName(conn,id);
		
		return userName;
		} catch (SQLException e) {
			throw new ServiceException("메시지 목록 구하기 실패: " + e.getMessage(), e);
		} finally {
			JdbcUtil.close(conn);
		}
	}
	
}
