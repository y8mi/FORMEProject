package org.zerock.domain;

import lombok.Data;

@Data
public class CsPageDTO {
	
	private int startPage;
	private int endPage2;
	private boolean prev, next;
	private int total2;
	private Criteria cri2;

	public CsPageDTO(Criteria cri2, int total2) {
		
		this.cri2 = cri2;
		this.total2 = total2;
		
		//페이징 끝번호(endpage) 계산
				this.endPage2 = (int)(Math.ceil(cri2.getPageNum() / 10.0)) * 10;     //화면 현재 보여주는 게시물의 갯수9개
				
				//페이징의 시작 번호(startpage) 계산
				this.startPage = this.endPage2 - 9;
				
				//total을 통한 endpage계산
				int realEnd = (int)(Math.ceil((total2 * 1.0) / cri2.getAmount()));
				
				if(realEnd < this.endPage2) {
					this.endPage2 = realEnd;
				}
				
				//이전 계산
				this.prev = this.startPage > 1;
				
				
				//다음 계산
				this.next = this.endPage2 < realEnd;
	}
}
