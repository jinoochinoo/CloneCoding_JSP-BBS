package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {

	private Connection conn; // 자바 <-> DB 연결
	private PreparedStatement pstmt; // 쿼리문 대기 및 설정
	private ResultSet rs; // 결과값 저장

	// 기본 생성자
	// UserDAO 실행될 때마다 자동으로 DB 연결
	public UserDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/bbs?serverTimezone=UTC";
			String dbID = "jinwoo";
			String dbPassword = "wlsdn123";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch(Exception e) {
			e.printStackTrace(); // 오류 출력
		}
	}

	//login.jsp 부분에서 userID, userPassword 값 받아서 login 메소드 실행
	public int login(String userID, String userPassword) {
		String sql = "select userPassword from user where userID = ?";
			try {
				pstmt = conn.prepareStatement(sql); // 쿼리문 대기
				pstmt.setString(1, userID); // 첫번째 '?' 부분에 매개변수 userID 대입
				rs = pstmt.executeQuery(); // 쿼리 실행값 저장
				
				if(rs.next()) {
					if(rs.getString(1).equals(userPassword)) {
						return 1; // 로그인 성공
					} else
						return 0; // 비밀번호 다름
					} 
				return -1; // 아이디 없음
				} catch(Exception e) {
					e.printStackTrace();
			} return -2; // 오류 
	}
	
	//User 클래스 인스턴스 생성해 회원정보 저장
	public int join(User user) {
		String sql = "insert into user values(?, ?, ?, ?, ?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,  user.getUserID());
			pstmt.setString(2,  user.getUserPassword());
			pstmt.setString(3,  user.getUserName());
			pstmt.setString(4,  user.getUserGender());
			pstmt.setString(5,  user.getUserEmail());
			return pstmt.executeUpdate();
	}catch (Exception e) {
		e.printStackTrace();
		}
		return -1;
	}
}

