## ๐ก cafe24 Tomcat JSP 
- ์๋น์ค ์์ ํ FTP, DB ๋น๋ฒ ๊ธฐ์ต
- cafe24 - MySQL ์ธ๋ถ IP ์ ๊ทผ์ค์  > ์ฌ์ฉ์ ๋ฌด > ์ฌ์ฉ์ค ์ฒดํฌ > IP ๋ฑ๋ก (๋ค์ด๋ฒ ๊ฒ์ ๋ด IP)


## ๐ก Heidisql
https://www.heidisql.com/download.php

- Sever Host : cafe24์์ ๋ ์ฃผ๊ณ  ์ฐ ๋๋ฉ์ธ
- DB Username : cafe24 ํธ์คํ ID (cafe ๋ก๊ทธ์ธ ์์ด๋๋ ๋ค๋ฆ)
- DB Password : cafe24 ํธ์คํํ  ๋ ์ค์ ํ FTP ๋น๋ฒ

- ์ ๊ท > ์ค๋ฅธ์ชฝ ์ฟผ๋ฆฌ(โถ) > ๋๋น ํ์ด๋ธ ๋ช ์๋ ๋ณต๋ถ ํ ๋๋๊ทธ > ์ฟผ๋ฆฌ์คํ(์ปจํธ๋กค + ์ฌํํธ + F9)

```java
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
```

## ๐ก DAO.java ํ์ผ๋ค ์์ 

- ๋ก์ปฌ๊ณผ ๋ค๋ฅด๊ฒ ์ด์์ ํ  ๋๋ dbURL, dbID, dbPassword ์๋์ ๊ฐ์ด ์ค์ 

```java
public UserDAO() {
	try {
		String dbURL = "jdbc:mysql://localhost/cafe24ํธ์คํID?characterEncoding=UTF-8&serverTimezone=UTC";
		String dbID = "cafe24ํธ์คํID";
		String dbPassword = "cafe24ํธ์คํ ํ  ๋ ๋น๋ฒ";
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(dbURL, dbID, dbPassword); 
	} catch(Exception e) {
		e.printStackTrace();
	}
}
```


## ๐ก JDK ๋ฒ์  ๋ค์ด๊ทธ๋ ์ด๋
- ํ๋ก์ ํธ๋ช ํด๋ฆญ > ์ํธ + ์ํฐ > ๊ฒ์์ฐฝ์ Project Facets > Java > ๋ฒ์  1.7


## ๐ก ํ์ผ ์ง๋ผ 
https://filezilla-project.org/download.php?type=client

- ์๋ฒํธ์คํธ : cafe24์์ ๋ ์ฃผ๊ณ  ์ฐ ๋๋ฉ์ธ
- Username : cafe24 ํธ์คํ ID (cafe ๋ก๊ทธ์ธ ์์ด๋๋ ๋ค๋ฆ)
- Password : cafe24 ํธ์คํํ  ๋ ์ค์ ํ FTP ๋น๋ฒ
- port: 22

1. /cafe24ํธ์คํID/tomcat/webapps/ROOT ๋ค์ด๊ฐ์ index.jsp, index.jsp.default ํ์ผ ์ญ์  
2. webapp์ ๋ค์ด๊ฐ์ META-INF, WEB-INF๋ฅผ ์ ์ธํ ํ์ผ๋ค์ /cafe24ํธ์คํID/tomcat/webapps/ROOT์ ์ ๋ถ ๋ฃ์ด์ค(jsp, css ,images ,js)
3. board/BBS/build์ ๋ค์ด๊ฐ์ classses ๋๋ ํ ๋ฆฌ๋ฅผ ๋ณต์ฌํ ํ /cafe24ํธ์คํID/tomcat/webapps/ROOT/WEB-INF์ classes๋๋ ํ ๋ฆฌ๋ฅผ ๋ถ์ฌ๋ฃ๊ธฐ


## ๐ก Putty

- ์๋ฒํธ์คํธ : cafe24์์ ๋ ์ฃผ๊ณ  ์ฐ ๋๋ฉ์ธ
- Username : cafe24 ํธ์คํ ID (cafe ๋ก๊ทธ์ธ ์์ด๋๋ ๋ค๋ฆ
- Password : cafe24 ํธ์คํํ  ๋ ์ค์ ํ FTP ๋น๋ฒ

## ๐ก Tomcat Start & Shutdown Command

- cd tomcat/bin 
- ./start.sh
- ./shutdown.sh
