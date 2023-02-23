package org.zerock.domain;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class ReviewVO {
	
	private long rno; // 댓글 번호
	private long bno; // 본글 번호
	private String id; // 댓글 작성자
	private String rcontent; // 댓글 내용 
	private double score; // 별점
	
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date replydate; // 작성 날짜  
		
	//private double reviewAvg; // 별점
}
