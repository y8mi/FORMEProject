 function replyList(param, callback, error) {
             console.log("replyList....");
             var csbno = param.csbno;
             var page = param.page || 1; // 2개 갑중 하나로 변수 초기화
             // 페이지 번호가 있으면 페이지 번호 전달 아니면 1전달.
             $.getJSON("/manager/csdetail" + csbno + "/" + page,
                 function(data) {
                     if(callback) {
                          callback(data.replyTotalCnt, data.list);
                     }
                 }).fail(function(xhr, status, err){
                     // xhr : xml http request의 약자.
                     // 현재는 사용되지 않고, 형식만 맞춰줌.
                     if(error) {
                         error(er);
                     }
                 })
        } // 덧글 목록 가져오기 끝.