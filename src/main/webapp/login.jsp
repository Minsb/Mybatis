<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"> 
<link rel="stylesheet" type="text/css" href="mystyle.css">
<title>로그인 페이지</title>
<script>
function admin_click() {
	var pass = prompt('관리자 코드를 입력하세요');
	if(pass == "1234")
		{
		alert('관리자님 환영합니다');
		location.href="admintemp.jsp"
		}
	else {
		alert('비밀번호 오류');
	}
}
</script>
</head>
<body>
<%
String errMsg = (String)session.getAttribute("errMsg");
if(errMsg == null) errMsg = "";

session.invalidate();
%>
<form action="loginUser" method="post" id="loginForm">
	<div>
		<label>아이디</label> <input name="id" type="text">
	</div>
	<div>
		<label>비밀번호</label> <input name="password" type="password">
	</div>
	<div class="checkbox">
		<label> <input type="checkbox" name="rememberid"> 아이디저장 </label>
	</div>
	<input type ="submit" value = "로그인">
	<input type="button" onclick="location.href='find.jsp'" value="계정 찾기" />
	<input type="button" onclick="location.href='register.jsp'" value="회원가입">
	<input type="button" onclick="admin_click();" value="관리자페이지" />
</form>

<div id="errMsg"><%=errMsg %></div>
</body>
</html>