package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import member.Message;
import jdbc.JdbcUtil;

public class MessageDao {

	// Dao 클래스는 기능 클래스 -> 여러개의 인스턴스 생성이 불필요
	// 따라서 싱글톤으로 구현

	// 1.생성자를 은닉
	private MessageDao() {
	}

	// 2.인스턴스 생성 : 1개 생성하고 공유할것
	private static MessageDao instance = new MessageDao();

	public static MessageDao getInstance() { // protected사용가능 ???????
		return instance;
	}

	public int insert(Connection conn, Message message) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = "insert into guestbook_message values(message_id_seq.NEXTVAL,?,?,?)";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, message.getGuestName());
			pstmt.setString(2, message.getPassword());
			pstmt.setString(3, message.getMessage());
			return pstmt.executeUpdate();
		} finally {
			JdbcUtil.close(pstmt);
		}
	}

	public int selectCount(Connection conn) throws SQLException {
		Statement stmt = null;
		ResultSet rs = null;
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery("select count(*) from guestbook_message");
			rs.next();
			return rs.getInt(1);
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(stmt);
		}
	}

	public List<Message> selectList(Connection conn, int firstRow, int endRow) throws SQLException {
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		List<Message> messageList = new ArrayList<Message>();

		String sql = "select message_id, guest_name, password, message"
				+ " from (select rownum rnum, message_id, guest_name, password, message"
				+ " from (select * from guestbook_message m order by m.message_id desc)" + " where rownum <= ?)"
				+ " where rnum >= ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, endRow);
		pstmt.setInt(2, firstRow);
		rs = pstmt.executeQuery();

		try {
			if (rs.next()) {
				messageList = new ArrayList<Message>();
				do {
					messageList.add(makeMessageFromResultSet(rs));
				} while (rs.next());
			} else {
				messageList = Collections.emptyList();
			}
			return messageList;

		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
	}

	private Message makeMessageFromResultSet(ResultSet rs) throws SQLException {
		Message message = new Message();
		message.setId(rs.getInt("message_id"));
		message.setGuestName(rs.getString("guest_name"));
		message.setPassword(rs.getString("password"));
		message.setMessage(rs.getString("message"));
		return message;

	}

	public int delete(Connection conn, int messageId) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement("delete from guestbook_message where message_id = ?");
			pstmt.setInt(1, messageId);
			return pstmt.executeUpdate();
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}

	}

	public String select(Connection conn, int messageId) throws SQLException {

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement("select guest_name from guestbook_message where message_id = ?");
			pstmt.setInt(1, messageId);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getString(1);
				//return makeMessageFromResultSet(rs);
			} else {
				return null;
			}
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
	}

}
