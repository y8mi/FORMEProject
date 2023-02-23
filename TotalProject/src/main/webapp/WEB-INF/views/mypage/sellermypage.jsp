<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../includes/header.jsp"%>  
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>Document</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
    <script src="https://kit.fontawesome.com/8eb5905426.js" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sellermypage.css?ver=4">
    	<script src="../../resources/js/mypage.js?ver=4"></script>
    	
    

</head>

<body>
	<div class="container-fluid">     
        <!-- sellermypage -->
        <%@include file="../includes/sellermypageincl.jsp"%>
            <div class="col-md-8 col-md-push-1">
                <div class="row">
                    <br>
                    <b style="font-size: 18px;">강습목록</b>
                </div>
                <br><br>
                <div class="row" style="padding-bottom:200px">
	                <c:forEach items="${list}" var="board">
						<!-- □ 게시글  -->
						<div class="p_article" onclick="" style="font-size: 15px;"
							class='uploadREsult' style="float:left;">
							<div class="col-md-6">
								<div class="col-md-6">
									<a class="p_board" href="/board/detail?bno=<c:out value ='${board.bno}'/>"> 
										<div class="p_class">
                                           	<img src="" id="p_img" class="p_img">
											<input type='hidden' class ='board_len' value ='<c:out value="${board.id}"/>'>
											<input type ='hidden' class ='uuid' value='<c:out value="${board.uuid}" />'>          
				                            <input type ='hidden' class ='uploadPath' value='<c:out value="${board.uploadpath}" />'> 
				                            <input type ='hidden' class ='fileName' value='<c:out value="${board.filename}" />'>
										</div>
											<br>
											<b>카테고리: 
											<c:set var="cate" value="${board.categoryno}" />
												<c:if test="${cate == 1}">
													스포츠/레저
												</c:if>
												<c:if test="${cate == 2}">
													언어/교육
												</c:if>
												<c:if test="${cate == 3}">
													문화/예술
												</c:if>
												<c:if test="${cate == 4}">
													요리/음료
												</c:if>
												<c:if test="${cate == 5}">
													핸드메이드
												</c:if>
												<c:if test="${cate == 6}">
													기타
												</c:if>
											</b>
										
										
											<br>	
											<b>강좌명: <c:out value="${board.title}" /></b>
									
										
											<br>	
									
											<span class="my_title"> 작성자: <c:out value="${board.id}" /> </span>
										
	
										
											<br>
										
											<b>가격: <fmt:formatNumber value="${board.price}" pattern="#,###" />원</b>
									
									</a>
									<!-- <img src="/board/display?fileName=2023\02\03/s_33205724-3026-44dc-afb9-35b03825b4da_6acf2c1e-b3df-4ac8-8886-c97b80ef726a.jpg"> -->
								</div>
							</div>
						</div>
					</c:forEach>
                </div>
            </div>
        </div>
</body>
</html>



<%@include file="../includes/footer.jsp"%>

<script>


/*이미지 띄우기*/

	
$(function() {
	
	 var len = $('.board_len').length; //cart_id란 클래스 개수 세기 ok
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