package org.zerock.domain;

import java.util.Date;

import lombok.Data;		


@Data
public class CsreplyVO {
	
	private Long rno;
	private Long csbno;
	private String id;
	private String csreply;
	private Date replayerdate;
	private Date updatedate;

}
