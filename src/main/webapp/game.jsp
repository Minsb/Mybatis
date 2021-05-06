<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kim12152143.model.User"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="mystyle.css">
<title>게임 화면</title>
</head>
<body>
<%
User user = (User)session.getAttribute("userdata");
%>
<form id="HiddenForm" method="post" action="insertRank">
     		<input type="hidden" name="userid" value=<%=user.getId()%>>
     		<input type="hidden" name="name" value=<%=user.getNickname()%>>
     		<input type="hidden" id="score" name="score">
     		<input type="hidden" id="stage" name="stage">
	 		</form>
<canvas id="myCanvas" width="700" height="500"></canvas>
<script>
var canvas = document.getElementById("myCanvas");
var ctx = canvas.getContext("2d");
var temp = 0;

if(sessionStorage.getItem("score") != null) {
var score = sessionStorage.getItem("score");
temp = score;
var lives = sessionStorage.getItem("lives"); 
var stage = sessionStorage.getItem("stage"); 
alert(temp);
}
else {
	var score = 0
	var lives = 1
	var stage = 1
}

var ballRadius = 25;

var x = canvas.width/2;
var y = canvas.height-30;
var dx = 8 + stage*0.5
var dy = -8 - stage*0.5

var barY = 10;
var barX = 150;
var barHitsize = (canvas.width-barX)/2;

var rightArrow = false;
var leftArrow = false;

var blockRow = 5;
var blockCol = stage % 4 + 1;

var blockWidth = 120;
var blockHeight = 40;
var blockPad = 10;

var topOffset = 30;
var leftOffset = 30;

var bricks = [];
for(var c=0; c<blockCol; c++) {
  bricks[c] = [];
  for(var r=0; r<blockRow; r++) {
    bricks[c][r] = { x: 0, y: 0, status: 1 };
  }
}
document.addEventListener("keydown", keyDownHandler, false);
document.addEventListener("keyup", keyUpHandler, false);
document.addEventListener("mousemove", mouseMoveHandler, false);

function keyDownHandler(e) {
    if(e.key == "Right" || e.key == "ArrowRight") {
        rightArrow = true;
    }
    else if(e.key == "Left" || e.key == "ArrowLeft") {
        leftArrow = true;
    }
}

function keyUpHandler(e) {
    if(e.key == "Right" || e.key == "ArrowRight") {
        rightArrow = false;
    }
    else if(e.key == "Left" || e.key == "ArrowLeft") {
        leftArrow = false;
    }
}

function mouseMoveHandler(e) {
  var relativeX = e.clientX - canvas.offsetLeft;
  if(relativeX > 0 && relativeX < canvas.width) {
    barHitsize = relativeX - barX/2;
  }
}

function collision() {
  for(var c=0; c<blockCol; c++) {
    for(var r=0; r<blockRow; r++) {
      var b = bricks[c][r];
      if(b.status == 1) {
        if(x > b.x && x < b.x+blockWidth && y > b.y && y < b.y+blockHeight) {
          dy = -dy;
          b.status = 0;
          score++;
          if(score - temp == blockRow*blockCol) {
            alert("stage " + stage + " Clear!");
            stage++;
            sessionStorage.setItem("score", score ); 
    		sessionStorage.setItem("lives", lives ); 
    		sessionStorage.setItem("stage", stage ); 
            document.location.reload();
          }
        }
      }
    }
  }
}

function drawBall() {
  ctx.beginPath();
  ctx.arc(x, y, ballRadius, 0, Math.PI*2);
  ctx.fillStyle = "#000000";
  ctx.fill();
  ctx.closePath();
}
function drawBar() {
  ctx.beginPath();
  ctx.rect(barHitsize, canvas.height-barY, barX, barY);
  ctx.fillStyle = "#000000";
  ctx.fill();
  ctx.closePath();
}
function drawBricks() {
  for(var c=0; c<blockCol; c++) {
    for(var r=0; r<blockRow; r++) {
      if(bricks[c][r].status == 1) {
        var brickX = (r*(blockWidth+blockPad))+leftOffset;
        var brickY = (c*(blockHeight+blockPad))+topOffset;
        bricks[c][r].x = brickX;
        bricks[c][r].y = brickY;
        ctx.beginPath();
        ctx.rect(brickX, brickY, blockWidth, blockHeight);
        ctx.fillStyle = "#000000";
        ctx.fill();
        ctx.closePath();
      }
    }
  }
}
function drawScore() {
  ctx.font = "16px Arial";
  ctx.fillStyle = "#0095DD";
  ctx.fillText("Score: "+score, 8, 20);
}
function drawLives() {
  ctx.font = "16px Arial";
  ctx.fillStyle = "#0095DD";
  ctx.fillText("Lives: "+lives, canvas.width-85, 20);
}

function drawStage() {
	  ctx.font = "16px Arial";
	  ctx.fillStyle = "#0095DD";
	  ctx.fillText("stage: "+stage, canvas.width-370, 20);
	}

function draw() {
  ctx.clearRect(0, 0, canvas.width, canvas.height);
  drawBricks();
  drawBall();
  drawBar();
  drawScore();
  drawLives();
  drawStage();
  collision();

  if(x + dx > canvas.width-ballRadius || x + dx < ballRadius) {
    dx = -dx;
  }
  if(y + dy < ballRadius) {
    dy = -dy;
  }
  else if(y + dy > canvas.height-ballRadius) {
    if(x > barHitsize && x < barHitsize + barX) {
      dy = -dy;
    }
    else {
      lives--;
      if(!lives) {
        var check = confirm("게임 오버 : 랭킹을 등록하시겠습니까?");
        if(check == true){
        	document.getElementById("score").value = score;
        	document.getElementById("stage").value = stage;
        	
        	sessionStorage.removeItem("score"); 
            sessionStorage.removeItem("lives"); 
            sessionStorage.removeItem("stage"); 
            
            document.getElementById("HiddenForm").submit();
          	alert("등록 완료")
        }
        else if(check == false){
        	sessionStorage.removeItem("score"); 
            sessionStorage.removeItem("lives"); 
            sessionStorage.removeItem("stage"); 
          alert("메인 페이지로 이동합니다")
          location.href="main.jsp";
        }
      }
      else {
        x = canvas.width/2;
        y = canvas.height-30;
        barHitsize = (canvas.width-barX)/2;
      }
    }
  }

  if(rightArrow && barHitsize < canvas.width-barX) {
    barHitsize += 7;
  }
  else if(leftArrow && barHitsize > 0) {
    barHitsize -= 7;
  }

  x += dx;
  y += dy;
  requestAnimationFrame(draw);
}

draw();
</script>
<hr>
<form>
<input type="button" style="font-size:20px; padding:20px 20px" onclick="location.href='main.jsp'" value="돌아가기">
</form>
      
            

</body>
</html>