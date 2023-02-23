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
</head>

<body>

	<div class="container-fluid">

        <!-- sellermypage -->
        <%@include file="../includes/sellermypageincl.jsp"%>
            <div class="col-md-9">
                <div class="row">
                    <br>
                    <b style="font-size: 18px;">수강자 목록</b>
                </div>
                <br><br>
                <div class="row" style="padding-bottom:200px">
	                <table class="table table-hover">
	                	<tr>
			                <td>게시물 번호</td>
			                <td>게시물 제목</td>
			                <td>수강신청자</td>
			                <td>수락</td>
			                <td>거절</td>
			                <td>게시물 바로가기</td>
			            </tr>
			                <c:forEach var="app" items="${lista}" varStatus="status" >
								<!-- 게시글  -->
								<div class="p_article" onclick="" style="font-size: 15px;"
									class='uploadREsult' style="float:left;">
									<div class="col-md-6">
										<div class="col-md-6">
											<tr>
								                <td><c:out value="${app.bno}" /></td>
								                <td><c:out value="${app.title}" /></td>
								                <td><c:out value="${app.id}" /></td>
								                <form action="/mypage/buyergrant" method="post">
								                	<td>
										                <input type="hidden" name="id" value="${app.id}"/>
										                <input type="hidden" name="bno" value="${app.bno}"/>
										                <input type="submit" value="수락" onclick="alert('수락하였습니다')"/>
									                </td>
								                </form>
								                <form action="/mypage/buyercancel" method="post">
									                <td>
									                	<input type="hidden" name="id" value="${app.id}"/>
										                <input type="hidden" name="bno" value="${app.bno}"/>
									                	<input type="submit" value="거절" onclick="alert('거절하였습니다')"/>
									                </td>
								                </form>
								                <td><a class="p_board" href="/board/detail?bno=<c:out value ='${app.bno}'/>">바로가기</a><td>
								            </tr>
										</div>
									</div>
								</div>
							</c:forEach>
					</table>
                </div>
                <!-- <div class="row">
	                <table class="table table-hover">
			            <br>
			            <tr>
			                <td>번 호</td>
			                <td>게시물</td>
			                <td>수강신청자</td>
			                <td>수락</td>
			                <td>거절</td>
			            </tr>
			            <tr>
			                <td>1</td>
			                <td>it 초보자를 위한 강의 계획</td>
			                <td>jhlee9710</td>
			                <td><input type="submit" value="수락" onclick="alert('수락하였습니다')"/></td>
			                <td><input type="submit" value="거절" onclick="alert('거절하였습니다')"/></td>
			            </tr>
			            <tr>
			                <td>2</td>
			                <td>초보 웹디자이너를 위한 css</td>
			                <td>homepls</td>
			                <td><input type="submit" value="수락" onclick="alert('수락하였습니다')"/></td>
			                <td><input type="submit" value="거절" onclick="alert('거절하였습니다')"/></td>
			            </tr>
			            <tr>
			                <td>3</td>
			                <td>nord.js의 기초</td>
			                <td>wanthome</td>
			                <td><input type="submit" value="수락" onclick="alert('수락하였습니다')"/></td>
			                <td><input type="submit" value="거절" onclick="alert('거절하였습니다')"/></td>
			            </tr>
			        </table>
                </div> -->
            </div>
        </div>
</body>
</html>

<%@include file="../includes/footer.jsp"%>
