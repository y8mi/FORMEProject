<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>



<%@ include file="../includes/header.jsp"%>

<html>
<head>

<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>

 <script src="https://code.jquery.com/jquery-latest.js"></script>
 <script src="http://code.jquery.com/jquery-1.8.2.min.js"></script>
 <script src="${path}/resources/js/reply.js"></script>


<style>

.managerboard{
	width: 1000px;
	padding: 30px;
	background-color: #fafafa;
	margin-top: 50px; 
	margin-bottom: 80px;
	margin-left: 400px;
	border-radius: 5%;
}

 table{
	border-collapse : collapse;
	text-align: center;
}

  .boardheader {
   background: rgb(47, 153, 244);
   font-size: 20px;
   border-radius: 10px 10px 0px 0px;
  }
  
  .boardheader th{
  padding:20px;
  color: white;
  height: 60px;
  font-size: 20px;
  text-align: center;
  vertical-align: baseline;
  }
  
 .boardbody{
 
  border-spacing: 1px;
  line-height: 1.5;
  border-top: 1px solid #ccc;
  margin : 20px 10px; 
  text-align: center;
    
  }
  
  .boardbody th {
  width: 150px;
  padding: 10px;
  font-weight: bold;
  vertical-align: top;
  border-bottom: 1px solid #ccc;
  font-size: 20px;
  }
  
 
 .boardbody td{
  width: 350px;
  padding: 10px;
  vertical-align: top;
  border-bottom: 1px solid #ccc;
 }
 
 #managerbno{
 	width: 190px;
 	text-align: center;
 	padding-bottom: 15px;
 }
 
 #managertitle{
  width: 2100px;
  text-align: center;
  padding-bottom: 15px;
 }

 #mangercate{
	width: 150px;
	text-align: center;
	padding-bottom: 15px;
 }
 
 #managerdate{
 width: 180px;
	text-align: center;
	padding-bottom: 15px;
 }
 
 #managerid{
 	width: 180px;
 	text-align: center;
 	padding-bottom: 15px;
 }
 
 

.managerheader{
   margin-top: 50px;
   margin-left: 400px; 
   
}

.managermenu{
   float: left;
   position: relative;
   margin-left: 130px;
   width: 170px;
   height: 100px;
   padding: 0%;
   background-color: rgb(47, 153, 244);
   border-radius: 10px 10px 0px 0px;
   box-shadow: 0px 3px 4px rgba(0, 0, 0, 0.2); 
}



.managermenu  h3{
   color: white;
   padding-top: 15px;
   text-align:center;
   font-weight: bold;
}



.managermenufooter{
   position: absolute;
   border: none;
   top: 100px;
   text-align: center;
   width: 170px;
   height: 200px;
   border: 1.5px solid #757575;
   border-radius: 0px 0px 10px 10px;
   box-shadow: 0px 3px 4px rgba(0, 0, 0, 0.2); 
}


.managermenufooter ul {
   text-align: left;
   padding: 0px;
}


 .menulist a{
   cursor:pointer;
   color: #444444;
   text-decoration: none;
   font-weight : bold;
} 

.menulist .hide{ 
   display:none;
}

.hide a{
   color: #b4b4b4;
   text-decoration: none;
   font-weight : bold;
}


 .wrap {
	position: absolute;
	top: 50%;
	left: 400px; 
	margin-top: -86px;
	margin-left: -89px;
	text-align: center;
	pont-size: 30px;
} 

.wrap > a {
	-webkit-transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
	-moz-transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
	-ms-transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
	-o-transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
	transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
	display: inline-block;
	width: 160px;
	height: 160px;
	text-decoration: none; 
	border-radius: 50%;
	padding: 0px 0px;
	background-size: cover;
	background-repeat: no-repeat;
   	font-family: Arial, sans-serif;
	font-weight: bold;
	font-size: 23px;
	text-align: center;
	
}

 .button p{
	position: absolute;
	margin-top: 65px;
	margin-left: 30px;
} 
 .button2 p{
	position: absolute;
	margin-top: 65px;
	margin-left: 30px;
} 

 .button3 p{
	position: absolute;
	margin-top: 65px;
	margin-left: 19px;
} 

.wrap a.button {
	color: rgba(30, 22, 54, 0.6);
	box-shadow: rgba(30, 22, 54, 0.4) 0 0px 0px 2px inset;
	position: absolute;
	margin-left: 110px;
	text-align: center;
	border: 5px;
}

.wrap a.button2 {
	color: rgba(30, 22, 54, 0.6);
	position: absolute;
	box-shadow: rgba(30, 22, 54, 0.4) 0 0px 0px 2px inset;
	margin-left: 430px;
	text-align: center;
}

.wrap a.button3 {
	color: rgba(30, 22, 54, 0.6);
	position: absolute;
	box-shadow: rgba(30, 22, 54, 0.4) 0 0px 0px 2px inset;
	margin-left: 750px;
	text-align: center;
}

.wrap a.button:hover {
	color: rgba(255, 255, 255, 0.85);
	box-shadow: rgba(30, 22, 54, 0.7) 0 0px 0px 150px inset;
}

.wrap a.button2:hover {
	color: rgba(255, 255, 255, 0.85);
	box-shadow: rgba(30, 22, 54, 0.7) 0 0px 0px 150px inset;
}

.wrap a.button3:hover {
	color: rgba(255, 255, 255, 0.85);
	box-shadow: rgba(30, 22, 54, 0.7) 0 0px 0px 150px inset;
}

    .h-footer a {
   cursor:pointer;
   color: #444444;
   text-decoration: none; 
  }

.btn btn-default{
	font-size: 20px;
	width: 50px;
	height: 25px;
}

#table {
  width: 900px;
  margin-left: 450px;
  margin-top: 70px;
  margin-bottom: 50px;
  border-collapse: collapse; /* add this to prevent border overlap */
  /* border: 2px solid black; */
  box-shadow: 0px 3px 4px rgba(0, 0, 0, 0.2); 
}

.title {
  text-align: center;
  border: 1.3px solid gainsboro;
  border-radius: 10px 10px 10px 10px;
  font-size: 20px;
  height: 50px;
}

.bno {
  text-align: center;
  border: 1.3px solid gainsboro;
  font-size: 20px;
  height: 50px;
}

.date {
  border: 1.3px solid gainsboro;
}

.id {
  border: 1.3px solid gainsboro;
}

.cate {
  border: 1.3px solid gainsboro;
}
.contentname{
border: 1.3px solid gainsboro;
}

.content {
  text-align: center;
  border: 1.3px solid gainsboro;
  border-radius: 10px 10px 10px 10px;
}

textarea {
  width: 100%; /* change to 100% to fill the cell */
  height: 100%;
  resize: none;
  padding: none;
  border: 2px solid gainsboro; /* add this to remove border */
  border-radius: 10px 10px 10px 10px;
}

td, th {
  padding: 10px; /* add padding to cell */
}

	#button1{
	width: 140px;
	height: 65px;
	margin-left: 550px;
	background-color: rgb(47, 153, 244);
	border-radius: 10px 10px 10px 10px;
	box-shadow: 0px 3px 4px rgba(0, 0, 0, 0.2); 
	border: 1.3px solid rgb(47, 153, 244);
	font-size: 20px;
	font-weight: bold;
	text-align: center;
	color: white;
	}
	#button2{
	width: 140px;
	height: 65px;
	margin-left: 47px;
	background-color: rgb(47, 153, 244);
	border-radius: 10px 10px 10px 10px;
	box-shadow: 0px 3px 4px rgba(0, 0, 0, 0.2); 
	border: 1.3px solid rgb(47, 153, 244);
	font-size: 20px;
	font-weight: bold;
	color: white;
	text-align: center;
	}
	#button3{
	width: 140px;
	height: 65px;
	margin-left: 47px;
	background-color: rgb(204, 81, 81);
	border-radius: 10px 10px 10px 10px;
	box-shadow: 0px 3px 4px rgba(0, 0, 0, 0.2); 
	border: 1.5px solid black;
	font-size: 20px;
	font-weight: bold;
	color: white;
	margin-bottom: 50px;
	text-align: center;
    background-color: rgb(47, 153, 244);
    border: none;
    border-radius: 10px;
	}
	
	#button4{
	width: 140px;
	height: 65px;
	margin-left: 47px;
	background-color: rgb(204, 81, 81);
	border-radius: 10px 10px 10px 10px;
	box-shadow: 0px 3px 4px rgba(0, 0, 0, 0.2); 
	border: 1.5px solid black;
	font-size: 20px;
	font-weight: bold;
	color: white;
	margin-bottom: 50px;
	text-align: center;
    background-color: rgb(47, 153, 244);
    border: none;
    border-radius: 10px;
	}
	
	#postbno{
	border: 1.3px solid gainsboro;
	}
	
.deletemodal {
  position: fixed;
  z-index: 1;
  left: 0;
  top: 0;
  width: 100%;
  height: 100%;
  overflow: auto;
  background-color: rgba(0, 0, 0, 0.4); /* 반투명한 검은색 배경 */
}

.modal-content {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-30%, -30%);
  padding: 30px; /* 여백 추가 */
  background-color: #fff; /* 모달창 배경색 변경 */
  border-radius: 10px; /* 테두리를 둥글게 만들어줍니다. */
}
#pid{
 text-align: center;
 font-size: 25px;
 font-weight: bold;
}

#yesBtn{
  margin: 0 10px;
  background-color: #333; /* 버튼 배경색 변경 */
  color: #fff; /* 버튼 글자색 변경 */
  border: none; /* 버튼 테두리 제거 */
  padding: 10px 20px; /* 버튼 안쪽 여백 추가 */
  border-radius: 5px; /* 버튼 테두리를 둥글게 만들어줍니다. */
  width: 100px;
  height: 50px;
  font-size: 18px;
}

#noBtn{
  margin: 0 10px;
  background-color: #333; /* 버튼 배경색 변경 */
  color: #fff; /* 버튼 글자색 변경 */
  border: none; /* 버튼 테두리 제거 */
  padding: 10px 20px; /* 버튼 안쪽 여백 추가 */
  border-radius: 5px; /* 버튼 테두리를 둥글게 만들어줍니다. */
  width: 100px;
  height: 50px;
  font-size: 18px;
}

.reply-container {
  display: flex;
  flex-direction: column;
  margin-top: 20px;
  width: 800px;
  margin-left: 500px;
}

.reply-header {
  display: flex;
  justify-content: space-between;
  background-color: #f1f1f1;
  border-radius: 10px 10px 0 0;
  padding: 10px;
  font-weight: bold;
}

.reply-body {
  background-color: #ffffff;
  border: 1px solid #dddddd;
  border-top: none;
  border-radius: 0 0 10px 10px;
  padding: 20px;
  margin-bottom: 20px;
}

.reply-date {
  font-size: 15px;
  color: #999999;
}

.reply-content {
  font-size: 18px;
  line-height: 1.5;
}

.reply-actions{
 font-size: 17.5px;
}

.reply-id{
 font-size: 19px;
}

.replytext{
  width: 800px;
  margin-left: 500px;
  margin-top: 100px;
  margin-bottom: 200px;
  
}

.reply2{
border: 1px solid #dddddd;
  border-top: none;
  border-radius: 0 0 10px 10px;
}

.paging {
  position: absolute;
 right: 390px;
}
	

</style>
</head>
<body>

      <div class="managerheader">
         <h2 align="left" style="display:inline">강습 심사 게시판</h2>
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


	<form method="post" class="csdetailform">
	<table id="table">
		<th class="title" colspan="3">${menu.title}</th>
		

		<tr style="height: 32px;">
			<td class="bno">문의번호 ${menu.csbno}</td>
			<td class="date"><fmt:formatDate pattern="yyyy-MM-dd"
							value="${menu.csdate}" /></td>
			<td class="id">${menu.csid}</td>
		</tr>
		<tr style="height: 24px;">
			<td class="contentname" colspan="3">문의 내용</td>
		</tr>
		<tr>
			<td class="content" colspan="3"><textarea rows="10" cols="60" readonly>${menu.content}</textarea></td>
		</tr>
		<tr>
			<td class="postbno" colspan="2" id="postbno">강습 게시글 번호 ${menu.postbno}</td>
			<td calss="postpenalty">강습 벌점 누적 ${menu.postpenalty}</td>
		</tr>
	</table>

	
	<input type="button" id="button1" value="뒤로 가기" onclick="history.back()">
	<input type="hidden" value="${menu.postpenalty}">
	<input type="hidden" name="bno" value="${menu.postbno}">
	<input type="hidden" name="csbno" value="${menu.csbno }">
	<input type="button" id="button2" value="강습 벌점 부여" >
   	<input type="button" id="button3" value="강습 삭제" >
   	<input type="button" id="button4" value="문의 삭제" >
		<div id="myModal" class="deletemodal">
			<div class="modal-content">
				<p id="pid">삭제하시겠습니까?</p><br>
				<button id="yesBtn">예</button>
				<button id="noBtn">아니오</button>
			</div>
		</div>

	</form>
	
	
<%-- <ul>
	
		<li style="list-style:none;" class="reply1">
		<div>
		<div class="replyheader">[${reply.id}]님의 댓글 
			<div class="replydate"> 
				<fmt:formatDate pattern="yyyy-MM-dd" value="${reply.replayerdate }" />
			</div>
		</div>
							<br><br>
		<div>
		${reply.csreply}
		</div>	
		</li>
 	
</ul> --%>
	
<div class="reply">

<form class="replyremove" method="POST" >
<c:forEach var="reply" items="${reply}">
	<div class="reply-container">
	  <div class="reply-header">
	    <div class="reply-info">
	    
	      <span class="reply-id">[${reply.id}]님의 댓글 </span>&nbsp;
	      <span class="reply-date"><fmt:formatDate pattern="yyyy-MM-dd" value="${reply.replayerdate }" /></span>
	    </div>
	    <div class="reply-actions">
	       <input type="hidden" name="rno" value="${reply.rno}">
	       <input type="hidden" name="csbno" value="${reply.csbno}">
	       <a href="#" class="delete" onclick="deleteReply(this)">삭제</a>
	    </div>
	  </div>
	  <div class="reply-body">
	    <div class="reply-content">
	      ${reply.csreply}
	    </div>
	   
	  </div>
	</div>
</c:forEach>
 
 </form>
 
 			<div class='paging'>
					<ul class="pagination">
					       <c:if test="${pageMaker.prev}">
							<li class="paginate_button previous"><a
								href="${pageMaker.startPage -1}">Previous</a></li>
						</c:if>

						<c:forEach var="num" begin="${pageMaker.startPage}"
							end="${pageMaker.endPage}">
							<li class="paginate_button  ${pageMaker.cri.pageNum == num ? "active":""} ">
								<a href="${num}">${num}</a>
							</li>
						</c:forEach>

						<c:if test="${pageMaker.next}">
							<li class="paginate_button next"><a
								href="${pageMaker.endPage +1 }">Next</a></li>
						</c:if>
					</ul>
				</div>
				<!--  end Pagination -->
		
			<form id='actionForm' action="/manager/csdetail" method='get'>
				<input type="hidden" name="csbno" value="${menu.csbno }">
				<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
				<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
				<%-- <input type='hidden' name='type' value='<c:out value="${ pageMaker.cri2.type }"/>'> 
				<input type='hidden' name='keyword' value='<c:out value="${ pageMaker.cri2.keyword }"/>'> --%> 
			</form>
 
		<div class="replytext">
			<form method="post" id="csreply" class="reply2"
				
				style="border: 1px solid #ccc; padding: 20px; border-radius: 10px;">
				<p>
					<label for="reply-textarea"
						style="font-size: 17px; font-weight: bold; margin-bottom: 10px;">문의
						답변</label>
				</p>
				<p>
					<textarea id="reply-textarea" name="csreply" id="csreply"
						placeholder="답변을 입력해주세요"
						style="width: 100%; height: 200px; font-weight: bold; border: none; padding: 10px; border-radius: 4px; background-color: #f8f9fa;"></textarea>
				</p>
				<p style="text-align: right;">
					<input type="hidden" name="csbno" value="${menu.csbno}"> <input
						type="hidden" name="id" value="관리자">
					<input type="submit" id="reply" 
						style="background-color: rgb(47, 153, 244); font-weight: bold; color: #fff; border: none; padding: 10px 20px; border-radius: 4px; cursor: pointer;" value="댓글 작성">
				</p>
			</form>
		</div>
		

	    
				

	</div>

</body>
</html>

<script>

   document.addEventListener("DOMContentLoaded", function() {
	  var button3 = document.getElementById("button3");
	  var modal = document.getElementById("myModal");
	  var yesBtn = document.getElementById("yesBtn");
	  var noBtn = document.getElementById("noBtn");
	  var formObj = $(".csdetailform");
	  
	  yesBtn.onclick = function() {
	    // 예 버튼을 클릭하면 실행될 코드
	      modal.style.display = "none";
	      formObj.attr("action", "/manager/postdelete");
		  formObj.attr("method", "post");
		  formObj.submit();
	  }

	  noBtn.onclick = function() {
	    // 아니오 버튼을 클릭하면 실행될 코드
	    modal.style.display = "none";
	  }

	  window.onclick = function(event) {
	    if (event.target == modal) {
	      modal.style.display = "none";
	    }
	  }

	  // 모달창 숨기기
	  modal.style.display = "none";

	  // 클릭 이벤트에 대한 핸들러 함수 등록
	  button3.onclick = function() {
	    modal.style.display = "block";
	  };
	}); 
	
		
	
   var formObj = $(".csdetailform");
	
 	
	$("#button2").on("click", function(e){
		  
		  alert("해당 강습 게시물에 벌점이 추가되었습니다.");
		  formObj.attr("action", "/manager/postpenalty");
		  formObj.attr("method", "post");
		  formObj.submit();
	})
	
	
	var formObj = $(".csdetailform");
	
 	
	$("#button4").on("click", function(e){
		  
		  alert("문의 게시글이 삭제되었습니다.");
		  formObj.attr("action", "/manager/csdelete");
		  formObj.attr("method", "post");
		  formObj.submit();
	})
	
	var formreply = $(".reply2");


	$("#reply").on("click", function(e) {
		if (formreply.find('textarea[name="csreply"]').val().length == 0) {
			alert("댓글을 입력해주세요.");
			formreply.find('textarea[name="csreply"]').focus();
			
			return false;
		} else {
			formreply.attr("action", "/manager/csreply");
			formreply.attr("method", "post");
			formreply.submit();
		}
	});
	



	 var modalModBtn = $("#modalModBtn");
	 
	 modalModBtn.on("click", function(e) {
         var reply = {rno:modal.data("rno"), reply: modalInputReply.val()};
         service.replymodify(reply, function(result) {
             alert(result);
             modal.modal("hide");
             showList(1);
         });
     });
	 
	 
	 
	 // ---------------------------------------댓글---------------------------------------------

	 
	 
	 
	/* $(".delete").on("click", function(e){
		  
		  alert("댓글이 삭제되었습니다.");
		  formObj2.attr("action", "/manager/replyremove");
		  formObj2.attr("method", "post");
		  formObj2.submit();
	}) */
	
	 var formObj2 = $(".replyremove");
	 	 
	$(".delete").on("click", function(e){
		  e.preventDefault();
		  var rno = $(this).prevAll('input[name="rno"]').val();
		  var csbno = $(this).prevAll('input[name="csbno"]').val();
		  var formObj2 = $('<form/>', {action: '/manager/replyremove', method: 'post'});
		  $('<input>').attr({type: 'hidden', name: 'rno', value: rno}).appendTo(formObj2);
		  $('<input>').attr({type: 'hidden', name: 'csbno', value: csbno}).appendTo(formObj2);
		  formObj2.appendTo('body').submit();
		  alert("댓글이 삭제되었습니다.");
		});
		
		
	var actionForm = $("#actionForm");
	
	$(".paginate_button a").on("click",function(e){
		e.preventDefault();
		
		console.log("click");
		actionForm.find("input[name='pageNum']").val($(this).attr("href"));
		actionForm.submit();
	});
	



</script>


<%@ include file="../includes/footer.jsp"%>