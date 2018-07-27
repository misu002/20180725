package Services;

import java.sql.Connection;
import java.sql.SQLException;

import DAO.MessageDao;
import member.Message;
import jdbc.connection.ConnectionProvider;

public class WriteMessageService {
	private static WriteMessageService instance = new WriteMessageService();

	public static WriteMessageService getInstance() {
		return instance;
	}

	private WriteMessageService() {
	}

	public int write(Message message) throws ServiceException {
		Connection conn=null;
		try {
			conn=ConnectionProvider.getConnection();
			MessageDao dao=MessageDao.getInstance();
			int resultCnt=dao.insert(conn,message);
			return resultCnt;
		} catch (SQLException e) {
			e.printStackTrace();
			throw new ServiceException("메시지 등록 실패: " + e.getMessage(), e);
		}
	}
}
