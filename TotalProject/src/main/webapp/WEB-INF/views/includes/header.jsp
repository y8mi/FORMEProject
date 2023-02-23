<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>   

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FORME</title>

		<!-- 합쳐지고 최소화된 최신 CSS -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<!-- 부가적인 테마 -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
		<!-- js분리안하고 사용하기 위해 -->
		<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
		<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

		<!-- 헤더 검색아이콘 -->
		<script src="https://kit.fontawesome.com/8eb5905426.js" crossorigin="anonymous"></script>
		     
		<!-- css 링크 -->
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/header.css?ver=2">
		
		<!-- 패드워드 핸드폰번호 관련 -->
		<script src="../resources/js/password.js"></script>
		<script src="../resources/js/phone.js"></script>
		

</head>

<body>
	<div class="body-wrapperh">
	   <!-- 헤더 -->
	   <div>
	    <header class="full">
	        <section class="ext">
	
				<!-- 로고 -->
				<a aria-label="logo" href ="<c:url value ='/main'/>" class="logo">
					<img src="../resources/images/header/logo.png">
				</a>
			
				<div class="gap" style="flex-grow: 1;"></div>
	
				<!-- (로그아웃 상태) -->	
				<c:if test="${member_s == null }">
			
			        <!-- 검색창-->
			        <form role="search" class="search">
			            <div class="search-boad">
			              
			                <input name="search" data-testid="search-input" type="text" placeholder="검색어를 입력하세요" maxlength="30" autocomplete="off" autocorrect="off" autocapitalize="off" class="search-box" value=""/>
			                <div class="search-btn-box">
			                    <span role="img" rotate="0" class="search-btn">
			                    	<i class="fas fa-search"></i>
			                    </span>
			                </div>
			
			            </div>
			        </form>
			        	
	        		 	<!--페이징, 카테고리 form 태그 -->
						<form id='actionFormT' action="/board/boardTotal" method='get'>             
							<input type='hidden' name='pageNum' value='${tpageMaker.cri.pageNum}'>    
							<input type='hidden' name='amount'  value='9'> 
							<input type='hidden' name='title' value='${tpageMaker.cri.title}'>
					  	 </form>
					<!-- 검색창 끝-->	  
			         
			        <!--로그인 버튼-->
			        <div class="login-box">
			            <a href ="<c:url value ='/member/loginForm'/>"><button type="button" class="log-btn">로그인</button></a>
			        </div>
		        </c:if>
	          
	          <!-- --------------------------  -->
	          
				<!--(로그인 상태)-->
				<c:if test="${member_s != null }">
	          
	    			<!-- 마이페이지 -->	      
	    			<form>
	                	<input id ="s.id" name="s.id" type ="hidden" value ="${member_s.id}"> 
	                	<input id ="s.password" name="s.password" type ="hidden"  value ="${member_s.password}">
	                	<input id ="s.name" name="s.name" type ="hidden"  value ="${member_s.name}">
	                	<input id ="s.right" name="s.right" type ="hidden"  value ="${member_s.right}">
	                	<input id ="s.email" name="s.email" type ="hidden"  value ="${member_s.email}">
	                	<input id ="s.phone" name="s.phone" type ="hidden"  value ="${member_s.phone}">           
			        	<div class="login-success" id="login-success">
			        	<a href="/mypage/buyermypage?id=${member_s.id}" >
			        		<input type="submit" value="[${member_s.name}]님의 마이페이지"/>
			        	</a>
			        	
			        	
			        	<%-- <c:set var="mright" value="${member_s.right}" />
			        	<c:if test="${mright == 0}">
							<a href="/mypage/buyermypage?id=${member_s.id}">[${member_s.name}]님의 마이페이지</a>
						</c:if>
						<c:if test="${mright == 1}">
							<a href="/mypage/sellermypage?id=${member_s.id}">[${member_s.name}]님의 마이페이지</a>
						</c:if> --%>
				         <%-- <a href="/mypage/buyermypage?id=${member_s.id}">[${member_s.name}]님의 마이페이지</a> --%>
				         <%-- <button id="mypage">[${member_s.name}]님의 마이페이지</button> --%>
			          	</div>
		          	</form>
		          	
					<!-- 검색창-->
			        <form role="search" class="search">
			            <div class="search-boad">
			              
			                <input name="search" data-testid="search-input" type="text" placeholder="검색어를 입력하세요" maxlength="30" autocomplete="off" autocorrect="off" autocapitalize="off" class="search-box" value=""/>
			                <div class="search-btn-box">
			                    <span role="img" rotate="0" class="search-btn">
			                    	<i class="fas fa-search"></i>
			                    </span>
			                </div>
			
			            </div>
			        </form>
			        	
	        		 	<!--페이징, 카테고리 form 태그 -->
						<form id='actionFormT' action="/board/boardTotal" method='get'>             
							<input type='hidden' name='pageNum' value='${tpageMaker.cri.pageNum}'>    
							<input type='hidden' name='amount'  value='9'> 
							<input type='hidden' name='title' value='${tpageMaker.cri.title}'>
					  	 </form>
					<!-- 검색창 끝-->	  
	          
		        	<!--로그아웃 버튼-->     
					<div class="login-box">       	  
					    <a href ="<c:url value ='/member/logout.do'/>"><button type="button" class="log-btn">로그아웃</button></a>
					</div>
		          
		         	
				</c:if>
	          
	          
	          
	        </section >
	        
	    </header>
    <div class="body-contenth">
    
  </div>
</body>
<script type="text/javascript">
/* 마이페이지 */

$("#mypage").on("click", function(){
	

	 var right = document.getElementById("s.right").value;
	 var id = document.getElementById("s.id").value;
	 
	alert(right);
	var buyer = '/mypage/buyermypage?id='+id; 

	var seller = '/mypage/sellermypage?id='+id;
	
	var manager = '/manager/manager';
	
	
	if(right == 0){
		alert(buyer);
		location.replace(buyer);
		
	}else if(right == 1){
		alert(seller);
		location.replace(seller);
	}else if(right == 3 ){
		alert(manager);
		location.replace(manager);
	}

    		


});	


(function(){ //즉시실행함수
	
	 var right = document.getElementById("s.right").value;
	 var id = document.getElementById("s.id").value;
	 
	 var login = document.getElementById("login-success");

 	 if(right ==0){
		 
		 document.all('login-success').innerHTML="<a href='/mypage/buyermypage?id=${member_s.id}'>[${member_s.name}]님의 마이페이지</a>"; 
 	 }else if(right == 1){
	
		 document.all('login-success').innerHTML="<a href='/mypage/sellermypage?id=${member_s.id}'>[${member_s.name}]님의 마이페이지</a>";
	 }else if(right == 3){
		 document.all('login-success').innerHTML="<a href='/manager/manager'>관리자페이지 바로가기</a>";
	 }

})();

</script>

<script>			  

	var actionFormT = $("#actionFormT");
	
 	$(".search-btn").on("click", function(e) {
	 

	 
	var title = $("input[name='search']").val();
	
    alert(title + "을(를)검색합니다.")
	actionFormT.find("input[name='title']").val(title);
	actionFormT.find("input[name='pageNum']").val(1);

	e.preventDefault();
	actionFormT.submit();
	
	var s_list = document.getElementById("total_list").value;
		console.log("total_list = " + total_list);
	if(s_list != s_list) {
		  
		 alert("결과 X");
		 return actionFormT.find("input[name='pageNum']").val(1);
	  }

	 
 });		  
</script>     		  
</html>  
 
  
