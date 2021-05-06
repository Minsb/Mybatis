<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kim12152143.model.User"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%

response.setHeader("Pragma","no-cache"); 

response.setDateHeader("Expires",0); 

response.setHeader("Cache-Control", "no-cache");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이 페이지</title>
</head>
<body>
<h3>회원 정보</h3>
<hr>
<%
User user = (User)session.getAttribute("userdata");

out.println("아이디 : " + user.getId() + "<br>");
out.println("비밀번호 : " + user.getPassword() + "<br>");
out.println("이름 : " + user.getName() + "<br>");
out.println("닉네임 : " + user.getNickname() + "<br>");
%>
생년월일 : <fmt:formatDate pattern="yyyy-MM-dd" value="<%=user.getDob()%>" /><br>
가입일 : <fmt:formatDate pattern="yyyy-MM-dd" value="<%=user.getDor()%>" /><br>

<%
out.println("이메일 : " + user.getEmail() + "<br>");
%>
<form action="userUpdate" method="post" id="updatebutton">
<select name="category" id="choice">
   <option value=1>비밀번호 변경</option>
   <option value=2>닉네임 변경</option>
   <option value=3>이메일 변경</option>
   </select>
<input type = "hidden" name="userid" value= "<%=user.getId()%>"/>
<input type = "text" name="newvalue"/>
<input type ="submit" value = "수정"></form>

<form action="userDelete" method="post" id="deletebutton">
<input type = "hidden" name="userid" value= "<%=user.getId()%>"/>
<input type = "hidden" name="check" value="유저" />
<input type ="submit" value = "회원 탈퇴"></form>
<input type="button" onclick="location.href='main.jsp'"value="돌아가기">

</body>
</html>