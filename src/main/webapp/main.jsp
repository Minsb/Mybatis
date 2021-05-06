<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="mystyle.css">
<title>메인 페이지</title>
</head>
<script>if(sessionStorage.getItem("score") != null)
	{
	sessionStorage.removeItem("score"); 
	sessionStorage.removeItem("lives"); 
	sessionStorage.removeItem("stage"); 
	}
	</script>
<body>
<table border=2 width="250" height="180">
<tbody>
          <tr>
            <td align="center"colspan="5"><div style="font-size : 30px">블록 깨기 게임</div></td>
          </tr>
          <tr>
            <td align="center"colspan="5"><div style="font-size : 20px">12152143 김민섭</div></td>
          </tr>
		<tr>
            <td><input type="button" onclick="location.href='game.jsp'" value="게임 시작"></td>
            <td><input type="button" onclick="location.href='manual.jsp'" value="게임 방법"></td>
            <td><input type="button" onclick="location.href='ranking.jsp'" value="랭킹"></td>
            <td><input type="button" onclick="location.href='mypage.jsp'" value="마이 페이지"></td>
            <td><input type="button" onclick="location.href='login.jsp'" value="로그아웃"></td>
          </tr>
          </tbody>
          </table>
</body>
</html>