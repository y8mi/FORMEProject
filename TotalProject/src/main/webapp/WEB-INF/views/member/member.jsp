<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%> 
<%-- <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> --%>
<%@include file="../includes/header.jsp"%> 

<html>
<head>
   <title>HomePage</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>


<script src="${path}/resources/js/member.js?ver=13"></script> 
<link href="${path}/resources/css/member.css" rel="stylesheet"/> 


</head>
   <body>
   
      <div class = "membercontainer">
         <div class="memberheader">
             <h2 align="left">회원 가입</h2>
          </div>
          <hr style="border: solid 1.5px gray; width: 1000px;"></hr>
          
               
                    <div align="center"> 
                      <h2>딱 이것만 체크하면 가입완료!</h2><br><br>
                    </div>
                    <div class="memberform">
                    <form action="/member/memberForm" name="myform" method="post" onSubmit="memberForm();return false">
                    <div class="membertext">
                         <h4>아이디</h4>
                            <input type="text" name ="id" id="id" size="20" onblur="idCheck()" placeholder="아이디 입력" ><br>
                            
                            <span class="id_ok">사용 가능한 아이디입니다.</span>
                     <span class="id_already">이미 사용중인 아이디입니다.</span>
                     
                         
                         <h4>비밀번호</h4>
                    <input type="password"  name="password" ><br>
                    <h4>비밀번호 확인</h4>
                    <input type="password"   name="repassword" ><br>

                  <!-- <input type="password" name=""><br>  -->
                         <h4>이름</h4>
                            <input type="text" name="name" ><br>
                          <h4>연락처</h4>
                            <input type="text" name="phone" placeholder="-없이 입력하세요."oninput="autoHyphen2(this)" maxlength="13" placeholder="숫자만 입력해주세요"><br> 
                          <h4>이메일</h4>
                        <input type="email" style="width: 300px;" name="email" id="email_id"  />
                        <!-- <select name="email_kind" id="email_kind" onChange="emailChoice(this.value, this.form.email_domain);"  style="width: 130px; height:40px;border:1px solid #cfcfcf;color:#bfbfbf;">
                           <option value="">직접입력</option>
                          <option value="naver.com">naver.com</option>
                           <option value="gmail.com">gmail.com</option>
                           <option value="hanmail.net">hanmail.net</option>
                           <option value="nate.com">nate.com</option>
                           <option value="yahoo.co.kr">yahoo.co.kr</option>
                        </select> -->
               </div>
                               
                          <div class="memberFooter">
                               <br>
                               <input type="reset" class="memberReset" class="cancel" value="취소">
                               <input type="submit" class="memberSubmit" value="회원가입" ><br><br>
                            </div>
                      </form>
                     
           </div>
      </div>    <!-- div container --><br><br><br>
   </body>

</html>


<%@include file="../includes/footer.jsp"%> 
