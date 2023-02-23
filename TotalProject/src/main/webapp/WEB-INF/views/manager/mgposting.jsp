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

<%-- <script src="${path}/resources/js/manager.js"></script>
<link href="${path}/resources/css/manager.css?ver=5" rel="stylesheet"/>   --%>

<script src="${path}/resources/js/mgposting.js?var=3"></script>
<link href="${path}/resources/css/mgposting.css?ver=67" rel="stylesheet"/>  


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


	<div class="managerboard">
		<table class="table table-striped table-boardered table-hover">
	      <thead>
	        <tr class="boardheader">
	          <th id="managerbno">강습번호</th>
	          <th id="managertitle">제목</th>
	          <th id="mangercate">카데고리</th>
	          <th id="managerdate">날짜</th>
	          <th id="managerid">아이디</th>
	        </tr>
	      </thead>
	      <tbody class="boardbody">
	      	<c:forEach var="list" items="${mgpostingList}">
				<tr>
					<td><c:out value="${list.bno}" /></td>
					
					<td><a href='/manager/managerdetail?bno=<c:out value="${list.bno}"/>'><c:out value="${list.title}"/></a></td>
					<%-- <td><c:out value="${list.title}" /></td> --%>
					<td><c:out value="${list.categoryno}" /></td>
					<td><fmt:formatDate pattern="yyyy-MM-dd"
							value="${list.postdate}" /></td>
					<td><c:out value="${list.id}" /></td>
				</tr>
			   						
			</c:forEach>
			 </tbody>
	    </table>
	    
	    <div class='row'>
					<div class="col-lg-12">

						<form id='searchForm' action="/manager/mgposting" method='get'>
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
		
			<form id='actionForm' action="/manager/mgposting" method='get'>
				<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
				<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
				<%-- <input type='hidden' name='type' value='<c:out value="${ pageMaker.cri.type }"/>'> 
				<input type='hidden' name='keyword' value='<c:out value="${ pageMaker.cri.keyword }"/>'> --%> 
			</form>
							
	      		
	   
	      	
	      	<!-- bno title cate  postdate id  -->
	    <%--     <tr>
	          <td id="managerbno">MGPOSTINGDTO ${MgPostingDTO }</td><th id="managertitle">${page }</td><td id="managercate">카데고리5</td><td>날짜5</td><td id="managerid">eeeee</td>
	        </tr>
	        <tr>
	          <td id="managerbno">25163</td><th id="managertitle">제목4</td><td id="managercate">카데고리4</td><td>날짜4</td><td id="managerid">dd</td>
	        </tr>
	        <tr>
	          <td id="managerbno">25162</td><th id="managertitle">제목3</td><td id="managercate">카데고리3</td><td>날짜3</td><td id="managerid">cccc</td>
	        </tr>
	        <tr>
	          <td id="managerbno">25161</td><th id="managertitle">제목2</td><td id="managercate">카데고리2</td><td>날짜2</td><td id="managerid">bbb</td>
	        </tr>
	        <tr>
	          <td id="managerbno">25160</td><th id="managertitle">제목1</td><td id="managercate">카데고리1</td><td>날짜1</td><td id="managerid">aaaa</td>
	        </tr> --%>
	     
    </div>
     <p class ="footer_br">&nbsp;</p>

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