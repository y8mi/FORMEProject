<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-1.8.2.min.js"></script>

<script src="${path}/resources/js/videolink.js?var=25"></script>
<link href="${path}/resources/css/videolink.css?var=38" rel="stylesheet"/>

<style>

</style>
</head>
<body>

 	 <div class="managerheader">
         <h2 align="left" style="display:inline">메인 페이지 동영상 링크</h2>
      </div>
      <hr align="left" style="border: solid 1.5px gray; width: 1000px; margin-left: 400px;"></hr>
      <div class="managermenu">
         <h3><a href="/manager/manager" style="text-decoration-line: none; color: white;">관리자센터</a></h3>
          <div class="managermenufooter">
            <ul class="menulist" align="center" style="list-style: none; padding: 0px;"><br>
             		 <li style="list-style: none;" align="center"><a href="/manager/csboard">고객문의</a></li><br>
                     <li style="list-style: none;" align="center"><a href="/manager/mgposting">강사 신청 목록</a></li><br>
                     <li style="list-style: none;" align="center"><a href="/manager/videolink">동영상 링크</a></li>
                  </ul>
                </li>
            </ul>
         </div> 
      </div>


	
<!--  <div class="videobody">
  <div class="video">
    <h3 id="videotext">메인 페이지 동영상 URL 링크</h3><br />
    <div class="youtube"></div>
    <form action="url" method="get">
      <textarea rows="5" cols="50"></textarea><br /><br>
      <input type="reset" id="reset" value="지우기">
      <input type="submit" id="submit" value="업로드" style="margin-left: 10px;">
    </form>
  </div>
</div> -->





<div class="videobody"> 
  <div class="video"> 
   <div class="youtube"></div> 
    <form id="vidioform" name="videoform" method="POST"> 
      <textarea rows="7" cols="50" id="video" name="video" placeholder="url 주소를 입력해주세요."></textarea><br /><br>
      <input type="reset" id="reset" value="지우기"> 
      <input type="button" id="preview" value="미리보기" style="margin-left: 10px;"> 
      <input type="submit" id="submit" value="업로드">
    </form><br><br>
    <div id="video-preview"></div>
  </div> 
</div>


<script>


document.getElementById("preview").addEventListener("click", function(event){
    event.preventDefault();
    var videoUrl = document.getElementById("video").value;
    document.getElementById("video-preview").innerHTML = '<iframe src="' + videoUrl + '" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>';
  });
  
  
$(document).ready(function() {
	
    
  var videoform = $("#vidioform");

	$("#submit").on("click",function(e){
		alert("동영상이 업로드 되었습니다.");
		videoform.attr("action", "/manager/video");
		videoform.attr("method", "post");
		vidioform.submit();
	});
	
})
	
  
</script>




	
	<!-- <div class="videoview">
			</div>  -->

</body>
</html>

<%@include file="../includes/footer.jsp"%> 