	//get.jsp에서 이 js파일을 가져다가 사용
	console.log("Reply Module........");

	
	
//즉시 실행함수
var reviewService = (function(){
	
	//alert( "reviewService" );
	
	function getList(param, callback, error){ //전체 데이터 조회 
	
		var bno = param.bno;
		var page = param.page || 1;
		
		//alert(bno + page);
		
		$.getJSON("/review/pages/" + bno + "/" + page + ".json",
				function(data){
					if(callback){
						//callback(data);  //댓글 목록만 가져오는 경우
						callback(data.reviewCnt, data.rlist); //댓글 카운터와 목록 둘 다 가져오는 경우
						
						//console.log(data.reviewCnt, data.rlist);
					}
				}).fail(function(xhr, status, err){
					if(error){
						error();
					}
				});
	}	
	
	
	return {
		getList : getList
	};
	
	/*var abc = function(){
	alert("abc()")
	}
	return {
		f1 : abc
	}*/
	
	
	

	
	
	
})();	//replyService		
	

