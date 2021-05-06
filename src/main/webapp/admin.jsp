<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<title>관리자 페이지</title>
</head>
<body>
 <h2>회원 정보</h2>
    <table>
        <tr bgcolor="pink">
        <th>아이디</th><th>비밀번호</th><th>이름</th><th>닉네임</th><th>출생일</th><th>가입일</th><th>이메일</th><th>회원 삭제</th>
        </tr>
        <c:forEach items="${list}" var="User" >
        <tr>
        <td>${User.id}</td>
        <td>${User.password}</td>
        <td>${User.name}</td>
        <td>${User.nickname}</td>
        <td><fmt:formatDate pattern="yyyy-MM-dd" value="${User.dob}" /></td>
        <td><fmt:formatDate pattern="yyyy-MM-dd" value="${User.dor}" /></td>
        <td>${User.email}</td>
        <td> <form action="userDelete" method="post" id="deletebutton">
        <input type = "hidden" name="userid" value="${User.id}" />
        <input type = "hidden" name="check" value="관리자" />
        <input type ="submit" value = "삭제"></form></td>
        </tr>
    </c:forEach>
    <c:if test="${empty list }">
        <tr><td>${"데이터 없음"}</td></tr>
    </c:if>
    </table>
   <input type="button" onclick="location.href='login.jsp'" value="로그인 화면" />
   <form action="allUser" method="get"><input type ="submit" value = "새로고침"></form>
</body>
</html>