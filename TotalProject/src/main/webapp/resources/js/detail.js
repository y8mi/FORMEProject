   $(document).ready(function(){
	   
	   //카테고리 num 받아서 html변경
	   var categorynumber = document.getElementById("categorynumber").value;
	   var categoryname = document.getElementById("categoryname");
	   
//	   alert(categorynumber);

//	   categoryname.innerHTML(caseInSwitch(categorynumber));
	   
	   var category = caseInSwitch(categorynumber);
	   categoryname.innerHTML = '&nbsp;'+(category);
	   
	   function caseInSwitch(categorynumber) {
		   var answer = "";
		   switch(categorynumber){
		     case '1': 
		       answer = "스포츠/레저";
		       break; 
		     case '2':
		       answer = "언어/교육";
		       break;
		     case '3':
		       answer = "문화/예술"; 
		       break;
		     case '4':
		       answer = "요리/음료"; 
		       break; 
		     case '5':
			   answer = "핸드메이드";
			   break; 
		     case '6':
			   answer = "기타"; 
		       break; 
		   }
		   return answer;
		 }
	   
       
       
       //삭제하기 누를 때, 모달
       $(".btn-remove").click(function(){
       	
       
    		 const modal_removecheck = document.getElementById("modal_removecheck");
    		 const modal_remove = document.getElementById("modal_remove");
 	    	 var closeBtn = modal_remove.querySelector(".close-area");
 	    	 var body = document.getElementsByTagName('body')[0];
     	   
 	    	  modal_removecheck.style.display = "flex"; 
 	    	  body.classList.add('scrollLock');
     	       
 	    	  //확인 누르면 닫힘
			  $("#close").click(function(){
				  modal_removecheck.style.display = "none";
				  body.classList.remove('scrollLock');			  
			  });
		     //삭제확인모달 
			  $("#reremove").click(function(){
				  bno = document.getElementById("bno").value;
				  link = '/board/remove?bno='+bno;
				  modal_removecheck.style.display = "none";
				  modal_remove.style.display = "flex"; 
				
     	 	     closeBtn.addEventListener("click", e => {
     	 	    	modal_remove.style.display = "none"
     	 	    	body.classList.remove('scrollLock');	
     	 	    	   	 	     
     	 	    	location.href=link;
     	 	   	});
			  });
       });
	   /*수정하기 버튼 보이게 */
	   var id = document.getElementById("sessionId").value;
	   var vo_id = document.getElementById("vo_id").value;

	   
	   if(id == vo_id){
		   $("#modifybtn").show();
		   $("#removebtn").show();
	   }
	   
	   else{ 
		   $("#removebtn").hide();
		   $("#modifybtn").hide();
	   } 
	   
 	   
	    
        /*웹페이지 열었을 때 하트표시*/
	   
	   
	   //CART DB에 있는 id들 가져와서 list..(bno는 이미 해당글이라 상관X)
	   var len = $('.cart_id').length; //cart_id란 클래스 개수 세기 ok
	   let cart_arr = [];
	   for(var i=0; i<len; i++){

	
		   var name = document.getElementsByClassName("cart_id")[i].value;

		   cart_arr.push(name);
//		   alert(cart_arr);//ok..
	   }
	   
	   var result = cart_arr.indexOf(id);
	   
//	   alert(result); //있으면 0/1왔다갔다;;;, 없으면 -1
	   
	   
	   	if(result == -1 ){
	        $("#heart1").show();
	        $("#heart2").hide();
	   	}else{
	        $("#heart1").hide();
	        $("#heart2").show();
	   		
	   	}


        /*버튼 누르면 하트 채워짐 (왔다갔다 ㅇ)*/

        $(".btn-1").click(function(){
        	
        	var id = document.getElementById("sessionId").value;
  	    	var closeBtn = modal.querySelector(".close-area");
  	    	var body = document.getElementsByTagName('body')[0];
      	   
      	   if(id == ""){ 
      	       modal.style.display = "flex"; 	
      	       
      	   
      	       body.classList.add('scrollLock');
   		   
      	 	   	closeBtn.addEventListener("click", e => {
      	 	     	modal.style.display = "none"
      	 	  		body.classList.remove('scrollLock');
      	 	   	});
      	
      	   }else{  //id있고 위시리시트에 없는게 확인되면 위시리스트에 담기 + 모달창
      		 const modal_wish = document.getElementById("modal_wish");
      		 const modal_wishremove = document.getElementById("modal_wishremove");
      		 var link = "http://localhost:8081/mypage/wishlist?id="+id;
      		 
      		 if(result == -1){
      			 
      			 //DB에 담기
			  	  var bno = document.getElementById("bno").value;
		          var id = document.getElementById("sessionId").value;

			      var data = {
			            wish : bno,
			            id : id
			      }
			     
      			  $.ajax({
      		        url : "/board/wishinsert",
      		        type : "POST",
      		        data : JSON.stringify(data),
      		        //dataType: 'JSON',
      		        contentType: 'application/json; charset=utf-8',
      		        success : function(request) {
      		                alert("success!")
      		                
      		            }
      		        });  //ajax
      			 modal_wish.style.display = "flex"; 	
          	     body.classList.add('scrollLock');

				  //확인 누르면 닫힘
				  $("#modal_wishappclose").click(function(){
					  modal_wish.style.display = "none"
					  body.classList.remove('scrollLock');			  
				  });
			     //마이페이지로 이동 누르면 page이동
				  $("#modal_wishmypage").click(function(){
					  modal_wish.style.display = "none"
					  body.classList.remove('scrollLock');
					  location.href=link;
						
				  });
	     
                 $("#heart1").hide();
                 $("#heart2").show();   
                 
             }else{//id있고 위시리스트에 있는거면 위시리스트에서 제거
            	 
            	 //DB에 담기
			  	  var bno = document.getElementById("bno").value;
		          var id = document.getElementById("sessionId").value;

			      var data = {
			            wish : bno,
			            id : id
			      }
			     
     			  $.ajax({
     		        url : "/board/wishremove",
     		        type : "POST",
     		        data : JSON.stringify(data),
     		        //dataType: 'JSON',
     		        contentType: 'application/json; charset=utf-8',
     		        success : function(request) {
     		                alert("success!")
     		                
     		            }
     		        });  //ajax
            	 
            	 modal_wishremove.style.display = "flex"; 	
          	     body.classList.add('scrollLock');

				  //확인 누르면 닫힘
				  $("#modal_removeappclose").click(function(){
					  modal_wishremove.style.display = "none"
					  body.classList.remove('scrollLock');			  
				  });
			     //마이페이지로 이동 누르면 page이동
				  $("#modal_removemypage").click(function(){
					  modal_wishremove.style.display = "none"
					  body.classList.remove('scrollLock');
					  location.href=link;
						
				  });
            	 
                 $("#heart1").show();
                 $("#heart2").hide();    
             }//하트체크 if문
      		   
      		   
      	   }//아이디체크 if문
            
        }); //하트 채워짐
        
        $('.btns').click(function(e)
        		{
        			e.preventDefault();   
        		});

        //버튼 클릭 시, 스크롤 이동 막기
       
      	
        //map api
        var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
        mapOption = {
            center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
            level: 3 // 지도의 확대 레벨
        };  

    // 지도를 생성합니다    
    var map = new kakao.maps.Map(mapContainer, mapOption); 

    // 주소-좌표 변환 객체를 생성합니다
    var geocoder = new kakao.maps.services.Geocoder();

    //주소를 가져옵니다.
    var address = document.getElementById("map_address").value;
    // 주소로 좌표를 검색합니다
    geocoder.addressSearch(address, function(result, status) {

        // 정상적으로 검색이 완료됐으면 
         if (status === kakao.maps.services.Status.OK) {

            var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

            // 결과값으로 받은 위치를 마커로 표시합니다
            var marker = new kakao.maps.Marker({
                map: map,
                position: coords
            });

            // 인포윈도우로 장소에 대한 설명을 표시합니다
            var infowindow = new kakao.maps.InfoWindow({
                content: '<div style="width:150px;text-align:center;padding:6px 0;">강습 장소</div>'
            });
            infowindow.open(map, marker);

            // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
            map.setCenter(coords);
        } 
    });  // map api
    
 });
    //===============modal 관련 기능 모음 =================
    
    
    function id_check() {
 	   
 	   /* 모달 관련 */
 	   
 	   const modal = document.getElementById("modal")
 	   const class_modal = document.getElementById("class_modal")
 	   const modal_apply = document.getElementById("modal_apply")
 	   const modal_self = document.getElementById("modal_self")
 	   
 	   
 	   //로그인 안되어있을 때, 누모달 버튼 누르면 창 나오게
 	   var id = document.getElementById("sessionId").value;
	   var vo_id = document.getElementById("vo_id").value;

  	   
 	   if(id == ""){ 
 	       modal.style.display = "flex"
 	   	   var body = document.getElementsByTagName('body')[0];
 		   body.classList.add('scrollLock');
 	
 	   }//본인 강의는 신청 못하게
 	   else if(id == vo_id){
 		  modal_self.style.display = "flex"
 	 	  var body = document.getElementsByTagName('body')[0];
 	 	  body.classList.add('scrollLock');
 	 	  
 	 	   const closeBtn = modal_self.querySelector(".close-area")
 	 	   	closeBtn.addEventListener("click", e => {
 	 	   	modal_self.style.display = "none"
 	  		body.classList.remove('scrollLock');
 	 	})
 		   
 	   }	   	   
 	   else{ 
 		  //신청 확인 모달 
 		  class_modal.style.display = "flex"
 		  var body = document.getElementsByTagName('body')[0];
		  body.classList.add('scrollLock');
		  //취소하면 닫힘
		  $("#modal_close").click(function(){
			  class_modal.style.display = "none"
				  body.classList.remove('scrollLock');			  
		  });
		  //확인 누르면 모달하나 더 뜸 ( +컨트롤러 동작하게)
		  
		  $("#modal_confirm").on("click", function() {
			  
			  	  var bno = document.getElementById("bno").value;
		          var id = document.getElementById("sessionId").value;
			      var classdate = $("#startDate").val();
		          var title = document.getElementById("title").value;
			     			   
			      var data = {
			            bno : bno,
			            id : id,
			            classdate : classdate,
			            title : title
			            
			         }


		        $.ajax({
		        url : "/board/apply",
		        type : "POST",
		        data : JSON.stringify(data),
		        //dataType: 'JSON',
		        contentType: 'application/json; charset=utf-8',
		        success : function(request) {
		                alert("success!")
		                
		            }
		        });  //ajax
		        
		        class_modal.style.display = "none"
			    modal_apply.style.display = "flex"
				var link = "http://localhost:8081/mypage/buyermypage?id="+id;

				  //확인 누르면 닫힘
				  $("#modal_appclose").click(function(){
					  modal_apply.style.display = "none"
					  body.classList.remove('scrollLock');			  
				  });
			     //마이페이지로 이동 누르면 page이동
				  $("#modal_mypage").click(function(){
					  modal_apply.style.display = "none"
					  body.classList.remove('scrollLock');
					  location.href=link;
						
				  });
				  
				  
				  
		  });
		  
 	   }	  
 	   //X누르면 모달 닫힘
 	   const closeBtn = modal.querySelector(".close-area")
 	   	closeBtn.addEventListener("click", e => {
     	modal.style.display = "none"
  		body.classList.remove('scrollLock');
 	})
 	   
 	  }; //modal
 	  

   
   		