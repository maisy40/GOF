<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>살까말까 - 글쓰기</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<link rel="stylesheet" href="/css/board1/board1_Write.css">

</head>
<body>
     <div class="container w-100">
         <div class="row w-100 m-0" id="header">
			<div class="col-12 p-0">
				<nav class="navbar navbar-expand-md navbar-light bg-light">
					<div class="container-fluid">
						<a class="navbar-brand" href="/index.jsp" style="color: #664E55">앞날의
							지침</a>
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
									aria-current="page" href="/list.brd1?cpage=1" style="color: #664E55">지출의 참견</a></li>
								<li class="nav-item"><a class="nav-link active"
									aria-current="page" href="/list.brd2" style="color: #664E55">선택의
										참견</a></li>
								<li class="nav-item"><a class="nav-link active"
									aria-current="page" href="/csmain.cscenter"
									style="color: #664E55">고객센터</a></li>
								<li class="nav-item"><a class="nav-link active"
									aria-current="page" href="/mypage.member"
									style="color: #664E55">마이페이지</a></li>
								<li class="nav-item"><a class="nav-link active"
									aria-current="page" href="#"><i
										class="bi bi-box-arrow-right" style="color: #664E55"></i></a></li>
							</ul>
						</div>
					</div>
				</nav>
			</div>
		</div>
         
         <div class="row w-100 m-0" id="content">
			<div class="d-none d-lg-block col-3"></div>
			<div class="col-12 col-lg-6">
				<div class="row w-100 m-0" id="board1Outline">
					<div class="col-12">
						<div class="row w-100 m-0" id="writingHeader">
							<div class="col-12">
								<p>지출의참견</p>
								<span>구매가 고민되는 상품의 정보를 입력해주세요.</span>
							</div>
						</div>
						<form action="/write.brd1" enctype="multipart/form-data" method="post">
							<div class="row w-100 m-0" id="writingArea">
								<div class="col-12">
									<input type="text" placeholder="글 제목을 입력해주세요" name="title" size="70" id="title" maxlength=100><br>
								</div>
								<div class="col-2 d-none d-lg-block"></div>
								<div class="col-4 col-lg-4" style="text-align:center">
									<div id="img_Box" class="thumbnail">
					            		<img src="/img/pig2.png" id="img_section">
					            	</div>
								</div>
								<div class="col-8 col-lg-4">
									<input type="text" placeholder="물건명을 입력해주세요" name="item" id="item" maxlength=30><br>  	
					            	<input type="text" placeholder="가격을 입력해주세요" name="item_price" id="item_price" maxlength=10 oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" /><br>
					            	<label for="upload_file">파일 첨부</label>
					            	<input type="file" name="file" id="upload_file" accept="image/*">
								</div>
								<div class="col-2 d-none d-lg-block"></div>
								<div class="col-12">
									<textarea placeholder="이 물건을 꼭 사야하는 이유" name="contents" rows="10" cols="70" maxlength=1000></textarea>
								</div>
								<div class="col-12">
									<input type="button" value="목록으로" id="toList" class="writingBtns">
		          					<input type="submit" value="저장하기" id="submit" class="writingBtns">
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		
		<div class="row w-100 m-0" id="footer">
			<div class="col-12">Copyright by Phoenix since 2022 05 00</div>
		</div>
     </div>	
	
	 <script>
		$("#toList").on("click",function(){
			location.href="/list.brd1?cpage=1";
		})
	     
	   $("#submit").on("click",function(){
	     let item_price = $("#item_price").val().trim();
	     let title= $("#title").val().trim();
	     let item = $("#item").val().trim();
		
	     if(title==''||item_price==''||item==''){
	    	 alert("제목, 물건명, 가격은 필수 입력 사항입니다.");
	    	 return false;
	     }
	   })

	 	
	 	const reader = new FileReader();
	 	reader.onload = (readerEvent) =>{
	 		document.querySelector("#img_section").setAttribute("src",readerEvent.target.result);
	 		console.log(readerEvent.target.result);
	 	}

	     document.querySelector("#upload_file").addEventListener("change",(changeEvent) => {
	       const imgFile = changeEvent.target.files[0];
	       reader.readAsDataURL(imgFile);
	     })
	     

	 </script>
</body>
</html>