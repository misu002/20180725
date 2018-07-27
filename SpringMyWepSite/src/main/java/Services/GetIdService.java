package Services;

import java.sql.Connection;
import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;

import DAO.userinfoDao;
import Services.ServiceException;
import jdbc.JdbcUtil;
import jdbc.connection.ConnectionProvider;

public class GetIdService {
	@Autowired
	userinfoDao UserinfoDao;
	
	public String findPw(String id) throws ServiceException{
		Connection conn=null;
		String pw="";
		try {
			conn=ConnectionProvider.getConnection();

			if(UserinfoDao!=null) {
				pw=UserinfoDao.selectPw(conn,id);
				return pw;
			}else {
				return "Not working";
			}			
		} catch (SQLException e) {
			e.printStackTrace();
			throw new ServiceException("메시지 등록 실패: " + e.getMessage(), e);
		}finally {
			JdbcUtil.close(conn);
		}

	}
}
