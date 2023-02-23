<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- 금액 콤마 찍기 -->
<%@ include file="../includes/header.jsp"%>

<head>
<link
   href="${pageContext.request.contextPath}/resources/css/board.css?ver=5"
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

	<!-- 카테고리 분류별 명 -->
	<div class="container">
		<div class="row kategori">
			<c:if test="${pageMaker.cri.keyword eq '1'}">
				<div class="kategori2">스포츠 / 레저</div>
			</c:if>
			<c:if test="${pageMaker.cri.keyword eq '2'}">
				<div class="kategori2">언어 / 교육</div>
			</c:if>
			<c:if test="${pageMaker.cri.keyword eq '3'}">
				<div class="kategori2">문화 / 예술</div>
			</c:if>
			<c:if test="${pageMaker.cri.keyword eq '4'}">
				<div class="kategori2">요리 / 음료</div>
			</c:if>
			<c:if test="${pageMaker.cri.keyword eq '5'}">
				<div class="kategori2">핸드 메이드</div>
			</c:if>
			<c:if test="${pageMaker.cri.keyword eq '6'}">
				<div class="kategori2">기타</div>
			</c:if>
		</div>
	</div>
	<!--카테고리별 명 끝 -->
	

	<!-- 검색창 -->
	<div class="row">
		<div id="sform" class="search_area">
			<form action="/board/boardcategory" method='get' role="search" id="">
				<input class="keyword" name="title" type="text" value="${pageMaker.cri.title }" placeholder="해당 카테고리 강좌명을 입력해 주세요." aria-label="Search" id='searchkeyword'>
				<button class="search_btn" type="button">검색</button>
			</form>
		</div>
	</div>
	<!--검색창 끝 -->
	
	 

   <!-- 게시물 -->
   <!--관련 게시물 -->
   <div class="row popular">
      <div class="container-fluid">
         <div class="row p_row">
            <div class="col-md-1"></div>


            <div class="col-md-10" style="margin-botton: 20px !important;">

               <!-- 카테고리 -->
               <div class="row">
                  <input type='hidden' id='categoryKeyword' value='${pageMaker.cri.keyword}'>
                  <ul class="k_btns" id="categiryNum">
                     <li>
                        <button class="kategori_btn_select" type="button" value="1"> 
                           <span>스포츠 / 레저</span>
                        </button>
                     </li>
                     <li>
                        <button class="kategori_btn_select" type="button" value="2">
                           <span>언어 / 교육</span>
                        </button>
                     </li>
                     <li>
                        <button class="kategori_btn_select" type="button" value="3">
                           <span>문화 / 예술</span>
                        </button>
                     </li>
                     <li>
                        <button class="kategori_btn_select" type="button" value="4">
                           <span>요리 / 음료</span>
                        </button>
                     </li>
                     <li>
                        <button class="kategori_btn_select" type="button" value="5">
                           <span>핸드 메이드</span>
                        </button>
                     </li>
                     <li>
                        <button class="kategori_btn_select" type="button" value="6">
                           <span>기타</span>
                        </button>
                     </li>
                  </ul>
               </div>
               <br>
               <!--카테고리 끝 -->


               <!--이미지 게시판 -->
               <input type="hidden" id ="s_list" value ="${list}">
   
               <c:forEach items="${list}" var="board">
	        	<!--list 확인 -->		
	    		<input type='hidden' class ='board_uuid' value ='<c:out value ="${board_uuid}"/>'>
                  <!-- □ 게시글  -->
                  <div class="p_article" onclick="" style="font-size: 15px;"
                     class='uploadREsult'>
                     <ul>
                        <div class = "p_class">
                           <a href ="/board/detail?bno=<c:out value ='${board.bno}'/>">
                            <img src="" id="p_img" class="p_img">
                           </a>
                        </div>
                     
                     </ul>
                           
                          <input type ='hidden' class ='uuid' value='<c:out value="${board.uuid}" />'>          
                          <input type ='hidden' class ='uploadPath' value='<c:out value="${board.uploadpath}" />'> 
                          <input type ='hidden' class ='fileName' value='<c:out value="${board.filename}" />'> 

                     
                     <a href="/board/detail?bno=<c:out value ='${board.bno}'/>">
                        <p class="p_small">
                           <b><c:out value="${board.id}" /></b>
                        </p>
                     </a> 
                     
                     
                     
                     <a href="/board/detail?bno=<c:out value ='${board.bno}'/>">
                        <p class="p_title" style ="font-size:18px;">
                           <b><c:out value="${board.title}" /></b>
                        </p>
                     </a> 
                     
                     <fmt:setLocale value="en_US" scope="session"/>
                     <a href="/board/detail?bno=<c:out value ='${board.bno}'/>">
                     <fmt:parseDate var ="start" pattern="yyyy-MM-dd HH:mm:ss" value ="${board.startdate}"/>
                     <fmt:formatDate var ="startdate" pattern="yyyy-MM-dd" value ="${start}"/>
                     <fmt:parseDate var ="end" pattern="yyyy-MM-dd HH:mm:ss" value ="${board.enddate}"/>
                     <fmt:formatDate var ="enddate" pattern="yyyy-MM-dd" value ="${end}"/>
                        	&nbsp&nbsp&nbsp <c:out value="${startdate}"/>
                        	~ <c:out value="${enddate}"/>
                     </a> 
   
                     <a href="/board/detail?bno=<c:out value ='${board.bno}'/>">
                        <p class="p_price">
                           <b><fmt:formatNumber value="${board.price}" pattern="#,###" />원</b>
                           
                        </p>
                     </a>
                     
                     
                 
               

                  </div>

               </c:forEach>
               <!--게시글 끝 -->
               
					<!--글쓰기 버튼-->
                  <c:if test= "${member_s.right == 1}"> 
                     <span class="btn-span">
                        <button onclick="location.href='register'" class="btn-write">글쓰기</button>
                     </span>
				  </c:if>  
            </div>
	            
	        
	             
	      
				<!--페이징 -->
                <div class="pagination justify-content-center">
               <ul class="pagination">

                  <c:if test="${pageMaker.prev}">
                     <li class="paginate_button previous">
                        <a href="${pageMaker.startPage -1}">Previous</a>
                     </li>
                  </c:if>

                  <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
                     <li class="paginate_button  ${pageMaker.cri.pageNum == num ? "active":""} ">
                        <a href="${num }">${num}</a>
                     </li>
                  </c:forEach>

                  <c:if test="${pageMaker.next}">
                     <li class="paginate_button next">
                        <a href="${pageMaker.endPage +1 }">Next</a>
                     </li>
                  </c:if>
               </ul>
            </div>
            <!--페이징 끝 -->
            
				

              <!--페이징, 카테고리 form 태그 -->
            <form id='actionForm' action="/board/boardcategory" method='get'>              <!-- 쿼리스트링 방식으로 넘김 pageNum, amount, keyword  -->
               <input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>      <!-- 페이지 number -->
               <input type='hidden' name='amount'  value='${pageMaker.cri.amount}'>       <!-- 게시글 수 -->
               <input type='hidden' name='keyword' value='${pageMaker.cri.keyword }'>
               <input type='hidden' name='title' value='${pageMaker.cri.title }'>
            </form>
            <!-- form 태그 끝 -->

         



            <div class="col-md-1"></div>

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
       // 스크립트 시작시 가장 먼저 동작 됌
   $(document).ready(function() {

      var actionForm = $("#actionForm");

      /* ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
       * ■ 카테고리 Btn
       * ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ */
      $(".kategori_btn_select").on("click", function(e) {

         var categoryVal = $(this).val();                                // 카테고리Val값 변수설정 카테고리별 value 값이 categoryVal에 담긴다
         
         actionForm.find("input[name='keyword']").val(categoryVal);      //find : actionForm에 담는다 input name 속성이 keyowrd.val 값을
         actionForm.find("input[name='pageNum']").val(1);                // 1 ~ 6 키워드를 클릭시 pagenum 은 무조건 1페이지로 이동
          $("input[name='title']").val('');                              //키워드 검색 후 다른키워드로 이동할 시 title 값 초기화
         actionForm.submit();

      });

   });


       

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
      


   
   
   var actionForm = $("#actionForm");
   
   /* ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
    * ■ 페이징 Btn
    * ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ */
   $(".paginate_button a").on("click", function(e) {
      
      e.preventDefault();
      
      var categoryKeyword = $("#categoryKeyword").val();
      categoryKeyword = Number(categoryKeyword);

      actionForm.find("input[name='titel']").val(categoryKeyword);
      actionForm.find("input[name='keyword']").val(categoryKeyword);
      actionForm.find("input[name='pageNum']").val($(this).attr("href"));
      actionForm.submit();
      
   });
		
		
   /* ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
    * ■ 검색  Btn
    * ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ */
       var actionForm = $("#actionForm");
   //메소드 동작
    $(".search_area button").on("click", function(e) {
     /* 버튼의 기능을 막는다  그 후 사용자가 작성한 title데이터를 form 태그 내부에 있는 name속성이 title인 input
        태그에 저장을 시킨다. 그리고 form태그 내부 name속성이 pageNum인 input에 저장되어 있는 값을 1로 변경한 수 서버로 
                전송한다. 
     */
     //alert("강좌명을  입력하세요 ");
     
      var title = $("input[name='title']").val();
      
      if( title == null || title == "") {
         alert(title + "강좌명을 입력하세요.")
      };
      
       
      var categoryKeyword = $("#categoryKeyword").val();
      categoryKeyword = Number(categoryKeyword);
       
       //alert(title + "을(를)검색합니다.");

      
      actionForm.find("input[name='title']").val(title);
      actionForm.find("input[name='keyword']").val(categoryKeyword);
      actionForm.find("input[name='pageNum']").val(1);
       e.preventDefault();
      actionForm.submit();
      
      
      
         
             
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



