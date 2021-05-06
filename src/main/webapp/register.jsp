<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="mystyle.css">
<title>회원가입 페이지</title>
</head>
<body>

<form action = "insertUser" method = "post">
ID:<input type = "text" name = "id"><br>
PW:<input type ="password" name = "password"> <br>
NAME:<input type = "text" name = "name"><br>
NICKNAME:<input type = "text" name = "nickname"><br>
DATE OF BIRTH:<input type = "date" name = "dob"> <br>
PASSWORD QUESTION: <select name="questionidx">
   <option value=1>졸업한 초등학교는?</option>
   <option value=2>가장 좋아하는 음식은?</option>
</select><br>
ANSWER:<input type = "text" name = "answer"> <br>
EMAIL: <input type = "text" name = "email"> <br>
<input type ="submit" value = "submit">
<input type="button" onclick="location.href='login.jsp'" value="돌아가기"> <br>
</form>

</body>
</html>