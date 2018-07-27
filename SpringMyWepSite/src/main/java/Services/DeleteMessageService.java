package Services;

import java.sql.Connection;
import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;

import DAO.MessageDao;
import BeanModel.Message;
import jdbc.JdbcUtil;
import jdbc.connection.ConnectionProvider;

public class DeleteMessageService {
	@Autowired
	MessageDao messageDao;

	public void deleteMessage(int messageId, String GuestName) throws ServiceException, InvalidMessagePassowrdException,
			MessageNotFoundException{
		Connection conn = null;
		
		try {
			conn = ConnectionProvider.getConnection();
			conn.setAutoCommit(false);
			
			//1.메세지검색
			String guestName = messageDao.select(conn, messageId);
			
			//왜
			if (guestName == null) {throw new MessageNotFoundException("해당 메세지를 작성하지 않으셨습니다.");}
			else if(guestName.equals(GuestName)) {
				messageDao.delete(conn, messageId);
				conn.commit();
			}else {
				throw new InvalidMessagePassowrdException();
			}
			
			//if (!message.hasPassword()) {throw new InvalidMessagePassowrdException();}
			//if (!message.getPassword().equals(password)) {throw new InvalidMessagePassowrdException();}
//			messageDao.delete(conn, messageId);
//			conn.commit();
			}catch (SQLException ex) {
				
				JdbcUtil.rollback(conn);
				throw new ServiceException("삭제 처리 중 에러가 발생했습니다:“ + ex.getMessage(), ex", ex);
				
			}catch (InvalidMessagePassowrdException ex) {
				
				JdbcUtil.rollback(conn);
				throw ex;
				
			}catch (MessageNotFoundException ex) {
				
				JdbcUtil.rollback(conn);
				throw ex;
				
			} finally {
				
				if (conn != null) {
				try {
					conn.setAutoCommit(false);				
				}catch (SQLException e) { }
					JdbcUtil.close(conn);
			}
			}
			
		
	}
	
	
}
