<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>앞날의 지침</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
<link rel="stylesheet" href="/css/index.css">
<script>
      	// SDK를 초기화. 사용할 앱의 JavaScript 키
      	Kakao.init('b956cab5ef7dbe5bc1f861614a4b2061');
//       	console.log(Kakao.isInitialized());
</script>

</head>
<body>

	<div class="container w-100">
		<div class="row w-100 m-0" id="header">
			<div class="col-12">
				<nav class="navbar navbar-expand-md navbar-light bg-light">
					<div class="container-fluid">
						<a class="navbar-brand" href="/index.jsp" style="color:#664E55">앞날의 지침</a>
						<button class="navbar-toggler" type="button"
							data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown"
							aria-controls="navbarNavDropdown" aria-expanded="false"
							aria-label="Toggle navigation">
							<span class="navbar-toggler-icon"></span>
						</button>
						<div class="collapse navbar-collapse justify-content-end"
							id="navbarNavDropdown">
							<ul class="navbar-nav">
								<c:choose>
									<c:when test="${loginID =='admin'}">
										<li class="nav-item"><a class="nav-link active"
											aria-current="page" href="#" style="color:#664E55">지출의 참견</a></li>
										<li class="nav-item"><a class="nav-link active"
											aria-current="page" href="/list.brd2" style="color:#664E55">선택의 참견</a></li>
										<li class="nav-item"><a class="nav-link active"
											aria-current="page" href="/csmain.cscenter" style="color:#664E55">고객센터</a></li>
										<li class="nav-item"><a class="nav-link active"
											aria-current="page" href="/adminmain.admin" style="color:#664E55">관리자페이지</a></li>
										<li class="nav-item"><a class="nav-link active"
										aria-current="page" href="#"><i class="bi bi-box-arrow-right" style="color:#664E55"></i></a></li>
									</c:when>
									<c:when test="${loginID !=null}">
										<li class="nav-item"><a class="nav-link active"
											aria-current="page" href="/list.brd1?cpage=1" style="color:#664E55">지출의 참견</a></li>
										<li class="nav-item"><a class="nav-link active"
											aria-current="page" href="/list.brd2" style="color:#664E55">선택의 참견</a></li>
										<li class="nav-item"><a class="nav-link active"
											aria-current="page" href="/csmain.cscenter" style="color:#664E55">고객센터</a></li>
										<li class="nav-item"><a class="nav-link active"
											aria-current="page" href="/mypage.member" style="color:#664E55">마이페이지</a></li>
										<li class="nav-item"><a class="nav-link active"
										aria-current="page" href="#"><i class="bi bi-box-arrow-right" style="color:#664E55"></i></a></li>
									</c:when>
									<c:otherwise>
										<li class="nav-item nonMember"><a class="nav-link active"
											aria-current="page" href="#" style="color:#664E55">지출의 참견</a></li>
										<li class="nav-item nonMember"><a class="nav-link active"
											aria-current="page" href="#" style="color:#664E55">선택의 참견</a></li>
										<li class="nav-item"><a class="nav-link active"
											aria-current="page" href="/csmain.cscenter" style="color:#664E55">고객센터</a></li>
										<li class="nav-item"><a class="nav-link active"
											aria-current="page" href="/joinform.member" style="color:#664E55">회원가입</a></li>
									</c:otherwise>
								</c:choose>
							</ul>
						</div>
					</div>
				</nav>
			</div>
		</div>
		
		<div class="row w-100 m-0" id="content">
			<div class="d-none d-lg-block col-12 bills">
				<img src="/img/tmp_indexL.png" id="billsPic1">
			</div>
			<div class="d-none d-lg-block col-12 bills">
				<img src="/img/tmp_indexW.png" id="billsPic2">
			</div>
			<div class="col-12" id="loginArea">
				<h1>Blah Blah</h1>
				<c:choose>
					<c:when test="${loginID !=null}">
						<div class="row">
							<div class="col-12">${loginNN }님 안녕하세요!</div>
						</div>
					</c:when>
					<c:otherwise>
						<form action="login.member" method="post">
							<div class="row">
								<div class="col-12 p-0">
									<input type="text" id="id" name="id" placeholder="아이디 입력">
								</div>
								<div class="col-12 p-0">
									<input type="password" id="pw" name="pw"
										placeholder="비밀번호 입력">
								</div>
								<div class="col-12">
									<input type="button" id="login" value="로그인">
									<a href="/joinform.member"><input type="button" value="회원가입" id="joinbtn"></a><br>
									<input type="button" id="kakao-login-btn" value="카카오로 로그인"><br>
									<input type="button" id="kakao-logout" value="카카오로 로그아웃">
								</div>
							</div>
						</form>
					</c:otherwise>
				</c:choose>
			</div>
			<div class="col-12">
				<img src="/img/tmp_indexpig.png" id="pigpic">
			</div>
		</div>

		<div class="row w-100 m-0" id="footer">
			<div class="col-12">Copyright by Phoenix since 2022 05 00</div>
		</div>
	
	</div>

	<script>
    	$(".nonMember").on("click",function(){ // 로그인 하지 않고 게시판 1,2 클릭 시 팝업
    		Swal.fire({
    			  title: '회원가입 후 이용 가능합니다.',
    			  text: "회원가입 페이지로 이동합니다.",
    			  icon: 'warning',
    			  showCancelButton: true,
    			  confirmButtonColor: '#3085d6',
    			  cancelButtonColor: '#d33',
    			  confirmButtonText: '확인',
    			  cancelButtonText: '취소',
    			}).then((result) => {
    			  if (result.isConfirmed) {
    			    location.href="/joinform.member"
    			  }
    			})
    	})

    	$("#login").on("click",function(){ // 일반회원 로그인시
    		$.ajax({
    			url:"/login.member",
    			data:{id:$("#id").val(),
    				pw:$("#pw").val()},
    			type:"POST"
    		}).done(function(resp){
    			if(resp=='false'){
    				Swal.fire({
    					  icon: 'error',
    					  title: 'Oops...',
    					  text: '입력하신 회원정보가 존재하지 않습니다.'
   					})
    				$("#id").val("");
    				$("#pw").val("");
    			}else{
    				location.reload();
    			}
    		})
    	})

	    $("#kakao-login-btn").on("click", function(){
	    //1. 로그인 시도
	    Kakao.Auth.login({
	        success: function(authObj) {
	         
	          //2. 로그인 성공시, API 호출
	          Kakao.API.request({
	            url: '/v2/user/me',
	            success: function(res) {
	              console.log(res);
	              let id = res.id;
				  scope : 'profile_nickname, account_email';
				alert('로그인성공');
	              //location.href="loginok.jsp";
	        	}
	          })
	          console.log(authObj); //access 토큰 값
			  Kakao.Auth.setAccessToken(authObj.access_token); //access 토큰 값 저장
			  var token = authObj.access_token;
	        },
	        fail: function(err) {
	          alert(JSON.stringify(err));
	        }
	      });
	    })
	    
	    $("#kakao-logout").on("click", function(){
			
			if (!Kakao.Auth.getAccessToken()) {
	      			alert('Not logged in.')
	      			return
	    		}
	    		Kakao.Auth.logout(function() {
	      			alert('logout ok\naccess token -> ' + Kakao.Auth.getAccessToken());
	   		 	})
	  		
		  })
		  
		  $(".bi-box-arrow-right").on("click",function(){
			  Swal.fire({
				  title: '로그아웃 하시겠습니까?',
				  showCancelButton: true,
				  confirmButtonText: '로그아웃',
				  cancelButtonText: '취소',
				}).then((result) => {
				  if (result.isConfirmed) {
				    location.href="/logout.member";
				  } 
				})
		  })
    </script>
</body>
</html>