package bbs;

//데이터를 처리하고 관리하는 기법 -> JAVA Beans
public class Bbs {
	
	/* 데이터베이스 내에서 만든 컬럼과 타입 그대로 변수 선언 
	 * bbsAvailable : 1 (게시판 삭제 안 된 경우), 0 (게시판 삭제 된 경우)    
	create table BBS (
    	bbsID INT primary key,
    	bbsTitle VARCHAR(50),
    	userID VARCHAR(20),
    	bbsDate DATETIME,
    	bbsContent VARCHAR(2048),
    	bbsAvailable INT
	);
	*/    
	
    private int bbsID;
    private String bbsTitle;
    private String userID;
    private String bbsDate;
    private String bbsContent;
    private int bbsAvailable;
    
    // 오른쪽 마우스 > Source > Generate Getter & Setter > Select All > Finish 
	public int getBbsID() {
		return bbsID;
	}
	public void setBbsID(int bbsID) {
		this.bbsID = bbsID;
	}
	public String getBbsTitle() {
		return bbsTitle;
	}
	public void setBbsTitle(String bbsTitle) {
		this.bbsTitle = bbsTitle;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getBbsDate() {
		return bbsDate;
	}
	public void setBbsDate(String bbsDate) {
		this.bbsDate = bbsDate;
	}
	public String getBbsContent() {
		return bbsContent;
	}
	public void setBbsContent(String bbsContent) {
		this.bbsContent = bbsContent;
	}
	public int getBbsAvailable() {
		return bbsAvailable;
	}
	public void setBbsAvailable(int bbsAvailable) {
		this.bbsAvailable = bbsAvailable;
	}    
}