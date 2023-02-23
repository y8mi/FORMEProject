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
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>

#table {
  width: 770px;
  margin-left: 360px;
  margin-top: 110px; 
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


.postbno{
  text-align: center;
  border: 1.3px solid gainsboro;
  font-size: 20px;
  height: 50px;
  padding: 10px;
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
text-align: center;
}

.content {
  text-align: center;
  border: 1.3px solid gainsboro;
  border-radius: 10px 10px 10px 10px;
  border: 1.3px solid gainsboro;
}

textarea {
  width: 100%; /* change to 100% to fill the cell */
  height: 100%;
  resize: none;
  padding: none;
  border: none; /* add this to remove border */
}

td, th {
  padding: 10px; /* add padding to cell */
}
#button1{
	width: 125px;
	height: 55px;
	margin-left: 40px;
	background-color: rgb(47, 153, 244);
	border-radius: 10px 10px 10px 10px;
	box-shadow: 0px 3px 4px rgba(0, 0, 0, 0.2); 
	border: 1.3px solid rgb(47, 153, 244);
	font-size: 22px;
	font-weight: bold;
	text-align: center;
	color: white;
}

#button2{
	width: 125px;
	height: 55px;
	margin-left: 40px;
	background-color: rgb(47, 153, 244);
	border-radius: 10px 10px 10px 10px;
	box-shadow: 0px 3px 4px rgba(0, 0, 0, 0.2); 
	border: 1.3px solid rgb(47, 153, 244);
	font-size: 22px;
	font-weight: bold;
	text-align: center;
	color: white;
}

#button3{
	width: 125px;
	height: 55px;
	margin-left: 220px;
	background-color: rgb(47, 153, 244);
	border-radius: 10px 10px 10px 10px;
	box-shadow: 0px 3px 4px rgba(0, 0, 0, 0.2); 
	border: 1.3px solid rgb(47, 153, 244);
	font-size: 22px;
	font-weight: bold;
	text-align: center;
	color: white;
}


</style>
</head>
<body>

	<div class="container-fluid">
		<%@include file="../includes/buyermypageincl.jsp"%>
		<div class="table table-striped table-boardered table-hover">
		
			<form action="/mypage/csregisterForm" name="regiform" id="regiform" method="post" >
				<table id="table">
					<th class="title" colspan="2"><input type="text" name="title" style="width:100%; border: 0;" placeholder="제목"/></th>
					
					<tr style="height: 32px;">
						<td class="postbno"><input type="text" name="postbno" placeholder="강습 게시글 번호를 입력하세요." style="font-size:17px; width:100%; border: 0;"/></td>
						<td class="id"><input type="text" name="csid" style="width:100%; border: 0;" value="${member_s.id}" readonly></td>
					</tr>
					<tr style="height: 24px;">
						<td class="contentname" colspan="3">문의 내용</td>
					</tr>
					<tr>
						<td class="content" colspan="3"><textarea rows="10" cols="60" name="content" placeholder="문의 내용을 입력하세요."></textarea></td>
						
					</tr>
				</table>
			
			<div class="csfooter">
			<!-- <input type="hidden" name="csbno"> <input type="hidden" name="csdate"> -->
			<input type="button" id="button3" value="뒤로 가기" onclick="history.back()"/>
			<input type="reset" id="button1" value="지우기"/>
			<input type="submit" id="button2" value="작성완료" class="submit">
			</div>
			</form>
	
	</div>

</body>
</html>

<script type="text/javascript">


	$(".submit").on("click", function(e){
		  
	
		if (isNaN(regiform.postbno.value)) {
			  alert("게시글 번호는 숫자만 입력 가능합니다.");
			  regiform.postbno.focus();
			  return false;
		}
		else if (regiform.title.value.length == 0){
			alert("제목을 입력하세요.");
			regiform.title.focus();
			return false;
		}
		else if (regiform.content.value.length == 0){
			alert("문의 내용을 입력하세요.");
			regiform.content.focus();
			return false;
		}else if (regiform.postbno.value.length == 0) {
			 regiform.postbno.value = 0;
	    }
	    else {
	        alert("문의 완료");
	        regiform.attr("action", "/mypage/csregisterForm");
	        regiform.attr("method", "post");
	        regiform.submit();
	    }
	})

		
		
</script>