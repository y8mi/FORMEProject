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
    <link rel="stylesheet" href="../../resources/dist/css/header.css">
    <link rel="stylesheet" href="../../resources/dist/css/footer.css">
    <link rel="stylesheet" href="../../resources/dist/css/buyermypage.css">
    <link rel="stylesheet" href="../../resources/dist/css/sellermypage.css">
</head>

<body>
	<div class="container-fluid">        
        <!-- buyermypage -->
        <div class="container">
            <div class="col-md-3">
                <div class="row"> 
                        <img src="../../resources/images/mypage/buyerimage.PNG">
                </div>
                <div class="row">
                    <div style="margin: auto; font-size: 20px;">
                        닉네임 들어갈 자리입니다
                    </div>
                </div>
                <div class="row">
                    <a href="sellermypage"><img src="../../resources/images/mypage/sellerchange.PNG"></a>
                </div>
                <br><br>
                <div class="row">
                    <b style="font-size: 18px;">마이포미</b>
                </div>
                <div class="row">   
                    <hr style="background-color: rgb(0, 0, 0); height: 2px;">
                </div>
                <div class="col-md-11 col-md-push-1">
                    <div class="row">
                        <a href="buyermypage" class="ba"> 수강중인 게시물 목록</a>
                    </div>
                    <br>
                    <div class="row">
                        <a href="wishlist" class="ba"> 나의 위시리스트</a>
                    </div>
                    <br>
                    <div class="row">
                        <a href="#" class="ba"> 개인정보 수정</a>
                    </div>
                    <br>
                    <div class="row">
                        <a href="passchange" class="ba"> 비밀번호 변경</a>
                    </div>
                    <br>
                    <div class="row">
                        <a href="#" class="ba"> 회원 탈퇴</a>
                    </div>
                </div>
            </div>
            <div class="col-md-8 col-md-push-1">
                <div class="row">
                    <br>
                    <b style="font-size: 18px;">비밀번호 변경</b>
                </div>
                <br><br>
                <div class="row">
                    <table class="table">
                        <tr>
                            <td>
                                <br><br><br><br><br><br>
                                <div class="row">
                                    <div class="col-md-4 col-md-push-4">
                                        <br>
                                        현재 비밀번호
                                        <br><br>
                                        <input type="text" class="pctext" name="pass" id="pass" autofocus required placeholder>
                                    </div>
                                </div>
                                <br><br>
                                <div class="row">
                                    <div class="col-md-4 col-md-push-4">
                                        새 비밀번호 입력
                                        <br><br>
                                        <input type="text" class="pctext" name="newpass" id="newpass" autofocus required placeholder>
                                    </div>
                                </div>
                                <br>
                                <br>
                                <br>
                                <button type="submit">변경</button>
                            </td>    
                        </tr>
                    </table>
                </div>
            </div>
        </div>

</body>
</html>

<%@include file="../includes/footer.jsp"%>

