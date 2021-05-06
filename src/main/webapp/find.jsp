<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>계정 찾기 페이지</title>
</head>
<body>
<input type="button" value="아이디 찾기" onclick="idform();"/>
<input type="button" value="비밀번호 찾기" onclick="pwform();"/>

<form action = "findUser" method = "post">
<input type = "hidden" id= "idform" name = "email" value="이메일을 입력하세요"><br>
<input type ="hidden" id="sbtn1" value = "아이디 찾기">
<input type = "hidden" name="category" value="findid">
</form>

<form action = "findUser" method = "post">
<input type = "hidden" id= "pwform" name = "id" value="아이디를 입력하세요"><br>
<input type ="hidden" id="sbtn2" value = "비밀번호 찾기">
<input type = "hidden" name="category" value="findpw">
</form>

<input type="button" onclick="location.href='login.jsp'" value="돌아가기">

<script>
function idform() {
document.getElementById("idform").type = "text";
document.getElementById("sbtn1").type = "submit";
}
function pwform() {
	document.getElementById("pwform").type = "text";
	document.getElementById("sbtn2").type = "submit";
	}
</script>
</body>
</html>