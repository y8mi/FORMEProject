<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="../includes/header.jsp"%>  
  

<html>
<head>
	<!--  css링크  -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/findpw.css?ver=3">



</head>
<body>
<div class="wrap">
    <div class="login">
        <h2>비밀번호 찾기</h2>

        <div class="login_id">
            <h4>ID</h4>
            <input type="text" id="id" name="id" class="text" placeholder="회원가입한 아이디를 입력하세요" required>
        </div>
        <div class="login_pw">
            <h4>Email</h4>
            <input type="email" id="email"  name="email" class="text" placeholder="회원가입한 이메일주소를 입력하세요" required>
        </div>
        <div class="submit">
            <input type="button" id="pwFindBtn" value="이메일로 발송">
        </div>

		<hr style="border:1px solid#878787; display: block !important; width: 80% !important;"/>

		<div class="login_ext"> 
			<a href ="<c:url value ='/member/memberForm'/>">회원가입</a>&nbsp|
            <a href ="<c:url value ='/member/loginForm'/>">로그인</a>&nbsp|
            <a href ="<c:url value ='/member/findIdForm'/>">아이디 찾기</a>
		</div>
    
    </div>
</div>
        
            
</body>
</html>
        
        
<script type="text/javascript">

$(function(){
	$("#pwFindBtn").click(function(){
		console.log("pw찾기 ...")
		$.ajax({
			url : "/member/findpw",
			type : "POST",
			data : {
				id : $("#id").val(),
				email : $("#email").val()
			},
			success : function(result) {
				alert(result);
			},
			error:function(request,status,error){
	        alert("code:"+request.status+"\n"+"\n"+"error:"+error);
	        }
		});
	});
});

</script>



<%@include file="../includes/footer.jsp"%>