package Services;

import java.sql.Connection;
import java.sql.SQLException;
import DAO.userinfoDao;
import jdbc.JdbcUtil;
import jdbc.connection.ConnectionProvider;
import member.userinfo;

public class RegisterInsertService {
	
	private static RegisterInsertService instance= new RegisterInsertService();
			
			private RegisterInsertService() {}
	public static RegisterInsertService getInstance() {
		return instance;
	}
	
	public int register(userinfo userinfo)  throws ServiceException  {
		Connection conn=null;		
		try {
			conn=ConnectionProvider.getConnection();
			userinfoDao UserinfoDao=userinfoDao.getInstance();
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
