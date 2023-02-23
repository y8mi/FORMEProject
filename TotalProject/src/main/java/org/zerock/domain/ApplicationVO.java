package org.zerock.domain;

import java.sql.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class ApplicationVO {

	private Long applyno;
	private Long bno;
	private String id;
	private Date applydate;
	private int applystatus;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date classdate;
	private String title;
	private int applycnt;
	
}
