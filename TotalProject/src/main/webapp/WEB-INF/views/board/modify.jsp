<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<%@ include file="../includes/header.jsp"%> 

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

 <!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/modify.js?ver=211"></script>
<!-- 주소검색api -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/modify.css?ver=1591">

<!-- js분리안하고 사용하기 위해 -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- 파일업로드 위해 jQuery cdn -->
<script
  src="https://code.jquery.com/jquery-3.3.1.js"
  integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
  crossorigin="anonymous"></script>

</head>

<body id = "y_body">
 <!--greed 분리위한 container-->
    <div class="container">
        <!--greed 분리위한 row-->
        <div class="row">
        <div class="col-md-2" ></div>
          <div class="col-md-8" >
	            <div align = "center"><h2><b> &nbsp&nbsp 클래스 관련 정보를 적어주세요 ! </b></h2></div><br>
	            
	            <div align = "center"><h4><b> 강의 관련 사진을 올려주세요. </b></h4>
	            					<br><h4>(※사진은 최대 3장만 업로드 가능합니다.)</h4>
	            </div>
	            <div class ="class_img">
	            <form enctype="multipart/form-data">
	            <label for ="uploadFile" class ="input-file-button"> 사진 선택</label>
	            	<input type ='file' style ="display : none" id = 'uploadFile' name ='uploadFile' multiple  />  <!-- style="display:none"  -->
	            </form>
	            

	            </div><!-- class_img -->
<!-- 	            <button id ="uploadBtn" class = "btn uploadbtn">    
	                          <span class ="upload">파일 업로드 </span></button> -->
	                          

	           	<!-- 파일 미리보기 -->
	            <div class ='uploadResult'>
	            	<ul>
	            	</ul>
	            </div>
	            
	            <!--상세설명 scrollspy위한 nav-->
	                <!--캐러셀 -->
	                
	                <br><br>
	                <!--상세설명-->
	                <input type="hidden" id="categorynumber" value="<c:out value="${posting.categoryno}"/>">
	                <div data-bs-spy="scroll" data-bs-target="#navbar-example2" data-bs-offset="0" class="scrollspy-example" tabindex="0" >
	                	<form role ='form' action ="/board/modify" method = "post" class ="address" onSubmit="return Checkform()" name="frm">
	                	   	<ul> 
	                            <li style ="display : none">id테스트<input type ='text' name='id' value ='${member.id}' ></li>
	                            <li style ="display : none">bno테스트<input type ='text' name='bno' value ='${posting.bno}' ></li>
	                            <li class = "title" >강의 제목</li>
	                            <li><input type="text" class ="required_time" name ='title' value='<c:out value ="${posting.title}"/>'/></li>
	                            <li>카테고리
	                            	<select class ="category" id ="categorySelected" name ='categoryno'>
	                            		<option value ="1">스포츠/레저</option>
	                            		<option value ="2">언어/교육</option>
	                            		<option value ="3">문화/예술</option>
	                            		<option value ="4">요리/음료</option>
	                            		<option value ="5">핸드메이드</option>
	                            		<option value ="6">기타</option>
	                            	</select>
	                            </li>
	                            <li class ="date">클래스 일정</li>
	                            
	                           	<fmt:parseDate value="${posting.startdate}" var="startdate" pattern="yyyy-MM-dd HH:mm"/>
								<fmt:parseDate value="${posting.enddate}" var="enddate" pattern="yyyy-MM-dd HH:mm"/>
	                            <li><input type="date" name="startdate" id="startDate" value="<fmt:formatDate value="${startdate}" pattern="yyyy-MM-dd"/>"> 
	                            &nbsp~ &nbsp<input type="date" name="enddate" id="startDate"value="<fmt:formatDate value="${startdate}" pattern="yyyy-MM-dd"/>"></li>
	                            <li class ="time">시간 선택</li>
	                            <li><select onchange="categoryChange(this)" class ="select" id ='category'>
										<option value ="">오전/오후</option>
										<option value="a">오전</option>
										<option value="b">오후</option>
										<option value="c">협의</option>
									</select>									
									<select id="classhours" class = "select" name ='starttime'>
									<option>클래스 시작 시간을 선택해주세요</option>
									
									</select>
								</li>
		                        <li> 소요 시간 <input type="text" name ='classtime' class ="required_time" value='<c:out value ="${posting.classtime}"/>'></li>
	                            <li>예약 금액   <input type="text" class ="price" name ='price'value='<c:out value ="${posting.price}"/>'>원</li>	                      
	                           	</ul>	
	                            <hr width="360px">  
	                            
	                        <h4 id="scrollspyHeading1">클래스 소개</h4><br>
	    						 <textarea class="autosize" name ='con1' onkeypress="check_enter()" onkeydown="resize(this)" onkeyup="check_length(area)" ><c:out value ="${posting.con1}"/></textarea><br>
	    					<h4 id="scrollspyHeading2">커리큘럼</h4><br>
                        		<textarea class="autosize" name ='con2' onkeypress="check_enter()" onkeydown="resize(this)" onkeyup="resize(this)" ><c:out value ="${posting.con2}"/></textarea><br><br><br>	 
	                        <h4 id="scrollspyHeading3">강사 소개</h4><br>
	    						 <textarea class="autosize" name ='con3' onkeypress="check_enter()" onkeydown="resize(this)" onkeyup="resize(this)"><c:out value ="${posting.con3}"/></textarea><br></textarea><br><br>

	                            <button type ="submit" class = "btn btn-2" id ="uploadBtn"><span class = "save_2">수 정</span></button>
	                           	
						</form>
	                </div> <!-- navbar -->                             
      </div> <!--row-->
      <button type="button" onClick="javascript:window.scrollTo(0,0)" class ="ontop">
        <!--화살표-->
        <svg class="MuiSvgIcon-root MuiSvgIcon-fontSizeMedium css-675ts4" focusable="false" aria-hidden="true" viewBox="0 0 24 24" data-testid="ArrowUpwardIcon"><path d="m4 12 1.41 1.41L11 7.83V20h2V7.83l5.58 5.59L20 12l-8-8-8 8z"></path></svg>
      </button>
      <div class="col-md-2" ></div>
    </div><!-- row -->
   </div><!-- container -->

<!-- =============모달 창 모음================= -->
<!--  등록완료 모달 -->
    <div id="modal" class="modal-overlay">
        <div class="modal-window">
            <div class="title">
                <h2></h2>
            </div>
            <div class="close-area">X</div>
            <div class="content">
                <p>처리 완료 </p>
                
                
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
    		
    		$(arr).each(function(i, attach){
    			
        		var fileCallPath = encodeURIComponent(attach.uploadPath+ "/s_" + attach.uuid + "_" + attach.fileName);
    			
        		str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"'data-filename='"+attach.fileName +"'data-type='"+attach.fileType+"' ><div>";
        		str += "<div><button type='button' data-file=\'"+fileCallPath+"\'data-type='image'>삭제</button><br>";
        		str += "<img src ='/board/display?fileName="+fileCallPath+"'>";
        		str += "</div></li>";
    		});//arr each문
    		
    	$(".uploadResult ul").html(str);	
    });//getJSON
		
})();

</script>

<%@include file="../includes/footer.jsp"%>
