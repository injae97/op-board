<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<title>메인 페이지</title>
</head>
<body>

    <!-- 로그인이 되었을 경우 -->
    <%
        String userID = null;
        if (session.getAttribute("userID") != null) {
        	userID = (String) session.getAttribute("userID");
        }
    %>
    
	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
			data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
			aria-expended="false">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="main.jsp">JSP 게시판 웹 사이트</a>
		</div>
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
		    <ul class="nav navbar-nav">
		        <li class="active"><a href="main.jsp">메인</a><li>
		        <li><a href="bbs.jsp">게시판</a><li>
		    </ul>
		    
		    <!-- 로그인이 안 됐을 경우 -->
		    <%
		        if(userID == null) {
        	%>
			    <!-- 오른쪽에 넣기 위한 리스트  -->
			    <ul class="nav navbar-nav navbar-right">
			        <li class="dropdown">
			            <a href="#" class="dropdown-toggle"
			            data-toggle="dropdown" role="button" aria-haspopup="true"
			            aria-expanded="false">접속하기<span class="caret"></span></a>
			            <ul class="dropdown-menu">
			                <li><a href="login.jsp">로그인</a><li> <!-- active : 하나의 페이지만 존재하며 파란색 표시 -->
			                <li><a href="join.jsp">회원가입</a><li>
			            </ul>
			        </li>
		        </ul>
		    <%   
		    
		        } 
		    
		        else {
	        %>	
			    <!-- 오른쪽에 넣기 위한 리스트  -->
			    <ul class="nav navbar-nav navbar-right">
			        <li class="dropdown">
			            <a href="#" class="dropdown-toggle"
			            data-toggle="dropdown" role="button" aria-haspopup="true"
			            aria-expanded="false">회원관리<span class="caret"></span></a>
			            <ul class="dropdown-menu">
			                <li><a href="logoutAction.jsp">로그아웃</a><li> <!-- active : 하나의 페이지만 존재하며 파란색 표시 -->
			            </ul>
			        </li>
		        </ul>        
	        <%
		        }
		    %>
	    </div>
    </nav>	
    <!-- 점보트론을 통해 메인 페이지 소개 -->
    <div class="container">
        <div class="jumbotron">
            <div class="container">
                <h1>웹 사이트 소개</h1>
                <p>이 웹사이트는 첫 번째로 만든 CRUD 게시판 입니다. <br> JSP + Tomcat 8.5 + Bootstrap 3.3 + MySQL 8.0 + Eclipse IDE</br></p>
                <p><a class="btn btn-primary btn-pull" href="https://github.com/injae97/Board" role="button">Github 게시판 프로젝트로 이동</a></p>
            </div>
        </div>
    </div>
    
    <!-- 캐러셀 클래스를 사용하여 사진 추가 -->
    <div class="container">
        <div id="myCarousel" class="carousel" data-ride="carousel">
            <!-- 이미지를 3개 넣어주기 위해 indicators로 공간 확보 -->
            <ol class="carousel-indicators">
                <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                <li data-target="#myCarousel" data-slide-to="1"></li>
            </ol>
            <!-- 실제 사진을 보여주기 위한 inner -->
            <div class="carousel-inner">
                <div class="item active">
                    <img src="images/1.jpg">
                </div>
                <div class="item">
                    <img src="images/2.jpg">
                </div>                       
            </div>
            <!-- 사진을 넘기기 위한 버튼 생성 -->
            <a class="left carousel-control" href="#myCarousel" data-slide="prev">
                <span class="glyphicon-chevron-left"></span>
            </a>       
            <a class="right carousel-control" href="#myCarousel" data-slide="next">
                <span class="glyphicon-chevron-right"></span>
            </a>                   
        </div>
    </div>   
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>