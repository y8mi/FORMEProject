<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="../includes/header.jsp"%>  
  

<html>
<head>
	<!--  css링크  -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/findpw.css?ver=5">



</head>
<body>
<form action = "/member/findId" method ="post">
	<div class="wrap">
		
	    <div class="login">
	        <h2>아이디 찾기</h2>
	
	        <div class="login_id">
	            <h4>이름</h4>
	            <input type="text" id="name" name="name" class="name" placeholder="이름을 입력하세요" required>
	        </div>
	        <div class="login_pw">
	            <h4>Email</h4>
	            <input type="email" id="email"  name="email" class="text" placeholder="이메일 주소를 입력하세요" required>
	        </div>
	        <div class="submit">
	            <input type="submit" id="idFindBtn" value="아이디찾기!">
	        </div>
	
			<hr style="border:1px solid#878787; display: block !important; width: 80% !important;"/>
	
			<div class="login_ext"> 
				<a href ="<c:url value ='/member/memberForm'/>">회원가입</a>&nbsp|
	            <a href ="<c:url value ='/member/loginForm'/>">로그인</a>&nbsp|
	            <a href ="<c:url value ='/member/findPwForm'/>">비밀번호 찾기</a>
			</div>
	    
	    </div>
		   
	</div>
</form>
            
</body>
</html>
 

<%@include file="../includes/footer.jsp"%>