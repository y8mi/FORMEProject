package org.zerock.domain;

import java.sql.Date;
import java.util.List;

import lombok.Data;

@Data
public class PostingVO {

	private Long bno;
	private String id;
	private int categoryno;
	private String title;
	private int count;
	private int postright;
	private Date postdate;
	private String startdate;
	private String enddate;
	private String starttime;
	private Date updatedate;
	private int price;
	private String con1;
	private String con2;
	private String con3;
	private String con4;
	private String con5;
	private String classtime;
	
	//파일 업로드
	private List<UploadVO> uploadList;
	
	private String uuid;
	private String filename;
	private String uploadpath;
	
	//리뷰 권한
	private String app_id;
	private int applystatus;
	


	
}