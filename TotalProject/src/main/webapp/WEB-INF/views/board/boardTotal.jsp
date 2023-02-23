<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- 금액 콤마 찍기 -->

<%@ include file="../includes/header.jsp"%>

<head>
<link
	href="${pageContext.request.contextPath}/resources/css/board.css?ver=2"
	rel="stylesheet" type="text/css">
<link rel="canonical"
	href="https://getbootstrap.com/docs/5.3/examples/album/">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
	crossorigin="anonymous">
<!-- Favicons -->
<link rel="apple-touch-icon"
	href="/docs/5.3/assets/img/favicons/apple-touch-icon.png"
	sizes="180x180">
<link rel="icon" href="/docs/5.3/assets/img/favicons/favicon-32x32.png"
	sizes="32x32" type="image/png">
<link rel="icon" href="/docs/5.3/assets/img/favicons/favicon-16x16.png"
	sizes="16x16" type="image/png">
<link rel="manifest" href="/docs/5.3/assets/img/favicons/manifest.json">
<link rel="mask-icon"
	href="/docs/5.3/assets/img/favicons/safari-pinned-tab.svg"
	color="#712cf9">
<link rel="icon" href="/docs/5.3/assets/img/favicons/favicon.ico">



<meta name="theme-color" content="#712cf9">

</head>
<body style="font-family: 'Noto Sans KR', sans-serif !important;">

	<div class="container">
		<div class="row kategori">
			<div class="kategori2">통합 검색</div>
		</div>
	</div>


	<!-- 게시물 -->
	<!--관련 게시물 -->
	<div class="row popular">
		<div class="container-fluid">
			<div class="row p_row">
				<div class="col-md-1"></div>

				<div class="col-md-10" style="margin-botton: 20px !important;">

					<!--이미지 게시판 -->
					<input type="hidden" id ="total_list" value ="${tList}">
					<c:forEach items="${tList}" var="tboard">
						<!--list 확인 -->		
		    			<input type='hidden' class ='board_uuid' value ='<c:out value ="${tboard_uuid}"/>'>
	                  
						<!-- □ 게시글  -->
		                <div class="p_article" onclick="" style="font-size: 15px;" class='uploadREsult'>
		                     
			                <ul>
			                    <div class = "p_class">
			                       <a href ="/board/detail?bno=<c:out value ='${tboard.bno}'/>">
			                        	<img src="" id="p_img" class="p_img">
			                       </a>
			                    </div>
		                    </ul>
			                  
			              		<input type ='hidden' class ='uuid' value='<c:out value="${tboard.uuid}" />'>          
			                    <input type ='hidden' class ='uploadPath' value='<c:out value="${tboard.uploadpath}" />'> 
			                    <input type ='hidden' class ='fileName' value='<c:out value="${tboard.filename}" />'> 
		              			<input type='hidden' class ='filebno' value='<c:out value="${tboard.bno}" />'> 
		             
			                <a href="/board/detail?bno=<c:out value ='${tboard.bno}'/>">
		                       <p class="p_small">
		                          <b><c:out value="${tboard.id}" /></b>
		                       </p>
		                    </a> 
			                     
		                    <a href="/board/detail?bno=<c:out value ='${tboard.bno}'/>">
		                       <p class="p_small">
		                          <b><c:out value="${tboard.title}" /></b>
		                       </p>
		                    </a> 
			                     
		                    <a href="/board/detail?bno=<c:out value ='${tboard.bno}'/>">
		                       <p class="p_price">
		                          <fmt:formatNumber value="${tboard.price}" pattern="#,###" />원
		                       </p>
		                    </a>
		                  
		                </div>
		
		                     
		                     
	               </c:forEach>
	               <!--게시글 끝 -->
				
						<input type='hidden' id ='total' value ="<c:out value ='${tpageMaker.total}'/>">
				
				
				<!--글쓰기 버튼-->
                <c:if test= "${member_s.right == 1}"> 
                    <span class="btn-span">
                       <button onclick="location.href='register'" class="btn-write">글쓰기</button>
                    </span>
				</c:if>  
	
	            </div> <!-- col-md-8 -->
	             
				<!--페이징 -->
                <div class="pagination justify-content-center">
					<ul class="pagination">

						<c:if test="${tpageMaker.prev}">
							<li class="paginate_button previous">
								<a href="${tpageMaker.startPage -1}">Previous</a>
							</li>
						</c:if>

						<c:forEach var="num" begin="${tpageMaker.startPage}" end="${tpageMaker.endPage}">
							<li class="paginate_button  ${tpageMaker.cri.pageNum == num ? "active":""} ">
								<a href="${num }">${num}</a>
							</li>
						</c:forEach>

						<c:if test="${tpageMaker.next}">
							<li class="paginate_button next">
								<a href="${tpageMaker.endPage +1 }">Next</a>
							</li>
						</c:if>
					</ul>
				</div>
				<!--페이징 끝 -->
				
				<div class="col-md-2"></div>
				
			</div>
			<!-- p_row end-->
		</div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
		crossorigin="anonymous">
	</script>
</body>
</html>


<!-- script_Start -->
<script>

  

		/* ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
		 * ■ 페이징 스크립트 Str
		 * ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ */
		$(function() {
			var result = '<c:out value="${result}"/>';
	
			checkModal(result);
	
			history.replaceState({}, null, null); //뒤로가기
	
			function checkModal(result) {
				if (result === '' || history.state) { //뒤로가기
					return;
				}
	
				if (parseInt(result) > 0) {
					$(".modal-body")
							.html("게시글 " + parseInt(result) + "번이 등록되었습니다.");
				}
				$("#myModal").modal("show");
			}


		
		var actionFormT = $("#actionFormT");
		
		/* ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
		 * ■ 페이징 Btn
		 * ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ */
		$(".paginate_button a").on("click", function(e) {
			
			e.preventDefault();

			actionFormT.find("input[name='title']").val();
			actionFormT.find("input[name='pageNum']").val($(this).attr("href"));
			actionFormT.submit();
			
		});
		
		
		/* ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
	  	 * ■ 썸네일 업로드
	   	 * ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ */
	   
	    /*이미지 띄우기*/

	     var len = $('.board_uuid').length; //cart_id란 클래스 개수 세기 ok
	    /*  alert("board_uuid리스트 길이: " +len); */
	   	  
	   	 for(var i=0; i<len; i++){
	    	
	    var uploadPath = document.getElementsByClassName("uploadPath")[i].value;
	    var uuid = document.getElementsByClassName("uuid")[i].value;
	    var fileName = document.getElementsByClassName("fileName")[i].value;
	    
	    
	    var fileCallPath = encodeURIComponent(uploadPath + "/s_" + uuid + "_" + fileName );
	    
	   /*  alert(fileCallPath); */
	    const img = document.getElementsByClassName("p_img")[i];
	    img.setAttribute('src', '/board/display?fileName='+fileCallPath);
	  
	    
	   }
	   
	   

	});

</script>



