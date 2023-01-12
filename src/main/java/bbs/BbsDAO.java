package bbs;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/* writeAction.jsp에서 글쓴 데이터들을 DB에 넣어주기 위한 용도 */
public class BbsDAO {

	/* JDBC를 통해 DB 연결 */	 
	private Connection conn;
	private ResultSet rs;
	
	public BbsDAO() {
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
	
	
	/* 게시판 글쓰기 위한 함수들 */
	/* 게시글 작성 시 현재 시간을 가져와서 넣기 위한 기능 */
	public String getDate() {
		String SQL = "SELECT NOW()";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery(); // 쿼리 수행 후 결과를 넣어줌
			if (rs.next()) {
				return rs.getString(1);
			}
		} catch (Exception e) {
		    e.printStackTrace();	
		}
		return ""; // 데이터베이스 오류
	}
	
	/* 게시판 정렬 기능 */
	public int getNext() {
		String SQL = "SELECT bbsID FROM BBS ORDER BY bbsID DESC";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery(); // 쿼리 수행 후 결과를 넣어줌
			if (rs.next()) {
				return rs.getInt(1) + 1; 
			}
			return 1; // 첫 번째 게시글인 경우
			
		} catch (Exception e) {
		    e.printStackTrace();	
		}
		return -1; // 데이터베이스 오류
	}
	
	/* 게시판 작성 기능 */
	public int write(String bbsTitle, String userID, String bbsContent) {
    	String SQL = "INSERT INTO BBS (bbsID,  bbsTitle,  userID,  bbsDate,  bbsContent,  bbsAvailable) VALUES(?,  ?,  ?,  ?,  ?,  ?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1,  getNext());
			pstmt.setString(2,  bbsTitle);
			pstmt.setString(3,  userID);
			pstmt.setString(4,  getDate());
			pstmt.setString(5,  bbsContent);
			pstmt.setInt(6,  1); // bbsAvailable : 1 (게시판 삭제 안 된 경우), 0 (게시판 삭제 된 경우)
			return pstmt.executeUpdate();
			
		} catch (Exception e) {
		    e.printStackTrace();	
		}
		return -1; // 데이터베이스 오류
	}
	
	/* DB(게시판 데이터가 저장된)에서 화면에서 보여주기 위한 기능 */
	/* 총 10개의 게시글을 가져옴 */
    public ArrayList<Bbs> getList(int pageNumber) {
		String SQL = "SELECT * FROM BBS WHERE bbsID < ? AND bbsAvailable = 1 ORDER BY bbsID DESC LIMIT 10";
		ArrayList<Bbs> list = new ArrayList<Bbs>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Bbs bbs = new Bbs();
				bbs.setBbsID(rs.getInt(1)); 
				bbs.setBbsTitle(rs.getString(2)); 
				bbs.setUserID(rs.getString(3)); 
				bbs.setBbsDate(rs.getString(4)); 
				bbs.setBbsContent(rs.getString(5)); 
				bbs.setBbsAvailable(rs.getInt(6)); 
				list.add(bbs);
			}
			
		} catch (Exception e) {
		    e.printStackTrace();	
		}
		return list;
    }
        
    /* 게시글이 10개밖에 없다면 다음페이지가 없어야 함 (페이징 처리) */
    public boolean nextPage(int pageNumber) {
		String SQL = "SELECT * FROM BBS WHERE bbsID < ? AND bbsAvailable = 1";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
			rs = pstmt.executeQuery(); 
			if (rs.next()) {
				return true;
			}		
		} catch (Exception e) {
		    e.printStackTrace();	
		}
		return false;
    }
    
    /* 게시글 제목 클릭시 내용 불러오기 위한 기능 */
    public Bbs getBbs(int bbsID) {
		String SQL = "SELECT * FROM BBS WHERE bbsID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, bbsID);
			rs = pstmt.executeQuery(); 
			if (rs.next()) {
				Bbs bbs = new Bbs();
				bbs.setBbsID(rs.getInt(1)); 
				bbs.setBbsTitle(rs.getString(2)); 
				bbs.setUserID(rs.getString(3)); 
				bbs.setBbsDate(rs.getString(4)); 
				bbs.setBbsContent(rs.getString(5)); 
				bbs.setBbsAvailable(rs.getInt(6)); 
				return bbs;
			}		
		} catch (Exception e) {
		    e.printStackTrace();	
		}
		return null; // 해당 게시글이 존재하지 않는다면 null
    }
    
    /* [UPDATE] 게시글 수정하는 기능 */
    public int update(int bbsID, String bbsTitle, String bbsContent) {
    	String SQL = "UPDATE BBS SET bbsTitle = ?, bbsContent = ? WHERE bbsID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, bbsTitle);
			pstmt.setString(2, bbsContent);
			pstmt.setInt(3, bbsID);
			return pstmt.executeUpdate(); // 성공시 0 반환
			
		} catch (Exception e) {
		    e.printStackTrace();	
		}
		return -1; // 데이터베이스 오류
    }
    
    /* [DELETE] 게시글 삭제하는 기능 */
    public int delete(int bbsID) {
    	String SQL = "UPDATE BBS SET bbsAvailable = 0 WHERE bbsID = ?"; // bbsAvailable = 0을 줌으로써 글을 블라인드 처리하기 위해 DELETE가 아닌 UPDATE 쿼리 사용
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, bbsID);
			return pstmt.executeUpdate(); // 성공시 0 반환
			
		} catch (Exception e) {
		    e.printStackTrace();	
		}
		return -1; // 데이터베이스 오류
    }

}