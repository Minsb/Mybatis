<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>

<%int result = (Integer)request.getAttribute("result");

if(result > 0) {
	%>
	회원가입 성공<br>
	"${user.name}" 회원님 환영합니다<br>
	<%
}
else {
	System.out.println(result);
	%>
	회원가입 실패(아이디 중복 또는 시스템 오류)<br>
	<%
}
	%>
	<input type="button" onclick="location.href='login.jsp'" value="로그인 화면">
</body>
</html>