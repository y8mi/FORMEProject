function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                // 조합된 참고항목을 해당 필드에 넣는다.
                document.getElementById("sample6_extraAddress").value = extraAddr;
            
            } else {
                document.getElementById("sample6_extraAddress").value = '';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('sample6_postcode').value = data.zonecode;
            document.getElementById("sample6_address").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("sample6_detailAddress").focus();
        }
    }).open(); //우편번호 찾기
        
}
	
$(document).ready(function(){

	  	//버튼 클릭 시, 스크롤 이동 막기
	    $('.btns').click(function(e)
	    		{
	    			e.preventDefault();   
	    		});
		  
	    //게시물 조회 시, getUploadList컨트롤러 동작 시켜서 첨부파일 리스트 JSON으로 받아오기

	    
	
		//Submit Button클릭 시, 첨부파일과 관련된 처리를 할 수 있도록 기본 동작 막기
		
		var formObj = $("form[role = 'form']");
		
		$("button[type='submit']").on("click",function(e){
			
			e.preventDefault();
			
			console.log("submit clicked"); //ok
			
			var str = "";
			
			$(".uploadResult ul li").each(function(i, obj){
				
				var jobj = $(obj);
				
				console.log("uploadResult ul li 되는지 확인");
				console.dir(jobj);
				
				str += "<input type ='hidden' name='uploadList["+i+"].fileName' value='"+jobj.data("filename")+"'>";
				str += "<input type ='hidden' name='uploadList["+i+"].uuid' value='"+jobj.data("uuid")+"'>";
				str += "<input type ='hidden' name='uploadList["+i+"].uploadPath' value='"+jobj.data("path")+"'>";
//type이 post 방식으로 가면 true(image) -> undefined가 되어버려서 안되는듯
				//str += "<input type ='hidden' name='uploadList["+i+"].fileType'value='"+jobj.data("type")+"'>";
			}); //upload ul li each문
			
			formObj.append(str).submit();
		
		});

	
		//파일 용량과 유형 체크하는..
		var regex = new RegExp ("(.*?)\.(png|jpg)$");
		var maxSize = 5242880; //5MB
			
		function checkExtension(fileName,fileSize){
			if(fileSize >=maxSize){
				alert("5MB이하 사진만 업로드 가능합니다.");
				return false;
			}
			
			if(!regex.test(fileName)){
				alert("png/jpg 유형의 파일만 업로드 가능합니다.");
				return false;
			}
			
			if(document.getElementById("uploadFile").files.length > 3 ){
			    alert("최대 3개의 이미지만 등록 가능합니다.");
			    return false;
			}
			
			if(document.getElementById("uploadFile").files.length == 0 ){
			    alert("이미지를 1개 이상 등록해 주세요.");
			    return false;
			}
			
			return true; //ok
			
			
		}
		//input type ='file'의 내용이 변경되는 걸 감지해서 파일 업로드 자동
		
			//class_img > 첨부파일 초기화
			var cloneObj = $(".class_img").clone();
			
		$("input[type='file']").change(function(e){
				
			var formData = new FormData();

			var inputFile = $("input[name='uploadFile']");
			
			var files = inputFile[0].files;
			
			console.log(files);

			for(var i =0; i<files.length; i++){
				
			
				if(!checkExtension(files[i].name, files[i].size)){					
					return false;
				}
				
				formData.append("uploadFile", files[i]);

			}
			
			$.ajax({
				url:'/board/register',
				processData : false,
				contentType : false,
				data : formData,
				type :'POST',
				dataType : 'json',
				success : function(result){
					
					console.log("change 되면 자동으로 file 업로드 : " + result);

					showUploadResult(result);
					
					$(".class_img").html(cloneObj.html());
					
				} ,    error:function(request,status,error){
			        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			       }
			}); //$.ajax
		}); //Upload
	

      
        
        //달력 날짜 최솟값
        var now_utc = Date.now()
        var timeOff = new Date().getTimezoneOffset()*60000;
        var today = new Date(now_utc-timeOff).toISOString().split("T")[0];
        document.getElementById("startDate").setAttribute("min", today);
        document.getElementById("endDate").setAttribute("min", today);
        //버튼 클릭 시 썸네일 삭제
    	$(".uploadResult").on("click", "button", function(e){
    		    		
    		var targetFile = $(this).data("file");
    		var type = $(this).data("type");
    		console.log("삭제할 파일 : " + targetFile);
    		
    		var targetLi = $(this).closest("li");
    		
    		$.ajax({
    			url : '/board/deleteFile',
    			data : {fileName : targetFile, type:type},
    			dataType : 'text',
    			type : 'POST',
    			success : function(result){
    				alert(result);
    				targetLi.remove();
    			}
    			
    		});//ajax
    	});//onclick    

});

function resize(obj) {
    obj.style.height = "1px";
    obj.style.height = (12+obj.scrollHeight)+"px";
  }; //textarea늘어나게
  
//글자 수 제한
  function check_length(area){
		
		var text =area.value;
		var text_length = text.length;
		
		var max_length = 200;
		var min_lenth = 50;

		 if(text_length>max_length){
			 alert(max_length+"자 이상 작성할 수 없습니다.")
			 text = text.substr(0, max_length);
			 area.value = text;
			 area.focus();
		 }
		 
	}//글자 수 제한

//다중선택리스트
  function categoryChange(e) {
		var good_a = ["9시", "10시", "11시", "12시"];
		var good_b = ["1시", "2시", "3시", "4시", "5시", "6시", "7시"];
		var good_c = ["협의"];
		var target = document.getElementById("classtime2");

		if(e.value == "a") var d = good_a;
		else if(e.value == "b") var d = good_b;
		else if(e.value == "c") var d = good_c;

		target.options.length = 0;

		for (x in d) {
			var opt = document.createElement("option");
			opt.value = d[x];
			opt.innerHTML = d[x];
			target.appendChild(opt);
		}
	};
	
	//형식 체크
	function Checkform() {

		
	    if( frm.title.value == "" ) {
	    
	        frm.title.focus();
	        window.scrollTo(0,500);
	        alert("제목을 입력해 주십시오.");
	        
	        return false;               
	    }
	    
		
	    if( frm.classtime.value == "" ) {
	    
	    	frm.classtime.focus();
	        window.scrollTo(0,600);
	        alert("소요시간을 입력해 주십시오.");
	        
	        return false;               
	    }
	    
	    if( frm.price.value == "" ) {
	        
	    	frm.price.focus();
	        window.scrollTo(0,700);
	        alert("예약금액을 입력해 주십시오.");
	        
	        return false;               
	    }
	    
	    if( frm.con1.value == "" ) {
	        
	    	frm.con1.focus();
	        window.scrollTo(0,700);
	        alert("클래스 소개를 50자 이상 입력해 주십시오.");
	        
	        return false;               
	    }
	    
	    if( frm.con2.value == "" ) {
	        
	    	frm.con1.focus();
	        window.scrollTo(0,700);
	        alert("커리큘럼을 50자 이상 입력해 주십시오.");
	        
	        return false;               
	    }
	    
	    if( frm.con3.value == "" ) {
	        
	    	frm.con1.focus();
	        window.scrollTo(0,700);
	        alert("강사소개를 50자 이상 입력해 주세요.");
	        
	        return false;               
	    }
	    
	    if( frm.con4.value == "" ) {
	        
	    	frm.con1.focus();
	        window.scrollTo(0,700);
	        alert("위치를 입력해 주세요.");
	        
	        return false;               
	    }
	}

	
	//썸네일 만들기

	
	function showUploadResult(uploadResultArr){
					
		
		if(!uploadResultArr || uploadResultArr.length == 0){ return; }
		
		var uploadUL = $(".uploadResult ul");
		var str ="";
		
		
		$(uploadResultArr).each(function(i,obj){
			
			var fileCallPath = encodeURIComponent(obj.uploadPath + "/s_" + obj.uuid+ "_" + obj.fileName);
		
			
			str += "<li data-path='"+obj.uploadPath+"' data-uuid ='"+obj.uuid+"' data-filename ='"+obj.fileName+"' data-type='"+obj.image+"' >";
			str += "<div><button type='button' data-file=\'"+fileCallPath+"\'data-type='image'>삭제</button><br>";
			str += "<img src ='/board/display?fileName="+fileCallPath+"'>";
			str += "</div></li>";
		});
		
		uploadUL.append(str);
	}

	
		



 
