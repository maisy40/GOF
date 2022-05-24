<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<style>
      body{
        width: 500px;
        height: 300px;
        text-align: center;
      }
</style>
</head>

<body>

  <br>
  <b><font size="5" color="gray">정말 탈퇴하시겠습니까?</font></b>
  <br>
  <p>이제 사치하시겠습니까?
    <br>그렇다면 비밀번호를 입력해주세요</p>
  <br><br>

  <input type="text" name="pw" id="pw"><br><br>
  <input type="submit" value="탈퇴하기" id="realout">
  <input type="button" value="그만두기" onclick="window.close()">

<script>
	$("#realout").on("click", function(){
		if($("#pw").val()==""){
			alert("비밀번호를 먼저 입력하세요.");
			return;
		}	
		
		$.ajax({
			type:"POST",
			url: "/memberCheck.member",
			data: {pw:$("#pw").val()}
		}).done(function(resp){
			if(resp == "false"){
				alert("비밀번호가 올바르지 않습니다.");
				$("#id").val("");
				$("#id").focus();
			} else {
				window.close();
				opener.location.href="/realOut.member"
			}

		})
	})
</script>
</body>
</html>