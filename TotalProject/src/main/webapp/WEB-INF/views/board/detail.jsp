<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="../includes/header.jsp"%>

<html>
<head>

<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/detail.js?ver=6121"></script>


<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/detail.css?ver=318">

</head>

<body>

 <!--greed 분리위한 container-->
    <div class="container">
        <!--greed 분리위한 row-->
        <div class="row">
        <div class="col-md-2" ></div>
          <div class="col-md-8" >
          	<div class="row"> <!-- 이중 row -->
          		<div class="col-md-8">
              		<!-- 캐러셀 -->
	          			<div class ="lg-slider">
	          			<div class ="slider">
	          				<div class ="slides">
	          					<input type ="radio" name ="radio-btn" id ="radio1">
	          					<input type ="radio" name ="radio-btn" id ="radio2">
	          					<input type ="radio" name ="radio-btn" id ="radio3">

<!-- 								<div class ="slide first" id = "1">
	          					</div>
	          					<div class ="slide" id ="2">
	          					</div>
	          					<div class ="slide" id ="3">
	          					</div>
 -->								
	          					<!-- automatic navigation start -->
	          					<div class="navigation-auto">
	          						<div class ="auto-btn1" id ="auto-btn1"></div>
	          						<div class ="auto-btn2" id ="auto-btn2"></div>
	          						<div class ="auto-btn3" id = "auto-btn3"></div>
	          					</div><!-- auto button -->
	          					<div class ="navigation-manual">
	          						<label for ="radio1" class ="manual-btn" id ="label1"></label>
	          						<label for ="radio2" class ="manual-btn" id ="label2"></label>
	          						<label for ="radio3" class ="manual-btn" id ="label3"></label>
	          					</div>
	          				</div><!-- slides -->
	          			</div><!-- slider -->
	          			</div><!-- lg-slider -->
	     
						
		           		<!--상세설명 scrollspy위한 nav-->
		                <nav id="navbar-example2" class="navbar navbar-light bg-light px-3">
		                <ul class="nav nav-pills" id ="fromInsideOut">
		                    <li class="nav-item">
		                        <a class="nav-link" href="#scrollspyHeading1">클래스 소개</a>
		                    </li>
		                    <li class="nav-item">
		                        <a class="nav-link" href="#scrollspyHeading2">커리큘럼</a>
		                    </li>
		                    <li class="nav-item">
		                        <a class="nav-link" href="#scrollspyHeading3">강사 소개</a>
		                    </li>
		                    <li class="nav-item">
		                        <a class="nav-link" href="#scrollspyHeading4">위치</a>
		                   </li>
		                    <li class="nav-item">
		                        <a class="nav-link" href="#scrollspyHeading5">클래스 후기</a>
		                    </li>
		                </ul>
		                </nav>
		                
		                <!--상세설명-->
		                <!-- wishlist 에 담은 목록 확인 하기 위해서 -->
        			     <c:forEach items="${cart}" var="cart">				
				    		<input type='hidden' class = 'cart_id' value ='<c:out value ="${cart.id}"/>'>
						</c:forEach>
		                <div data-bs-spy="scroll" data-bs-target="#navbar-example2" data-bs-offset="0" class="scrollspy-example" tabindex="0">
		                        <h4 id="scrollspyHeading1"></h4>
		                        	<ul class ="su_form">
		                        		<li class = "summary"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-geo-alt-fill" viewBox="0 0 16 16">
	  									<path d="M8 16s6-5.686 6-10A6 6 0 0 0 2 6c0 4.314 6 10 6 10zm0-7a3 3 0 1 1 0-6 3 3 0 0 1 0 6z"/>
										</svg><div style="display:inline;" id ="categoryname"></div>
										<input type ='hidden' id ='categorynumber' value ='<c:out value ="${posting.categoryno}"/>'> </li>
		                        		<li><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-stopwatch" viewBox="0 0 16 16">
										  <path d="M8.5 5.6a.5.5 0 1 0-1 0v2.9h-3a.5.5 0 0 0 0 1H8a.5.5 0 0 0 .5-.5V5.6z"/>
										  <path d="M6.5 1A.5.5 0 0 1 7 .5h2a.5.5 0 0 1 0 1v.57c1.36.196 2.594.78 3.584 1.64a.715.715 0 0 1 .012-.013l.354-.354-.354-.353a.5.5 0 0 1 .707-.708l1.414 1.415a.5.5 0 1 1-.707.707l-.353-.354-.354.354a.512.512 0 0 1-.013.012A7 7 0 1 1 7 2.071V1.5a.5.5 0 0 1-.5-.5zM8 3a6 6 0 1 0 .001 12A6 6 0 0 0 8 3z"/>
										</svg> <c:out value ="${posting.classtime }"/> </li><br>
										 <input type ="hidden" id ="sessionId" value ="${member_s.id}" />
										 <input type ="hidden" id ="bno" value ="${posting.bno}" />
										 <input type ="hidden" id ="title" value ="${posting.title}" />
		                        	</ul>
		                        	<h4>클래스 소개</h4>
		                            <pre name ='con1' ><c:out value ="${posting.con1 }"/></pre>
		                            <hr>
		                        <h4 id="scrollspyHeading2"></h4><br>
		                        	<br><br><h4>커리큘럼</h4>
 									<pre name ='con2' ><c:out value ="${posting.con2 }"/></pre>
									<hr>
		                        <h4 id="scrollspyHeading3"></h4>
		                        <br><br><h4>강사 소개</h4>
 									<pre name ='con3' ><c:out value ="${posting.con3 }"/></pre>
									<hr>
									<br>
		                        <h4 id="scrollspyHeading4"></h4>
		                        <br><br><h4>위치</h4>
		                            <!--지도-->
		                           
		                            <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=156033f4a3eb36d4ea8b4352d5412fea&libraries=services"></script>
		                            <div id="map" style="width:500px;height:400px;"></div>
		                            <input type="hidden" id="map_address" value="<c:out value="${posting.con4}"/>">

								<br><br>
								
							<!-- 리뷰 -->
							<div class="review_all">									
								<h4 id="scrollspyHeading5"></h4>
								<br><br><h4>클래스 후기</h4>
								   <p><b><%--<i class="bi bi-star-fill"></i>  ${reviewAvg.score} 점 |--%> ${reCnt.reviewCnt}개의 리뷰</b></p>  <!-- 일단보류 -->
						   
							   <c:forEach items="${reviewRight}" var="test">
								   <c:if test="${member_s.id eq test.id && posting.bno eq test.bno}">
									   
									   <form  id ="reviewregister" action="/review/insert">
		
										   <fieldset>
											<span class="text-bold">별점을 선택해주세요</span>
											<input type="radio" name="reviewStar" class="reviewStar" value="5" id="rate1"><label
												for="rate1">★</label>
											<input type="radio" name="reviewStar" class="reviewStar" value="4" id="rate2"><label
												for="rate2">★</label>
											<input type="radio" name="reviewStar" class="reviewStar" value="3" id="rate3"><label
												for="rate3">★</label>
											<input type="radio" name="reviewStar" class="reviewStar" value="2" id="rate4"><label
												for="rate4">★</label>
											<input type="radio" name="reviewStar" class="reviewStar" value="1" id="rate5"><label
												for="rate5">★</label>
										</fieldset>
										   
										   <textarea class="autosize" placeholder="리뷰를 작성해주세요.(제한 150자)"></textarea>
		
										   <div class="reply_button_wrap">
											<button type="button" class="enroll_btn">리뷰 쓰기</button>
										</div>		
									   </form>
								   </c:if>
							   </c:forEach> 
		
								<br>
							   	<hr>
						   
							   <div class="panel-body">
								   <ul class="reviewList">
									   <%-- <li class="reviewForm">
										   <div class ="review">
											   <p>	${review.id}  |  ${review.score}</p>		   							
											   <p class = "reviewcontent">
													${review.rcontent}
											   </p> 
											   <p> &nbsp ${review.replydate} 등록된 내용입니다. </p>
										   </div>
											   
										   <hr color ="gray">
									   </li> --%>
								   </ul> 
								</div>
									
		   						<!-- 페이징 -->
		   						
		   						<div class="panel-footer">
		   						
		   						</div>
					   		
				   			</div>
						</div> 
	                </div><!-- 이중 col-md-8 -->
		                
		                <div class = "col-md-4">
		                <!--수강신청 창-->
		                <input id ="vo_id" type ="hidden" value="<c:out value ="${posting.id }"/>">
		                <div class ="application">
		                    <form class = "app_menu">
		                        <ul>
		                            <br>
		                            <li class = 'name'><c:out value ="${posting.id }"/> &nbsp강사님 
		                            <li class = 'title'>[<c:out value ="${posting.title}"/>]</li>		                            
		                            <li >클래스 일정</li>
		                            <li class  ="date">
		                            <fmt:parseDate value="${posting.startdate}" var="startdate" pattern="yyyy-MM-dd HH:mm"/>
		                            <fmt:parseDate value="${posting.enddate}" var="enddate" pattern="yyyy-MM-dd HH:mm"/>
		                            <li>
									<c:set var ="today" value ="<%=new java.util.Date()%>"/>
									
		                            <li><input type="date" name="startdate" id="startDate"
		                            	 min="<fmt:formatDate value="${startdate}" pattern="yyyy-MM-dd"/>"
		                            	 max="<fmt:formatDate value="${enddate}" pattern="yyyy-MM-dd"/>"
		                            	 value ="<fmt:formatDate value ="${today}" pattern ="yyyy-MM-dd" />"> 		                        
		                            </li>
		                          	<li class ="time">클래스 시작 시간</li>
		                            <li class ="time2">&nbsp &nbsp<c:out value ="${posting.starttime }"/> </li>
		                            <li>예약 금액   <div class = price><c:out value ="${posting.price }"/>원</div></li>
		                            <li><hr></li>	                           
		                        </ul>
		                        <div class ="btns">
		                            <button class = "btn btn-1">    
		                                <span class ="sub_1">위시리스트
		                                    <!--하트 이미지 -->
		                                    <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAEIAAAA6CAMAAAAz+392AAAAPFBMVEVHcEyvs7Gvs7OvtbWvtLKvtLGvtbKvr6+vtLGus7Kvt6////+vtLLi5OO1ubfv8PD6+vq/w8HN0M/a3Nv6m2nYAAAAC3RSTlMAdUkwve1gEJzQIBqIrK8AAAGlSURBVEjHzddLtoMgDABQUPyVAAr73+uL0NeiAhXSQTON50oiRmQsigcXYgAYxMwf7BIPPoesSGV9jJh/x8KnODnxJc4OYwLoENBWmVXK1Tirj5eNPutCVvlsdxZmvETJKNSGK+lDsscVbMcsIvMBmASAk6fAy8KtcIFHfg8HIOJSF9BGXmK1AFjMCGDXa9ZoEHEVOnFNuNU4JhYY7qDftfDkGkIxe/tVJonr4M/nDZATvKGySQMQdogAK/OhVCFpQzu6XCNuBLaj84twsjmc7yjA2k4YGPY6NkmIDSuZKXXslXBshaEQBp/JFwgASQqAHyF+o53kfTF/Y3dOpHdkxW6S31TxnXlBWYZ7DvG+NB6Lof5nZ2mCl/fEa4Lv35GtoR3rFn0Tp6XBQGGJvogNxkloMC5CtZEQKg18FlehysgI3ri3P7LCbQOFOSPcNIw+nbKqDVUW/LmtbCj4IIRzl6EJZQMFzhjFUP4QSTHcbSFn2ArBn8gVTUgZNv0DUWGg0DNGMVqEg4EDpkXwPxGKJrwMgvA0kmOyynA0wRtEYf+7/Cj8AY8oc03k3Xz7AAAAAElFTkSuQmCC" 
		                                    class = "heart" id = "heart1" alt="하트 이미지">
		                                    <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAEIAAAA6CAMAAAAz+392AAAARVBMVEVHcEwbGxsbGxsbGxsbGxsbGxscGxsQEBAaGhocHBwYGBgbGxscHBz8VlEcHBwpHx+rQD3VS0dDJSTtUk2SOjhvMS/ESER9tM2LAAAADXRSTlMAiTBvoNDtEFu9IM9AOZCsCAAAAa1JREFUSMfN19u6giAQBlA8pKIygIDv/6ibQ21NgZTpov92+lYw0YiE7DI2lHYAHa2akZwyNlWo0ljVZ7D1LVPT74t9M+2r3ZAAuBGrYkyu2vD3j4WqXiVjahXHakgFsAi2i1jsSupQrKdYtXoDegqg2SH2Y93sqnN3AFw0AN1vdQIu2SnKANjlDgBGnauSA92ENiqErxqGyAJfRrv1ISHYzbj2i0TRGs9+jAApwRsiWZQA4YRQMCwdITJFE9oxAFesMIrD7BehWXG072iuEx8joXP7WBgiiz05FWYfbieVbcWKIVb7m3yBAGCoAPwI8RvtbLHnov3G6ewBVLmgbDfR/1Q3MGb8vMAsQz+HeJ0bj9mI1+wkTXqC5+cNh2Z7jiwF7VDL9hwh/aPAsMJj90QsMA5CgXESbhsR4aYhY8Itw/6aMSEYEiV448oZc/eKhHDR2N9MygyRF/y9LW/Yf1ZeyN27Lgt5Qxxvm7cN4S+RGENfFlKGuSE44zwL7wkxw8RfIG4YVqgJwRglgn9DEduAKRH8S4TACf8GQngaakkOmIuGxgneQAru7fKj8AcGOIdU02lXBgAAAABJRU5ErkJggg==" 
		                                    class = "heart" id ="heart2" alt="하트 이미지">
		                                </span>
		                            </button> <br>
		                            <button id="btn-modal" type="button"  class="btn btn-2" onClick="id_check();"><span class = "sub_2">클래스 신청</span></button>
    								<br><br>
		                    		<button onclick="location.href='modify?bno=<c:out value ='${posting.bno}'/>'" class="btn-write" id ="modifybtn">수정하기</button >
		                    		<button class="btn-remove" id ="removebtn">삭제하기</button >
		                    
		                        </div><!--위시리스트 수강신청 버튼-->		
		                        
		                     
	                        
		                    </form>
		                </div> <!--end appliaction-->
		                </div><!-- 이중 col-md-4 -->
	          </div><!-- 이중 row -->

          <div class="col-md-2" ></div>
        </div> <!-- col-md-8-->
      </div> <!--row-->
      <button type="button" onClick="javascript:window.scrollTo(0,0)" class ="ontop">
        <!--화살표-->
        <svg class="MuiSvgIcon-root MuiSvgIcon-fontSizeMedium css-675ts4" focusable="false" aria-hidden="true" viewBox="0 0 24 24" data-testid="ArrowUpwardIcon"><path d="m4 12 1.41 1.41L11 7.83V20h2V7.83l5.58 5.59L20 12l-8-8-8 8z"></path></svg>
      </button>
    </div><!-- container -->

	
	

<!-- ================모달창 모음  ======================-->  
    <div id="modal" class="modal-overlay">
        <div class="modal-window">
            <div class="title">
                <h2></h2>
            </div>
            <div class="close-area">X</div>
            <div class="content">
                <p>로그인  후 이용 가능합니다. </p>
                
                
            </div>
        </div>
    </div>
    
    <!-- 클래스 신청 모달 -->
    <div id="class_modal" class="modal-overlay">
        <div class="modal-window">
            <div class="title">
                <h2></h2>
            </div>
            <div class="close-area"></div>
            <div class="content" style="text-align:center;">
                <p>해당 클래스를 신청하시겠습니까? </p>
                
                
            </div>
            <div class="modal-foot">  
	        <span class="modal-btn confirm" id="modal_confirm">신청</span>     
	        <span class="modal-btn close" id="modal_close">취소</span>
	      	</div>
        </div>
    </div>
    
    <!-- 클래스 신청 확정 모달 -->
    <div id="modal_apply" class="modal-overlay">
        <div class="modal-window">
            <div class="title">
                <h2></h2>
            </div>
            <div class="close-area"></div>
            <div class="content" style="text-align:center;">
                <p> 신청되었습니다. </p>        
            </div>
            <div class="modal-foot">  
		        <span class="modal-btn mypage" id="modal_mypage">마이페이지로 이동</span>     
		        <span class="modal-btn close" id="modal_appclose">확인</span>
	      	</div>
        </div>
    </div>
    
     <!-- 위시리스트 담는 모달 -->
    <div id="modal_wish" class="modal-overlay">
        <div class="modal-window">
            <div class="title">
                <h2></h2>
            </div>
            <div class="close-area"></div>
            <div class="content" style="text-align:center;">
                <p> 위시리스트에 추가되었습니다. </p>        
            </div>
            <div class="modal-foot">  
		        <span class="modal-btn mypage" id="modal_wishmypage">마이페이지로 이동</span>     
		        <span class="modal-btn close" id="modal_wishappclose">확인</span>
	      	</div>
        </div>
    </div>
    
    <!-- 위시리스트 취소 모달 -->
    <div id="modal_wishremove" class="modal-overlay">
        <div class="modal-window">
            <div class="title">
                <h2></h2>
            </div>
            <div class="close-area"></div>
            <div class="content" style="text-align:center;">
                <p> 위시리스트에서 제외되었습니다. </p>        
            </div>
            <div class="modal-foot">  
		        <span class="modal-btn mypage" id="modal_removemypage">마이페이지로 이동</span>     
		        <span class="modal-btn close" id="modal_removeappclose">확인</span>
	      	</div>
        </div>
    </div>
  
  
  <!-- 자기 강의는 신청 못하게 -->
   <div id="modal_self" class="modal-overlay">
     <div class="modal-window">
         <div class="title">
             <h2></h2>
         </div>
         <div class="close-area">X</div>
         <div class="content">
             <p>본인의 클래스는 신청하실 수 없습니다. </p>
             
             
         </div>
     </div>
 </div>
 
     
    <!-- 삭제 확인 모달 -->
    <div id="modal_removecheck" class="modal-overlay">
        <div class="modal-window">
            <div class="title">
                <h2></h2>
            </div>
            <div class="close-area"></div>
            <div class="content" style="text-align:center;">
                <p>삭제한 게시글은 다시 복구할 수 없습니다. </p>
                <p>해당 게시글을 지우시겠습니까?</p>
                
                
            </div>
            <div class="modal-foot">  
	        <span class="modal-btn confirm" id="reremove">예</span>     
	        <span class="modal-btn close" id="close">아니요</span>
	      	</div>
        </div>
    </div>
    
    <!-- 삭제 완료 모달 -->
    <div id="modal_remove" class="modal-overlay">
     <div class="modal-window">
         <div class="title">
             <h2></h2>
         </div>
         <div class="close-area">X</div>
         <div class="content" style="text-align:center;">
             <p>삭제되었습니다. </p>           
         </div>
     </div>
 </div>
</body>
</html>
<script>

(function(){ //즉시실행함수
	
	var bno = '<c:out value ="${posting.bno}"/>';

	
	 $.getJSON("/board/getUploadList", {bno : bno}, function(arr){
		    
		 console.log("즉시실행함수");
    		console.log(arr);
    		
    		var str = "";
    		var img = 1;
    		var length = arr.length;  		
    		console.log("length : " + length);
    		
            //캐러셀
            var counter = 1;
            setInterval(function(){
         	  document.getElementById('radio' + counter).checked = true;

         	  counter++;

      			var btnLength = arr.length;
         	  
         	  console.log("count : " + counter);
         	  console.log(btnLength);
         	  if(counter > btnLength){
         		  counter =1;
         	  }
         	  
            },3000);
    		
    		
    		//length 구해서, radio버튼 개수에 맞게
    		if(length == 1){
    			
    			  var div1 = document.getElementById('radio2');
    			  var div2 = document.getElementById('radio3');
    			  
    			  var div3 = document.getElementById('auto-btn2');   			  
    			  var div4 = document.getElementById('auto-btn3'); 
    			  
     			  var div5 = document.getElementById('label2');
    			  var div6 = document.getElementById('label3');
  	
    			  
    			  div1.remove();
    			  div2.remove();
    			  div3.remove();
    			  div4.remove();
    			  div5.remove();
    			  div6.remove();
    			  

    		}else if(length == 2){
    			
    			$('#radio2').css('margin-left','-60%');
    			
  			  var div1 = document.getElementById('radio3');
			  
			  var div2 = document.getElementById('auto-btn3');   
			  
 			  var div3 = document.getElementById('label3');
	
			  
			  div1.remove();
			  div2.remove();
			  div3.remove();
    			
    		}
    		
    		//반복문 해서 img태그 추가하기 (append)
    		$(arr).each(function(i, upload){
    			
    			var fileCallPath = encodeURIComponent(upload.uploadPath + "/" + upload.uuid + "_" + upload.fileName );
    			
    			if(length == arr.length){
    				 str +="<div class ='slide first'><img src ='/board/display?fileName=" + fileCallPath + "'></div>";
        			 $(".slides").append(str);
        			 
        			 console.log(str);
    			}else{
    				
      			  str += "<div class ='slide'><img src ='/board/display?fileName=" + fileCallPath + "'></div>";
      			  $(".slides").append(str);
      			  
      			  console.log(str);
      			}
    			
				img++;		
    			str ='';
    			length--;
    		});
    		
    	/*	$(arr).each(function(i, upload){
    			
    			var fileCallPath = encodeURIComponent(upload.uploadPath + "/" + upload.uuid + "_" + upload.fileName );
  
    			if(length == arr.length){
    				
    			 str +="<div class ='slide first' id='1'><img src ='/board/display?fileName=" + fileCallPath + "'></div>";
    			 $("#"+img).html(str);
    				
    			}else{
    				
    			  str += "<div class ='slide' id ='"+img+"'><img src ='/board/display?fileName=" + fileCallPath + "'></div>";
    			  $("#"+img).html(str);
    			}

    			img++;
    			
    			str ='';
    			length--;
	
    		});//each문 */

    		
    });//getJSON
		
})();

</script>
<!--  리뷰관련 스크립트-->
<script type="text/javascript" src="/resources/js/review.js"></script>

<script>

/*리뷰쓰기*/ 
$(".enroll_btn").on("click", function(){
	
	console.log("리뷰 등록 ...");
	
	var rbno = "${posting.bno}";
	var rid = "${member_s.id}";
	var rscore = $(".reviewStar").val();
	var rcontent = $(".autosize").val();

	var data = {
			bno : rbno,
			id : rid,
			score : rscore,
			rcontent : rcontent
	}
	      		
	$.ajax({
		data : JSON.stringify(data),	// 제이슨 형태의 객체를 문자열로 구조로 변경해서 보내줌 
										//(consumes가 json을 받기 때문에 json타입으로 보내고 서버에서는 문자열구조로만 받기 때문에 문자열로 변경해줌 )
		type : 'post',
		url : '/review/insert',
		contentType: 'application/json; charset=utf-8',  //ContentType은 서버로 전송하는 데이터 형식이다.
		//dataType: 'json', //DataType은 서버에서 반환하는 데이터 형식을 의미한다.
		success : function(data) {
			alert("리뷰가 등록되었습니다.");
			location.reload();
	     },
		error : function() {
			//alert("error");
			console.log(data);
		}
	 		
 	}); //ajax 
});		

	
/* 리뷰 보이기 */	
$(document).ready(function(){	
	 		
 		var bnoValue = '<c:out value= "${posting.bno}"/>';
 		var replyUL = $(".reviewList");
 		
 		//alert("ready");
 		
 		//showList(1);
 		showList(-1);
 		
 		
 		//리뷰 목록 보기
 		function showList(page){
 	
 			reviewService.getList({bno:bnoValue, page: page || 1}, function(reviewCnt,rlist){
 				
 		
 				
 				console.log("reviewCnt: " + page);
 				console.log("rList: " + rlist);
 				
 				if(page == -1){
 					pageNum = Math.ceil(reviewCnt/10.0);
 					showList(pageNum);
 		
 					return;
 				}
 	 		
 				var str = "";
 				console.log("rList.length" + rlist.Length);
 				
 	 			if(rlist == null || rlist.length == 0){
 					
 					return;
 				} 

 				for (var i = 0, len = rlist.length || 0; i < len; i++){
 					str += "<li class='reviewForm' data-rno='" + rlist[i].rno + "'>";
 					str += "<div class ='review'>";
 					str += "<p><b>'" + rlist[i].id + "'&nbsp|&nbsp <i class='bi bi-star-fill'></i>" + rlist[i].score + "</b></p>";		   							
 					str += "<p class = 'reviewcontent'>" + rlist[i].rcontent + "</p>";
 					/* str += "<p>" + rlist[i].replydate + "등록된 내용입니다. </p>"; */	
 					str += "</div><hr color ='rgb(238, 197, 197)'></li>";
 					
 					
 				}	
 				
 				console.log("리뷰페이징");
 				console.log("str: "+ str);
 			
 				replyUL.html(str);	
 				
 				showReviewPage(reviewCnt)
 			
 			}); //end function
 		
 		}//end showList
 		
 		
 		//리뷰 페이징
 		var pageNum = 1;
 		var reviewPageFooter = $(".panel-footer");
 		
 		function showReviewPage(reviewCnt){
 			
 			var endNum = Math.ceil(pageNum / 10.0) * 10;
 			var startNum = endNum -9;
 			
 			var prev = startNum != 1;
 			var next = false;
 			
 			if(endNum * 10 >= reviewCnt){
 				endNum = Math.ceil(reviewCnt / 10.0);
 			}
 			
 			if(endNum * 10 < reviewCnt){
 				next = true;
 			}
 			
 			var str = "<ul class='pagination pull-right'>";
 			
 			if(prev){
 				str+= "<li class='page-item'><a class='page-link' href='" + (startNum -1) + "'>Previous</a></li>";
 			}
 			
 			for(var i = startNum; i<= endNum; i++){
 				
 				var active = pageNum == i? "active":" ";
 				
 				str+= "<li class='page-item" + active + "'><a class='page-link' href='" + i +"'>" + i + "</a></li>";
 			}
 			
 			if(next){
 				str+= "<li class='page-item'><a class='page-link' href='" + (endNum +1) + "'>Next</a></li>";
 			}
 			
 			str+= "</ul></div>";

 			console.log(str);
 			
 			reviewPageFooter.html(str);
 			
 		}//showReviewPage
 		
 		
 		reviewPageFooter.on("click","li a", function(e){
 			e.preventDefault();
 			console.log("page click");
 			
 			var targetPageNum = $(this).attr("href");
 			
 			console.log("targetPageNum: " + targetPageNum);
 			
 			pageNum = targetPageNum;
 			
 			showList(pageNum);
 		})
});	//ready

	
</script>

<%@include file="../includes/footer.jsp"%>
