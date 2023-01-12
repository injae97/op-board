## 💡 cafe24 Tomcat JSP 
- 서비스 시작 후 FTP, DB 비번 기억
- cafe24 - MySQL 외부 IP 접근설정 > 사용유무 > 사용중 체크 > IP 등록 (네이버 검색 내 IP)


## 💡 Heidisql
https://www.heidisql.com/download.php

Sever Host : cafe24에서 돈 주고 산 도메인
DB Username : cafe24 호스팅 ID (cafe 로그인 아이디랑 다름)
DB Password : cafe24 호스팅할 때 설정한 FTP 비번

신규 > 오른쪽 쿼리(▶) > 디비 테이블 명 아래 복붙 후 드래그 > 쿼리실행(컨트롤 + 쉬프트 + F9)

create table USER (
    userID VARCHAR(20) primary KEY,
    userPassword VARCHAR(20),
    userName VARCHAR(20),
    userGender VARCHAR(20),
    userEmail VARCHAR(20)
);

create table BBS (
    bbsID INT primary key,
    bbsTitle VARCHAR(50),
    userID VARCHAR(20),
    bbsDate DATETIME,
    bbsContent VARCHAR(2048),
    bbsAvailable INT
);


## 💡 DAO.java 파일들 수정
로컬과 다르게 운영을 할 때는 dbURL, dbID, dbPassword 아래와 같이 설정

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



## 💡 JDK 버전 다운그레이드
- 프로젝트명 클릭 > 알트 + 엔터 > 검색창에 Project Facets > Java > 버전 1.7


## 💡 파일 질라 
https://filezilla-project.org/download.php?type=client

서버호스트 : cafe24에서 돈 주고 산 도메인
Username : cafe24 호스팅 ID (cafe 로그인 아이디랑 다름)
Password : cafe24 호스팅할 때 설정한 FTP 비번
port: 22

1. /cafe24호스팅ID/tomcat/webapps/ROOT 들어가서 index.jsp, index.jsp.default 파일 삭제 
2. webapp에 들어가서 META-INF, WEB-INF를 제외한 파일들을 /cafe24호스팅ID/tomcat/webapps/ROOT에 전부 넣어줌(jsp, css ,images ,js)
3. board/BBS/build에 들어가서 classses 디렉토리를 복사한 후 /cafe24호스팅ID/tomcat/webapps/ROOT/WEB-INF에 classes디렉토리를 붙여넣기


## 💡 Putty
서버호스트 : cafe24에서 돈 주고 산 도메인
Username : cafe24 호스팅 ID (cafe 로그인 아이디랑 다름)
Password : cafe24 호스팅할 때 설정한 FTP 비번

## 💡 Tomcat Start & Shutdown Command
cd tomcat/bin 
./start.sh
./shutdown.sh