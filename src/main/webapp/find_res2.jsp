<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
</head>
<body>
<h2>비밀번호 찾기</h2>
<hr>
<%
String pw = (String)request.getAttribute("result");
int quest = (Integer)request.getAttribute("question");
String ans = (String)request.getAttribute("answer");

switch(quest) {
case 1:
	out.println("비밀번호 찾기 질문 : 졸업한 초등학교는?<br>");
	break;
case 2:
	out.println("비밀번호 찾기 질문 : 가장 좋아하는 음식은?<br>");
	break;
default:
	out.println("오류<br>");
	break;
}

%>
<input type="hidden" id="answer" value= <%=ans%>>

<input type="text" id="answerinput" value="정답을 입력하세요"/>
<input type="button" onclick="check();" value="확인"/>

<div id="msg" style="visibility:hidden;">회원님의 비밀번호는 <%=pw%> 입니다.</div>


<br>
<input type="button" onclick="location.href='login.jsp'" value="로그인 화면"/>

<script>
var count = 0;
function check() {
	var input = document.getElementById("answerinput").value;
	var answer = document.getElementById("answer").value;
	var msg = document.getElementById("msg");
	
	if(input == answer) {
		msg.style.visibility = "visible";
	}
	else {
		count++
		alert('틀렸습니다.' + count + ' 번 오류');
	}
	
	if(count > 5) {
		alert('시도 횟수가 초과되어 로그인 화면으로 이동합니다');
		location.href="login.jsp";
	} 
}
</script>

</body>
</html>