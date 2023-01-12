<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>    
<%@ page import="bbs.Bbs" %>   
<%@ page import="bbs.BbsDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<title>게시판 페이지</title>
</head>
<body>

    <%
        String userID = null;
        if (session.getAttribute("userID") != null) {
        	userID = (String) session.getAttribute("userID");
        }
        /* view.jsp 소스코드 추가  */
        int bbsID = 0;
        if (request.getParameter("bbsID") != null) {
        	bbsID = Integer.parseInt(request.getParameter("bbsID")); // view.jsp?bbsID=11
        }
        
        if (bbsID == 0) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글입니다.')");
			script.println("location.href = 'bbs.jsp'");
			script.println("</script>");
        }
        
        Bbs bbs = new BbsDAO().getBbs(bbsID);
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
		        <li><a href="main.jsp">메인</a><li>
		        <li class="active"><a href="bbs.jsp">게시판</a><li>
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
    
    <!-- view.jsp 소스코드 추가  -->    
    <div class="container">
        <div class="row">
        <table class="table table-striped" style="text-align: center; border: 1px solid #dddddd"> <!-- 테이블 짝수,홀수 번갈아가면서 저장 -->
              <thead>
                  <tr>
                      <th colspan="3" style="background-color: #eeeeee; text-align: center;">게시판 글 보기</th>                  
                  </tr>
              </thead>
              
              <tbody>
              <!-- XSS 공격 방지를 위한 문자 치환(replaceAll)  -->
                  <tr>
                      <td style="width: 20%;">글 제목</td>
                      <td colspan="2"><%= bbs.getBbsTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %></td>
                  </tr>

                  <tr>
                      <td>작성자</td>
                      <td colspan="2"><%= bbs.getUserID() %></td>                                            
                  </tr>        
                  
                  <tr>
                      <td>작성일자</td>
                      <td colspan="2"><%= bbs.getBbsDate().substring(0, 11) + bbs.getBbsDate().substring(11, 13) + "시 " + bbs.getBbsDate().substring(14, 16) + "분 " %></td>                                            
                  </tr>      
                  
                   <tr>
                      <td>내용</td>
                      <td colspan="2" style="min-height: 200px; text-align: left;"><%= bbs.getBbsContent().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %></td>                                            
                  </tr>           
              </tbody>                
            </table>
            <a href="bbs.jsp" class="btn btn-primary">목록</a>
            
            <!-- 로그인한 사용자가 본인 글이라면 수정 및 삭제 하게 해야함 -->
            <%
               if (userID != null && userID.equals(bbs.getUserID())) {
         	%>
         	      <a href="update.jsp?bbsID=<%= bbsID %>" class="btn btn-primary">수정</a>
         	      <a onclick="return confirm('정말로 삭제하시겠습니까?')" href="deleteAction.jsp?bbsID=<%= bbsID %>" class="btn btn-primary">삭제</a>
         	<%
               }
            %>
            <a href="write.jsp" class="btn btn-primary pull-right">글쓰기</a>
        </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>