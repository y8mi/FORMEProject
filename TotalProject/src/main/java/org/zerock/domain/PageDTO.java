package org.zerock.domain;

import lombok.Data;

@Data
public class PageDTO {
	
	private int startPage;
	private int endPage;
	private boolean prev, next;
	
	private int total;
	private Criteria cri;
	
	public PageDTO(Criteria cri, int total) {
		
		this.cri = cri;
		this.total = total;
		
		//페이징 끝번호(endpage) 계산
		this.endPage = (int)(Math.ceil(cri.getPageNum() / 10.0)) * 10;     //화면 현재 보여주는 게시물의 갯수9개
		
		//페이징의 시작 번호(startpage) 계산
		this.startPage = this.endPage - 9;
		
		//total을 통한 endpage계산
		int realEnd = (int)(Math.ceil((total * 1.0) / cri.getAmount()));
		
		if(realEnd < this.endPage) {
			this.endPage = realEnd;
		}
		
		//이전 계산
		this.prev = this.startPage > 1;
		
		
		//다음 계산
		this.next = this.endPage < realEnd;
	}

}
