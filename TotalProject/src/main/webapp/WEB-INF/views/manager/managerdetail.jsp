<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>



<%@ include file="../includes/header.jsp"%>


<html>
<head>

<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/detail.js?ver=12"></script>
 <script src="https://code.jquery.com/jquery-latest.js"></script>


<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/detail.css?ver=11">

<style>
.modal {
  display: none; /* Hidden by default */
  position: fixed; /* Stay in place */
  z-index: 1; /* Sit on top */
  left: 0;
  top: 0;
  width: 100%; /* Full width */
  height: 100%; /* Full height */
  overflow: auto; /* Enable scroll if needed */
  background-color: rgb(0,0,0); /* Fallback color */
  background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}

.modal-content {
  background-color: #fefefe;
  margin: 15% auto; /* 15% from the top and centered */
  padding: 20px;
  border: 1px solid #888;
  width: 80%; /* Could be more or less, depending on screen size */
}

.close {
  color: #aaa;
  float: right;
  font-size: 28px;
  font-weight: bold;
}

.close:hover,
.close:focus {
  color: black;
  text-decoration: none;
  cursor: pointer;
}

.update_btn2{
       position:relative;
       width: 150px;
       height: 70px;
       color: #ffffff;
       font-weight: bold;
       font-size: 25px;
       background-color: rgb(210, 102, 102);
       border-radius: 10px;
       border: 1px solid rgba( 255, 255, 255, 0.18 );
       display: inline-block;
       margin-left: 15px;
       margin-top: 45px;
       float: left;
       }
       
 
       
       .update_btn{
       position:absolute;
       margin-left: 20px;
       width: 150px;
       height: 70px;
       color: white;
       font-weight: bold;
       font-size: 25px;
       margin-top: 45px;
       background-color: rgb(47, 153, 244);
       border-radius: 10px;
       border: 1px solid rgba( 255, 255, 255, 0.18 );
       
       }
       
         /* The Modal (background) */
        .modal {
            display: none; /* Hidden by default */
            position: fixed; /* Stay in place */
            z-index: 1; /* Sit on top */
            left: 0;
            top: 0;
            width: 100%; /* Full width */
            height: 100%; /* Full height */
            overflow: auto; /* Enable scroll if needed */
            background-color: rgb(0,0,0); /* Fallback color */
            background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
        }
    
        /* Modal Content/Box */
        .modal-content {
            background-color: #fefefe;
            margin: 15% auto; /* 15% from the top and centered */
            padding: 20px;
            border: 1px solid #888;
            width: 30%; /* Could be more or less, depending on screen size */                          
        }
        
        
        #con5{
        margin-top: 60px;
        width: 350px;
        height: 130px;
        border-radius: 10px; 
        border: 1.7px solid gainsboro;
        box-shadow: 0px 3px 4px rgba(0, 0, 0, 0.2); 
        }
       
</style>

</head>

<body>


<form id="updateForm" name="updateForm" method="POST">

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
										  <input type ="hidden" id ="sessionId" value ="${member_s.id}" />
										 <input type ="hidden" id ="bno" value ="${posting.bno}" />
										 <input type ="hidden" id ="title" value ="${posting.title}" />
										   <input id ="vo_id" type ="hidden" value="<c:out value ="${posting.id }"/>">
										</svg> <c:out value ="${posting.classtime }"/> </li><br>
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
			   						<p><b> 별점 평균 | 000 개의 평가</b></p>
			   					
			   						
			   							<fieldset>
											<span class="text-bold">별점을 선택해주세요</span>
											<input type="radio" class="reviewStar" value="5" id="rate1"><label
												for="rate1">★</label>
											<input type="radio" class="reviewStar" value="4" id="rate2"><label
												for="rate2">★</label>
											<input type="radio" class="reviewStar" value="3" id="rate3"><label
												for="rate3">★</label>
											<input type="radio" class="reviewStar" value="2" id="rate4"><label
												for="rate4">★</label>
											<input type="radio" class="reviewStar" value="1" id="rate5"><label
												for="rate5">★</label>
										</fieldset>
			   							<textarea class="autosize" placeholder="리뷰를 작성해주세요.(제한 150자)">
				   						
										</textarea>
	
				   						<div class="reply_button_wrap">
											<button type="button" class="enroll_btn">리뷰 쓰기</button>
										</div>		
										
			   						
			   						
	
									<br>
			   						<hr>
			   					
			   						<c:forEach items="${reviewList}" var="review">
				   						<div class ="review">
				   							<p>	${reviewList.id}  |  ${reviewList.score}</p>		   							
				   							<p class = "reviewcontent">
				   							 	${reviewList.rcontent}
				   							</p> 
				   							<p> &nbsp ${reviewList.replydate} 등록된 내용입니다. </p>
				   						</div>
				   						
				   						<hr color ="gray">
			   						</c:forEach>
			   						
			   						
			   						<!-- 리뷰 페이징 -->
			   						<div class="pagination justify-content-center">
										<ul class="pagination">
											
								            <c:if test="${pageMaker.prev}">
												<li class="paginate_button previous"><a
													href="${pageMaker.startPage -1}">Previous</a></li>
											</c:if>
					
											<c:forEach var="num" begin="${pageMaker.startPage}"
					 							end="${pageMaker.endPage}">
					 							<li class="paginate_button  ${pageMaker.cri.pageNum == num ? "active":""} "> 
					 								<%-- <a href="${num }">${num}</a>  --%>
												</li>
											</c:forEach>
					
											<c:if test="${pageMaker.next}">
												<li class="paginate_button next">
												<a href="${pageMaker.endPage +1 }">Next</a></li>
											</c:if>
										</ul>
									</div>
									
									
										<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
										<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
									<!--  리뷰 페이징 end -->
							    	
							    	
					             
			   					</div><!-- 리뷰 end -->	
		
		                </div> 
		                </div><!-- 이중 col-md-8 -->
		                
		                <div class = "col-md-4">
		                <!--수강신청 창-->
		                <div class ="application">
		                    <form class = "app_menu">
		                        <ul>
		                            <br>
		                            <li class = name ><c:out value ="${posting.id }"/> &nbsp강사님</li>
		                            <li class = title>[<c:out value ="${posting.title}"/>]</li>		                            
		                            <li class>클래스 일정</li>
		                            <li class  ="date">
		                            <fmt:parseDate value="${posting.startdate}" var="startdate" pattern="yyyy-MM-dd HH:mm"/>
									<fmt:formatDate value="${startdate}" pattern="yyyy-MM-dd"/>
		                          
		                            	&nbsp~ &nbsp
 									<fmt:parseDate value="${posting.enddate}" var="enddate" pattern="yyyy-MM-dd HH:mm"/>
									<fmt:formatDate value="${enddate}" pattern="yyyy-MM-dd"/>
		                            </li>
		                          	<li class ="time">클래스 시작 시간</li>
		                            <li class ="time2">&nbsp &nbsp<c:out value ="${posting.starttime }"/> </li>
		                            <li>예약 금액   <div class = price><c:out value ="${posting.price }"/>원</div></li>
		                            <li><hr></li>	                           
		                        </ul>
		             	
							
							  <input type="hidden" name="bno" value="${posting.bno}"/>
							  <ul>
		                      <li><input type="submit" class="update_btn2"style ="margin-top:0;" value="반려" /></li>
		                     
		                  	
		                  	<%-- 	<input type="button" value="${posting.bno }"/>
		                  		<input type="button" value="<c:out value='${posting.bno }'/>"> --%>
		                  	
                      	
                     		<li>
		                 	<input type="hidden" name="bno" value="${posting.bno}"/></input>
		                 	</li>
		                 	<li><input type="submit" class="update_btn" style ="margin-top:0;"value="승인" /></li>
		                 	
		                 
		                 	<!-- <h3 style="margin-top: 130px; margin-left: 80px;">심사 내용</h3> -->
		                 	<li><textarea name="con5" id="con5" style="resize: none; margin-top:20px; width:320px;" placeholder="반려 사유를 작성해주세요."></textarea></li>
		                 	 </ul>
					

							</div>
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

   						
    </form>
    
     
						
  
</body>
</html>

<!-- <script>

(function(){ //즉시실행함수
	

	
	
	  /* $.getJSON("/board/getUploadList", {bno : bno}, function(arr){
		    
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
 -->
<script type="text/javascript">

$(document).ready(function(){
	var formObj = $("#updateForm");
	

	$(".update_btn").on("click", function(e){
		  
			alert("심사 승인");
		  formObj.attr("action", "/manager/managerupdate");
		  formObj.attr("method", "post");
		  formObj.submit();
		});
	
	
	$(".update_btn2").on("click",function(e){
		

		if($("#con5").val().length == 0){
			alert("반려 사유를 작성해주세요.");
			e.preventDefault();
			return false;
		}else{
			alert("심사 반려");
			formObj.attr("action", "/manager/managerupdate2");
			formObj.attr("method", "post");
			formObj.submit();
			return true;
		}
		
	});


})


 
</script>
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

    		
    });//getJSON
		
})();
</script>

<%@include file="../includes/footer.jsp"%>
