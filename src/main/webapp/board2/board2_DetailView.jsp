<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Board2 DetailView Page</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
<link rel="stylesheet" href="/css/board2/board2_DetailView.css">

</head>
<body>
	<div id="container">
		<div class="row w-100 m-0" id=header>
			<div class="col-12 p-0">
				<nav class="navbar navbar-expand-lg navbar-light bg-light">
					<div class="container-fluid">
						<a class="navbar-brand" href="/index.jsp">앞날의 지침</a>
						<button class="navbar-toggler" type="button"
							data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown"
							aria-controls="navbarNavDropdown" aria-expanded="false"
							aria-label="Toggle navigation">
							<span class="navbar-toggler-icon"></span>
						</button>
						<div class="collapse navbar-collapse justify-content-end"
							id="navbarNavDropdown">
							<ul class="navbar-nav">
								<li class="nav-item"><a class="nav-link active"
									aria-current="page" href="/list.brd1?cpage=1"
									style="color: #664E55">살까말까</a></li>
								<li class="nav-item"><a class="nav-link active"
									aria-current="page" href="/list.brd2" style="color: #664E55">최저가
										경매</a></li>
								<li class="nav-item"><a class="nav-link active"
									aria-current="page" href="csmain.cscenter"
									style="color: #664E55">고객센터</a></li>

								<c:choose>
									<c:when test="${loginID =='admin'}">
										<li class="nav-item"><a class="nav-link active"
											aria-current="page" href="#" style="color: #664E55">관리자페이지</a></li>
										<li class="nav-item"><a class="nav-link active"
											aria-current="page" href="logout.member"><i
												class="bi bi-box-arrow-right"></i></a></li>
									</c:when>
									<c:when test="${loginID !=null}">
										<li class="nav-item"><a class="nav-link active"
											aria-current="page" href="mypage.member"
											style="color: #664E55">마이페이지</a></li>
										<li class="nav-item"><a class="nav-link active"
											aria-current="page" href="logout.member"><i
												class="bi bi-box-arrow-right"></i></a></li>
									</c:when>
								</c:choose>
							</ul>
						</div>
					</div>
				</nav>
			</div>
		</div>
		<div class="row w-100 m-0" id="content">
			<div class="d-none d-lg-block col-3"></div>
			<div class="col-12 col-lg-6">
				<div class="row w-100 m-0" id="board2Outline">
					<div class="col-12">
						<div class="row w-100 m-0">
							<div class="col-12 round_title" align=center>${dto.title}</div>
						</div>
						<div class="row w-100 my-2">
							<div class="col-6 col-md-2">글번호 : ${dto.seq }</div>
							<div class="col-6 col-md-4">작성자 : ${dto.nickname }</div>
							<div class="col-6 col-md-4" id="wtime">작성일 : ${dto.write_date}</div>
							<div class="col-6 col-md-2">조회수 : ${dto.view_count}</div>
						</div>
						<div class="row w-100 my-3 mx-0" id="board2List">
							<div class="col-12" style="text-align:left">제한시간 : <span id="limit">
								<div class="spinner-border spinner-border-sm text-secondary" role="status">
 									 <span class="visually-hidden">Loading...</span>
								</div>
							</div>
							<div class="col-12">
								<div class="row" style="height:50%">
									<div class="col-12 my-2" >${dto.contents}</div>
								</div>	
							</div>
							<div class="col-12">
								<div class="row" class="btn">
									<div class="col-12" style="text-align:right;">
										<button type="button" id="listview" class=write>
											<a href="list.brd2" style="color: #9D8189;">목록보기</a>
										</button>
										<c:if
											test="${(dto.nickname == loginNN && cck== false)||(loginID == admin)}">
											<button type="button" id="modi" class=write>수정하기</button>
											<button type="button" id="del" class=write>삭제하기</button>
										</c:if>
									</div>
								</div>
							</div>
						</div>
							
						<!--  댓글   -->	
						<div class="row w-100 m-0" id="replywriter">
								<form action="/write.brd2_reply" method="post">
											<div class="row">
												<div class="col-12">
													<div class="row">
														<div class="col-12 col-sm-3 p-0 px-1">
															<input type="text" id="writer" value="${loginNN}" style="display: none"> 
															<input type="text" required="required" placeholder="가격 ex)1000" maxlength="10" name="price" id="wprice" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" /> 
															<input type="text" name="pseq" value="${dto.seq}" style="display: none">
															
														</div>
														<div class="col-12 col-sm-7 p-0 px-1">
															<textarea placeholder="내용을 입력해주세요" name="contents" id="contents" required="required"></textarea>
														</div>
														<div class="col-12 col-sm-2 p-0 px-1">
															<button type="submit" id="btn1">작성</button>
														</div>
													</div>
													<hr>
												</div>
											</div>
										</form>
									<!-- 	댓글 작성 한적이 없거나 선택되지 않았다면 뎃글 작성 가능 -->
								</div>
								<c:if test="${crdto != null}">
									<div class="row bestcontent">
										<div class="col-10">
											<div class="row writingEtc">
												<div class="col-12 col-sm-6">낙찰가 : ${crdto.price}원</div>
												<div class="col-12 col-sm-6">닉네임 : ${crdto.nickname}</div>
											</div>
											<div class="row p-0">
												<div class="col-12 p-0" id=best><textarea class="best" disabled >${crdto.contents}</textarea></div>
											</div>				
										</div>
										<div class="col-2 p-0" style="margin-top: 10px;"><img src="/img/thumbs-up.png" style="width:80px; height:80px; "></div>
									</div>
									<hr>
								</c:if>
								<div class="row w-100 m-0 " >
									<div class="col-12 p-0 h-100  ">
										<c:forEach var="i" items="${rdto}">
											<div class="row w-100 m-0 reply ">
										
												<div class="col-12 d-sm-none d-block writingEtc">
													작성자 : ${i.nickname } <i class="bi bi-dot"></i>
													작성일 : ${i.write_date}
												</div>
												
												<div class="col-6 col-sm-3 price">
													<div id="w${i.seq}" class="editable"></div>
													<input type="text" value="${i.price}" id="${i.seq}" class="editable" disabled style = "display:none; text-align:center;">
												</div>
												
												<div class="col-sm-9 d-none d-sm-block writingEtc">
													작성자 : ${i.nickname } <i class="bi bi-dot"></i>
													작성일 : ${i.write_date}
												</div>
												
												
											</div>
											<div class="row w-100 m-0">
												<div class="col-12  contents">
													<div class="row">
														<div class="col-12 incontents">
															<textarea class="content_editable" disabled >${i.contents}</textarea>
														</div>
													</div>
												</div>
												<div class="col-12  p-0 text2 writingEtc">
													<div style="float:right;">
													<c:if test="${(i.nickname == loginNN && cck== false)||(loginID == admin)}">
														<button class="modibtn write">수정</button>
														<button class="delbtn write" value="${i.seq}" >삭제</button>	
													</c:if>
													</div>
													<c:if test="${loginNN == dto.nickname && cck == false}">
														<input type="radio" name="choice" value="${i.seq}" class="choice" style="margin-left: 10px; margin-top:3px;"><span>선택</span>
													</c:if>
												</div>
											
											</div>
										</c:forEach>
									</div>
								</div>
							</div>
							<div class="col-2"></div>
						
					</div>
				</div>
			</div>
		</div>
		<div class="row w-100 m-0" id="footer" style="background-color:#A2BAAC; font-weight:bold">
			<div class="col-12 d-lg-none">
				<div style="margin-left:40px ; margin-top:20px;text-align:left">
					<a href="/cscenter/csmain.jsp" class="footerLink"><span>자주 묻는 질문</span></a><span style="margin-left:20px" class="footerBar">|</span>
					<a href="/cscenter/csmain.jsp" class="footerLink"><span style="margin-left:20px">1 : 1 문의</span></a><span style="margin-left:20px" class="footerBar">|</span>
					<a href="/cscenter/csmain.jsp" class="footerLink"><span style="margin-left:20px">찾아오시는 길</span></a><br>
					<div style="margin-top:35px ; text-align:left">
						<span class="footerLetter">ADDRESS : 서울 중구 남대문로 120 대일빌딩 2층, 3층</span><br>
						<span class="footerLetter">대 표 전 화 : 4989 - 4284</span><span style="margin-left:20px" class="footerLetter">|</span><span>E-MAIL : 4989 - 4284 </span><br>
						<span style="color:#FFF2CC">COPYRIGHT BY PHOENIX  </span>
					</div>
				</div>
			</div>
			<div class="d-none d-lg-block col-lg-9">
				<div style="margin-left:40px ; margin-top:20px;text-align:left">
					<a href="/cscenter/csmain.jsp" class="footerLink"><span>자주 묻는 질문</span></a><span style="margin-left:20px" class="footerBar">|</span>
					<a href="/cscenter/csmain.jsp" class="footerLink"><span style="margin-left:20px">1 : 1 문의</span></a><span style="margin-left:20px" class="footerBar">|</span>
					<a href="/cscenter/csmain.jsp" class="footerLink"><span style="margin-left:20px">찾아오시는 길</span></a><br>
					<div style="margin-top:30px ; text-align:left; margin-bottom:15px">
						<span class="footerLetter">ADDRESS : 서울 중구 남대문로 120 대일빌딩 2층, 3층</span><br>
						<span class="footerLetter">대 표 전 화 : 4989 - 4284</span><span style="margin-left:20px" class="footerLetter">|</span><span style="margin-left:20px" class="footerLetter">E-MAIL : 4989 - 4284 </span><br>
						<span style="color:#FFF2CC">COPYRIGHT BY YUNJI AYEONG WOOHYENG JEONGYOEN HEESEUNG IN  PHOENIX  </span>
					</div>
				</div>
			</div>
			<div class="d-none d-lg-block col-lg-3" style="text-align:right">
				<img src="/img/footerLogo.png" style="width:70%;margin-right:10px;margin-top:10%">
			</div>
		</div>
	</div>
	
	<script>
	// 머니폼
	window.onload = function(){
		for(let i=0;i<${jrdto}.length;i++){
			let seq = ${jrdto}[i].seq;
			let money = $("#"+seq).val();
			let moneyForm = money + "원";
			$("#w"+seq).text(moneyForm);
		}
			
	}
	
	if(${timeover}){
		$("#btn1").attr("disabled","true");
		$("#btn1").text('마감');

		$("#modi").css("display","none");
		$(".choice").css("display","none");
		$(".choice").children("display","none");
		
		$(".modibtn").css("display","none");
		$(".text2").text("시간종료");
		$(".text2").css("text-align","center");
		
		$("#wprice").attr("disabled",true);
		$("#contents").attr({"disabled":"true","placeholder":"작성시간이 마감된 게시글입니다."});
	}
		if(${wck}){
			$("#contents").attr("disabled",true);
			$("#contents").attr("placeholder","댓글은 한 게시물 당 한 개만 작성이 가능합니다.");
			$("#wprice").attr("disabled",true);
		}
		if(${cck}){
		$("#contents").attr("disabled",true);
		$("#contents").attr("placeholder","작성자가 댓글을 선택했다면 게시글을 작성할수 없습니다.");
		$("#wprice").attr("disabled",true);
		//$(".content_editable").css("display","none");
 		//$("#full_reply").css("display", "inline");
		
		}
		
 	if(${cck == true}){
 		$(".text2").text("");
 		
 	}
 	
	$("#del").on("click",function(){
		result = window.confirm("정말 삭제하시겟습니까?");
		if(result){
			location.href = "/del.brd2?seq="+${dto.seq}
		}
		//글 삭제
	})
	$("#modi").on("click",function(){
		result = window.confirm("정말 수정하시겟습니까?");
		if(result){
			location.href = "/modi.brd2?seq="+${dto.seq}
		}
		//글 수정
	})
	$(".delbtn").on("click",function(){
		reulst = window.confirm("정말 삭제하시겟습니까?");
		if(reulst){
		$.ajax({
			url:"/del.brd2_reply",
			dataType:"json",
			data:{rseq:$(this).val(),
				pseq:${dto.seq}}
		}).always(function(){
			location.reload();
		})
		}
	})
	//댓글 삭제
	$(".choice").on("click",function(){
		result = window.confirm("정말 선택하시겟습니까?");
		if(result){
			$.ajax({
				url:"/choice.brd2_reply",
				dataType:"json",
				data:{rseq:$(this).val()
				}
				}).always(function(){
					location.reload();
				})
			}
	})
	//댓글 선택
	$(".modibtn").on("click",function(){
		result = window.confirm("수정 하시겟습니까?");
		if(result){
			$(this).parent().parent().parent().siblings(".reply").children(".price").children().removeAttr("disabled");
			$(this).parent().parent().siblings(".contents").children().children(".incontents").children().removeAttr("disabled");
			$(this).css("display","none");
			$(this).siblings().css("display","none");
			
			$(".choice").css("disply","none");
			
			for(let i=0;i<${jrdto}.length;i++){
				let seq = ${jrdto}[i].seq;
				$("#w" + seq).css("display", "none");
				$("#" + seq).css("display","inline");
			}
			
			
			let ok = $("<button>");
			ok.attr("type","button");
			ok.attr("class","modiok write");
			ok.text("수정 완료");
			
			let cancel = $("<button>");
			cancel.text("취소");
			cancel.attr("type","button");
			cancel.attr("class","write");
			cancel.on("click",function(){
				location.reload();
			});
			$(this).parent().append(ok);
			$(this).parent().append(cancel);
			$(".modiok").on("click",function(){
				console.log($(this).parent().siblings().val());
			$.ajax({
				url : "/modi.brd2_reply",
				dataType:"json",
				data:{
					rseq:$(this).parent().siblings().val(),
					price:$(this).parent().parent().parent().siblings(".reply").children(".price").children()[1].value,
					contents:$(this).parent().parent().siblings(".contents").children().children(".incontents").children()[0].value
				}
			}).always(function(){
				location.reload();
			})
			})
		}
	})
	//댓글 수정
	const countDownTimer = function(id, date) {
			let _vDate = new Date(date);
			// 전달 받은 일자 
			let _second = 1000;
			let _minute = _second * 60;
			let _hour = _minute * 60;
			let _day = _hour * 24;
			let timer;
			function showRemaining() {	
				let now = new Date();
				var distDt = _vDate - now;
				if (distDt < 0) {
					clearInterval(timer);
					document.getElementById(id).textContent="종료";
					document.getElementById(id).style.color="#FF595E";
					return;
				}
				let days = Math.floor(distDt / _day);
				let hours = Math.floor((distDt % _day) / _hour);
				let minutes = Math.floor((distDt % _hour) / _minute);
				let seconds = Math.floor((distDt % _minute) / _second);
				//document.getElementById(id).textContent = date.toLocaleString() + "까지 : ";
 				//document.getElementById(id).textContent = days + '일 ';
				//document.getElementById(id).textContent += hours + '시간 ';
				document.getElementById(id).textContent = minutes + '분 ';
				document.getElementById(id).textContent += seconds + '초';
				document.getElementById(id).style.color="#1982C4";
			}
			timer = setInterval(showRemaining, 1000);
		}
	        let time = $("#wtime").text();
	        let dateObj = new Date(time);
	        dateObj.setMinutes(dateObj.getMinutes() +30);
			countDownTimer("limit", dateObj);
	
			
		
			
	
	</script>
</body>
</html>