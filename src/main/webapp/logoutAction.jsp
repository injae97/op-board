<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그아웃 액션 페이지</title>
</head>
<body>
	<%
        session.invalidate(); // 현재 해당 페이지 접속 시 세션을 빼앗아서 로그아웃  
	%>
	<script>
	    location.href = "main.jsp";
	</script>
</body>
</html>