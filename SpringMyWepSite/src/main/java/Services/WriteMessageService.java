package Services;

import java.sql.Connection;
import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;

import DAO.MessageDao;
import BeanModel.Message;
import jdbc.connection.ConnectionProvider;

public class WriteMessageService {
	@Autowired
	MessageDao messageDao;

	public int write(Message message) throws ServiceException {
		Connection conn=null;
		try {
			conn=ConnectionProvider.getConnection();
			int resultCnt=messageDao.insert(conn,message);
			return resultCnt;
		} catch (SQLException e) {
			e.printStackTrace();
			throw new ServiceException("메시지 등록 실패: " + e.getMessage(), e);
		}
	}
}
