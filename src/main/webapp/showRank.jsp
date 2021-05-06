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
<META HTTP-EQUIV="refresh" CONTENT="5">
<title>순위</title>
</head>
<body>
 <h2>게임 랭킹</h2>
    <table>
        <tr bgcolor="pink">
        <th>번호</th><th>유저 아이디</th><th>닉네임</th><th>점수</th><th>스테이지</th>
        </tr>
        <c:forEach items="${list}" var="User" >
        <tr>
        <td>${User.rankidx}</td>
        <td>${User.userid}</td>
        <td>${User.nickname}</td>
        <td>${User.score}</td>
        <td>${User.stage}</td>
        </tr>
    </c:forEach>
    <c:if test="${empty list }">
        <tr><td>${"데이터 없음"}</td></tr>
    </c:if>
    </table>
   <input type="button" onclick="location.href='main.jsp'" value="메인 페이지" />
</body>
</html>