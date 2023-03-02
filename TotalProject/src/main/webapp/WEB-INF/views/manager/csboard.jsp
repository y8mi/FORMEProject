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

<style>

@charset "UTF-8";

.managerboard{
	width: 1000px;
	padding: 30px;
	background-color: #fafafa;
	margin-top: 50px; 
	margin-bottom: 380px;
	margin-left: 400px;
	border-radius: 15px;
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



</style>

</head>
<body>

 <div class="managerheader">
         <h2 align="left" style="display:inline">고객 문의</h2>
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
      
      <div class="managerboard">
		<table class="table table-striped table-boardered table-hover">
	      <thead>
	        <tr class="boardheader">
	          <th id="managerbno">문의번호</th>
	          <th id="managertitle">제목</th>
	         <!--  <th id="mangercate">카데고리</th> -->
	          <th id="managerdate">날짜</th>
	          <th id="managerid">아이디</th>
	        </tr>
	      </thead>
	      <tbody class="boardbody">
	      	<c:forEach var="list" items="${getcs}">
				<tr>
					<td><c:out value="${list.csbno}" /></td>
					
					<td><a href='/manager/csdetail?csbno=<c:out value="${list.csbno}"/>'><c:out value="${list.title}"/></a></td>
					<%-- <td><c:out value="${list.title}" /></td> --%>
					<td><fmt:formatDate pattern="yyyy-MM-dd"
							value="${list.csdate}" /></td>
					<td><c:out value="${list.csid}" /></td>
				</tr>
			   						
			</c:forEach>
			 </tbody>
	    </table>
	    
	    <div class='row'>
					<div class="col-lg-12">

						<form id='searchForm' action="/manager/csboard" method='get'>
							<select name='type'>
								<option value="T"
									<c:out value="${pageMaker.cri.type eq 'T'?'selected':''}"/>>제목</option>
								<option value="C"
									<c:out value="${pageMaker.cri.type eq 'C'?'selected':''}"/>>내용</option>
								<option value="W"
									<c:out value="${pageMaker.cri.type eq 'W'?'selected':''}"/>>작성자</option>
								<option value="TC"
									<c:out value="${pageMaker.cri.type eq 'TC'?'selected':''}"/>>제목
									or 내용</option>
								<option value="TW"
									<c:out value="${pageMaker.cri.type eq 'TW'?'selected':''}"/>>제목
									or 작성자</option>
								<option value="TWC"
									<c:out value="${pageMaker.cri.type eq 'TWC'?'selected':''}"/>>제목
									or 내용 or 작성자</option>
							</select> <input type='text' name='keyword'  placeholder="검색어를 입력하세요."
								value='<c:out value="${pageMaker.cri.keyword}"/>' /> <input
								type='hidden' name='pageNum'
								value='<c:out value="${pageMaker.cri.pageNum}"/>' /> <input
								type='hidden' name='amount'
								value='<c:out value="${pageMaker.cri.amount}"/>' />
							<button class='btn btn-default'>검색</button>
						</form>
					</div>
				</div>
	    
				<div class='pull-right'>
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
		
			<form id='actionForm' action="/manager/csboard" method='get'>
				<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
				<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
				<%-- <input type='hidden' name='type' value='<c:out value="${ pageMaker.cri2.type }"/>'> 
				<input type='hidden' name='keyword' value='<c:out value="${ pageMaker.cri2.keyword }"/>'> --%> 
			</form>

</body>
</html>

<script>

$(function(){

	var actionForm = $("#actionForm");
	
	$(".paginate_button a").on("click",function(e){
		e.preventDefault();
		
		console.log("click");
		actionForm.find("input[name='pageNum']").val($(this).attr("href"));
		actionForm.submit();
	});
	
	var searchForm = $("#searchForm");
	
	$("#searchForm button").on("click",function(e){
		if(!searchForm.find("option:selected").val()){
			alert("검색종류를 선택하세요");
			return false;
		}
		
		if(!searchForm.find("input[name='keyword']").val()){
			alert("키워드를 입력하세요");
			return false;
		}
		
		searchForm.find("input[name='pageNum']").val("1");
		e.preventDefault();

		searchForm.submit();
	});
	
});

</script>

<%@include file="../includes/footer.jsp"%> 