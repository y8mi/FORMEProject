<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="../includes/header.jsp"%>   

<html>
<head>
		<!-- css 링크 -->
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/findid.css?ver=">
	
</head>
<body>

	<div class="wrap">	
	    <div class="login" style="border: 3px solid rgb(238, 197, 197);">
	        
	        	<!-- (정보가 있는 경우) -->	
				<c:if test="${Idinfo != null }">
			        <div class="login_id" style="color: rgb(238, 150, 150); text-align: center; " >
						<h2> [ <c:out value="${Idinfo.name}" /> ]님의  ID는</h2>
						<h2> ' <c:out value="${Idinfo.id}"/> ' 입니다. </h2>	            
			        </div> 
			        
			        <hr style="border:1px solid#878787; display: block !important; width: 80% !important;"/>
	
					<div class="login_ext" > 
			            <a href ="<c:url value ='/member/loginForm'/>">로그인</a>&nbsp|
			            <a href ="<c:url value ='/member/findPwForm'/>">비밀번호 찾기</a>
					</div>
				
			    </c:if>  
			      
			        <!-- ----------------------------------------------------- -->
			   
			    <!-- (정보가 없는 경우) -->	
				<c:if test="${Idinfo == null }">
			        <div class="login_id" style="color: rgb(238, 150, 150); text-align: center;">
						<h2> 입력한 정보가 틀렸거나,</h2>
						<h2> 등록되지 않은 회원입니다.</h2>
						<h2> 다시 확인해주세요!</h2>
			        </div>
		        
		        	<hr style="border:1px solid#878787; display: block !important; width: 80% !important;"/>
	
					<div class="login_ext"> 
						<a href ="<c:url value ='/member/memberForm'/>">회원가입</a>&nbsp|
			            <a href ="<c:url value ='/member/loginForm'/>">로그인</a>&nbsp|
			            <a href ="<c:url value ='/member/findIdForm'/>">아이디 찾기</a>&nbsp|
			            <a href ="<c:url value ='/member/findPwForm'/>">비밀번호 찾기</a>
					</div>
		        </c:if>
   		</div>   	      
   	</div>
	
</body>
</html>


<%@include file="../includes/footer.jsp"%>

