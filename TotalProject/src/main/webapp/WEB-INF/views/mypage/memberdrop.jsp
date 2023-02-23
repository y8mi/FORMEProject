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
    <script src="../../resources/js/password.js"></script>
    
    <style>
    html, body {
	height: 100%;
}

	 .mypage {
		    margin: 0;
		    padding: 0;
		    height: 100%;
	}  
		
	.body-wrapperh {
	    min-height: 100%;
	    position: relative;
	}
	
	.body-contenth {
	    margin-top: 100px;
	    padding-bottom: 67.55px; /* footer의 높이 */
	}
	
	footer {
	    width: 100%;
	    height: 67.55px; /* footer의 높이 */
	    position: absolute;  
	    bottom: 0;
	    left: 0;
	}
	</style>
</head>



<body>
  
	<div class="container-fluid">
               
        <!-- wishlist -->
        <div class="container">
          
            <div class="col-md-8 col-md-push-1">
                <div class="row">
                    <br>
                    <b style="font-size: 20px;">회원 탈퇴</b>
                </div>
                <br><br>
                <form class="container-info" action="/mypage/memberdelete" method="post">
	               <div class="row">
		                <div class="row">
		                    <div class="col-md-8">
			                    <div>
							 		<label for="id">아이디</label>
							 		<input type="text" id="id" name="id" value="${member_s.id}" readonly/>
							 	</div>
							 	
							 	<div>
							 		<label for="password">비밀번호</label>
							 		<input type="password" id="password" name="password" />
							 	</div>
		                    </div>
		                </div>
	                </div>
	                <div class="row">
	                	<div class="col-md-8">
	                	회원탈퇴시 모든 정보가 삭제되며 되돌릴 수 없습니다.
						<button type=submit data-oper='memberdelete' onclick="alert('비밀번호가 일치할시 자동 로그아웃 됩니다.')">탈퇴</button>
	                	</div>
	                </div>
	            </form>
            </div>
        </div>
	</div> 
</body>
</html>

<%@include file="../includes/footer.jsp"%>
