
   
   function idCheck(){
           var id = $("#id").val(); //id값이 "id"인 입력란의 값을 저장
           $.ajax({
               url:"/member/idCheck", //Controller에서 요청 받을 주소
               type:"post", //POST 방식으로 전달
               dataType: "json",
               data:{"id" : id},
               success:function(cnt){ //컨트롤러에서 넘어온 cnt값을 받는다 
                   if(cnt == 0){ //cnt가 1이 아니면(=0일 경우) -> 사용 가능한 아이디 
                       $('.id_ok').css("display","inline-block"); 
                        $('.id_already').css("display", "none");
                   } else if(cnt == 1){ // cnt가 1일 경우 -> 이미 존재하는 아이디
                       $('.id_already').css("display","inline-block");
                        $('.id_ok').css("display", "none");
                        alert("아이디를 다시 입력해주세요");
                        $('#id').val('');
                   }
               }
           })
       }
  

       
       function emailChoice(){  
           if ($("#email_kind").val() == "")
           {
            $("#email_domain").val("").attr("readonly", false).focus();
           }
           else
           {
            $("#email_domain").val($("#email_kind").val()).attr("readonly", true);
           }
          }

  
       function memberForm(){
           /* event.preventDefault();*/


          /* 아이디 유효성 검사 */
         if(myform.id.value.length == 0){ // myform.id.value == "" 이것도 가능
            alert("아이디가 누락됐습니다.");
            myform.id.focus(); // 포커스를 이동시켜 바로 아이디를 입력할 수 있게
         
         }
         
         /* 비밀번호 및 비밀번호 확인 유효성 검사 */
         else if(myform.password.value.length == 0){
            alert("비밀번호가 누락됐습니다.");
            myform.password.focus(); // 포커스를 이동시켜 바로 비밀번호를 입력할 수 있게
         
         }

         else if(myform.password.value.length < 8 || myform.password.value.length > 20){
              alert("8자리 ~ 20자리 이내로 입력해주세요.");
             
         }
         
         else if(myform.repassword.value.length == 0){
            alert("비밀번호확인이 누락됐습니다.");
            myform.repassword.focus(); 
            
         }
         
         else if(myform.password.value != myform.repassword.value){
            alert("비밀번호를 재확인하세요.");
            myform.repassword.select(); //이걸로 하면 focus 이동하면서 입력한게 블록으로 선택됨
            
         }
         
         /* 이름 유효성 검사 */
         else if(myform.name.value.length == 0){
            alert("이름이 누락됐습니다.");
            myform.name.focus(); 
            
         }
         
         /* 연락처 유효성 검사 */

         else if(myform.phone.value.length == 0){
            alert("연락처가 누락됐습니다.");
            myform.phone.focus(); 
            
         }
         
                  
         /* 이메일 유효성 검사 */
         else if(myform.email.value.length == 0){
            alert("이메일이 누락됐습니다.");
            myform.email.focus(); 
            
         }
         
         // input type이 email로 해주면 불필요한 부분. text이면 필요한 부분.
         else if(myform.email.value.indexOf('@') == -1){
            alert("이메일 형식이 아닙니다.");
            myform.email.focus(); 
            
         }else{       
      
            document.myform.submit();
            return true;
         
         }
       }
       
       
