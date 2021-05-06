<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kim12152143.model.User"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 수정 결과 화면</title>
</head>
<body>
<%
User user = (User)session.getAttribute("userdata");
int category = (Integer)request.getAttribute("category");

switch(category) {
case 1:
	user.setPassword((String)request.getAttribute("newvalue"));
	break;
case 2:
	user.setNickname((String)request.getAttribute("newvalue"));
	break;
case 3:
	user.setEmail((String)request.getAttribute("newvalue"));
	break;
default:
	break;
}
session.setAttribute("userdata", user);
%>
수정 완료
<input type="button" onclick="location.href='main.jsp'" value="메인페이지">
</body>
</html>