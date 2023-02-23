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
    
<style>
.managerboard{
	width: 850px;
	padding: 30px;
	background-color: #fafafa;
	margin-top: 5px; 
	margin-bottom: 80px;
	margin-left: 360px;
	border-radius: 15px;
}

 table{
	border-collapse : collapse;
	text-align: center;
	margin-bottom: 500px;
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
  width: 1300px;
  text-align: center;
  padding-bottom: 15px;
 }

 #mangercate{
	width: 150px;
	text-align: center;
	padding-bottom: 15px;
 }
 
 #managerdate{
 width: 220px;
	text-align: center;
	padding-bottom: 15px;
 }
 
 #managerid{
 	width: 220px;
 	text-align: center;
 	padding-bottom: 15px;
 }
  #regipost{
  background-color: rgb(70,70,70); /* 버튼 배경색 변경 */
  margin-left:75px;
  color: #fff; /* 버튼 글자색 변경 */
  border: none; /* 버튼 테두리 제거 */
  box-shadow: 0px 3px 4px rgba(0, 0, 0, 0.2); 
  font-weight: bold;
  border-radius: 10px; /* 버튼 테두리를 둥글게 만들어줍니다. */
  width: 140px;
  height: 45px;
  font-size: 18px;
 }
 
</style>
</head>

<body>
    
        <div class="container-fluid">
	<%@include file="../includes/buyermypageincl.jsp"%>
	<button type="button" id="regipost" onclick="location.href='/mypage/buyercsregister?id=${member_s.id}';">문의 글쓰기</button> 
	<div class="managerboard">
	<table class="table table-striped table-boardered table-hover">
	      <thead>
	        <tr class="boardheader">
	          <th id="managerbno">문의번호</th>
	          <th id="managertitle">제목</th>
	          <th id="mangercate">강습번호</th>
	          <th id="managerdate">날짜</th>
	          <th id="managerid">아이디</th>
	        </tr>
	      </thead>
	      <tbody class="boardbody">
	      	<c:forEach var="list" items="${list}">
				<tr>
					<td><c:out value="${list.csbno}" /></td>
					
					<td><a href='/mypage/buyercsdetail?bno=<c:out value="${list.csbno}"/>'><c:out value="${list.title}"/></a></td>
					<%-- <td><c:out value="${list.title}" /></td> --%>
					<td><c:out value="${list.postbno}" /></td>
					<td><fmt:formatDate pattern="yyyy-MM-dd"
							value="${list.csdate}" /></td>
					<td><c:out value="${list.csid}" /></td>
				</tr>
			   						
			</c:forEach>
			 </tbody>
	    </table>
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
		
		<%-- 	<form id='actionForm' action="/mypage/buyercs" method='get'>
				<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
				<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
				<input type='hidden' name='type' value='<c:out value="${ pageMaker.cri.type }"/>'> 
				<input type='hidden' name='keyword' value='<c:out value="${ pageMaker.cri.keyword }"/>'> 
				<input type='text' name='id' value='<c:out value="${ pageMaker.cri.id}"/>'>
			</form>  --%>
	
	</div>
	
	
	
       
        
        

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


<%@ include file="../includes/footer.jsp"%>