<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>   
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


<script src="../../resources/js/password.js"></script>
<script src="../../resources/js/passwordconfirm.js"></script>

		<div class="container" style="padding-bottom:200px">
            <div class="col-md-3">
                <div class="row"> 
                   <img src="../../../resources/images/mypage/buyerimage.PNG">          
               </div>
                <div class="row">
                    <div style="margin: auto; font-size: 20px;">
                        ${member_s.name}님 환영합니다.
                    </div>            
                </div>
                <div class="row">
                <form>
                	<input id ="s.id" name="s.id" type ="hidden" value ="${member_s.id}"> 
                	<input id ="s.password" name="s.password" type ="hidden"  value ="${member_s.password}">
                	<input id ="s.name" name="s.name" type ="hidden"  value ="${member_s.name}">
                	<input id ="s.right" name="s.right" type ="hidden"  value ="${member_s.right}">
                	<input id ="s.email" name="s.email" type ="hidden"  value ="${member_s.email}">
                	<input id ="s.phone" name="s.phone" type ="hidden"  value ="${member_s.phone}">    
                    <a href="/mypage/sellermypage?id=${member_s.id}">
                    	<img src="../../../resources/images/mypage/sellerchange.PNG">
                    </a>
                </form>
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
                        <a href="/mypage/buyermypage?id=${member_s.id}" class="ba"> 수강신청 목록</a>
                    </div>
                    <br>
                    <div class="row">
                        <a href="/mypage/wishlist?id=${member_s.id}" class="ba"> 나의 위시리스트</a>
                    </div>
                    <br>
                    <div class="row">
                    <form action="/mypage/buyercs" class="mypageForm" method="get">
                        <a href="/mypage/buyercs?id=${member_s.id }" type="submit" class="ba">나의 문의 사항</a>
                    </form>
                    </div>
                    <br>

                    <div class="row">
                        <a href="buyerinfochange" class="ba"> 개인정보 수정</a>
                    </div>
                    <br>
                    <div class="row">
                        <a href="buyerpasschange" class="ba"> 비밀번호 변경</a>
                    </div>
                    <br>
                    <div class="row">
                        <a href="memberdrop" class="ba"> 회원 탈퇴</a>
                    </div>
                </div>
            </div>