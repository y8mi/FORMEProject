package org.zerock.domain;

import lombok.Data;

@Data
public class PagingCriteria {
	

	    private String id;
	    private Long csbno;
	    
		/* 현재 페이지 */  
		private int pageNum;
		
		/* 한 페이지 당 보여질 게시물 갯수 */
		private int amount;
		
		/* 카테고리 값 */
		private String keyword;   
		
		/* 검색 키워드 */
		private String type;  
		
		/* 검색 키워드 */
		private String title;
		
		/* 기본 생성자 */	
		public PagingCriteria() {
			this(1,10);
		}
		
		
		public PagingCriteria(int pageNum, int amount) {
			this.pageNum = pageNum;
			this.amount = amount;
		}
		
		
		//검색 조건을 배열로 만들어서 한 번에 처리하기 위함.
	    public String[] getTypeArr() {
			
			return type == null? new String[] {}: type.split("");
		}	
	

}
