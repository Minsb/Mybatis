<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기 결과</title>
</head>
<body>
<h2>아이디 찾기</h2>
<hr>
<%
String userid = (String)request.getAttribute("userid");
%>
회원님의 아이디는 <%=userid%> 입니다.
<input type="button" onclick="location.href='login.jsp'" value="로그인 화면"/>
</body>
</html>