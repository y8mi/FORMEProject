package org.zerock.domain;

import java.util.Date;

import lombok.Data;

@Data
public class MgPostingVO {
	
	
	/*
	 * private Long bno; private String title; private String content; private
	 * String writer; private Date regdate; private Date updateDate;
	 */
	
	 private Long bno; 
	 private String id; 
	 private int categoryno; 
	 private String title; 
	 private Long count;
	 private int postright;
	 private Date postdate;
	 private Date startdate;
	 private Date enddate;
	 private String starttime;
	 private Date updatedate;
	 private Long price;
	 private String con1;
	 private String con2;
	 private String con3;
	 private String con4;
}
