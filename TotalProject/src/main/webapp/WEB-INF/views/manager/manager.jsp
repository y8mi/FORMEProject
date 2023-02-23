<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file="../includes/header.jsp"%> 
    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-1.8.2.min.js"></script>

<script src="${path}/resources/js/manager.js"></script>
<link href="${path}/resources/css/manager.css?ver=32" rel="stylesheet"/>   
<style>
iframe{
margin-left: 200px;
margin-top: 80px;
margin-bottom: 140px;
}
</style> 

</head>
<body>
      <div class="managerheader">
         <h2 align="left" style="display:inline">관리자센터</h2>
      </div>
      <hr align="left" style="border: solid 1.5px gray; width: 1000px; margin-left: 400px;"></hr>
      <div class="managermenu">
         <h3><a href="/manager/manager" style="text-decoration-line: none; color: white;">관리자센터</a></h3>
          <div class="managermenufooter">
            <ul class="menulist" align="center" style="list-style: none; padding: 0px;"><br>
               <!-- <li class="menulist" align="center" style="list-style: none;"><a href="#">강사 심사</a> -->
             		 <li style="list-style: none;" align="center"><a href="/manager/csboard">고객문의</a></li><br>
                     <li style="list-style: none;" align="center"><a href="/manager/mgposting">강사 신청 목록</a></li><br>
                     <li style="list-style: none;" align="center"><a href="/manager/videolink">동영상 링크</a></li>
                  </ul>
                </li>
            </ul>
         </div> 
      </div>
      
<iframe width="800" height="450" src="https://www.youtube.com/embed/Jh8359cq-Ic" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
      
</body>
</html>


<%@include file="../includes/footer.jsp"%> 
