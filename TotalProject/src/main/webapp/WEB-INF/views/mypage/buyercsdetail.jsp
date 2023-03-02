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
	<!-- Bootstrap Core CSS -->
    <link href="/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="/resources/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- DataTables CSS -->
    <link href="/resources/vendor/datatables-plugins/dataTables.bootstrap.css" rel="stylesheet">

    <!-- DataTables Responsive CSS -->
    <link href="/resources/vendor/datatables-responsive/dataTables.responsive.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="/resources/dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="/resources/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <script src="https://kit.fontawesome.com/8eb5905426.js" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <link rel="stylesheet" href="../../resources/dist/css/buyermypage.css">
    <link rel="stylesheet" href="../../resources/dist/css/sellermypage.css">
<style>



#table {
  width: 770px;
  margin-left: 360px;
  margin-top: 150px; 
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

.csfooter{
margin-left: 540px;
margin-bottom: 100px;

}

#button1{
width: 150px;
height: 50px;
background-color: rgb(47, 153, 244);
border-radius: 10px 10px 10px 10px;
box-shadow: 0px 3px 4px rgba(0, 0, 0, 0.2); 
border: 1.3px solid rgb(47, 153, 244);
font-size: 23px;
font-weight: bold;
color: white;
}

#button2{
width: 150px;
height: 50px;
margin-left: 130px;
margin-bottom: 100px;
background-color: rgb(47, 153, 244);
border-radius: 10px 10px 10px 10px;
box-shadow: 0px 3px 4px rgba(0, 0, 0, 0.2); 
border: 1.3px solid rgb(47, 153, 244);
font-size: 23px;
font-weight: bold;
color: white;
}

.reply-container {
  display: flex;
  flex-direction: column;
  margin-top: 20px;
  width: 800px;
  margin-left: 350px;
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
  margin-left: 350px;
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
 right: 267px;
}

</style>
</head>
<body>

   <div class="container-fluid">
	<%@include file="../includes/buyermypageincl.jsp"%>
	<div class="table table-striped table-boardered table-hover">
		
			<table id="table">
				<th class="title" colspan="3">${menu.title}</th>
				<input type="hidden" name="csbno" value="${menu.csbno}"/>
		
				<tr style="height: 32px;">
					<td class="postbno">강습번호 ${menu.postbno}</td>
					<td class="date"><fmt:formatDate pattern="yyyy-MM-dd"
									value="${menu.csdate}" /></td>
					<td class="id">${menu.csid}</td>
				</tr>
				<tr style="height: 24px;">
					<td class="contentname" colspan="3">문의 내용</td>
				</tr>
				<tr>
					<td class="content" colspan="3"><textarea rows="10" cols="60">${menu.content}</textarea></td>
				</tr>
				
			</table>
			<div class="csfooter">
			<button id="button1" onclick="history.back()">수정하기</button>
			<button id="button2" onclick="history.back()">목록가기</button>
			</div>
	
	</div>
	
	<div class='bigPictureWrapper'>
  <div class='bigPicture'>
  </div>
</div>
	



      
     <!-- ----------------------------- 댓글 부분---------------------------------- -->

		
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
		
			<form id='actionForm' action="/mypage/buyercsdetail" method='get'>
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
						style="font-size: 17px; font-weight: bold; margin-bottom: 10px;">문의 댓글</label>
				</p>
				<p>
					<textarea id="reply-textarea" name="csreply" id="csreply"
						placeholder="댓글을 입력해주세요"
						style="width: 100%; height: 200px; font-weight: bold; border: none; padding: 10px; border-radius: 4px; background-color: #f8f9fa;"></textarea>
				</p>
				<p style="text-align: right;">
					<input type="hidden" name="csbno" value="${menu.csbno}"> 
					<input type="hidden" name="id" value="${menu.csid}">
					<input type="submit" id="reply" 
						style="background-color: rgb(47, 153, 244); font-weight: bold; color: #fff; border: none; padding: 10px 20px; border-radius: 4px; cursor: pointer;" value="댓글 작성">
				</p>
			</form>
		</div>
		<!-- ----------------------------- 댓글 부분---------------------------------- -->

    
</body>
</html>

<script type="text/javascript" src="../resources/js/reply.js"></script>

<script>

$(document).ready(function () {
  
  var bnoValue = '<c:out value="${cs_board.csbno}"/>';
  var replyUL = $(".chat");
  
    showList(1);
    
    function showList(page){
       
       console.log("show list " + page);
        
        replyService.getList({csbno:bnoValue,page: page|| 1 }, function(replyCnt, list) {
          
        console.log("replyCnt: "+ replyCnt );
        console.log("list: " + list);
        console.log(list);
        
        if(page == -1){
          pageNum = Math.ceil(replyCnt/10.0);
          showList(pageNum);
          return;
        }
          
         var str="";
         
         if(list == null || list.length == 0){
           return;
         }
         
         for (var i = 0, len = list.length || 0; i < len; i++) {
           str +="<li class='left clearfix' data-rno='"+list[i].rno+"'>";
           str +="  <div><div class='header'><strong class='primary-font'>["
              +list[i].rno+"] "+list[i].replyer+"</strong>"; 
           str +="    <small class='pull-right text-muted'>"
               +replyService.displayTime(list[i].replyDate)+"</small></div>";
           str +="    <p>"+list[i].reply+"</p></div></li>";
         }
         
         replyUL.html(str);
         
         showReplyPage(replyCnt);

     
       });//end function
         
     }//end showList
    
    var pageNum = 1;
    var replyPageFooter = $(".panel-footer");
    
    function showReplyPage(replyCnt){
      
      var endNum = Math.ceil(pageNum / 10.0) * 10;  
      var startNum = endNum - 9; 
      
      var prev = startNum != 1;
      var next = false;
      
      if(endNum * 10 >= replyCnt){
        endNum = Math.ceil(replyCnt/10.0);
      }
      
      if(endNum * 10 < replyCnt){
        next = true;
      }
      
      var str = "<ul class='pagination pull-right'>";
      
      if(prev){
        str+= "<li class='page-item'><a class='page-link' href='"+(startNum -1)+"'>Previous</a></li>";
      }
      
       
      
      for(var i = startNum ; i <= endNum; i++){
        
        var active = pageNum == i? "active":"";
        
        str+= "<li class='page-item "+active+" '><a class='page-link' href='"+i+"'>"+i+"</a></li>";
      }
      
      }
      
      str += "</ul></div>";
      
      console.log(str);
      
      replyPageFooter.html(str);
    
     
    replyPageFooter.on("click","li a", function(e){
        e.preventDefault();
        console.log("page click");
        
        var targetPageNum = $(this).attr("href");
        
        console.log("targetPageNum: " + targetPageNum);
        
        pageNum = targetPageNum;
        
        showList(pageNum);
      });     

    
     function showList(page){
      
      replyService.getList({bno:bnoValue,page: page|| 1 }, function(list) {
        
        var str="";
       if(list == null || list.length == 0){
        
        replyUL.html("");
        
        return;
      }
       for (var i = 0, len = list.length || 0; i < len; i++) {
           str +="<li class='left clearfix' data-rno='"+list[i].rno+"'>";
           str +="  <div><div class='header'><strong class='primary-font'>"+list[i].replyer+"</strong>"; 
           str +="    <small class='pull-right text-muted'>"+replyService.displayTime(list[i].replyDate)+"</small></div>";
           str +="    <p>"+list[i].reply+"</p></div></li>";
         }


    replyUL.html(str);

      });//end function
      
   }//end showList 
   
    var modal = $(".modal");
    var modalInputReply = modal.find("input[name='reply']");
    var modalInputReplyer = modal.find("input[name='replyer']");
    var modalInputReplyDate = modal.find("input[name='replyDate']");
    
    var modalModBtn = $("#modalModBtn");
    var modalRemoveBtn = $("#modalRemoveBtn");
    var modalRegisterBtn = $("#modalRegisterBtn");
    
    $("#modalCloseBtn").on("click", function(e){
       
       modal.modal('hide');
    });
    
    $("#addReplyBtn").on("click", function(e){
      
      modal.find("input").val("");
      modalInputReplyDate.closest("div").hide();
      modal.find("button[id !='modalCloseBtn']").hide();
      
      modalRegisterBtn.show();
      
      $(".modal").modal("show");
      
    });
    

    modalRegisterBtn.on("click",function(e){
      
      var reply = {
            reply: modalInputReply.val(),
            replyer:modalInputReplyer.val(),
            csbno:csbnoValue
          };
      replyService.add(reply, function(result){
        
        alert(result);
        
        modal.find("input").val("");
        modal.modal("hide");
        
        //showList(1);
        showList(-1);
        
      });
      
    });


  //댓글 조회 클릭 이벤트 처리 
    $(".chat").on("click", "li", function(e){
      
      var rno = $(this).data("rno");
      
      replyService.get(rno, function(reply){
      
        modalInputReply.val(reply.reply);
        modalInputReplyer.val(reply.replyer);
        modalInputReplyDate.val(replyService.displayTime( reply.replyDate))
        .attr("readonly","readonly");
        modal.data("rno", reply.rno);
        
        modal.find("button[id !='modalCloseBtn']").hide();
        modalModBtn.show();
        modalRemoveBtn.show();
        
        $(".modal").modal("show");
            
      });
    });
  
    
     modalModBtn.on("click", function(e){
      
      var reply = {rno:modal.data("rno"), reply: modalInputReply.val()};
      
      replyService.update(reply, function(result){
            
        alert(result);
        modal.modal("hide");
        showList(1);
        
      });
      
    });

    modalRemoveBtn.on("click", function (e){
         
       var rno = modal.data("rno");
       
       replyService.remove(rno, function(result){
             
           alert(result);
           modal.modal("hide");
           showList(1);
           
       });
       
     }); 

    modalModBtn.on("click", function(e){
         
        var reply = {rno:modal.data("rno"), reply: modalInputReply.val()};
        
        replyService.update(reply, function(result){
              
          alert(result);
          modal.modal("hide");
          showList(pageNum);
          
        });
        
      });


      modalRemoveBtn.on("click", function (e){
        
        var rno = modal.data("rno");
        
        replyService.remove(rno, function(result){
              
            alert(result);
            modal.modal("hide");
            showList(pageNum);
            
        });
        
      });

 
});




var formreply = $(".reply2");


$("#reply").on("click", function(e) {
	if (formreply.find('textarea[name="csreply"]').val().length == 0) {
		alert("댓글을 입력해주세요.");
		formreply.find('textarea[name="csreply"]').focus();
		
		return false;
	} else {
		formreply.attr("action", "/mypage/csreply");
		formreply.attr("method", "post");
		formreply.submit();
	}
});

</script>



<script>

/* console.log("===============");
console.log("JS TEST");

var bnoValue = '<c:out value="${board.bno}"/>'; */

//for replyService add test
/* replyService.add(
    
    {reply:"JS Test", replyer:"tester", bno:bnoValue}
    ,
    function(result){ 
      alert("RESULT: " + result);
    }
); */


//reply List Test
/* replyService.getList({bno:bnoValue, page:1}, function(list){
    
     for(var i = 0,  len = list.length||0; i < len; i++ ){
       console.log(list[i]);
     }
});
 */

 
/*  //17번 댓글 삭제 테스트 
 replyService.remove(17, function(count) {

   console.log(count);

   if (count === "success") {
     alert("REMOVED");
   }
 }, function(err) {
   alert('ERROR...');
 });
 */
 

//12번 댓글 수정 
/* replyService.update({
  rno : 12,
  bno : bnoValue,
  reply : "Modified Reply...."
}, function(result) {

  alert("수정 완료...");

});  
 */

</script>  


<script type="text/javascript">
$(document).ready(function() {
  
  var operForm = $("#operForm"); 
  
  $("button[data-oper='modify']").on("click", function(e){
    
    operForm.attr("action","/board/modify").submit();
    
  });
  
    
  $("button[data-oper='list']").on("click", function(e){
    
    operForm.find("#bno").remove();
    operForm.attr("action","/board/list")
    operForm.submit();
    
  });  
});
</script>


<script>


$(document).ready(function(){
  
  (function(){
  
    var bno = '<c:out value="${board.bno}"/>';
    
    /* $.getJSON("/board/getAttachList", {bno: bno}, function(arr){
    
      console.log(arr);
      
      
    }); *///end getjson
    $.getJSON("/board/getAttachList", {bno: bno}, function(arr){
        
       console.log(arr);
       
       var str = "";
       
       $(arr).each(function(i, attach){
       
         //image type
         if(attach.fileType){
           var fileCallPath =  encodeURIComponent( attach.uploadPath+ "/s_"+attach.uuid +"_"+attach.fileName);
           
           str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"' ><div>";
           str += "<img src='/display?fileName="+fileCallPath+"'>";
           str += "</div>";
           str +"</li>";
         }else{
             
           str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"' ><div>";
           str += "<span> "+ attach.fileName+"</span><br/>";
           str += "<img src='/resources/img/attach.png'></a>";
           str += "</div>";
           str +"</li>";
         }
       });
       
       $(".uploadResult ul").html(str);
       
       
     });//end getjson

    
  })();//end function
  
  $(".uploadResult").on("click","li", function(e){
      
    console.log("view image");
    
    var liObj = $(this);
    
    var path = encodeURIComponent(liObj.data("path")+"/" + liObj.data("uuid")+"_" + liObj.data("filename"));
    
    if(liObj.data("type")){
      showImage(path.replace(new RegExp(/\\/g),"/"));
    }else {
      //download 
      self.location ="/download?fileName="+path
    }
    
    
  });
  


  $(".bigPictureWrapper").on("click", function(e){
    $(".bigPicture").animate({width:'0%', height: '0%'}, 1000);
    setTimeout(function(){
      $('.bigPictureWrapper').hide();
    }, 1000);
  });

  
});


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