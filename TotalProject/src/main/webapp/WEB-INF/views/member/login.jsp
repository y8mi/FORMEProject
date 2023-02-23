<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="../includes/header.jsp"%> 




<html>
<head>
	<!--  CSS 링크 -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/login.css?ver=3">  
</head>
<body>
	<div class="wrap">
	
		
		<form action="login.do" method="post" class="login" name="login">
			
			<h2>로그인</h2>
				<div class="login_id">
					<h4>아이디</h4>
					<input type="text" id="id" name="id" placeholder="아이디를 입력해주세요">
				</div>
				<div class="login_pw">
					<h4>비밀번호</h4>
					<input type="password" id="password" name="password"  placeholder="비밀번호를 입력해주세요">
				</div>
				
				<!-- <div class="login_remember">
					<input type="checkbox" name="remember"><span>로그인 유지</span>
				</div> -->
				
				
				 <div>
					<br>
					<c:if test="${msg_s == false}">
						<p style="color: red; ">로그인 실패!! 아이디와 비밀번호 확인해주세요.</p>
					</c:if>
				</div> 
				
				<!--(alert형식) -->
				<%-- <br>
				<c:if test="${msg == false}">
					<script type="text/javascript">
						alert("로그인 실패!! 아이디와 비밀번호 확인해주세요.");
					</script>
				</c:if> --%>
				
				
				<div class="submit" style="margin-top: 10px !important;">
					<input type="submit" value="로그인">
				</div>
			
				
				<hr style="border:1px solid#878787; display: block !important; width: 80% !important;"/>
		
				
				<div class="login_ext"> 
					<a href ="<c:url value ='/member/memberForm'/>">회원가입</a>&nbsp|
	                <a href ="<c:url value ='/member/findIdForm'/>">아이디 찾기</a>&nbsp|
	                <a href ="<c:url value ='/member/findPwForm'/>">비밀번호 찾기</a>
				</div>
			</form>
		
	</div>
</body>
</html>	
	


<%@include file="../includes/footer.jsp"%>
