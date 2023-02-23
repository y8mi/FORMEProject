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
    <link rel="stylesheet" href="../../resources/dist/css/buyermypage.css">
    <link rel="stylesheet" href="../../resources/dist/css/sellermypage.css">
</head>

<body>

	<div class="container-fluid">
       
        <!-- buyermypage -->
        <%@include file="../includes/sellermypageincl.jsp"%>
            <div class="col-md-8 col-md-push-1">
                <div class="row">
                    <br>
                    <b style="font-size: 18px;">개인정보 수정</b>
                </div>
                <br><br>
                <form class="container-info" action="/mypage/memberupdate" method="post">	
	                <div class="row">
		                <br><br><br>
		               	<div class="row">
		                    <div class="col-md-4 col-md-push-4">
		                        <div class="membertext">
	                         <div class="form-group">
			               		<label for="mb_id" class="form-label mt-4">아이디</label>
			                    <input type="text" class="form-control" name="id" id="mb_id" value="${member_s.id}" readonly>	
								<div><font id="id_feedback" size="2"></font></div>
			                </div>
	                         <div class="form-group">
			               		<label for="mb_pass" class="form-label mt-4">비밀번호</label>
			                    <input type="password" class="form-control" name="password" id="mb_pass" value="${member_s.password}" readonly>	
			                </div>
	                        <div class="form-group">
			               		<label for="mb_name" class="form-label mt-4">이름</label>
			                    <input type="text" class="form-control" name="name" id="mb_name"  value="${member_s.name}">	
			                </div>
			                <div class="form-group">
			                    <input type="hidden" class="form-control" name="right" id="mb_right"  value="${member_s.right}">	
			                </div>
	                         <div class="form-group">
			               		<label for="mb_phone" class="form-label mt-4">번호</label>
			                    <input type="text" class="form-control" name="phone" id="mb_phone" value="${member_s.phone}"
			                    oninput="autoHyphen2(this)" maxlength="13">   
			                </div>
	                        <div class="form-group">
			               		<label for="mb_email" class="form-label mt-4">이메일</label>
			                    <input type="email" class="form-control" name="email" id="mb_email" value="${member_s.email}"> 
			                </div>
	                      </div>
	                            <div class="membersubmit">
	                               <br>
	                               <input type="reset" value="취소" class="cancel"><br><br>
	                               <input type="submit" value="수정하기"  onclick="alert('변경되었습니다')"> <br><br>
	                            </div>
		                    </div>
		                </div>
		                <br>
	                </div>
     			</form>
        </div>

</body>
</html>

<%@include file="../includes/footer.jsp"%>

