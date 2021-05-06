<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
<%
String passwordreal = (String)request.getAttribute("userpw");
String passwordinput = (String)request.getAttribute("password");

session.setAttribute("userdata", request.getAttribute("user"));

if(passwordreal != null && passwordinput != null){
if(passwordreal.equals(passwordinput))
{
	RequestDispatcher view = request.getRequestDispatcher("main.jsp");
	view.forward(request, response);
}
else {
	session.setAttribute("errMsg", "로그인 정보가 올바르지 않습니다");
	response.sendRedirect("login.jsp");	
}
}
else {
	session.setAttribute("errMsg", "로그인 정보가 올바르지 않습니다");
	response.sendRedirect("login.jsp");	
}
%>
</body>
</html>