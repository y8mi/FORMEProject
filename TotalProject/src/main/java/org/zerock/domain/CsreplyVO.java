package org.zerock.domain;

import java.util.Date;

import lombok.Data;		


@Data
public class CsreplyVO {
	
	private Long rno;
	private Long bno;
	
	private String csreply;
	private String replyer;
	private Date replyDate;
	private Date updateDate;

}
