package org.zerock.domain;

import java.util.Date;

import lombok.Data;

@Data
public class CsVO {
	
	private Long csbno;
	private Long postbno;
	private Long bno;
	private String id;
	private String csid;
	private String title;
	private String content;
	private Date csdate;
	private int cate;
	private int postpenalty;   //게시글 패널티 
	

}
