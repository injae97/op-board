package user;

/* Auto Library : Ctrl + Shift + O  */
/* writeAction.jsp를 위한 컨트롤러 */
import java.sql.Connection; 
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {

	/* JDBC를 통해 DB 연결 */	 

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public UserDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost/cafe24호스팅ID?characterEncoding=UTF-8&serverTimezone=UTC";
			String dbID = "cafe24호스팅ID";
			String dbPassword = "cafe24호스팅 할 때 비번";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword); 

		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	/* 로그인 */	 
	public int login(String userID, String userPassword) {
		String SQL = "SELECT userPassword FROM USER WHERE userID = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID); // SQL 인젝션 방어 기법 -> ?를 default로 넣은 후, ?를 userID로 덮어씀
			rs = pstmt.executeQuery(); // 실행 결과 값을 rs에 넣어줌
			
			// 아이디가 존재함
			if (rs.next()) {
				if(rs.getString(1).equals(userPassword)) {
					return 1; 
				}
				else 
					return 0; // 비밀번호 불일치
			}
			return -1; // 아이디가 존재하지 않음 
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -2; // 데이터베이스 오류 
	}
	
	/* 회원가입 */	 
    public int join(User user) {
    	String SQL = "INSERT INTO USER VALUES (?, ?, ?, ?, ?)";
    	try {
    		pstmt = conn.prepareStatement(SQL);
    		pstmt.setString(1, user.getUserID());
    		pstmt.setString(2, user.getUserPassword());
    		pstmt.setString(3, user.getUserName());
    		pstmt.setString(4, user.getUserGender());
    		pstmt.setString(5, user.getUserEmail());
    		return pstmt.executeUpdate();
    	} catch (Exception e) {
    		e.printStackTrace();
    	}
    	return -1; // 데이터베이스 오류 
    }
}