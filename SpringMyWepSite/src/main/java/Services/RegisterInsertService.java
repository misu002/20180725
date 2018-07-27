package Services;

import java.sql.Connection;
import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;

import DAO.userinfoDao;
import jdbc.JdbcUtil;
import jdbc.connection.ConnectionProvider;
import BeanModel.userinfo;

public class RegisterInsertService {
	@Autowired
	userinfoDao UserinfoDao;
	
	
	public int register(userinfo userinfo)  throws ServiceException  {
		Connection conn=null;		
		try {
			conn=ConnectionProvider.getConnection();
			int resultCnt=UserinfoDao.insert(conn,userinfo);
			return resultCnt;
		} catch (SQLException e) {
			e.printStackTrace();
			throw new ServiceException("메시지 목록 구하기 실패: " + e.getMessage(), e);
		}finally {		
			JdbcUtil.close(conn);
		}
	}
	
}
